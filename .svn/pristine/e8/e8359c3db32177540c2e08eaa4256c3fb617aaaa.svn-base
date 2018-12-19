package com.aaa.util.jck;

import java.util.Map;

import javax.servlet.http.HttpSession;

public class LoginUtil {

	//根据httpsession获取里面的登陆信息
	public static Map<String, Object> getlogin(HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("login");
		return map;
	}
}
