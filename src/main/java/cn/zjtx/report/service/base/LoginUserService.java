package cn.zjtx.report.service.base;

import cn.zjtx.report.bean.BaseResult;
import cn.zjtx.report.entity.TBLoginUserDO;
import com.github.pagehelper.PageInfo;

public interface LoginUserService {

	public TBLoginUserDO selectByLoginName(String loginName);

	public boolean insertOrUpdate(TBLoginUserDO loginUser);

	public PageInfo<TBLoginUserDO> selectUserList(Integer userId, String userName, String pageIndex, String pageSize);

	public boolean resetUserPwd(Integer userId);

	public boolean updateUserStatus(Integer userId,Integer status);

	public boolean deleteUser(Integer userId);

	public boolean updateUserPower(Integer userId,String json);

	public BaseResult modifyPwd(Integer userId,String oldPwd,String newPwd);
}
