package com.aaa.service.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.BillingTypeDao;
import com.aaa.entity.ChargePar;
@Service
@Transactional
public class BillingTypeService {

	@Autowired
	BillingTypeDao btd;
	//查询计费方式
	public List<Map<String, Object>> selBilling(){
		return btd.selBilling();
	}
}
