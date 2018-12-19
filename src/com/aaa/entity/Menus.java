package com.aaa.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 菜单信息
 * 
 * @author Administrator
 * 
 */
public class Menus implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer m_id;
	private String m_name;
	private String m_url;
	private String m_icon;
	private Integer m_parentid;
	private Integer u_id;
	private Integer m_state;
	private Date m_updateTime;
	private String m_remark;
	private Integer upu_id;

	public Integer getM_id() {
		return m_id;
	}

	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_url() {
		return m_url;
	}

	public void setM_url(String m_url) {
		this.m_url = m_url;
	}

	public String getM_icon() {
		return m_icon;
	}

	public void setM_icon(String m_icon) {
		this.m_icon = m_icon;
	}

	public Integer getM_parentid() {
		return m_parentid;
	}

	public void setM_parentid(Integer m_parentid) {
		this.m_parentid = m_parentid;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getM_state() {
		return m_state;
	}

	public void setM_state(Integer m_state) {
		this.m_state = m_state;
	}

	public Date getM_updateTime() {
		return m_updateTime;
	}

	public void setM_updateTime(Date m_updateTime) {
		this.m_updateTime = m_updateTime;
	}

	public String getM_remark() {
		return m_remark;
	}

	public void setM_remark(String m_remark) {
		this.m_remark = m_remark;
	}

	public Integer getUpu_id() {
		return upu_id;
	}

	public void setUpu_id(Integer upu_id) {
		this.upu_id = upu_id;
	}

	@Override
	public String toString() {
		return "Menus [m_id=" + m_id + ", m_name=" + m_name + ", m_url="
				+ m_url + ", m_icon=" + m_icon + ", m_parentid=" + m_parentid
				+ ", u_id=" + u_id + ", m_state=" + m_state + ", m_updateTime="
				+ m_updateTime + ", m_remark=" + m_remark + ", upu_id="
				+ upu_id + "]";
	}

	public Menus(Integer m_id, String m_name, String m_url, String m_icon,
			Integer m_parentid, Integer u_id, Integer m_state,
			Date m_updateTime, String m_remark, Integer upu_id) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_url = m_url;
		this.m_icon = m_icon;
		this.m_parentid = m_parentid;
		this.u_id = u_id;
		this.m_state = m_state;
		this.m_updateTime = m_updateTime;
		this.m_remark = m_remark;
		this.upu_id = upu_id;
	}

	public Menus() {
		super();
		// TODO Auto-generated constructor stub
	}

}
