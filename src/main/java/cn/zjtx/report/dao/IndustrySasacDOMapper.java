package cn.zjtx.report.dao;

import java.util.List;

import cn.zjtx.report.entity.IndustrySasacDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface IndustrySasacDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(IndustrySasacDO record);

    IndustrySasacDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IndustrySasacDO record);

    List<IndustrySasacDO> selectAll();

    Integer selectLasrOrderNo(@Param("parentId")Integer parentId);
}