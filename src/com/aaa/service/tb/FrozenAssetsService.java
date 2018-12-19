package com.aaa.service.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.FrozenAssetsDao;
import com.aaa.entity.FrozenAssets;

/**
 * 冻结金额表业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class FrozenAssetsService {
	@Autowired
	FrozenAssetsDao fadao;

	/**
	 * 添加冻结金额表信息
	 * 
	 * @param frozenAssets
	 * @return
	 */
	public Boolean addFrozenAssets(FrozenAssets frozenAssets) {
		Integer rs = fadao.addFrozenAssets(frozenAssets);
		if (rs == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 获取用户账户冻结余额
	 * 
	 * @param u_id
	 * @return
	 */
	public Double getSumForzenMoneyByu_id(Integer u_id) {
		Double sumMoney = fadao.getSumForzenMoneyByu_id(u_id);
		return sumMoney;
	}

	/**
	 * 根据订单编号查询订单的冻结金额
	 * 
	 * @param i_id
	 * @return
	 */
	public FrozenAssets querFrozenMoneyByi_id(String i_id) {
		return fadao.querFrozenMoneyByi_id(i_id);
	}

}
