package cn.zjtx.report.base.util;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * <p>
 * DO到Bean对象的转换类
 * </p>
 * 
 */
public abstract class ObjConverter<BO, DO> {
	public abstract BO from(DO from);

	public abstract DO to(BO from);

	public List<BO> convert(List<DO> ds) {
		if (ds == null || ds.size() < 1) {
			return new ArrayList<BO>();
		}
		List<BO> result = new ArrayList<BO>();
		for (DO d : ds) {
			result.add(from(d));
		}
		return result;
	}
}
