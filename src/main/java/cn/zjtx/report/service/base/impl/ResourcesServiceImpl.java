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
			record.setActive(1);
			record.setCreateTime(new Timestamp(System.currentTimeMillis()));
			resourcesDOMapper.insertSelective(record);
		}else{
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
	 * @param upName
	 * @param upId
	 * @param uppId
	 * @param upOrder
	 * @return
	 */
	@Override
	public boolean updateResourcePosition(TBResourcesDO resource, String upName, Integer upId, Integer uppId, Integer upOrder) {
		boolean result = false;
		if (upOrder == null || resource.getOrderNo() == null) {
			return result;
		}else if(uppId == 0L&&resource.getParentId() == 0L){
			int num = saveParentId(resource, upName, upId, uppId, upOrder);
			result = num == 1 ? true : false;
		}else {
			int num = saveOrUpdate(resource, upName, upId, uppId, upOrder);
			result = num == 1 ? true : false;
		}
		return result;
	}

	/**
	 * 二级菜单位置互换
	 *
	 * @param user
	 * @return
	 */
	private int saveOrUpdate(final TBResourcesDO resource, final String upName,
							 final Integer upId, final Integer uppId, final Integer upOrder) {
		Integer order = resource.getOrderNo();
		resource.setOrderNo(upOrder);
		TBResourcesDO r = new TBResourcesDO();
		r.setOrderNo(order);
		r.setResourceId(upId);
		int updateSed = resourcesDOMapper.updateByPrimaryKeySelective(resource);
		int updateOne = resourcesDOMapper.updateByPrimaryKeySelective(r);
		if(updateSed >0 && updateOne>0){
			return 1;
		}
		return -1;
	}



	/**
	 * 一级菜单位置互换
	 * 1.根据菜单编号判断是向下或者向上互换
	 * 2.如向下互换，首更改互换菜单编号，循环子节点如存在，依次递增更改菜单排序编号
	 *   获取子节点个数，互换菜单编号加上子节点个数加一者进行更换原菜单编号，依次循环
	 *   原菜单下子节点，如存在着依次加一
	 * 3.向上互换同理
	 * @param user
	 * @return
	 */
	private int saveParentId(final TBResourcesDO resource, final String upName,
							 final Integer upId, final Integer uppId, final Integer upOrder) {
		int count = 1;
		int countOne = 1;
		//更换菜单
		TBResourcesDO r = new TBResourcesDO();
		r.setResourceId(upId);
		// 原始菜单子列表
		List<TBResourcesDO> rList = resourcesDOMapper.queryResourceByParentId(resource.getResourceId());
		//更换菜单子列表
		List<TBResourcesDO> changList = resourcesDOMapper.queryResourceByParentId(upId);
		//向上互换 同理向下
		if(resource.getOrderNo() > upOrder){
			//原菜单序列更变
			resource.setOrderNo(upOrder);
			int updateSed = resourcesDOMapper.updateByPrimaryKeySelective(resource);
			if(updateSed>0){
				// 获取原菜单所有的子节点
				for (TBResourcesDO r1 : rList) {
					int orderId = new Long(upOrder).intValue();
					orderId = orderId + count;
					r1.setOrderNo(orderId);
					resourcesDOMapper.updateByPrimaryKeySelective(r1);
					count++;
				}
				//修改更换菜单排序号
				r.setOrderNo((upOrder + rList.size() + 1));
				resourcesDOMapper.updateByPrimaryKeySelective(r);

				// 更换菜单下子节点
				for (TBResourcesDO r2 : changList) {
					int orderId = r.getOrderNo();
					orderId = orderId + countOne;
					r2.setOrderNo(orderId);
					resourcesDOMapper.updateByPrimaryKeySelective(r2);
					countOne++;
				}
			}
		}else{
			//更换菜单序号
			r.setOrderNo(resource.getOrderNo());
			int updateSed = resourcesDOMapper.updateByPrimaryKeySelective(r);
			if(updateSed>0){
				//获取更换子节点
				for (TBResourcesDO r2 : changList) {
					int orderId = resource.getOrderNo();
					orderId = orderId + countOne;
					r2.setOrderNo(orderId);
					resourcesDOMapper.updateByPrimaryKeySelective(r2);
					countOne++;
				}
				//更换原始菜单
				resource.setOrderNo(r.getOrderNo()+changList.size()+1);
				resourcesDOMapper.updateByPrimaryKeySelective(resource);
				// 获取原菜单所有的子节点
				for (TBResourcesDO r1 : rList) {
					int orderId = resource.getOrderNo();
					orderId = orderId + count;
					r1.setOrderNo(orderId);
					resourcesDOMapper.updateByPrimaryKeySelective(r1);
					count++;
				}
			}
		}
		return 1;
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
