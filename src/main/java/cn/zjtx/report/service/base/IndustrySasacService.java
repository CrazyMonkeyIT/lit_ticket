package cn.zjtx.report.service.base;

import java.util.List;

import cn.zjtx.report.entity.IndustrySasacDO;

public interface IndustrySasacService {

	
	public List<IndustrySasacDO> selectAll();
	
	public void saveIndustry(IndustrySasacDO industry);
}
