package cn.zjtx.report.controller.system;

import cn.zjtx.report.base.util.DateUtil;
import cn.zjtx.report.base.util.StringUtil;
import cn.zjtx.report.controller.BaseController;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.entity.TBResourcesDO;
import cn.zjtx.report.service.base.LoginUserService;
import cn.zjtx.report.service.base.ResourcesService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理
 * @author xiaxin
 * @date 2017-10-11
 */
@Controller
@RequestMapping("/system/user")
public class UserController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    LoginUserService loginUserService;

    @Resource
    ResourcesService resourcesService;
    /**
     * 用户列表
     */
    @RequestMapping("/list.html")
    public String list(ModelMap modelMap,String userName,String pageIndex){
        PageInfo<TBLoginUserDO> page = null;
        try{
            page =  loginUserService.selectUserList(getCurrentUser().getUserId(),userName,pageIndex,null);
        }catch(Exception e){
            logger.error("获取用户列表异常",e);
        }
        modelMap.addAttribute("page",page);
        modelMap.addAttribute("userName",userName);
        return "pages/system/user/list";
    }
    /**
     * 更新用户信息
     */
    @RequestMapping("/updateUser.html")
    @ResponseBody
    public Map<String,Object> updateUser(TBLoginUserDO user,String loginInvalidDate){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",false);
        try {
            TBLoginUserDO record = loginUserService.selectByLoginName(user.getLoginName());
            if(record != null && !record.getUserId().equals(user.getUserId())){
                resultMap.put("msg","抱歉，登录名已存在");
                return resultMap;
            }
            user.setParentId(getCurrentUser().getUserId());
            user.setLoginInvalid(StringUtil.isNotBlank(loginInvalidDate)?DateUtil.StrToTimestamp(loginInvalidDate+" 23:59:59","yyyy-MM-dd HH:mm:ss"):null);
            boolean result = loginUserService.insertOrUpdate(user);
            resultMap.put("result",result);
        }catch(Exception e){
            logger.error("更新用户信息异常",e);
        }
        return resultMap;
    }
    /**
     * 获取用户信息
     */
    @RequestMapping("/getUserInfo.html")
    @ResponseBody
    public TBLoginUserDO getUserInfo(String loginName){
        TBLoginUserDO record = null;
        try{
            record = loginUserService.selectByLoginName(loginName);
        }catch(Exception e){
            logger.error("获取用户信息异常",e);
        }
        return record;
    }
    /**
     * 重置用户密码
     */
    @RequestMapping("/resetUserPwd.html")
    @ResponseBody
    public Boolean resetUserPwd(Integer userId){
        Boolean result = false;
        try {
            result = loginUserService.resetUserPwd(userId);
        }catch(Exception e){
            logger.error("重置用户密码异常",e);
        }
        return result;
    }
    /**
     * 更新用户状态
     */
    @RequestMapping("/updateUserStatus.html")
    @ResponseBody
    public Boolean updateUserStatus(Integer userId,Integer status){
        Boolean result = false;
        try {
            result = loginUserService.updateUserStatus(userId,status);
        }catch(Exception e){
            logger.error("更新用户状态异常",e);
        }
        return result;
    }
    /**
     * 删除用户
     */
    @RequestMapping("/deleteUser.html")
    @ResponseBody
    public Boolean deleteUser(Integer userId){
        Boolean result = false;
        try {
            result = loginUserService.deleteUser(userId);
        }catch(Exception e){
            logger.error("删除用户异常",e);
        }
        return result;
    }
    /**
     * 获取用户的权限列表
     */
    @RequestMapping("/getUserPowerList.html")
    public @ResponseBody List<Map<String,Object>> getCurrUserPowerList(Integer userId){
        try {
            List<TBResourcesDO> list = null;
            if(userId == null){
                list = resourcesService.selectByUserId(getCurrentUser().getUserId());
            }else{
                list = resourcesService.selectByUserId(userId);
            }
            List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
            //转换为json格式数据，方便zTree树的实现
            for (TBResourcesDO t : list) {
                Map<String,Object> map = new HashMap<String, Object>();
                map.put("id", t.getResourceId());
                map.put("pId", t.getParentId());
                map.put("name", t.getResourceName());
                if(t.getParentId() == 0){
                    map.put("open", "true");
                }
                mapList.add(map);
            }
            return mapList;
        } catch (Exception e) {
            logger.error("获取用户的权限列表异常",e);
            return null;
        }
    }
    /**
     * 修改用户权限
     */
    @RequestMapping("/updateUserPower.html")
    @ResponseBody
    public Boolean updateUserPower(Integer userId,String json){
        Boolean result = false;
        try {
            result = loginUserService.updateUserPower(userId,json);
        }catch(Exception e){
            logger.error("修改用户权限异常",e);
        }
        return result;
    }
}
