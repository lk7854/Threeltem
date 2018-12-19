package com.aaa.controller.jck;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Feedback;
import com.aaa.service.jck.FeedbackService;


@Controller
@RequestMapping("feedbackCon")
public class FeedbackController {

	@Autowired
	FeedbackService fs;
	@RequestMapping("addFeedback")
	@ResponseBody
	public int addFeedback(Feedback f){
		return fs.addFeedback(f);
	}
	@RequestMapping("selFeedback")
	@ResponseBody
	public boolean selFeedback(String i_id){
		Map<String, Object> map = fs.selFeedback(i_id);
		if (null!=map) {
			return false;
		}
		return true;
	}
}
