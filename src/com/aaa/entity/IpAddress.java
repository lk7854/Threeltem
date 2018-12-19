package com.aaa.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * ip记录表
 * 
 * @author Administrator
 * 
 */
public class IpAddress implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer IP_id;
	private String IP_address;
	private Date IP_addtime;
	private Integer p_id;
	private String i_id;

	public Integer getIP_id() {
		return IP_id;
	}

	public void setIP_id(Integer iP_id) {
		IP_id = iP_id;
	}

	public String getIP_address() {
		return IP_address;
	}

	public void setIP_address(String iP_address) {
		IP_address = iP_address;
	}

	public Date getIP_addtime() {
		return IP_addtime;
	}

	public void setIP_addtime(Date iP_addtime) {
		IP_addtime = iP_addtime;
	}

	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public IpAddress(Integer iP_id, String iP_address, Date iP_addtime,
			Integer p_id, String i_id) {
		super();
		IP_id = iP_id;
		IP_address = iP_address;
		IP_addtime = iP_addtime;
		this.p_id = p_id;
		this.i_id = i_id;
	}

	public IpAddress() {
		super();
	}

}
