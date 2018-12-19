package com.aaa.controller.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Feedback;
import com.aaa.entity.Information;
import com.aaa.entity.LayuiQuery;
import com.aaa.service.tb.FeedBackService;

/**
 * 反馈信息的控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("fb")
public class FeedBackController {

	@Autowired
	FeedBackService fs;

	/**
	 * 处理反馈
	 * 
	 * @param info
	 * @param f_id
	 * @return
	 */
	@RequestMapping("handler")
	@ResponseBody
	public Boolean handler(Information info, Integer f_id) {
		return fs.handler(info, f_id);
	}

	/**
	 * 分页待条件查询，反馈信息
	 * 
	 * @param fb
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("fbquery")
	@ResponseBody
	public LayuiQuery query(Feedback fb, Integer page, Integer limit) {
		return fs.query(fb, page, limit);
	}

}
