package cn.zjtx.report.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;

import cn.zjtx.report.entity.TBResourcesDO;
import cn.zjtx.report.service.base.ResourcesService;

/**
 * 资源管理
 */
@Controller
public class ResourceController {

	@Autowired
	private ResourcesService resourcesService;

	/**
	 * 获取资源列表
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/sys/resouce.html", method = RequestMethod.GET)
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
			if(res.getParentId() == null){
				map.put("open", "true");
			}
			mapList.add(map);
		}  
		mv.addObject("data", JSONUtils.toJSONString(mapList));
		mv.setViewName("pages/system/resource/list");
		return mv;
	}
	
}
