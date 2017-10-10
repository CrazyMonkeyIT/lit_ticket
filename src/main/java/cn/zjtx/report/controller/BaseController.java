package cn.zjtx.report.controller;

import cn.zjtx.report.entity.TBLoginUserDO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 控制层基类
 * @author xin.xia
 * @date 2017-10-10
 */
public class BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
    /**
     * 获得当前用户
     * @return
     */
    public TBLoginUserDO getCurrentUser(){
        Subject subject = SecurityUtils.getSubject();
        if(subject == null || subject.getPrincipal() == null){
            return null;
        }
        TBLoginUserDO user = null;
        try {
            user = (TBLoginUserDO) subject.getSession().getAttribute("currUser");
        } catch (Exception e) {
            logger.error("用户查询异常",e);
            return null;
        }
        return user;
    }
}
