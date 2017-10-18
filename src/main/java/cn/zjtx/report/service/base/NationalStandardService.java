package cn.zjtx.report.service.base;

import cn.zjtx.report.entity.NationalStandardDO;

import java.util.List;

public interface NationalStandardService {

	
	List<NationalStandardDO> selectAll();

	NationalStandardDO selectByPrimaryKey(Integer id);
	
	boolean insertOrUpdate(NationalStandardDO record);

	boolean deleteByPrimaryKey(Integer id);

	boolean updatePosition(NationalStandardDO record, Integer upId, Integer upOrder);

	int selectCurrOrderNo(Integer parentId);
}
