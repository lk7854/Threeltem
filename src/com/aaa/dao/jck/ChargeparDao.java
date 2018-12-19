package com.aaa.dao.jck;

import java.util.List;
import java.util.Map;

public interface ChargeparDao {

	//根据计费方式计算收费标准
	public List<Map<String, Object>> selChargepar(Integer id);
}
