package com.tq.requisition.infrastructure.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeStamp {
	/**
	 * ʱ���ת�������ڸ�ʽ�ַ���
	 * 
	 * @param seconds
	 *            ��ȷ������ַ���
	 * @param formatStr
	 * @return
	 */
	public static String timeStamp2Date(String seconds, String format) {
		if (seconds == null || seconds.isEmpty() || seconds.equals("null")) {
			return "";
		}
		if (format == null || format.isEmpty())
			format = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date(Long.valueOf(seconds + "000")));
	}
	
	public static Date timeStamp2Date(String seconds){
		return new Date(Long.valueOf(seconds + "000"));
	}

	/**
	 * ���ڸ�ʽ�ַ���ת����ʱ���
	 * 
	 * @param date
	 *            �ַ�������
	 * @param format
	 *            �磺yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String date2TimeStamp(String date_str, String format) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return String.valueOf(sdf.parse(date_str).getTime() / 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * ȡ�õ�ǰʱ�������ȷ���룩
	 * 
	 * @return
	 */
	public static String timeStamp() {
		long time = System.currentTimeMillis();
		String t = String.valueOf(time / 1000);
		return t;
	}
	
	/**
	 * ȡ�õ�ǰʱ�������ȷ���룩
	 * 
	 * @return
	 */
	public static String timeStamp(Date time){
		return String.valueOf(time.getTime() / 1000);
	}
}
