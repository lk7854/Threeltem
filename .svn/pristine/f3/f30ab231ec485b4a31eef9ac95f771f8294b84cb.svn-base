package com.aaa.controller.tb;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.tb.ClickTableService;

/**
 * 点击表控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("click")
public class ClickCountController {

	@Autowired
	ClickTableService cts;

	/**
	 * 获取订单点击信息的图表数据
	 * 
	 * @param i_id
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("getTableData")
	@ResponseBody
	public String getData(String i_id) throws ParseException {
		return cts.getTableData(i_id);
	}

	/**
	 * 访问接口,计数，点击次数
	 * 
	 * @param id
	 * @param req
	 * @return
	 */
	@RequestMapping("go")
	public String go(Integer id, HttpServletRequest req) {
		return cts.count(id, req);
	}

}
