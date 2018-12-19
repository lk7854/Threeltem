package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 收费标准表
 * 
 * @author Administrator
 * 
 */
public class ChargePar implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cp_id;
	private Integer gt_id;
	private Integer st_id;
	private Integer bt_id;
	private double cp_money;
	private Integer u_id;
	private Date cp_addTime;
	private Date cp_updateTime;
	private String cp_remark;

	public Integer getCp_id() {
		return cp_id;
	}

	public void setCp_id(Integer cp_id) {
		this.cp_id = cp_id;
	}

	public Integer getGt_id() {
		return gt_id;
	}

	public void setGt_id(Integer gt_id) {
		this.gt_id = gt_id;
	}

	public Integer getSt_id() {
		return st_id;
	}

	public void setSt_id(Integer st_id) {
		this.st_id = st_id;
	}

	public Integer getBt_id() {
		return bt_id;
	}

	public void setBt_id(Integer bt_id) {
		this.bt_id = bt_id;
	}

	public double getCp_money() {
		return cp_money;
	}

	public void setCp_money(double cp_money) {
		this.cp_money = cp_money;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Date getCp_addTime() {
		return cp_addTime;
	}

	public void setCp_addTime(Date cp_addTime) {
		this.cp_addTime = cp_addTime;
	}

	public Date getCp_updateTime() {
		return cp_updateTime;
	}

	public void setCp_updateTime(Date cp_updateTime) {
		this.cp_updateTime = cp_updateTime;
	}

	public String getCp_remark() {
		return cp_remark;
	}

	public void setCp_remark(String cp_remark) {
		this.cp_remark = cp_remark;
	}

	@Override
	public String toString() {
		return "ChargePar [cp_id=" + cp_id + ", gt_id=" + gt_id + ", st_id="
				+ st_id + ", bt_id=" + bt_id + ", cp_money=" + cp_money
				+ ", u_id=" + u_id + ", cp_addTime=" + cp_addTime
				+ ", cp_updateTime=" + cp_updateTime + ", cp_remark="
				+ cp_remark + "]";
	}

}
