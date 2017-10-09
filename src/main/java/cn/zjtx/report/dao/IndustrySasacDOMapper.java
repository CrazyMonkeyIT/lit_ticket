package cn.zjtx.report.dao;

import java.util.List;

import cn.zjtx.report.entity.IndustrySasacDO;

public interface IndustrySasacDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(IndustrySasacDO record);

    int insertSelective(IndustrySasacDO record);

    IndustrySasacDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IndustrySasacDO record);

    int updateByPrimaryKey(IndustrySasacDO record);
    
    List<IndustrySasacDO> selectAll();
}