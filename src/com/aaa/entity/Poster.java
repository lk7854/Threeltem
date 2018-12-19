package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 广告表
 * 
 * @author Administrator
 * 
 */
public class Poster implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer p_id;
	private String p_name;
	private Integer u_id;
	private Integer p_state;
	private Date p_addTime;
	private Date p_updateTime;
	private String p_remark;
	private String p_url;
	private Integer pt_id;
	private String p_formPage;

	public String getP_url() {
		return p_url;
	}

	
	public Integer getPt_id() {
		return pt_id;
	}


	public void setPt_id(Integer pt_id) {
		this.pt_id = pt_id;
	}


	public void setP_url(String p_url) {
		this.p_url = p_url;
	}

	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getP_state() {
		return p_state;
	}

	public void setP_state(Integer p_state) {
		this.p_state = p_state;
	}

	public Date getP_addTime() {
		return p_addTime;
	}

	public void setP_addTime(Date p_addTime) {
		this.p_addTime = p_addTime;
	}

	public Date getP_updateTime() {
		return p_updateTime;
	}

	public void setP_updateTime(Date p_updateTime) {
		this.p_updateTime = p_updateTime;
	}

	public String getP_remark() {
		return p_remark;
	}

	public void setP_remark(String p_remark) {
		this.p_remark = p_remark;
	}

	

	public String getP_formPage() {
		return p_formPage;
	}


	public void setP_formPage(String p_formPage) {
		this.p_formPage = p_formPage;
	}


	public Poster(Integer p_id, String p_name, Integer u_id, Integer p_state,
			Date p_addTime, Date p_updateTime, String p_remark, String p_url,
			Integer pt_id) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.u_id = u_id;
		this.p_state = p_state;
		this.p_addTime = p_addTime;
		this.p_updateTime = p_updateTime;
		this.p_remark = p_remark;
		this.p_url = p_url;
		this.pt_id = pt_id;
	}


	
	public Poster(Integer p_id, String p_name, Integer u_id, Integer p_state,
			Date p_addTime, Date p_updateTime, String p_remark, String p_url,
			Integer pt_id, String p_formPage) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.u_id = u_id;
		this.p_state = p_state;
		this.p_addTime = p_addTime;
		this.p_updateTime = p_updateTime;
		this.p_remark = p_remark;
		this.p_url = p_url;
		this.pt_id = pt_id;
		this.p_formPage = p_formPage;
	}


	@Override
	public String toString() {
		return "Poster [p_id=" + p_id + ", p_name=" + p_name + ", u_id=" + u_id
				+ ", p_state=" + p_state + ", p_addTime=" + p_addTime
				+ ", p_updateTime=" + p_updateTime + ", p_remark=" + p_remark
				+ ", p_url=" + p_url + ", pt_id=" + pt_id + ", p_formPage="
				+ p_formPage + "]";
	}


	public Poster() {
		super();
	}

}
