package cn.zjtx.report;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;



/**
 *
 * <p>获取web信息</p>
 * @author qinde
 * @version $Id: WebProcessInfoResolver.java, v 0.1 2013-12-3 上午10:28:55 qinde Exp $
 */
public class WebProcessInfoResolver implements WebArgumentResolver {

    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) throws Exception {
        if (methodParameter.getParameterType().equals(WebEnvironment.class)) {
            return extractEnv(webRequest.getNativeRequest(HttpServletRequest.class));
        }

        return UNRESOLVED;
    }


    private WebEnvironment extractEnv(HttpServletRequest request) {
    	WebEnvironment channelInfo = new WebEnvironment();
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        channelInfo.setClientIp(ip);
        channelInfo.setClientMac("x12345678x");
        return channelInfo;
    }

}
