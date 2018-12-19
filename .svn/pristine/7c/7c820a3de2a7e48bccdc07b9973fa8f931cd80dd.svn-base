package com.aaa.dao.tb;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Indent;

public interface IndentDao {
	/**
	 * 后台： 分页模糊订单查询
	 * 
	 * @param ident
	 * @param page
	 * @param limit
	 * @return
	 */
	public List<Map<String, Object>> select(Indent indent, Integer offset,
			Integer limit, Integer inst_uid);

	/**
	 * 修改订单信息
	 * 
	 * @param indent
	 * @return
	 */
	public Integer checkIndent(Indent indent);

	/**
	 * 获取广告位上的，要投放的订单，只有一条
	 * 
	 * @param p_id
	 * @return
	 */
	public List<Map<String, Object>> queryIndentBys_id(Integer s_id);

}
