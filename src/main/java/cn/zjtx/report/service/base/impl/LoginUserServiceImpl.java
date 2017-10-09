package cn.zjtx.report.service.base.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.zjtx.report.dao.TBLoginUserDOMapper;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.service.base.LoginUserService;

@Service("loginUserService")
public class LoginUserServiceImpl implements LoginUserService {

	@Resource
	private TBLoginUserDOMapper loginUserDOMapper;
	
	@Override
	public TBLoginUserDO selectByLoginName(String loginName) {
		if(StringUtils.isEmpty(loginName))
			return null;
		return loginUserDOMapper.selectByLoginName(loginName);
	}

	@Override
	public void update(TBLoginUserDO loginUser) {
		loginUserDOMapper.updateByPrimaryKey(loginUser);
		
	}

}
