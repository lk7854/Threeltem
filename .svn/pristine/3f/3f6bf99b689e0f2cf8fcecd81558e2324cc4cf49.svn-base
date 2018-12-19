package com.aaa.util.tb.help;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Tools {

	/**
	 * 任何数据类型转换成Integer类型
	 * 
	 * @param obj
	 * @return
	 */
	public static Integer toInteger(Object obj) {
		if (null != obj) {
			return Integer.parseInt(obj.toString());
		}
		return null;
	}

	/**
	 * 将informat格式的字符串date转换成outformat格式的字符串
	 * 
	 * @param date
	 * @param informat
	 * @param outformat
	 * @return
	 * @throws ParseException
	 */
	public static String getDate(String date, String informat, String outformat)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(informat);
		Date rs = sdf.parse(date);
		SimpleDateFormat sdf2 = new SimpleDateFormat(outformat);
		String rs2 = sdf2.format(rs);
		return rs2;
	}

	public static Date getDate2(String date, String informat, String outformat)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(informat);
		Date rs = sdf.parse(date);
		return rs;
	}

	/**
	 * 转化Double类型
	 * 
	 * @param obj
	 * @return
	 */
	public static Double toDouble(Object obj) {
		if (null != obj) {
			return Double.parseDouble(obj.toString());
		}
		return null;
	}

	/**
	 * 转换string类型
	 * 
	 * @param obj
	 * @return
	 */
	public static String toStr(Object obj) {
		if (null != obj) {
			return obj.toString();
		}
		return null;
	}

	/**
	 * 获取当前系统时间
	 * 
	 * @param format
	 * 
	 * @return
	 */
	public static String getNowDate(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date());
	}

	/**
	 * 获取IP
	 * 
	 * @param request
	 * @return IP地址
	 */
	public static String getRemoteHost(
			javax.servlet.http.HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");// 代理服务器IP
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");// http中隐含的客户端IP
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
	}

}
