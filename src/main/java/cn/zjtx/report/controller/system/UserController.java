package cn.zjtx.report.controller.system;

import cn.zjtx.report.controller.BaseController;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.service.base.LoginUserService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    LoginUserService loginUserService;

    /**
     * 用户列表
     */
    @RequestMapping("/list.html")
    public String list(ModelMap modelMap,String userName,String pageIndex){
        try{
            PageInfo<TBLoginUserDO> page =  loginUserService.selectUserList(getCurrentUser().getUserId(),userName,pageIndex,null);
        }catch(Exception e){
            logger.error("获取用户列表异常",e);
        }
        return "pages/system/user/list";
    }
}
