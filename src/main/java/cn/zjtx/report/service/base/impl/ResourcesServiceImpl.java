package cn.zjtx.report.service.base.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zjtx.report.dao.TBResourcesDOMapper;
import cn.zjtx.report.entity.TBResourcesDO;
import cn.zjtx.report.service.base.ResourcesService;

@Service("resourcesService")
public class ResourcesServiceImpl implements ResourcesService {

	@Resource
	private TBResourcesDOMapper resourcesDOMapper;

	/**
	 * 更新资源信息
	 * @param record
	 * @return
	 */
	@Override
	public boolean insertOrUpdate(TBResourcesDO record) {
		if(record.getResourceId() == null){
			record.setActive(1);
			record.setCreateTime(new Timestamp(System.currentTimeMillis()));
			resourcesDOMapper.insertSelective(record);
		}else{
			record.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			resourcesDOMapper.updateByPrimaryKeySelective(record);
		}
		return true;
	}

	@Override
	public List<TBResourcesDO> selectByUserId(Integer userId) {
		if(userId == 0 || userId == null){
			return null;
		}
		return resourcesDOMapper.selectByUserId(userId);
	}


	@Override
	public List<TBResourcesDO> selectAll() {
		return resourcesDOMapper.selectAllActive();
	}

}
