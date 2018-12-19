package com.aaa.controller.tb;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Indent;
import com.aaa.entity.IndentCheck;
import com.aaa.entity.LayuiQuery;
import com.aaa.service.tb.IndentService;
import com.aaa.util.tb.help.Tools;

/**
 * 订单表操作的控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("indent")
public class IndentController {

	@Autowired
	IndentService is;

	@RequestMapping("rollback")
	@ResponseBody
	public Boolean rollback(Indent indent, HttpSession session) {
		return is.rollback(indent, session);
	}

	/**
	 * 修改订单信息
	 * 
	 * @param indent
	 * @param session
	 * @return
	 */
	@RequestMapping("up")
	@ResponseBody
	public Boolean update(Indent indent, HttpSession session) {
		return is.update(indent, session);
	}

	/**
	 * 获取某一广告位上的要投放的广告信息，广告url 和图片url
	 * 
	 * @param i_id
	 * @return
	 */
	@RequestMapping("getOrders")
	@ResponseBody
	public Object getOrdersInfo(Integer s_id) {
		return is.getOders(s_id);
	}

	/**
	 * 审核方法
	 * 
	 * @param indent
	 * @return
	 */
	@RequestMapping("uporcheck")
	@ResponseBody
	public Boolean check(Indent indent, IndentCheck ic, HttpSession session) {
		return is.check(indent, ic, session);
	}

	/**
	 * 订单查询
	 * 
	 * @param ident
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("identQuery")
	@ResponseBody
	public LayuiQuery select(Indent ident, Integer page, Integer limit,
			HttpSession session) {
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session
				.getAttribute("login");
		Integer rid = Tools.toInteger(map.get("r_id"));
		Integer uid = null;
		if (rid == 2) {// 管理员
		} else if (rid == 3) {// 广告主
			ident.setU_id(Tools.toInteger(map.get("u_id")));
		} else if (rid == 4) {// 网站主
			uid = Tools.toInteger(map.get("u_id"));
		}
		return is.select(ident, page, limit, uid);
	}
}
