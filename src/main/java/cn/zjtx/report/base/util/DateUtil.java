package cn.zjtx.report.base.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String format(Date date, String format) {
		if (date == null) {
			return null;
		}
		return new SimpleDateFormat(format).format(date);
	}

	public static Timestamp StrToTimestamp(String date, String format) throws Exception {
		if (date == null) {
			return null;
		}
		return new Timestamp(new SimpleDateFormat(format).parse(date).getTime());
	}
}
