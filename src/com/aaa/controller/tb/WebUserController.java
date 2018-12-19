package com.aaa.controller.tb;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Users;
import com.aaa.service.tb.WebUserService;

/**
 * 网站信息控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("webuser")
public class WebUserController {

	@Autowired
	WebUserService wus;

	@RequestMapping("query")
	@ResponseBody
	public LayuiQuery query(Users u, Integer page, Integer rows) {
		return wus.query(u, page, rows);
	}

	@RequestMapping("getData")
	@ResponseBody
	public Map<String, Object> getData(Integer[] u_id) {
		return wus.getTableData(u_id);
	}

}
