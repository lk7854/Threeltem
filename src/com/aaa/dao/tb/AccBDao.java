package com.aaa.dao.tb;

import java.util.Map;

import com.aaa.entity.AccountBalance;

/**
 * 金额表接口方法
 * 
 * @author Administrator
 * 
 */
public interface AccBDao {

	public Integer addAB(AccountBalance accb);

	/**
	 * 修改金额表信息
	 * 
	 * @param accb条件对象
	 * @return
	 */
	public Integer accbUp(AccountBalance accb);

	/**
	 * 通过用户ID，查询用户金额
	 * 
	 * @param uid用户ID
	 * @return
	 */
	public Map<String, Object> queryAcbyUid(Integer uid);

}
