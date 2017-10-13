package cn.zjtx.report.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.zjtx.report.bean.BaseResult;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.entity.TBResourcesDO;
import cn.zjtx.report.service.base.LoginUserService;
import cn.zjtx.report.service.base.ResourcesService;

/**
 * 登录
 */
@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private ResourcesService resourcesService;
	
	@Autowired
	private LoginUserService loginUserService;
	
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv){
		mv.setViewName("pages/login");
		return mv;
	}
	
	@RequestMapping(value = "/loginSubmit.html", method = RequestMethod.POST)
	@ResponseBody
	public BaseResult loginSubmit(HttpServletRequest req, HttpServletResponse resp,String loginname,String password){
		BaseResult result = new BaseResult(false,"account_error");
		Subject subject = null;
		try {
			subject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(loginname,password);
			subject.login(token);
		} catch (UnknownAccountException uae) {
			logger.error("登录失败：用户名或密码错误");
			return result;
		} catch (IncorrectCredentialsException ice) {
			logger.error("登录失败：密码错误");
			return result;
		} catch (LockedAccountException lae) {
			logger.error("登录失败：账户冻结");
			result.setMsg("account_lock");
			return result;
		} catch (AuthenticationException ae) {
			if(ae.getMessage().equals("account_invalid")){
				result.setMsg("account_invalid");
				return result;
			}
			logger.error("登录失败，账户失效",ae);
			return result;
		} catch(Exception e){
			logger.error("登录失败：",e);
			return result;
		}
		
		TBLoginUserDO loginUser = loginUserService.selectByLoginName(loginname);
		subject.getSession().setAttribute("currUser",loginUser);
		Date updateTime = new Date();		
		loginUser.setLastLoginTime(updateTime);
        loginUser.setUpdateTime(updateTime);
        loginUserService.insertOrUpdate(loginUser);
        
        List<TBResourcesDO> userResources = resourcesService.selectByUserId(loginUser.getUserId());
        userResources = resourcesOper(userResources);
        if(userResources.size() == 0){
        	result.setMsg("no_permission");
        	return result;
        }
        req.getSession().setAttribute("menuList", userResources);
		result.setSuccess(true);
		result.setMsg("success");
		return result;
	}
	
	private List<TBResourcesDO> resourcesOper(List<TBResourcesDO> userResources){
		for (TBResourcesDO re : userResources) {
			if(re.getParentId() != null && re.getParentId() != 0){
				for (TBResourcesDO res : userResources) {
					if(res.getResourceId() == re.getParentId()){
						res.setHasChild(true);
					}
				}
			}
		}
		return userResources;
	}
	/**
	 * 更新菜单选中状态
	 */
	@RequestMapping("/updateMenuStatus.html")
	@ResponseBody
	public Boolean updateMenuStatus(HttpServletRequest request,Integer oneId,Integer twoId,String oneName,String twoName){
		request.getSession().setAttribute("SelectOneLevelId",oneId);
		request.getSession().setAttribute("SelectTwoLevelId",twoId);
		request.getSession().setAttribute("SelectOneLevelName",oneName);
		request.getSession().setAttribute("SelectTwoLevelName",twoName);
		return true;
	}
}
