package com.aaa.util.tb.help;

import java.util.Random;

public class getNum {
	/**
	 * 产生随机短信验证码
	 * 
	 * @return
	 */
	public static Integer getCode() {
		StringBuilder str = null;// 定义变长字符串
		Integer code = 1;
		Random random = new Random();
		// 能用的为验证码
		while (code.toString().length() < 6) {
			str = new StringBuilder();
			// 随机生成数字，并添加到字符串
			for (int i = 0; i < 6; i++) {
				str.append(random.nextInt(10));
			}
			code = Integer.parseInt(str.toString());
		}
		return code;
	}
}
