package com.aaa.dao.lk;

import java.util.List;
import java.util.Map;

public interface ParentDao {
	
	// 左侧菜单栏--查询节点
	public List<Map<String, Object>> queryByParentm_id(Integer r_id,Integer m_parentid);
		
	// 权限中间表--根据角色id查询菜单id
	public Integer[] queryBym_id(Integer r_id);
	
	// 权限中间表--增，删
	public Integer addrole_menu(Integer r_id, Integer m_id);

	public int deleterole_menu(Integer r_id);

}
