package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 广告审核记录表
 * 
 * @author Administrator
 * 
 */
public class PosterCheck implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer pc_id;
	private Integer p_id;
	private Integer u_id;
	private Date pc_time;
	private Integer pc_result;
	private String pc_remark;

	public Integer getPc_id() {
		return pc_id;
	}

	public void setPc_id(Integer pc_id) {
		this.pc_id = pc_id;
	}

	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Date getPc_time() {
		return pc_time;
	}

	public void setPc_time(Date pc_time) {
		this.pc_time = pc_time;
	}

	public Integer getPc_result() {
		return pc_result;
	}

	public void setPc_result(Integer pc_result) {
		this.pc_result = pc_result;
	}

	public String getPc_remark() {
		return pc_remark;
	}

	public void setPc_remark(String pc_remark) {
		this.pc_remark = pc_remark;
	}

	public PosterCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "PosterCheck [pc_id=" + pc_id + ", p_id=" + p_id + ", u_id="
				+ u_id + ", pc_time=" + pc_time + ", pc_result=" + pc_result
				+ ", pc_remark=" + pc_remark + "]";
	}

	public PosterCheck(Integer pc_id, Integer p_id, Integer u_id, Date pc_time,
			Integer pc_result, String pc_remark) {
		super();
		this.pc_id = pc_id;
		this.p_id = p_id;
		this.u_id = u_id;
		this.pc_time = pc_time;
		this.pc_result = pc_result;
		this.pc_remark = pc_remark;
	}

}
