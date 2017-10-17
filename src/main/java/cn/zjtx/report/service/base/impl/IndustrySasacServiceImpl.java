package cn.zjtx.report.service.base.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.zjtx.report.dao.IndustrySasacDOMapper;
import cn.zjtx.report.entity.IndustrySasacDO;
import cn.zjtx.report.service.base.IndustrySasacService;

import javax.annotation.Resource;

/**
 * 国资委行业
 * @author xiaxin
 * @date 2017-10-16
 */
@Service
public class IndustrySasacServiceImpl implements IndustrySasacService {

	@Resource
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
	 * 查询单条国资委行业信息
	 * @param id
	 * @return
	 */
	@Override
	public IndustrySasacDO selectByPrimaryKey(Integer id) {
		return industrySasacDOMapper.selectByPrimaryKey(id);
	}

	/**
	 * 更新国资委行业信息
	 * @param record
	 * @return
	 */
	@Override
	public boolean insertOrUpdate(IndustrySasacDO record) {
		if(record.getId() == null){
			record.setOrderNo(selectCurrOrderNo(record.getParentId()));
			record.setActive(1);
			record.setCreateTime(new Timestamp(System.currentTimeMillis()));
			industrySasacDOMapper.insertSelective(record);
		}else{
			if(record.getParentId().equals(record.getId())){
				record.setParentId(null);
			}
			record.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			industrySasacDOMapper.updateByPrimaryKeySelective(record);
		}
		return true;
	}

	/**
	 * 删除国资委行业
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteByPrimaryKey(Integer id) {
		int rows = industrySasacDOMapper.deleteByPrimaryKey(id);
		return (rows > 0);
	}

	/**
	 * 更新排序位置
	 * @return
	 */
	@Override
	public boolean updatePosition(IndustrySasacDO record, Integer upId, Integer upOrder) {
		Integer order = record.getOrderNo();
		record.setOrderNo(upOrder);
		IndustrySasacDO r = new IndustrySasacDO();
		r.setOrderNo(order);
		r.setId(upId);
		int updateSed = industrySasacDOMapper.updateByPrimaryKeySelective(record);
		int updateOne = industrySasacDOMapper.updateByPrimaryKeySelective(r);
		if(updateSed > 0 && updateOne > 0){
			return true;
		}
		return false;
	}

	/**
	 * 获取当前节点序号
	 * @param parentId
	 * @return
	 */
	@Override
	public int selectCurrOrderNo(Integer parentId) {
		Integer maxOrderNo = industrySasacDOMapper.selectLasrOrderNo(parentId);
		//如果没有子菜单，就设置初始值1
		maxOrderNo = maxOrderNo == null?0:maxOrderNo;
		return (maxOrderNo + 1);
	}


}
