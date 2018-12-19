package com.aaa.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 权限中间表
 * 
 * @author Administrator
 * 
 */
public class Role_Menu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer r_id;
	private Integer m_id;
	private Integer u_id;
	private Integer upu_id;
	private Date rm_addTime;
	private Date rm_updateTime;

	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}

	public Integer getM_id() {
		return m_id;
	}

	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getUpu_id() {
		return upu_id;
	}

	public void setUpu_id(Integer upu_id) {
		this.upu_id = upu_id;
	}

	public Date getRm_addTime() {
		return rm_addTime;
	}

	public void setRm_addTime(Date rm_addTime) {
		this.rm_addTime = rm_addTime;
	}

	public Date getRm_updateTime() {
		return rm_updateTime;
	}

	public void setRm_updateTime(Date rm_updateTime) {
		this.rm_updateTime = rm_updateTime;
	}

	@Override
	public String toString() {
		return "Role_Menu [r_id=" + r_id + ", m_id=" + m_id + ", u_id=" + u_id
				+ ", upu_id=" + upu_id + ", rm_addTime=" + rm_addTime
				+ ", rm_updateTime=" + rm_updateTime + "]";
	}

	public Role_Menu(Integer r_id, Integer m_id, Integer u_id, Integer upu_id,
			Date rm_addTime, Date rm_updateTime) {
		super();
		this.r_id = r_id;
		this.m_id = m_id;
		this.u_id = u_id;
		this.upu_id = upu_id;
		this.rm_addTime = rm_addTime;
		this.rm_updateTime = rm_updateTime;
	}

	public Role_Menu() {
		super();
		// TODO Auto-generated constructor stub
	}

}
