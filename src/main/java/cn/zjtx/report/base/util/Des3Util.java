package cn.zjtx.report.base.util;

import com.sun.org.apache.xml.internal.security.utils.Base64;
import org.apache.commons.lang3.StringUtils;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;

/**
 * DES3加解密帮助类
 * @author xiaxin
 * @date 2017-10-21
 */
public class Des3Util {

    /**
     * 密钥
     */
    public final static String SECRET_KEY = "qXSdHWfbSZaaLeHBRhLgxBiGHSHJKRKK5656SD65Q600JKfJfrSADSSDf";
    /**
     * 向量
     */
    private final static String IV = "12345678";
    /**
     *加解密统一使用的编码方式
     */
    private final static String ENCODING = "UTF-8";

    public static void main(String[] args) throws Exception {
// 实现3DES加密算法，工作模式CBC，填充模式PKCS5
        String str = "18583221860";
        String encStr = encode(str);
        System.out.println("加密后：" + encStr);
        System.out.println("解密后：" + decode("Q+gd3ZIDIox7+KaiNywT4g=="));
    }

    /**
     * 3DES加密
     *
     * @param plainText
     * 普通文本
     * @return
     * @throws Exception
     */
    public static String encode(String plainText) throws Exception {
        return encode(plainText, SECRET_KEY);
    }

    public static String encode(String plainText, String secretKey)
            throws Exception {
        Key desKey = null;
        DESedeKeySpec spec = new DESedeKeySpec(secretKey.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("desede");
        desKey = keyFactory.generateSecret(spec);

        Cipher cipher = Cipher.getInstance("desede/CBC/PKCS5Padding");
        IvParameterSpec ips = new IvParameterSpec(IV.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, desKey,ips);
        byte[] encryptData = cipher.doFinal(plainText.getBytes(ENCODING));
        return Base64.encode(encryptData);
    }

    /**
     * 3DES解密
     *
     * @param plainText
     * 加密文本
     * @return
     * @throws Exception
     */
    public static String decode(String plainText) throws Exception {
        if (StringUtils.isBlank(plainText)) {
            return "";
        }
        return decode(plainText, SECRET_KEY);
    }

    public static String decode(String encryptText, String secretKey)
            throws Exception {
        if (StringUtils.isBlank(encryptText)||StringUtils.isBlank(secretKey)) {
            return "";
        }
        Key deskey = null;
        DESedeKeySpec spec = new DESedeKeySpec(secretKey.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("desede");
        deskey = keyFactory.generateSecret(spec);
        Cipher cipher = Cipher.getInstance("desede/CBC/NoPadding");
        IvParameterSpec ips = new IvParameterSpec(IV.getBytes());
        cipher.init(Cipher.DECRYPT_MODE, deskey,ips);

        byte[] decryptData = cipher.doFinal(Base64.decode(encryptText));

        return new String(decryptData, ENCODING).trim();
    }
}
