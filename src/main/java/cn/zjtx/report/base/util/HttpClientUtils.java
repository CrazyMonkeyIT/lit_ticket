package cn.zjtx.report.base.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.config.RequestConfig.Builder;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;

import sun.misc.BASE64Encoder;

/**
 *  依赖的jar包有：commons-lang-2.6.jar、httpclient-4.3.2.jar、httpcore-4.3.1.jar、commons-io-2.4.jar
 * @author zhaoyb
 *
 */
@SuppressWarnings("restriction")
public class HttpClientUtils {

    public static final int CONN_TIME_OUT =10000;
    public static final int READ_TIME_OUT=10000;
    public static final String CHARSET="UTF-8";
    private static HttpClient client = null;
    
    static {
        PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        cm.setMaxTotal(128);
        cm.setDefaultMaxPerRoute(128);
        client = HttpClients.custom().setConnectionManager(cm).build();
    }
    /**
     * post  请求
     * @param url
     * @param parameterStr
     * @return
     * @throws ConnectTimeoutException
     * @throws SocketTimeoutException
     * @throws Exception
     */
    public static String postJsonParameters(String url, String parameterStr) throws ConnectTimeoutException, SocketTimeoutException, Exception{
        return post(url,parameterStr,"application/json",CHARSET,CONN_TIME_OUT,READ_TIME_OUT);
    }
    
    
    public static String postParameters(String url, String parameterStr) throws ConnectTimeoutException, SocketTimeoutException, Exception{
        return post(url,parameterStr,"application/x-www-form-urlencoded",CHARSET,CONN_TIME_OUT,READ_TIME_OUT);
    }
    
    public static String postParameters(String url) throws ConnectTimeoutException, SocketTimeoutException, Exception{
        return post(url,null,"application/x-www-form-urlencoded",CHARSET,CONN_TIME_OUT,READ_TIME_OUT);
    }
    
    public static String postParameters(String url, String parameterStr,String charSet, Integer connTimeout, Integer readTimeout) throws ConnectTimeoutException, SocketTimeoutException, Exception{
        return post(url,parameterStr,"application/x-www-form-urlencoded",charSet,connTimeout,readTimeout);
    }
    
    public static String postParameters(String url, Map<String, String> params) throws ConnectTimeoutException,  
     SocketTimeoutException, Exception {
         return postForm(url, params, null, CONN_TIME_OUT, READ_TIME_OUT);
     }
    
    public static String postParameters(String url, Map<String, String> params, Integer connTimeout,Integer readTimeout) throws ConnectTimeoutException,  
    SocketTimeoutException, Exception {
         return postForm(url, params, null, connTimeout, readTimeout);
     }
      
    public static String get(String url) throws Exception {  
        return get(url, CHARSET, null, null);
    }
    
    public static String get(String url, String charSet) throws Exception {
        return get(url, charSet, CONN_TIME_OUT, READ_TIME_OUT);
    } 

