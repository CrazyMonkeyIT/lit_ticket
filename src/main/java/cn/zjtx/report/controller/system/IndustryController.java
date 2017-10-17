package cn.zjtx.report.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;

import cn.zjtx.report.bean.BaseResult;
import cn.zjtx.report.entity.IndustrySasacDO;
import cn.zjtx.report.service.base.IndustrySasacService;

@Controller
public class IndustryController {

	@Autowired
	private IndustrySasacService industrySasacService;
	
	@RequestMapping(value = "/sys/industry/sasac.html", method = RequestMethod.GET)
	public ModelAndView sasacList(ModelAndView mv){
		
		List<IndustrySasacDO> industrys = industrySasacService.selectAll();
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		
		Map<String,Object> rootMap = new HashMap<String, Object>();
		rootMap.put("id", 0);
		rootMap.put("pId", null);
		rootMap.put("name", "国资委行业");
		rootMap.put("order", 0);
		rootMap.put("open", "true");
		mapList.add(rootMap);
		
		//转换为json格式数据，方便zTree树的实现
		for (IndustrySasacDO ind : industrys) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", ind.getId());
			map.put("pId", ind.getParentId());
			map.put("name", ind.getIndustryName());
			map.put("order", ind.getOrderNo());
			if(ind.getParentId() == null){
				map.put("open", "true");
			}
			mapList.add(map);
		}  
		mv.addObject("data", JSONUtils.toJSONString(mapList));
		
		mv.setViewName("pages/system/industry/sasac_list");
		return mv;
	}
	
	
	@RequestMapping(value = "/sys/industry/saveSasac.html", method = RequestMethod.POST)
	@ResponseBody
	public BaseResult saveIndustry(IndustrySasacDO industry){
		BaseResult result = new BaseResult(true, "");
		try {
//			industrySasacService.saveIndustry(industry);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMsg("保存失败");
		}
		return result;
	}
}
