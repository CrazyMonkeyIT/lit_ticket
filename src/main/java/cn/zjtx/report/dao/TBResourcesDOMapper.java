package cn.zjtx.report.dao;

import java.util.List;

import cn.zjtx.report.entity.TBResourcesDO;
import org.springframework.stereotype.Component;

@Component
public interface TBResourcesDOMapper {
    int deleteByPrimaryKey(Integer resourceId);

    int insertSelective(TBResourcesDO record);

    TBResourcesDO selectByPrimaryKey(Integer resourceId);

    int updateByPrimaryKeySelective(TBResourcesDO record);

    List<TBResourcesDO> selectByUserId(Integer userId);
    
    List<TBResourcesDO> selectAllActive();
}