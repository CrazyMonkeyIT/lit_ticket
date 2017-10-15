package cn.zjtx.report.service.base.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zjtx.report.dao.IndustrySasacDOMapper;
import cn.zjtx.report.entity.IndustrySasacDO;
import cn.zjtx.report.service.base.IndustrySasacService;

@Service("industrySasacService")
public class IndustrySasacServiceImpl implements IndustrySasacService {

	@Autowired
	private IndustrySasacDOMapper industrySasacDOMapper;
	
	@Override
	public List<IndustrySasacDO> selectAll() {
		return industrySasacDOMapper.selectAll();
	}

	@Override
	public void saveIndustry(IndustrySasacDO industry) {
		industrySasacDOMapper.insert(industry);
	}

}
