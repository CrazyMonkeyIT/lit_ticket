package cn.zjtx.report.service.base;

import cn.zjtx.report.entity.TBLoginUserDO;
import com.github.pagehelper.PageInfo;

public interface LoginUserService {

	public TBLoginUserDO selectByLoginName(String loginName);

	public void insertOrUpdate(TBLoginUserDO loginUser);

	public PageInfo<TBLoginUserDO> selectUserList(Integer userId, String userName, String pageIndex, String pageSize);
}
