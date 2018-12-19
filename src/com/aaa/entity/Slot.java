package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 广告位表
 * 
 * @author Administrator
 * 
 */
public class Slot implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer s_id;
	private String s_name;
	private Integer st_id;
	private Integer s_hight;
	private Integer s_width;
	private String s_picture;
	private Integer u_id;
	private Integer s_state;
	private Date s_addtime;
	private Date s_updatetime;
	private String s_remark;
	private Integer s_clickcount;
	private Integer upu_id;
	private Integer ch_id;
	private double s_thousandsShow;
	private double s_singleclick;
	private String s_url;


	

	public Integer getUpu_id() {
		return upu_id;
	}

	public void setUpu_id(Integer upu_id) {
		this.upu_id = upu_id;
	}

	public Integer getCh_id() {
		return ch_id;
	}

	public void setCh_id(Integer ch_id) {
		this.ch_id = ch_id;
	}

	public Integer getS_clickcount() {
		return s_clickcount;
	}

	public void setS_clickcount(Integer s_clickcount) {
		this.s_clickcount = s_clickcount;
	}

	

	public Integer getS_id() {
		return s_id;
	}

	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public Integer getSt_id() {
		return st_id;
	}

	public void setSt_id(Integer st_id) {
		this.st_id = st_id;
	}

	public Integer getS_hight() {
		return s_hight;
	}

	public void setS_hight(Integer s_hight) {
		this.s_hight = s_hight;
	}

	public Integer getS_width() {
		return s_width;
	}

	public void setS_width(Integer s_width) {
		this.s_width = s_width;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getS_state() {
		return s_state;
	}

	public void setS_state(Integer s_state) {
		this.s_state = s_state;
	}

	public Date getS_addtime() {
		return s_addtime;
	}

	public void setS_addtime(Date s_addtime) {
		this.s_addtime = s_addtime;
	}

	public Date getS_updatetime() {
		return s_updatetime;
	}

	public void setS_updatetime(Date s_updatetime) {
		this.s_updatetime = s_updatetime;
	}

	public String getS_remark() {
		return s_remark;
	}

	public void setS_remark(String s_remark) {
		this.s_remark = s_remark;
	}

	public String getS_picture() {
		return s_picture;
	}

	public void setS_picture(String s_picture) {
		this.s_picture = s_picture;
	}

	public Slot(Integer s_id, String s_name, Integer st_id, Integer s_hight,
			Integer s_width, String s_picture, Integer u_id, Integer s_state,
			Date s_addtime, Date s_updatetime, String s_remark,
			Integer s_clickcount, Integer upu_id,Integer ch_id) {
		super();
		this.s_id = s_id;
		this.s_name = s_name;
		this.st_id = st_id;
		this.s_hight = s_hight;
		this.s_width = s_width;
		this.s_picture = s_picture;
		this.u_id = u_id;
		this.s_state = s_state;
		this.s_addtime = s_addtime;
		this.s_updatetime = s_updatetime;
		this.s_remark = s_remark;
		this.s_clickcount = s_clickcount;
		this.upu_id = upu_id;
		this.ch_id = ch_id;
	}

	

	@Override
	public String toString() {
		return "Slot [s_id=" + s_id + ", s_name=" + s_name + ", st_id=" + st_id
				+ ", s_hight=" + s_hight + ", s_width=" + s_width
				+ ", s_picture=" + s_picture + ", u_id=" + u_id + ", s_state="
				+ s_state + ", s_addtime=" + s_addtime + ", s_updatetime="
				+ s_updatetime + ", s_remark=" + s_remark + ", s_clickcount="
				+ s_clickcount + ", upu_id=" + upu_id + ", ch_id=" + ch_id
				+ ", s_thousandsShow=" + s_thousandsShow + ", s_singleclick="
				+ s_singleclick + ", s_url=" + s_url + "]";
	}

	public double getS_thousandsShow() {
		return s_thousandsShow;
	}

	public void setS_thousandsShow(double s_thousandsShow) {
		this.s_thousandsShow = s_thousandsShow;
	}

	public double getS_singleclick() {
		return s_singleclick;
	}

	public void setS_singleclick(double s_singleclick) {
		this.s_singleclick = s_singleclick;
	}

	public String getS_url() {
		return s_url;
	}

	public void setS_url(String s_url) {
		this.s_url = s_url;
	}

	public Slot() {
		super();
	}

}
