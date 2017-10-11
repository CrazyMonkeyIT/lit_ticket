package cn.zjtx.report.base.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String format(Date date, String format) {
		if (date == null) {
			return null;
		}
		return new SimpleDateFormat(format).format(date);

	}
}
