package cn.zjtx.report.dao;

import cn.zjtx.report.entity.NationalStandardDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface NationalStandardDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(NationalStandardDO record);

    NationalStandardDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NationalStandardDO record);

    List<NationalStandardDO> selectAll();

    Integer selectLasrOrderNo(@Param("parentId") Integer parentId);
}