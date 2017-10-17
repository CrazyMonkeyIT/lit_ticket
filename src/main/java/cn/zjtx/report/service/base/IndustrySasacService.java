package cn.zjtx.report.service.base;

import java.util.List;

import cn.zjtx.report.entity.IndustrySasacDO;

public interface IndustrySasacService {

	
	List<IndustrySasacDO> selectAll();
	
	boolean insertOrUpdate(IndustrySasacDO record);

	boolean deleteByPrimaryKey(Integer id);

	boolean updatePosition();
}
