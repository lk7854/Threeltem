package com.aaa.controller.tb;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Institution;
import com.aaa.entity.LayuiQuery;
import com.aaa.service.tb.InstCheckService;
import com.aaa.service.tb.InstitutionService;

/**
 * 机构信息控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("inst")
public class InstController {

	@Autowired
	InstitutionService is;
	@Autowired
	InstCheckService ics;

	/**
	 * 分页模糊查询机构信息
	 * 
	 * @param inst
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("instQuery")
	@ResponseBody
	public LayuiQuery query(Institution inst, Integer page, Integer limit) {
		return is.query(inst, page, limit);
	}

	/**
	 * 审核机构
	 * 
	 * @param inst
	 * @param session
	 * @return
	 */
	/*@RequestMapping("check")
	@ResponseBody
	public Boolean check(Institution inst, HttpSession session) {
		return ics.check(inst, session);
	}*/

}
