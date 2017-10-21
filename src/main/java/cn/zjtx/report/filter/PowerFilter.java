package cn.zjtx.report.filter;

import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.service.base.LoginUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 权限过滤器
 * @author xiaxin
 * @date 2017-10-21
 */
@Component("powerFilter")
public class PowerFilter implements Filter{
    private static final Logger logger = LoggerFactory.getLogger(PowerFilter.class);

    @Autowired
    private LoginUserService loginUserService;

    @Override
    public void doFilter(ServletRequest rq, ServletResponse sr, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) rq;
        HttpServletResponse response = (HttpServletResponse) sr;
        String requestUrl = request.getServletPath();
        Subject subject = SecurityUtils.getSubject();
        // 已验证
        if (subject.isAuthenticated()) {
            if (requestUrl.equals("/index.html")) {// 已登录跳主页
                filterChain.doFilter(request, response);
            } else if (requestUrl.equals("/login.html")) {// 已登录跳主页
                response.sendRedirect(request.getContextPath() + "/index.html");
            }else {
                TBLoginUserDO loginUser = loginUserService.selectByLoginName(subject.getPrincipal().toString());
                //如果用户是非正常状态
                if (1 != loginUser.getUserStatus()) {
                    logger.error("用户非正常状态，用户状态码：" + loginUser.getUserStatus() + "，已强制退出登录！");
                    if(isAjax(request)){
                        subject.logout();
                        response.getWriter().print("logout");
                    }else {
                        response.sendRedirect(request.getContextPath() + "/logout.html");
                    }
                } else {
                    filterChain.doFilter(request, response);
                }
            }
        // 未验证
        } else {
            if (requestUrl.equals("/login.html")||requestUrl.equals("/logout.html")) {
                filterChain.doFilter(request, response);
            } else {
                // 是否为Ajax请求，是的话返回退出码logout
                if(isAjax(request)){
                    response.getWriter().print("logout");
                }else{
                    response.sendRedirect(request.getContextPath() + "/login.html");
                }
            }
        }
    }
    /**
     * 判断是否为Ajax请求
     */
    public boolean isAjax(ServletRequest request){
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if("XMLHttpRequest".equalsIgnoreCase(header)){
            return true;
        }
        return false;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
