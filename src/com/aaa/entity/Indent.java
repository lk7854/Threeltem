package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单表
 * 
 * @author Administrator
 * 
 */
public class Indent implements Serializable {
	private static final long serialVersionUID = 1L;
	private String i_id;
	private Integer p_id;
	private Date i_startTime;
	private Date i_endTime;
	private Date i_startTime2;
	private Date i_endTime2;
	private Integer u_id;
	private Integer i_state;
	private Date i_addTime;
	private Date i_updateTime;
	private String i_remark;
	private Integer upu_id;
	private Integer s_id;
	private Double i_money;

	public Indent() {
		super();
	}

	public Double getI_money() {
		return i_money;
	}

	public void setI_money(Double i_money) {
		this.i_money = i_money;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public Date getI_startTime() {
		return i_startTime;
	}

	public void setI_startTime(Date i_startTime) {
		this.i_startTime = i_startTime;
	}

	public Date getI_endTime() {
		return i_endTime;
	}

	public void setI_endTime(Date i_endTime) {
		this.i_endTime = i_endTime;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getI_state() {
		return i_state;
	}

	public void setI_state(Integer i_state) {
		this.i_state = i_state;
	}

	public Date getI_addTime() {
		return i_addTime;
	}

	public void setI_addTime(Date i_addTime) {
		this.i_addTime = i_addTime;
	}

	public Date getI_updateTime() {
		return i_updateTime;
	}

	public void setI_updateTime(Date i_updateTime) {
		this.i_updateTime = i_updateTime;
	}

	public String getI_remark() {
		return i_remark;
	}

	public void setI_remark(String i_remark) {
		this.i_remark = i_remark;
	}

	public Integer getUpu_id() {
		return upu_id;
	}

	public void setUpu_id(Integer upu_id) {
		this.upu_id = upu_id;
	}

	public Date getI_startTime2() {
		return i_startTime2;
	}

	public void setI_startTime2(Date i_startTime2) {
		this.i_startTime2 = i_startTime2;
	}

	public Date getI_endTime2() {
		return i_endTime2;
	}

	public void setI_endTime2(Date i_endTime2) {
		this.i_endTime2 = i_endTime2;
	}

	public Integer getS_id() {
		return s_id;
	}

	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}

	public Indent(String i_id, Integer p_id, Date i_startTime, Date i_endTime,
			Date i_startTime2, Date i_endTime2, Integer u_id, Integer i_state,
			Date i_addTime, Date i_updateTime, String i_remark, Integer upu_id,
			Integer s_id, Double i_money) {
		super();
		this.i_id = i_id;
		this.p_id = p_id;
		this.i_startTime = i_startTime;
		this.i_endTime = i_endTime;
		this.i_startTime2 = i_startTime2;
		this.i_endTime2 = i_endTime2;
		this.u_id = u_id;
		this.i_state = i_state;
		this.i_addTime = i_addTime;
		this.i_updateTime = i_updateTime;
		this.i_remark = i_remark;
		this.upu_id = upu_id;
		this.s_id = s_id;
		this.i_money = i_money;
	}

	@Override
	public String toString() {
		return "Indent [i_id=" + i_id + ", p_id=" + p_id + ", i_startTime="
				+ i_startTime + ", i_endTime=" + i_endTime + ", i_startTime2="
				+ i_startTime2 + ", i_endTime2=" + i_endTime2 + ", u_id="
				+ u_id + ", i_state=" + i_state + ", i_addTime=" + i_addTime
				+ ", i_updateTime=" + i_updateTime + ", i_remark=" + i_remark
				+ ", upu_id=" + upu_id + ", s_id=" + s_id + ", i_money="
				+ i_money + "]";
	}

}
