package com.aaa.dao.jck;

import java.util.Map;

import com.aaa.entity.Feedback;

public interface FeedbackDao {

	//添加反馈
	public int addFeedback(Feedback f);
	//根据订单查询反馈信息
	public Map<String, Object> selFeedback(String i_id);
}
