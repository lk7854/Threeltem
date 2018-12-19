package com.aaa.service.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.BillingTypeDao;
import com.aaa.dao.jck.RevokeindentDao;
import com.aaa.entity.ChargePar;
import com.aaa.entity.RevokeIndent;
@Service
@Transactional
public class RevokeindentService {

	@Autowired
	RevokeindentDao rd;
	//添加一条撤单记录
	public int addRevoke(RevokeIndent r){
		return rd.addRevoke(r);
	}
	public int updateRevoke(RevokeIndent r){
		return rd.updateRevoke(r);
	}
	//查询撤单记录
	public List<Map<String, Object>> selRevoke(RevokeIndent r){
		return rd.selRevoke(r);
	}
}
