package cn.zjtx.report.dao;

import cn.zjtx.report.entity.CustomerDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CustomerDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(CustomerDO record);

    int updateByPrimaryKeySelective(CustomerDO record);

    CustomerDO selectByPrimaryKey(Integer id);

    CustomerDO selectByCustName(@Param("custName")String custName);

    List<CustomerDO> selectCurrUserCustList(@Param("userId")Integer userId,@Param("custName")String custName);

}