package com.aaa.entity;

import java.io.Serializable;

/**
 * 点击次数表
 * 
 * @author Administrator
 * 
 */
public class ClickTable implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ct_id;
	private String i_id;// 订单编号
	private Integer ct_nums;// 点击次数
	private Integer ct_num;
	private Integer ct_views;
	private Integer ct_exposureCount;// 曝光总次数

	public Integer getCt_exposureCount() {
		return ct_exposureCount;
	}

	public void setCt_exposureCount(Integer ct_exposureCount) {
		this.ct_exposureCount = ct_exposureCount;
	}

	public Integer getCt_views() {
		return ct_views;
	}

	public void setCt_views(Integer ct_views) {
		this.ct_views = ct_views;
	}

	public Integer getCt_id() {
		return ct_id;
	}

	public void setCt_id(Integer ct_id) {
		this.ct_id = ct_id;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public Integer getCt_nums() {
		return ct_nums;
	}

	public void setCt_nums(Integer ct_nums) {
		this.ct_nums = ct_nums;
	}

	public Integer getCt_num() {
		return ct_num;
	}

	public void setCt_num(Integer ct_num) {
		this.ct_num = ct_num;
	}

	public ClickTable(Integer ct_id, String i_id, Integer ct_nums,
			Integer ct_num, Integer ct_views, Integer ct_exposureCount) {
		super();
		this.ct_id = ct_id;
		this.i_id = i_id;
		this.ct_nums = ct_nums;
		this.ct_num = ct_num;
		this.ct_views = ct_views;
		this.ct_exposureCount = ct_exposureCount;
	}

	public ClickTable(Integer ct_id, String i_id, Integer ct_nums,
			Integer ct_num, Integer ct_views) {
		super();
		this.ct_id = ct_id;
		this.i_id = i_id;
		this.ct_nums = ct_nums;
		this.ct_num = ct_num;
		this.ct_views = ct_views;
	}

	public ClickTable() {
		super();
	}

}
