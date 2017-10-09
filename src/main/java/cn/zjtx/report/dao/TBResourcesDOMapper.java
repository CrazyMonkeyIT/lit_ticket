package cn.zjtx.report.dao;

import java.util.List;

import cn.zjtx.report.entity.TBResourcesDO;

public interface TBResourcesDOMapper {
    int deleteByPrimaryKey(Integer resourceId);

    int insert(TBResourcesDO record);

    int insertSelective(TBResourcesDO record);

    TBResourcesDO selectByPrimaryKey(Integer resourceId);

    int updateByPrimaryKeySelective(TBResourcesDO record);

    int updateByPrimaryKey(TBResourcesDO record);
    
    List<TBResourcesDO> selectByUserId(Integer userId);
    
    List<TBResourcesDO> selectAllActive();
}