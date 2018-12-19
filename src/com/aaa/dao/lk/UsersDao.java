package com.aaa.dao.lk;

import java.util.List;
import java.util.Map;

import com.aaa.entity.AccountBalance;
import com.aaa.entity.BusinessLicense;
import com.aaa.entity.Channel;
import com.aaa.entity.Institution;
import com.aaa.entity.Users;

public interface UsersDao {
	
	// 登录
	public Map<String, Object> login(String name,String pwd);
	
	// 注册--关联信息
	public int addUsers(Users us);

	public int updateUsers(Users u);
	
	public int addInstitution(Institution in);
	
	public int updateInstitution(Institution in);
	
	public int addChannel(Channel c);
	
	public int addBusinessLicense(BusinessLicense bl);
	
	public Map<String, Object> queryInstitution(Institution in);
	
	public List<Map<String, Object>> queryUsers(Users u,Integer page,Integer limit);
	
	public int addMoney(AccountBalance ab);
	
	// 修改个人资料
	public List<Map<String, Object>> geren();
	
	// 下拉列表
	public List<Map<String, Object>> selectInstitution();
	//根据用户名密码进行登录查询数据
	public Map<String, Object> Logins(String name,String pwd);
}
