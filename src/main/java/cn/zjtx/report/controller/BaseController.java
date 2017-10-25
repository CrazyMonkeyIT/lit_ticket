package cn.zjtx.report.controller;

import cn.zjtx.report.entity.CustomerDO;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.service.base.CustomerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.List;

/**
 * 控制层基类
 * @author xin.xia
 * @date 2017-10-10
 */
public class BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    @Resource
    CustomerService customerService;
    /**
     * 获得当前用户
     * @return
     */
    public TBLoginUserDO getCurrentUser(){
        TBLoginUserDO user = null;
        try {
            Subject subject = SecurityUtils.getSubject();
            if(subject != null && subject.getPrincipal() != null) {
                user = (TBLoginUserDO) subject.getSession().getAttribute("currUser");
            }
        } catch (Exception e) {
            logger.error("获得当前用户异常",e);
        }
        return user;
    }

    /**
     * 获取当前用户客户列表（键值对）
     */
    public List<CustomerDO> getCurrCustList(){
        List<CustomerDO> list = null;
        try{
            list = customerService.selectCurrUserCustKV(getCurrentUser().getUserId());
        }catch (Exception e){
            logger.error("获取当前用户客户列表（键值对）异常",e);
        }
        return list;
    }
}
