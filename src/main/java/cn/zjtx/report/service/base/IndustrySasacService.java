package cn.zjtx.report.service.base;

import java.util.List;

import cn.zjtx.report.entity.IndustrySasacDO;

public interface IndustrySasacService {

	
	List<IndustrySasacDO> selectAll();
	
	void saveIndustry(IndustrySasacDO industry);
}
