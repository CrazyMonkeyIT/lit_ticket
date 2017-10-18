package cn.zjtx.report.controller.system;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.zjtx.report.base.util.ObjectUtil;
import cn.zjtx.report.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;

import cn.zjtx.report.entity.TBResourcesDO;
import cn.zjtx.report.service.base.ResourcesService;

/**
 * 资源管理
 */
@Controller
@RequestMapping("/system/resource")
public class ResourceController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);

	@Autowired
	private ResourcesService resourcesService;

	/**
	 * 资源列表
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv){
		List<TBResourcesDO> resources = resourcesService.selectAll();
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		//转换为json格式数据，方便zTree树的实现
		for (TBResourcesDO res : resources) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", res.getResourceId());
			map.put("pId", res.getParentId());
			map.put("name", res.getResourceName());
			map.put("order", res.getOrderNo());
			if(res.getParentId() == 0){
				map.put("open", "true");
			}
			mapList.add(map);
		}
		mv.addObject("data", JSONUtils.toJSONString(mapList));
		mv.addObject("resourceList",resources);
		mv.setViewName("pages/system/resource/list");
		return mv;
	}

	/**
	 * 获取一条资源信息
	 * @param resourceId
	 * @return
	 */
	@RequestMapping(value="/getResourceInfo.html",method=RequestMethod.POST)
	public @ResponseBody TBResourcesDO preEdit(Integer resourceId){
		TBResourcesDO resource = null;
		try {
			resource = resourcesService.selectByPrimaryKey(resourceId);
		} catch (Exception e) {
			logger.error("获取资源信息异常",e);
		}
		return resource;
	}

	/**
	 * 删除资源信息
	 * @param id
	 * @param pId
	 * @return
	 */
	@RequestMapping(value="/deleteResource.html",method=RequestMethod.POST)
	public @ResponseBody boolean deleteResource(Integer resourceId){
		boolean result = false;
		try {
			result = resourcesService.deleteResource(resourceId);
		} catch (Exception e) {
			logger.error("删除资源异常",e);
		}
		return result;
	}
	/**
	 * 更新资源信息
	 * @param groupId
	 * @return
	 */
	@RequestMapping(value="/editResource.html",method=RequestMethod.POST)
	public @ResponseBody boolean addResource(TBResourcesDO resource){
		boolean result = false;
		try {
			result = resourcesService.insertOrUpdate(resource);
		} catch (Exception e) {
			logger.error("添加资源异常",e);
		}
		return result;
	}
	/**
	 * 菜单位置变更
	 * @param id
	 * @param pId
	 * @return
	 */
	@RequestMapping(value="/changeResource.html",method=RequestMethod.POST)
	@ResponseBody
	public boolean changeResource(TBResourcesDO resource,Integer upId,Integer upOrder){
		boolean result = false;
		if(!ObjectUtil.isNullOrEmpty(resource)){
			try {
				result = resourcesService.updateResourcePosition(resource, upId, upOrder);
			} catch (Exception e) {
				logger.error("菜单位置变更异常",e);
			}
		}
		return result;
	}
}
