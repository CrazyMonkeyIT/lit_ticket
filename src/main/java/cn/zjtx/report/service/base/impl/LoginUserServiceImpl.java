package cn.zjtx.report.service.base.impl;
import cn.zjtx.report.base.util.SHA256;
import cn.zjtx.report.base.util.StringUtil;
import cn.zjtx.report.bean.BaseResult;
import cn.zjtx.report.dao.TBUserResourceDOMapper;
import cn.zjtx.report.entity.TBUserResourceDO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import cn.zjtx.report.dao.TBLoginUserDOMapper;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.service.base.LoginUserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.StringTokenizer;

@Service("loginUserService")
public class LoginUserServiceImpl implements LoginUserService {

	@Resource
	private TBLoginUserDOMapper loginUserDOMapper;

	@Resource
	TBUserResourceDOMapper userResourceDOMapper;
	/**
	 * 根据登录名称查询用户信息
	 * @param loginName
	 * @return
	 */
	@Override
	public TBLoginUserDO selectByLoginName(String loginName) {
		if(StringUtils.isEmpty(loginName)) {
			return null;
		}
		return loginUserDOMapper.selectByLoginName(loginName);
	}

	/**
	 * 更新用户信息
	 * @param loginUser
	 */
	@Override
	public boolean insertOrUpdate(TBLoginUserDO loginUser) {
		int rows = 0;
		if(loginUser.getUserId() == null){
			loginUser.setLoginPwd(SHA256.encrypt("123456"));
			loginUser.setUserStatus(1);
			loginUser.setCreateTime(new Timestamp(System.currentTimeMillis()));
			rows = loginUserDOMapper.insertSelective(loginUser);
		}else {
			loginUser.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			rows = loginUserDOMapper.updateByPrimaryKeySelective(loginUser);
		}
		return (rows > 0);
	}

	/**
	 * 查询用户列表
	 * @param userId
	 * @param userName
	 * @param page
	 * @param size
	 * @return
	 */
	@Override
	public PageInfo<TBLoginUserDO> selectUserList(Integer userId, String userName, String page, String size) {
		page = (page==null || StringUtil.isBlank(page))?"1":page;
		size = (size==null || StringUtil.isBlank(size))?"10":size;
		PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(size));
		List<TBLoginUserDO> list = loginUserDOMapper.selectUserList(userId,userName);
		PageInfo<TBLoginUserDO> r = new PageInfo<TBLoginUserDO>(list);
		return r;
	}

	/**
	 * 重置用户密码
	 * @param userId
	 * @return
	 */
	@Override
	public boolean resetUserPwd(Integer userId) {
		TBLoginUserDO loginUser = new TBLoginUserDO();
		loginUser.setUserId(userId);
		loginUser.setLoginPwd(SHA256.encrypt("123456"));
		int rows = loginUserDOMapper.updateByPrimaryKeySelective(loginUser);
		return (rows > 0);
	}

	/**
	 * 修改用户状态（冻结/解冻）
	 * @param userId
	 * @param status
	 * @return
	 */
	@Override
	public boolean updateUserStatus(Integer userId, Integer status) {
		TBLoginUserDO loginUser = new TBLoginUserDO();
		loginUser.setUserId(userId);
		loginUser.setUserStatus(status);
		int rows = loginUserDOMapper.updateByPrimaryKeySelective(loginUser);
		return (rows > 0);
	}

	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	@Override
	public boolean deleteUser(Integer userId) {
		TBLoginUserDO user = new TBLoginUserDO();
		user.setUserId(userId);
		user.setUserStatus(4);
		int rows = loginUserDOMapper.updateByPrimaryKeySelective(user);
		return (rows > 0);
	}

	/**
	 * 修改用户权限
	 * @param userId
	 * @param json
	 * @return
	 */
	@Override
	public boolean updateUserPower(Integer userId, String json) {
		//将原资源权限设为不可用
		userResourceDOMapper.deleteByUserId(userId);
		StringTokenizer st = new StringTokenizer(json,",");
		while(st.hasMoreTokens()){
			TBUserResourceDO record = new TBUserResourceDO();
			record.setUserId(userId);
			record.setResourceId(Integer.parseInt(st.nextToken()));
			record.setActive(1);
			record.setCreateTime(new Timestamp(System.currentTimeMillis()));
			userResourceDOMapper.insertSelective(record);
		}
		return true;
	}

	/**
	 * 修改密码
	 * @param userId
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@Override
	public BaseResult modifyPwd(Integer userId, String oldPwd, String newPwd) {
		BaseResult result = new BaseResult();
		result.setSuccess(false);
		TBLoginUserDO user = loginUserDOMapper.selectByPrimaryKey(userId);
		if(!user.getLoginPwd().equals(SHA256.encrypt(oldPwd))){
			result.setMessage("原密码不正确");
		}else{
			user.setLoginPwd(SHA256.encrypt(newPwd));
			loginUserDOMapper.updateByPrimaryKeySelective(user);
			result.setSuccess(true);
		}
		return result;
	}

}
