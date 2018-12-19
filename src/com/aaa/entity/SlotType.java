package com.aaa.entity;

import java.sql.Date;

public class SlotType {
	
	private Integer st_id;
	private String st_name;
	private Date st_addtime;
	private Date st_updatetime;
	private String st_remark;
	
	public Integer getSt_id() {
		return st_id;
	}
	public void setSt_id(Integer st_id) {
		this.st_id = st_id;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public Date getSt_addtime() {
		return st_addtime;
	}
	public void setSt_addtime(Date st_addtime) {
		this.st_addtime = st_addtime;
	}
	public Date getSt_updatetime() {
		return st_updatetime;
	}
	public void setSt_updatetime(Date st_updatetime) {
		this.st_updatetime = st_updatetime;
	}
	public String getSt_remark() {
		return st_remark;
	}
	public void setSt_remark(String st_remark) {
		this.st_remark = st_remark;
	}
	@Override
	public String toString() {
		return "SlotType [st_id=" + st_id + ", st_name=" + st_name
				+ ", st_addtime=" + st_addtime + ", st_updatetime="
				+ st_updatetime + ", st_remark=" + st_remark + "]";
	}


}
