package cn.zjtx.report.dao;

import cn.zjtx.report.entity.CustomerDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 客户
 * @author xiaxin
 * @date 2017-10-18
 */
@Component
public interface CustomerDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(CustomerDO record);

    int updateByPrimaryKeySelective(CustomerDO record);

    CustomerDO selectByPrimaryKey(Integer id);

    CustomerDO selectByCustName(@Param("custName")String custName);

    List<CustomerDO> selectCurrUserCustList(@Param("userId")Integer userId,@Param("custName")String custName);

    /**
     * 查询客户列表，键值对方法
     * @param userId 当前用户ID
     * @return 客户列表
     */
    List<CustomerDO> selectCurrUserCustKV(@Param("userId")Integer userId);
}