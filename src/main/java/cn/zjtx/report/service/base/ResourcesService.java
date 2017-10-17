package cn.zjtx.report.service.base;

import java.util.List;

import cn.zjtx.report.entity.TBResourcesDO;

public interface ResourcesService {

	public List<TBResourcesDO> selectByUserId(Integer userId);
	
	public List<TBResourcesDO> selectAll();

	boolean insertOrUpdate(TBResourcesDO record);

	TBResourcesDO selectByPrimaryKey(Integer resourceId);

	boolean deleteResource(Integer resourceId);

	boolean updateResourcePosition(TBResourcesDO resource,Integer upId,Integer upOrder);

	int selectCurrOrderNo(Integer parentId);
}
