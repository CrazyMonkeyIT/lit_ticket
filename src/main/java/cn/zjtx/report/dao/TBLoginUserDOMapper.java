package cn.zjtx.report.dao;

import cn.zjtx.report.entity.TBLoginUserDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface TBLoginUserDOMapper {
    int deleteByPrimaryKey(Integer userId);

    int insertSelective(TBLoginUserDO record);

    TBLoginUserDO selectByPrimaryKey(Integer userId);
    
    TBLoginUserDO selectByLoginName(String loginName);

    int updateByPrimaryKeySelective(TBLoginUserDO record);

    List<TBLoginUserDO> selectUserList(@Param("userId") Integer userId, @Param("userName") String userName);
}