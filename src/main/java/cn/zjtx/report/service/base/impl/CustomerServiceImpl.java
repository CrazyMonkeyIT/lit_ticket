package cn.zjtx.report.service.base.impl;

import cn.zjtx.report.dao.CustomerDOMapper;
import cn.zjtx.report.entity.CustomerDO;
import cn.zjtx.report.service.base.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户管理
 * @author xiaxin
 * @date 2017-10-18
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Resource
    CustomerDOMapper customerDOMapper;

    /**
     * 查询当前用户的客户列表
     * @param userId
     * @param custName
     * @param page
     * @param size
     * @return
     */
    @Override
    public PageInfo<CustomerDO> selectCurrUserCustList(Integer userId, String custName, Integer page, Integer size) {
        PageHelper.startPage((page == null)?1:page, (size == null)?10:size);
        List<CustomerDO> list = customerDOMapper.selectCurrUserCustList(userId,custName);
        PageInfo<CustomerDO> result = new PageInfo<CustomerDO>(list);
        return result;
    }


    /**
     * 更新客户信息
     * @param record
     * @return
     */
    @Override
    public Map<String,Object> insertOrUpdate(CustomerDO record, Integer userId) {
        boolean isSuccess = false;
        String message = "";
        CustomerDO custNameRecord = customerDOMapper.selectByCustName(record.getCustName());
        if(custNameRecord != null && !custNameRecord.getId().equals(record.getId())){
            message = "该客户名已存在，不能重复创建";
        }else {
            if (record.getId() == null) {
                record.setActive(1);
                record.setCreateUserId(userId);
                record.setCreateTime(new Timestamp(System.currentTimeMillis()));
                int rows = customerDOMapper.insertSelective(record);
                isSuccess = (rows > 0);
            } else {
                record.setUpdateUserId(userId);
                record.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                int rows = customerDOMapper.updateByPrimaryKeySelective(record);
                isSuccess = (rows > 0);
            }
        }
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",isSuccess);
        resultMap.put("message",message);
        return resultMap;
    }

    /**
     * 查询客户信息
     * @param id
     * @return
     */
    @Override
    public CustomerDO selectByPrimaryKey(Integer id) {
        return customerDOMapper.selectByPrimaryKey(id);
    }

    /**
     * 删除客户信息
     * @param id
     * @return
     */
    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        int rows = customerDOMapper.deleteByPrimaryKey(id);
        return (rows > 0);
    }
}
