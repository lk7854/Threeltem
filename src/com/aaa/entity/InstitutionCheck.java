package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 机构审核记录表
 * 
 * @author Administrator
 * 
 */
public class InstitutionCheck implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer inc_id;
	private Integer in_id;
	private Integer u_id;
	private Date inc_time;
	private Integer inc_result;
	private String inc_remark;

	public Integer getInc_id() {
		return inc_id;
	}

	public void setInc_id(Integer inc_id) {
		this.inc_id = inc_id;
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

	public Date getInc_time() {
		return inc_time;
	}

	public void setInc_time(Date inc_time) {
		this.inc_time = inc_time;
	}

	public Integer getInc_result() {
		return inc_result;
	}

	public void setInc_result(Integer inc_result) {
		this.inc_result = inc_result;
	}

	public String getInc_remark() {
		return inc_remark;
	}

	public void setInc_remark(String inc_remark) {
		this.inc_remark = inc_remark;
	}

	public InstitutionCheck() {
		super();
	}

	public InstitutionCheck(Integer inc_id, Integer in_id, Integer u_id,
			Date inc_time, Integer inc_result, String inc_remark) {
		super();
		this.inc_id = inc_id;
		this.in_id = in_id;
		this.u_id = u_id;
		this.inc_time = inc_time;
		this.inc_result = inc_result;
		this.inc_remark = inc_remark;
	}

	@Override
	public String toString() {
		return "InstitutionCheck [inc_id=" + inc_id + ", in_id=" + in_id
				+ ", u_id=" + u_id + ", inc_time=" + inc_time + ", inc_result="
				+ inc_result + ", inc_remark=" + inc_remark + "]";
	}

}
