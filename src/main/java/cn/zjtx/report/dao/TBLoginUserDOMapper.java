package cn.zjtx.report.dao;

import cn.zjtx.report.entity.TBLoginUserDO;

public interface TBLoginUserDOMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(TBLoginUserDO record);

    int insertSelective(TBLoginUserDO record);

    TBLoginUserDO selectByPrimaryKey(Integer userId);
    
    TBLoginUserDO selectByLoginName(String loginName);

    int updateByPrimaryKeySelective(TBLoginUserDO record);

    int updateByPrimaryKey(TBLoginUserDO record);
}