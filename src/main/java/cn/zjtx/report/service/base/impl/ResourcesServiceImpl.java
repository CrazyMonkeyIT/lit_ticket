package cn.zjtx.report.service.base.impl;

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
