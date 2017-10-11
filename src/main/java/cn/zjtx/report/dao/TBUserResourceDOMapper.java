package cn.zjtx.report.dao;

import cn.zjtx.report.entity.TBUserResourceDO;
import org.springframework.stereotype.Component;

@Component
public interface TBUserResourceDOMapper {
    int deleteByPrimaryKey(Integer userResourceId);

    int insertSelective(TBUserResourceDO record);

    TBUserResourceDO selectByPrimaryKey(Integer userResourceId);

    int updateByPrimaryKeySelective(TBUserResourceDO record);


}