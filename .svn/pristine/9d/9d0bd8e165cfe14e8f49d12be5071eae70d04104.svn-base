package com.aaa.service.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.ChargeparDao;
@Service
@Transactional
public class ChargeparService {

	@Autowired
	ChargeparDao cd;
	//根据计费方式计算收费标准
	public List<Map<String, Object>> selChargepar(Integer id){
		return cd.selChargepar(id);
	}
}
