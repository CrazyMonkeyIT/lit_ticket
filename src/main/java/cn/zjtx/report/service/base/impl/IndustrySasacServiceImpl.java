package cn.zjtx.report.service.base.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zjtx.report.dao.IndustrySasacDOMapper;
import cn.zjtx.report.entity.IndustrySasacDO;
import cn.zjtx.report.service.base.IndustrySasacService;

/**
 * 国资委行业
 * @author xiaxin
 * @date 2017-10-16
 */
@Service("industrySasacService")
public class IndustrySasacServiceImpl implements IndustrySasacService {

	@Autowired
	private IndustrySasacDOMapper industrySasacDOMapper;

	/**
	 * 获取所有的国资委行业
	 * @return
	 */
	@Override
	public List<IndustrySasacDO> selectAll() {
		return industrySasacDOMapper.selectAll();
	}

	/**
	 * 更新国资委行业信息
	 * @param record
	 * @return
	 */
	@Override
	public boolean insertOrUpdate(IndustrySasacDO record) {
		return false;
	}

	/**
	 * 删除国资委行业
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteByPrimaryKey(Integer id) {
		return false;
	}

	/**
	 * 更新排序位置
	 * @return
	 */
	@Override
	public boolean updatePosition() {
		return false;
	}


}
