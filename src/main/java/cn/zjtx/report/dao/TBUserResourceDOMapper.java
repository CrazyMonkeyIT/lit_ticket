package cn.zjtx.report.dao;

import cn.zjtx.report.entity.TBUserResourceDO;

public interface TBUserResourceDOMapper {
    int deleteByPrimaryKey(Integer userResourceId);

    int insert(TBUserResourceDO record);

    int insertSelective(TBUserResourceDO record);

    TBUserResourceDO selectByPrimaryKey(Integer userResourceId);

    int updateByPrimaryKeySelective(TBUserResourceDO record);

    int updateByPrimaryKey(TBUserResourceDO record);
    
}