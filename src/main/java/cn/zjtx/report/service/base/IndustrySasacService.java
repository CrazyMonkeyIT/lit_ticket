package cn.zjtx.report.service.base;

import java.util.List;

import cn.zjtx.report.entity.IndustrySasacDO;

public interface IndustrySasacService {

	
	List<IndustrySasacDO> selectAll();

	IndustrySasacDO selectByPrimaryKey(Integer id);
	
	boolean insertOrUpdate(IndustrySasacDO record);

	boolean deleteByPrimaryKey(Integer id);

	boolean updatePosition(IndustrySasacDO record, Integer upId, Integer upOrder);

	int selectCurrOrderNo(Integer parentId);
}
