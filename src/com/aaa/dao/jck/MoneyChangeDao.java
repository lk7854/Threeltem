package com.aaa.dao.jck;

import java.util.List;
//金额变动接口
import java.util.Map;

import com.aaa.entity.MoneyChange;
public interface MoneyChangeDao {

	public List<Map<String, Object>> selMoneyChange(String i_id);
}
