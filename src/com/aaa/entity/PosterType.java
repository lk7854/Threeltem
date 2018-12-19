package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 广告类型表
 * 
 * @author Administrator
 * 
 */
public class PosterType implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer pt_id;// 类型id
	private String pt_name;// 广告类型
	private Integer u_id;// 修改人id
	private Date pt_updateTime;// 修改时间
	private Integer upu_id;

	public Integer getPt_id() {
		return pt_id;
	}

	public void setPt_id(Integer pt_id) {
		this.pt_id = pt_id;
	}

	public String getPt_name() {
		return pt_name;
	}

	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Date getPt_updateTime() {
		return pt_updateTime;
	}

	public void setPt_updateTime(Date pt_updateTime) {
		this.pt_updateTime = pt_updateTime;
	}

	public Integer getUpu_id() {
		return upu_id;
	}

	public void setUpu_id(Integer upu_id) {
		this.upu_id = upu_id;
	}

	@Override
	public String toString() {
		return "PosterType [pt_id=" + pt_id + ", pt_name=" + pt_name
				+ ", u_id=" + u_id + ", pt_updateTime=" + pt_updateTime
				+ ", upu_id=" + upu_id + "]";
	}

}
