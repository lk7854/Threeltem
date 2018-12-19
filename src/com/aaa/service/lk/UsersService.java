package com.aaa.service.lk;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.lk.UsersDao;
import com.aaa.entity.AccountBalance;
import com.aaa.entity.BusinessLicense;
import com.aaa.entity.Channel;
import com.aaa.entity.Institution;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Users;
import com.aaa.util.tb.help.Tools;

@Service
@Transactional
public class UsersService {
	
	@Autowired
	private UsersDao uDao;
	
	/**
	 * 登录
	 * 
	 * @author Despacito
	 * 
	 * @param login 登录
	 * registe 注册
	 * @param updateUsers
	 * 
	 */
	public Map<String, Object> login(String name,String pwd,HttpSession session){
		session.setAttribute("login", uDao.login(name, pwd));
		return uDao.login(name, pwd);
	}
	
	public String personal(Channel c,Institution in,Users us,HttpSession session){
		System.out.println("in"+in);
		System.out.println("us"+us);
		System.out.println("c"+c);
		int addInstitution = uDao.addInstitution(in);
		System.out.println("addInstitution"+addInstitution);
		Map<String, Object> listIn = uDao.queryInstitution(in);
		if (addInstitution == 1) {
			us.setIn_id(Tools.toInteger(listIn.get("in_id")));
			int addUsers = uDao.addUsers(us);
			if (addUsers == 1 && us.getR_id()==4) {
				c.setIn_id(Tools.toInteger(listIn.get("in_id")));
				c.setU_id(us.getU_id());
				int addChannel = uDao.addChannel(c);
				System.out.println(addChannel);
				return "../index";// 网站主注册成功
			} else {
				return "../index";// 广告主注册成功
			}
		} else {
			return "error";// 失败
		}
	}
	
	public boolean addUsers(Users us){
		int i = uDao.addUsers(us);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateUsers(Users us){
		int i = uDao.updateUsers(us);
		System.out.println(i);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public int addInstitution(Institution in,HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("in");
		in.setIn_certificate(map.get("in_id").toString());
		System.out.println(in);
		return uDao.addInstitution(in);
	}
	
	public boolean updateInstitution(Institution in){
		int i = uDao.updateInstitution(in);
		System.out.println(i);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean addChannel(Channel c){
		int i = uDao.addChannel(c);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean addBusinessLicense(BusinessLicense bl){
		int i = uDao.addBusinessLicense(bl);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean addMoney(AccountBalance ab){
		int i = uDao.addMoney(ab);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public LayuiQuery queryUsers(Users u,Integer page,Integer limit){
		Integer offset = 0;
		if (null == page && null == limit) {
			limit = 10;
		} else {
			offset = (page - 1) * limit;
		}
		LayuiQuery layuiQuery=new LayuiQuery(0, null, uDao.queryUsers(u, null, null).size(), uDao.queryUsers(u, offset, limit));
		System.out.println(layuiQuery);
		System.out.println(uDao.queryUsers(u, page, offset).size());
		return layuiQuery;
	}
	
	public List<Map<String, Object>> selectInstitution(){
		return uDao.selectInstitution();
	}
	
	public boolean geren(Users u,Institution in,HttpSession session){
		int updateusers = uDao.updateUsers(u);
		System.out.println("updateusers"+updateusers);
		if (updateusers != 0) {
			return false;// 修改失败
		} else {
			int updateinstitution = uDao.updateInstitution(in);
			System.out.println("updateinstitution"+updateinstitution);
			if (updateinstitution == 1) {
				session.removeAttribute("login");
				session.setAttribute("login", uDao.login(u.getU_name(), u.getU_pwd()));
				return true;// 修改成功
			} else {
				return false;// 修改失败
			}
		}
	}

}
