package com.aaa.dao.tb;

import com.aaa.entity.IndentCheck;

/**
 * 审核记录表借口
 * 
 * @author Administrator
 * 
 */
public interface IndentCheckDao {

	/**
	 * 添加审核记录
	 * 
	 * @param is审核记录对象
	 * @return
	 */
	public Integer addRecord(IndentCheck is);
}
