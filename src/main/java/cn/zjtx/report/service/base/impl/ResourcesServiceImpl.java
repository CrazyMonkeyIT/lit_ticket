package cn.zjtx.report.service.base.impl;

import java.sql.Timestamp;
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

	/**
	 * 更新资源信息
	 * @param record
	 * @return
	 */
	@Override
	public boolean insertOrUpdate(TBResourcesDO record) {
		if(record.getResourceId() == null){
			record.setOrderNo(selectCurrOrderNo(record.getParentId()));
			record.setActive(1);
			record.setCreateTime(new Timestamp(System.currentTimeMillis()));
			resourcesDOMapper.insertSelective(record);
		}else{
			if(record.getParentId().equals(record.getResourceId())){
				record.setParentId(null);
			}
			record.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			resourcesDOMapper.updateByPrimaryKeySelective(record);
		}
		return true;
	}

	/**
	 * 查询单条资源信息
	 * @param resourceId
	 * @return
	 */
	@Override
	public TBResourcesDO selectByPrimaryKey(Integer resourceId) {
		return resourcesDOMapper.selectByPrimaryKey(resourceId);
	}

	/**
	 * 删除资源信息
	 * @param resourceId
	 * @return
	 */
	@Override
	public boolean deleteResource(Integer resourceId) {
		TBResourcesDO record = new TBResourcesDO();
		record.setResourceId(resourceId);
		record.setActive(0);
		resourcesDOMapper.updateByPrimaryKeySelective(record);
		return true;
	}

	/**
	 * 调整资源位置
	 * @param resource
	 * @param upId
	 * @param upOrder
	 * @return
	 */
	@Override
	public boolean updateResourcePosition(TBResourcesDO resource, Integer upId,Integer upOrder) {
		Integer order = resource.getOrderNo();
		resource.setOrderNo(upOrder);
		TBResourcesDO r = new TBResourcesDO();
		r.setOrderNo(order);
		r.setResourceId(upId);
		int updateSed = resourcesDOMapper.updateByPrimaryKeySelective(resource);
		int updateOne = resourcesDOMapper.updateByPrimaryKeySelective(r);
		if(updateSed > 0 && updateOne > 0){
			return true;
		}
		return false;
	}

	/**
	 * 查询当前资源节点序号
	 * @param parentId
	 * @return
	 */
	@Override
	public int selectCurrOrderNo(Integer parentId) {
		Integer maxOrderNo = resourcesDOMapper.selectLasrOrderNo(parentId);
		//如果没有子菜单，就设置初始值1
		maxOrderNo = maxOrderNo == null?0:maxOrderNo;
		return (maxOrderNo + 1);
	}
	/**
	 * 获取用户资源列表
	 * @param userId
	 * @return
	 */
	@Override
	public List<TBResourcesDO> selectByUserId(Integer userId) {
		if(userId == 0 || userId == null){
			return null;
		}
		return resourcesDOMapper.selectByUserId(userId);
	}

	/**
	 * 获取全部资源列表
	 * @return
	 */
	@Override
	public List<TBResourcesDO> selectAll() {
		return resourcesDOMapper.selectAllActive();
	}

}
