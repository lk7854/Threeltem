package com.aaa.dao.tb;

import com.aaa.entity.IpAddress;

/**
 * IP记录表的接口
 * 
 * @author Administrator
 * 
 */
public interface IpAddressDao {
	/**
	 * 添加IP记录
	 * 
	 * @param ipaddress
	 * @return
	 */
	public Integer addIp(IpAddress ipaddress);
}
