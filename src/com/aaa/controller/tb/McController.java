package com.aaa.controller.tb;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.LayuiQuery;
import com.aaa.entity.MoneyChange;
import com.aaa.service.tb.McService;
import com.aaa.util.tb.help.Tools;

/**
 * 金额变动表控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("Mc")
public class McController {

	@Autowired
	McService ms;

	/**
	 * 本系统的盈利情况
	 * 
	 * @param mc
	 * @param startTime
	 * @param endTime
	 * @param page
	 * @param rows
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("query")
	@ResponseBody
	public LayuiQuery queryMc(MoneyChange mc, String startTime, String endTime,
			Integer page, Integer rows) throws ParseException {
		Date date1 = null;
		Date date2 = null;
		if (null != startTime && "" != startTime) {
			date1 = Tools.getDate2(startTime, "yyyy-MM-dd", "yyyy-MM-dd");
		}
		if (null != endTime && "" != endTime) {
			date2 = Tools.getDate2(endTime, "yyyy-MM-dd", "yyyy-MM-dd");
		}
		return ms.queryMc(mc, date1, date2, page, rows);
	}

	/**
	 * 网站主的盈利情况
	 * 
	 * @param mc
	 * @param page
	 * @param rows
	 * @param session
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("webquery")
	@ResponseBody
	public LayuiQuery queryMc(MoneyChange mc, String startTime, String endTime,
			Integer page, Integer rows, HttpSession session)
			throws ParseException {
		@SuppressWarnings("unchecked")
		Integer uid = Tools.toInteger(((Map<String, Object>) session
				.getAttribute("login")).get("u_id"));
		mc.setU_id2(uid);
		Date date1 = null;
		Date date2 = null;
		if (null != startTime && "" != startTime) {
			date1 = Tools.getDate2(startTime, "yyyy-MM-dd", "yyyy-MM-dd");
		}
		if (null != endTime && "" != endTime) {
			date2 = Tools.getDate2(endTime, "yyyy-MM-dd", "yyyy-MM-dd");
		}
		return ms.queryMc(mc, date1, date2, page, rows);
	}

}
