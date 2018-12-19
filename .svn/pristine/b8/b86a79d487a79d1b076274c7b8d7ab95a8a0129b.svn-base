package com.aaa.service.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.IpAddressDao;
import com.aaa.entity.IpAddress;

/**
 * IP记录表业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class IpAddressService {

	@Autowired
	IpAddressDao ipdao;

	/**
	 * 添加IP记录
	 * 
	 * @param ipaddress
	 * @return
	 */
	public Boolean addIp(IpAddress ipaddress) {
		Integer rs = ipdao.addIp(ipaddress);
		if (rs == 1) {
			return true;
		}
		return false;
	}
}
