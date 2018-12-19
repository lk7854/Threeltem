package com.aaa.service.jck;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.FeedbackDao;
import com.aaa.entity.Feedback;
@Service
@Transactional
public class FeedbackService {

	@Autowired
	FeedbackDao fd;
	//添加反馈
	public int addFeedback(Feedback f){
		return fd.addFeedback(f);
	}
	//根据订单查询反馈信息
	public Map<String, Object> selFeedback(String i_id){
		return fd.selFeedback(i_id);
	}
}
