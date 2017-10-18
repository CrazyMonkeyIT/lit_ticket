package cn.zjtx.report.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.zjtx.report.base.util.ObjectUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;

import cn.zjtx.report.entity.IndustrySasacDO;
import cn.zjtx.report.service.base.IndustrySasacService;

import javax.annotation.Resource;

/**
 * 国资委行业
 * @author xiaxin
 * @date 2017-10-17
 */
@Controller
@RequestMapping("/system/sasacIndustry")
public class SasacIndustryController {
	private static final Logger logger = LoggerFactory.getLogger(SasacIndustryController.class);

	@Resource
	private IndustrySasacService industrySasacService;

	/**
	 * 列表
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.GET)
	public ModelAndView sasacList(ModelAndView mv){
		List<IndustrySasacDO> industrys = industrySasacService.selectAll();
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		//转换为json格式数据，方便zTree树的实现
		for (IndustrySasacDO ind : industrys) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", ind.getId());
			map.put("pId", ind.getParentId());
			map.put("name", ind.getIndustryName());
			map.put("order", ind.getOrderNo());
			if(ind.getParentId() == 0){
				map.put("open", "true");
			}
			mapList.add(map);
		}  
		mv.addObject("data", JSONUtils.toJSONString(mapList));
		mv.addObject("industrys",industrys);
		mv.setViewName("pages/system/industry/sasac_list");
		return mv;
	}

	/**
	 * 根据ID查询国资委行业信息
	 * @return
	 */
	@RequestMapping(value="/getInfo.html",method=RequestMethod.POST)
	public @ResponseBody IndustrySasacDO preEdit(Integer id){
		IndustrySasacDO record = null;
		try {
			record = industrySasacService.selectByPrimaryKey(id);
		} catch (Exception e) {
			logger.error("根据ID查询国资委行业信息异常",e);
		}
		return record;
	}

	/**
	 * 删除国资委行业信息
	 * @return
	 */
	@RequestMapping(value="/delete.html",method=RequestMethod.POST)
	public @ResponseBody boolean delete(Integer id){
		boolean result = false;
		try {
			result = industrySasacService.deleteByPrimaryKey(id);
		} catch (Exception e) {
			logger.error("删除国资委行业信息异常",e);
		}
		return result;
	}
	/**
	 * 更新国资委行业信息
	 * @return
	 */
	@RequestMapping(value="/update.html",method=RequestMethod.POST)
	public @ResponseBody boolean update(IndustrySasacDO record){
		boolean result = false;
		try {
			result = industrySasacService.insertOrUpdate(record);
		} catch (Exception e) {
			logger.error("更新国资委行业信息异常",e);
		}
		return result;
	}
	/**
	 * 菜单位置变更
	 * @return
	 */
	@RequestMapping(value="/updatePosition.html",method=RequestMethod.POST)
	@ResponseBody
	public boolean updatePosition(IndustrySasacDO record,Integer upId,Integer upOrder){
		boolean result = false;
		if(!ObjectUtil.isNullOrEmpty(record)){
			try {
				result = industrySasacService.updatePosition(record, upId, upOrder);
			} catch (Exception e) {
				logger.error("菜单位置变更异常",e);
			}
		}
		return result;
	}
}
