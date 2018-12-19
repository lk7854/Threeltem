package com.aaa.dao.jck;

import java.util.Map;

import com.aaa.entity.Users;

public interface JckusersDao {

	//广告主的个人中心显示
	public Map<String, Object> showMyselfInfo(Integer uid);
	//广告主的个人信息修改
	public int updateMyselfInfo(Users u);
}
