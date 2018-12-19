package com.aaa.dao.tb;

import com.aaa.entity.InstitutionCheck;

/**
 * 机构审核表的接口
 * 
 * @author Administrator
 * 
 */
public interface InstitutionCheckDao {
	/**
	 * 添加机构审核记录
	 * 
	 * @param inst机构审核记录
	 * @return
	 */
	public Integer addInstCheck(InstitutionCheck instc);
}
