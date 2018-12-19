package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 网站信息表
 * 
 * @author Administrator
 * 
 */
public class Channel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer ch_id;// 网站id
	private String ch_name;// 网站名
	private Integer in_id;// 机构id
	private Integer u_id;// 修改人id
	private Integer ch_state;// 网站状态
	private Integer gt_id;// 网站级别
	private Integer gt_pv;// 日均访问量
	private Date ch_addtime;// 创建时间
	private Date ch_updatetime;// 修改时间
	private String ch_url;

	public Integer getCh_id() {
		return ch_id;
	}

	public void setCh_id(Integer ch_id) {
		this.ch_id = ch_id;
	}

	public String getCh_name() {
		return ch_name;
	}

	public void setCh_name(String ch_name) {
		this.ch_name = ch_name;
	}

	public Integer getIn_id() {
		return in_id;
	}

	public void setIn_id(Integer in_id) {
		this.in_id = in_id;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getCh_state() {
		return ch_state;
	}

	public void setCh_state(Integer ch_state) {
		this.ch_state = ch_state;
	}

	public Integer getGt_id() {
		return gt_id;
	}

	public void setGt_id(Integer gt_id) {
		this.gt_id = gt_id;
	}

	public Integer getGt_pv() {
		return gt_pv;
	}

	public void setGt_pv(Integer gt_pv) {
		this.gt_pv = gt_pv;
	}

	public Date getCh_addtime() {
		return ch_addtime;
	}

	public void setCh_addtime(Date ch_addtime) {
		this.ch_addtime = ch_addtime;
	}

	public Date getCh_updatetime() {
		return ch_updatetime;
	}

	public void setCh_updatetime(Date ch_updatetime) {
		this.ch_updatetime = ch_updatetime;
	}

	public String getCh_url() {
		return ch_url;
	}

	public void setCh_url(String ch_url) {
		this.ch_url = ch_url;
	}

	@Override
	public String toString() {
		return "Channel [ch_id=" + ch_id + ", ch_name=" + ch_name + ", in_id="
				+ in_id + ", u_id=" + u_id + ", ch_state=" + ch_state
				+ ", gt_id=" + gt_id + ", gt_pv=" + gt_pv + ", ch_addtime="
				+ ch_addtime + ", ch_updatetime=" + ch_updatetime + ", ch_url="
				+ ch_url + "]";
	}


}
