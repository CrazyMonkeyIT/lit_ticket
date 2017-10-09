package cn.zjtx.report.service.base;

import cn.zjtx.report.entity.TBLoginUserDO;

public interface LoginUserService {

	/**
	 * 根据登录名称查询用户信息
	 * @param loginName
	 * @return
	 */
	public TBLoginUserDO selectByLoginName(String loginName);
	
	public void update(TBLoginUserDO loginUser);
}
