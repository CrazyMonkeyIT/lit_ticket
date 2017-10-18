package cn.zjtx.report.service.base;

import cn.zjtx.report.entity.CustomerDO;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CustomerService {

    boolean deleteByPrimaryKey(Integer id);

    boolean insertOrUpdate(CustomerDO record,Integer userId);

    CustomerDO selectByPrimaryKey(Integer id);

    PageInfo<CustomerDO> selectCurrUserCustList(Integer userId, String custName, Integer pageIndex, Integer pageSize);
}
