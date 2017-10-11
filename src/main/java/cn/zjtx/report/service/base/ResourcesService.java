package cn.zjtx.report.service.base;

import java.util.List;

import cn.zjtx.report.entity.TBResourcesDO;

public interface ResourcesService {

	public List<TBResourcesDO> selectByUserId(Integer userId);
	
	public List<TBResourcesDO> selectAll();

	boolean insertOrUpdate(TBResourcesDO record);
}
