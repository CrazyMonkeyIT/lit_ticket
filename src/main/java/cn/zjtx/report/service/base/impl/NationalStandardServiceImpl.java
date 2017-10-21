package cn.zjtx.report.service.base.impl;

import cn.zjtx.report.dao.NationalStandardDOMapper;
import cn.zjtx.report.entity.NationalStandardDO;
import cn.zjtx.report.service.base.NationalStandardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

/**
 * 国标行业
 * @author xiaxin
 * @date 2017-10-16
 */
@Service
public class NationalStandardServiceImpl implements NationalStandardService {

	@Resource
	private NationalStandardDOMapper nationalStandardDOMapper;

	/**
	 * 获取所有的国标行业
	 * @return
	 */
	@Override
	public List<NationalStandardDO> selectAll() {
		return nationalStandardDOMapper.selectAll();
	}

    /**
     * 查询单条国标行业信息
	 * @param id
     * @return
     */
	@Override
	public NationalStandardDO selectByPrimaryKey(Integer id) {
		return nationalStandardDOMapper.selectByPrimaryKey(id);
	}

	/**
	 * 更新国标行业信息
	 * @param record
	 * @return
	 */
	@Override
	public boolean insertOrUpdate(NationalStandardDO record) {
		if(record.getId() == null){
			record.setOrderNo(selectCurrOrderNo(record.getParentId()));
			record.setActive(1);
			record.setCreateTime(new Timestamp(System.currentTimeMillis()));
			nationalStandardDOMapper.insertSelective(record);
		}else{
			if(record.getParentId().equals(record.getId())){
				record.setParentId(null);
			}
			record.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			nationalStandardDOMapper.updateByPrimaryKeySelective(record);
		}
		return true;
	}

	/**
	 * 删除国标行业
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteByPrimaryKey(Integer id) {
		NationalStandardDO record = new NationalStandardDO();
		record.setId(id);
		record.setActive(0);
		int rows = nationalStandardDOMapper.updateByPrimaryKeySelective(record);
		return (rows > 0);
	}

	/**
	 * 更新排序位置
	 * @return
	 */
	@Override
	public boolean updatePosition(NationalStandardDO record, Integer upId, Integer upOrder) {
		Integer order = record.getOrderNo();
		record.setOrderNo(upOrder);
		NationalStandardDO r = new NationalStandardDO();
		r.setOrderNo(order);
		r.setId(upId);
		int updateSed = nationalStandardDOMapper.updateByPrimaryKeySelective(record);
		int updateOne = nationalStandardDOMapper.updateByPrimaryKeySelective(r);
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
		Integer maxOrderNo = nationalStandardDOMapper.selectLasrOrderNo(parentId);
		//如果没有子菜单，就设置初始值1
		maxOrderNo = maxOrderNo == null?0:maxOrderNo;
		return (maxOrderNo + 1);
	}


}
