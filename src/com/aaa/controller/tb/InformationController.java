package com.aaa.controller.tb;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Information;
import com.aaa.entity.LayuiQuery;
import com.aaa.service.tb.InformationService;
import com.aaa.util.tb.help.Tools;

/**
 * 添加消息通知
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("info")
public class InformationController {

	@Autowired
	InformationService is;

	@RequestMapping("update")
	@ResponseBody
	public Boolean update(Integer[] ids) {
		Boolean rs = true;
		if (null != ids) {
			// 循环进行修改消息的状态
			for (int i = 0; i < ids.length; i++) {
				Information info = new Information();
				info.setInf_id(ids[i]);
				info.setInf_state(0);
				System.out.println(info);
				if (!is.update(info)) {
					rs = false;
				}
			}
		}
		return rs;
	}

	/**
	 * 查询通知消息
	 * 
	 * @param info
	 * @param page
	 * @param rows
	 * @param session
	 * @return
	 */
	@RequestMapping("queryInform")
	@ResponseBody
	public LayuiQuery query(Information info, Integer page, Integer rows,
			HttpSession session) {
		@SuppressWarnings("unchecked")
		Integer uid = Tools.toInteger(((Map<String, Object>) session
				.getAttribute("login")).get("u_id"));
		info.setU_id(uid);
		return is.query(info, page, rows);
	}

	/**
	 * 发送消息通知
	 * 
	 * @param info
	 * @return
	 */
	@RequestMapping("addInfo")
	@ResponseBody
	public Boolean send(Information info) {
		Integer rs = is.addInfo(info);
		info.setMt_id(7);// 设置消息类型
		if (rs == 1) {
			return true;
		}
		return false;
	}

}
