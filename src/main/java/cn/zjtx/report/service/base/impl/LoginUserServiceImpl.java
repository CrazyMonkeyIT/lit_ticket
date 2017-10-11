package cn.zjtx.report.service.base.impl;
import cn.zjtx.report.base.util.StringUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import cn.zjtx.report.dao.TBLoginUserDOMapper;
import cn.zjtx.report.entity.TBLoginUserDO;
import cn.zjtx.report.service.base.LoginUserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service("loginUserService")
public class LoginUserServiceImpl implements LoginUserService {

	@Resource
	private TBLoginUserDOMapper loginUserDOMapper;

	/**
	 * 根据登录名称查询用户信息
	 * @param loginName
	 * @return
	 */
	@Override
	public TBLoginUserDO selectByLoginName(String loginName) {
		if(StringUtils.isEmpty(loginName))
			return null;
		return loginUserDOMapper.selectByLoginName(loginName);
	}

	/**
	 * 更新用户信息
	 * @param loginUser
	 */
	@Override
	public void insertOrUpdate(TBLoginUserDO loginUser) {
		loginUserDOMapper.updateByPrimaryKeySelective(loginUser);
	}

	/**
	 * 查询用户列表
	 * @param userName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public PageInfo<TBLoginUserDO> selectUserList(Integer userId, String userName, String page, String size) {
		page = (page==null || StringUtil.isBlank(page))?"1":page;
		size = (size==null || StringUtil.isBlank(size))?"10":size;
		PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(size));
		List<TBLoginUserDO> list = loginUserDOMapper.selectUserList(userId,userName);
		PageInfo<TBLoginUserDO> r = new PageInfo<TBLoginUserDO>(list);
		return r;
	}

}
