package com.aaa.dao.tb;

import com.aaa.entity.FrozenAssets;

public interface FrozenAssetsDao {

	/**
	 * 添加冻结金额表信息
	 * 
	 * @param frozenAssets
	 * @return
	 */
	public Integer addFrozenAssets(FrozenAssets frozenAssets);

	/**
	 * 获取用户账户冻结余额
	 * 
	 * @param u_id
	 * @return
	 */
	public Double getSumForzenMoneyByu_id(Integer u_id);

	/**
	 * 根据订单编号查询订单的冻结金额
	 * 
	 * @param i_id
	 * @return
	 */
	public FrozenAssets querFrozenMoneyByi_id(String i_id);

	/**
	 * 冻结金额表的修改
	 * 
	 * @param frozenAssets
	 * @return
	 */
	public Integer update(FrozenAssets frozenAssets);

}
