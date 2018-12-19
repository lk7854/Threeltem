package com.aaa.service.lk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lk.ParentDao;

@Service
public class ParentService {
	
	@Autowired
	ParentDao pDao;
	
	/**
	 * 权限中间表操作
	 * 
	 * @author Despacito
	 * @param queryBym_id
	 * @param addrole_menu
	 * @param deleterole_menu
	 * 
	 */
	public Integer[] queryBym_id(Integer r_id) {
		Integer[] ids = pDao.queryBym_id(r_id);
		return ids;
	}
	
	public boolean addrole_menu(Integer r_id, Integer[] m_ids) {
		System.out.println("r_id" + r_id);
		// 删除权限
		boolean del = deleterole_menu(r_id);
		System.out.println("del" + del);
		Integer add = null;
		if (del) { // 删除后,执行添加
			for (Integer integer : m_ids) {
				add = pDao.addrole_menu(r_id, integer);
			}

			if (add == 1) {
				return true;
			} else {
				return false;
			}
		} else {
			// 删除失败
			return false;
		}

	};
	
	// 角色删除
	public boolean deleterole_menu(Integer r_id) {
		int i = pDao.deleterole_menu(r_id);
		if (i == 0) {
			return false;
		} else {
			return true;
		}
	};


}
