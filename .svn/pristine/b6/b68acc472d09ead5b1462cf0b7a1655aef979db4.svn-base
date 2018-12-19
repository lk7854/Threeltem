package com.aaa.dao.tb;

import java.util.List;
import java.util.Map;

import com.aaa.entity.ClickTable;

public interface ClickTableDao {

	/**
	 * 修改
	 * 
	 * @param ct
	 * @return
	 */
	public Integer update(ClickTable ct);

	/**
	 * 添加点击记录
	 * 
	 * @param ct
	 * @return
	 */
	public Integer addct(ClickTable ct);

	/**
	 * 根据订单ID查询执行中的点击次数
	 * 
	 * @param i_id
	 * @return
	 */
	public List<Map<String, Object>> query(String i_id);

	/**
	 * 用于查询每个订单中广告的点击情况
	 * 
	 * @param i_id
	 * @return
	 */
	public List<Map<String, Object>> getTableData(String i_id);

}
