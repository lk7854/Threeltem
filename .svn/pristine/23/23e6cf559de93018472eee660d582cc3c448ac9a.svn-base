package com.aaa.controller.jck;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Feedback;
import com.aaa.entity.Indent;
import com.aaa.entity.LayuiQuery;
import com.aaa.service.jck.JckIndentService;


@Controller
@RequestMapping("jckIn")
public class JckIndentController {

	@Autowired
	JckIndentService jds;
	@RequestMapping("addIndent")
	@ResponseBody
	/**
	 * 添加订单
	 * @param i
	 * @param day
	 * @param session
	 * @return
	 */
	public Integer addIndent(Indent i,double day,Integer st_id,HttpSession session){
		session.setAttribute("st_id", st_id);
		return jds.AddIndent(i,day,session);
	}
	@RequestMapping("selMoney")
	@ResponseBody
	public int selMoney(double money,HttpSession session){
		return jds.getMoney(money, session);
	}
	@RequestMapping("selIndents")
	@ResponseBody
	/**
	 * 进行查询自己的订单
	 * @param i
	 * @param page
	 * @param limit
	 * @param f
	 * @return
	 */
	public LayuiQuery selIndents(Indent i,Integer page,Integer limit,Feedback f){
		return jds.selIndents(i, page, limit, f);
	}
	@RequestMapping("selInd")
	@ResponseBody
	/**
	 * 根据订单中的广告位id进行查询该广告位下面是否有订单，如果有返回值，没有返回空值
	 * @param i
	 * @param day
	 * @return
	 */
	public Map<String, Object> selInd(Indent i,Double day){
		return jds.selIndent(i, day);
	}
	@RequestMapping("getIndentMoney")
	@ResponseBody
	public double getIndentMoney(HttpSession session){
		return jds.getIndentMoney(session);
	}
	//修改订单冻结记录表里面当前用户金额为负数的冻结金额
	@RequestMapping("updateMoney")
	@ResponseBody
	public int updateMoney(HttpSession session){
		return jds.updateMoney(session);
	}
	//进行订单续费
	@RequestMapping("xufei")
	@ResponseBody
	public Map<String, Object> xufei(Indent i,double money,double day,HttpSession session){
		return jds.xufei(i,money,day,session);
	}
}
