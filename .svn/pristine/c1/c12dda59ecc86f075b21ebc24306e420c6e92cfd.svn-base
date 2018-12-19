package com.aaa.service.jck;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckInstitutionDao;
import com.aaa.dao.jck.JckusersDao;
import com.aaa.entity.Institution;
import com.aaa.entity.Users;
@Service
@Transactional
public class JckusersService {

	@Autowired
	JckusersDao jud;
	@Autowired
	JckInstitutionDao ji;
	//广告主的个人中心显示
	public Map<String, Object> showMyselfInfo(Integer uid){
		return jud.showMyselfInfo(uid);
	}
	//广告主的个人信息修改
	public boolean updateMyselfInfo(Users u,Institution in){
		if (jud.updateMyselfInfo(u)==1&&ji.updateInstitution(in)==1) {
			return true;
		}
		return false;
	}
}
