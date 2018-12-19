package com.aaa.controller.jck;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Institution;
import com.aaa.entity.Users;
import com.aaa.service.jck.JckusersService;


@Controller
@RequestMapping("jckUs")
public class JckusersController {

	@Autowired
	JckusersService js;
	
	@RequestMapping("showMyself")
	public String showMyself(Model m){
		m.addAttribute("ju", js.showMyselfInfo(2));
		return "jck/myselfInfo";
	}
	//修改个人的信息
	@RequestMapping("updateMyself")
	@ResponseBody
	public boolean updateMyself(Users u,Institution i){
		if (js.updateMyselfInfo(u, i)) {
			return true;
		}
		return false;
	}
	
}