    /** 
     * 发送一个 Post 请求, 使用指定的字符集编码. 
     *  
     * @param url 
     * @param body RequestBody 
     * @param mimeType 例如 application/xml "application/x-www-form-urlencoded" a=1&b=2&c=3
     * @param charset 编码 
     * @param connTimeout 建立链接超时时间,毫秒. 
     * @param readTimeout 响应超时时间,毫秒. 
     * @return ResponseBody, 使用指定的字符集编码. 
     * @throws ConnectTimeoutException 建立链接超时异常 
     * @throws SocketTimeoutException  响应超时 
     * @throws Exception 
     */  
    public static String post(String url, String body, String mimeType,String charset, Integer connTimeout, Integer readTimeout)
            throws ConnectTimeoutException, SocketTimeoutException, Exception {
        HttpClient client = null;
        HttpPost post = new HttpPost(url);
        String result = "";
        try {
            if (StringUtils.isNotBlank(body)) {
                HttpEntity entity = new StringEntity(body, ContentType.create(mimeType, charset));
                post.setEntity(entity);
            }
            // 设置参数
            Builder customReqConf = RequestConfig.custom();
            if (connTimeout != null) {
                customReqConf.setConnectTimeout(connTimeout);
            }
            if (readTimeout != null) {
                customReqConf.setSocketTimeout(readTimeout);
            }
            post.setConfig(customReqConf.build());

            HttpResponse res;
            if (url.startsWith("https")) {
                // 执行 Https 请求.
                client = createSSLInsecureClient();
                res = client.execute(post);
            } else {
                // 执行 Http 请求.
                client = HttpClientUtils.client;
                res = client.execute(post);
            }
            result = IOUtils.toString(res.getEntity().getContent(), charset);
        } finally {
            post.releaseConnection();
            if (url.startsWith("https") && client != null&& client instanceof CloseableHttpClient) {
                ((CloseableHttpClient) client).close();
            }
        }
        return result;
    }  
    
    
    /** 
     * 提交form表单 
     *  
     * @param url 
     * @param params 
     * @param connTimeout 
     * @param readTimeout 
     * @return 
     * @throws ConnectTimeoutException 
     * @throws SocketTimeoutException 
     * @throws Exception 
     */  
    public static String postForm(String url, Map<String, String> params, Map<String, String> headers, Integer connTimeout,Integer readTimeout) throws ConnectTimeoutException,  
            SocketTimeoutException, Exception {  
  
        HttpClient client = null;  
        HttpPost post = new HttpPost(url);  
        try {  
            if (params != null && !params.isEmpty()) {  
                List<NameValuePair> formParams = new ArrayList<org.apache.http.NameValuePair>();  
                Set<Entry<String, String>> entrySet = params.entrySet();  
                for (Entry<String, String> entry : entrySet) {  
            		 formParams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));  
                }  
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formParams, Consts.UTF_8);  
                post.setEntity(entity);  
            }
            
            if (headers != null && !headers.isEmpty()) {  
                for (Entry<String, String> entry : headers.entrySet()) {  
                    post.addHeader(entry.getKey(), entry.getValue());  
                }  
            }  
            // 设置参数  
            Builder customReqConf = RequestConfig.custom();  
            if (connTimeout != null) {  
                customReqConf.setConnectTimeout(connTimeout);  
            }  
            if (readTimeout != null) {  
                customReqConf.setSocketTimeout(readTimeout);  
            }  
            post.setConfig(customReqConf.build());  
            HttpResponse res = null;  
            if (url.startsWith("https")) {  
                // 执行 Https 请求.  
                client = createSSLInsecureClient();  
                res = client.execute(post);  
            } else {  
                // 执行 Http 请求.  
                client = HttpClientUtils.client;  
                res = client.execute(post);  
            }  
            return IOUtils.toString(res.getEntity().getContent(), "UTF-8");  
        } finally {  
            post.releaseConnection();  
            if (url.startsWith("https") && client != null  
                    && client instanceof CloseableHttpClient) {  
                ((CloseableHttpClient) client).close();  
            }  
        }  
    } 
    
    
    
    
    /** 
     * 发送一个 GET 请求 
     *  
     * @param url 
     * @param charset 
     * @param connTimeout  建立链接超时时间,毫秒. 
     * @param readTimeout  响应超时时间,毫秒. 
     * @return 
     * @throws ConnectTimeoutException   建立链接超时 
     * @throws SocketTimeoutException   响应超时 
     * @throws Exception 
     */  
    public static String get(String url, String charset, Integer connTimeout,Integer readTimeout) 
            throws ConnectTimeoutException,SocketTimeoutException, Exception { 
        
        HttpClient client = null;  
        HttpGet get = new HttpGet(url);  
        String result = "";  
        try {  
            // 设置参数  
            Builder customReqConf = RequestConfig.custom();  
            if (connTimeout != null) {  
                customReqConf.setConnectTimeout(connTimeout);  
            }  
            if (readTimeout != null) {  
                customReqConf.setSocketTimeout(readTimeout);  
            }  
            get.setConfig(customReqConf.build());  
  
            HttpResponse res = null;  
  
            if (url.startsWith("https")) {  
                // 执行 Https 请求.  
                client = createSSLInsecureClient();  
                res = client.execute(get);  
            } else {  
                // 执行 Http 请求.  
                client = HttpClientUtils.client;  
                res = client.execute(get);  
            }  
            result = IOUtils.toString(res.getEntity().getContent(), charset);  
        } finally {  
            get.releaseConnection();  
            if (url.startsWith("https") && client != null && client instanceof CloseableHttpClient) {  
                ((CloseableHttpClient) client).close();  
            }  
        }  
        return result;  
    }  
    
    
    /** 
     * 从 response 里获取 charset 
     *  
     * @param ressponse 
     * @return 
     */  
    @SuppressWarnings("unused")  
    private static String getCharsetFromResponse(HttpResponse ressponse) {  
        // Content-Type:text/html; charset=GBK  
        if (ressponse.getEntity() != null  && ressponse.getEntity().getContentType() != null && ressponse.getEntity().getContentType().getValue() != null) {  
            String contentType = ressponse.getEntity().getContentType().getValue();  
            if (contentType.contains("charset=")) {  
                return contentType.substring(contentType.indexOf("charset=") + 8);  
            }  
        }  
        return null;  
    }  
    
    
    
    /**
     * 创建 SSL连接
     * @return
     * @throws GeneralSecurityException
     */
    private static CloseableHttpClient createSSLInsecureClient() throws GeneralSecurityException {
        try {
            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
                @Override
                public boolean isTrusted(X509Certificate[] chain,String authType) throws CertificateException {
                            return true;
                        }
                }).build();
            
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, new X509HostnameVerifier() {

                        @Override
                        public boolean verify(String arg0, SSLSession arg1) {
                            return true;
                        }

                        @Override
                        public void verify(String host, SSLSocket ssl)
                                throws IOException {
                        }

                        @Override
                        public void verify(String host, X509Certificate cert)
                                throws SSLException {
                        }

                        @Override
                        public void verify(String host, String[] cns,
                                String[] subjectAlts) throws SSLException {
                        }

                    });
            
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
            
        } catch (GeneralSecurityException e) {
            throw e;
        }
    }
    
    
    public static String getImg(String url,String fileName) throws ClientProtocolException, IOException{
    	HttpGet httpget = new HttpGet(url);
        httpget.setHeader("Referer", "http://www.google.com");

        System.out.println("executing request " + httpget.getURI());
        CloseableHttpResponse response = (CloseableHttpResponse) client.execute(httpget);

        try {
          HttpEntity entity = response.getEntity();

          if (response.getStatusLine().getStatusCode() >= 400) {
            throw new IOException("Got bad response, error code = " + response.getStatusLine().getStatusCode()
                + " imageUrl: " + url);
          }
          if (entity != null) {
            InputStream input = entity.getContent();
            OutputStream output = new FileOutputStream(new File(fileName));
            IOUtils.copy(input, output);
            output.flush();
            input.close();
            output.close();
            File file = new File(fileName);
            FileInputStream fis = new FileInputStream(file);
            byte[] data = new byte[fis.available()];  
            fis.read(data);
            fis.close();
            file.delete();
         // 对字节数组Base64编码  
    		BASE64Encoder encoder = new BASE64Encoder();  
    		String basecode = encoder.encode(data);
    		// 返回Base64编码过的字节数组字符串 
    		return basecode;
          }
        } finally {
          response.close();

        }
        return "";
    }
    /**
     * 把网络图片转成base64码返回
     * @param url
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static String getImgBase64Code(String urlStr,String path) throws ClientProtocolException, IOException{
    	HttpURLConnection httpUrl = null;
    	URL url = null;
		InputStream input = null; 
		byte[] data = null;
		String result = "";
		try{
		    if(urlStr == null || urlStr == "" || "".equals(urlStr)){
			    	return "";
		    }
			  //在根目录创建一个临时文件
		    File file = new File(path+File.separator+System.currentTimeMillis()+".jpg");
			url = new URL(urlStr);
			httpUrl = (HttpURLConnection) url.openConnection();
			httpUrl.connect();
			input = httpUrl.getInputStream();	
			OutputStream output = new FileOutputStream(file);
	        IOUtils.copy(input, output);
	        output.flush();
	        input.close();
	        output.close();
	        //读取文件--------------------------------------------------------
	        FileInputStream fis = new FileInputStream(file);
			data = new byte[fis.available()];
			fis.read(data);
			fis.close();
			file.delete();
			httpUrl.disconnect();
			// 对字节数组Base64编码
			BASE64Encoder encoder = new BASE64Encoder();
            // 返回Base64编码过的字节数组字符串
			result =  encoder.encode(data);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return  result;
    }
    
    public static void main(String[] args) throws ConnectTimeoutException, SocketTimeoutException {  
        try {
            String a = get("https://detail.m.tmall.com/item.htm?id=538997480308","GBK");
            System.out.println(a);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
}