package cn.zjtx.report.controller;

import cn.zjtx.report.entity.CustomerDO;
import cn.zjtx.report.service.base.CustomerService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 客户管理
 * @author xiaxin
 * @date 2017-10-18
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController{
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Resource
	CustomerService customerService;

	/**
  	 * 客户列表
	 */
	@RequestMapping(value = "/list.html")
	public String list(ModelMap mm,String custName,Integer pageIndex){
		PageInfo<CustomerDO> page = null;
		try{
			page = customerService.selectCurrUserCustList(getCurrentUser().getUserId(),custName,pageIndex,null);
		}catch (Exception e){
			logger.error("获取客户列表异常",e);
		}
		mm.addAttribute("page",page);
		mm.addAttribute("custName",custName);
		return "pages/customer/list";
	}
	/**
	 * 获取客户信息
	 */
	@RequestMapping("/getInfo.html")
	@ResponseBody
	public CustomerDO getInfo(Integer id){
		CustomerDO record = null;
		try{
			record = customerService.selectByPrimaryKey(id);
		}catch (Exception e){
			logger.error("获取客户信息异常",e);
		}
		return record;
	}
	/**
	 * 更新客户信息
	 */
	@RequestMapping("/update.html")
	@ResponseBody
	public Map<String,Object> update(CustomerDO record){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			resultMap = customerService.insertOrUpdate(record,getCurrentUser().getUserId());
		}catch (Exception e){
			logger.error("更新客户信息异常",e);
		}
		return resultMap;
	}

	/**
	 * 删除客户信息
	 */
	@RequestMapping("/delete.html")
	@ResponseBody
	public Boolean delete(Integer id){
		Boolean result = false;
		try{
			result = customerService.deleteByPrimaryKey(id);
		}catch (Exception e){
			logger.error("删除客户信息异常",e);
		}
		return result;
	}
}
