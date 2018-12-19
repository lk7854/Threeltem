package com.aaa.dao.jck;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Feedback;
import com.aaa.entity.Indent;


public interface JckIndentDao {

	//添加订单
	public int AddIndent(Indent i,double day,Integer count);
	//查询订单
	public List<Map<String, Object>> selIndents(Indent i,Integer page,Integer limit,Feedback f);
	//根据单个订单信息进行查询订单信息
	public List<Map<String, Object>> selIndent(Indent i,Double day);
	//修改单个的订单信息(续费)
	public int updateIndent(Indent i,double day);
}
