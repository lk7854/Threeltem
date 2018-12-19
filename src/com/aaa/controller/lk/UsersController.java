package com.aaa.controller.lk;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.dao.lk.UsersDao;
import com.aaa.dao.tb.AccBDao;
import com.aaa.entity.AccountBalance;
import com.aaa.entity.BusinessLicense;
import com.aaa.entity.Channel;
import com.aaa.entity.Institution;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Users;
import com.aaa.service.lk.UsersService;
import com.aaa.util.jck.Upload;
import com.aaa.util.tb.help.Tools;

/**
 * @author Despacito
 * @see 登录
 * */
@Controller
@RequestMapping("LKusers")
public class UsersController {

	@Autowired
	private UsersService usService;
	@Autowired
	AccBDao abd;
	@Autowired
	private UsersDao uDao;

	@RequestMapping("login")
	@ResponseBody
	public Integer Login(String name, String pwd, HttpSession session) {
		System.out.println("name:" + name);
		System.out.println("pwd:" + pwd);
		if (null != usService.login(name, pwd, session)) {

			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping("lookInfo")
	// 在查看个人中心的时候先走个controller
	public String lookInfo(HttpSession session, Model m) {
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session
				.getAttribute("login");
		m.addAttribute(
				"logi",
				uDao.Logins(Tools.toStr(map.get("u_name")),
						Tools.toStr(map.get("u_pwd"))));
		return "userInfo";
	}

	@RequestMapping("exit")
	public String exit(HttpSession session) {
		session.removeAttribute("login");
		return "../index";
	}

	@RequestMapping("addus")
	@ResponseBody
	public boolean addUsers(Users us) {
		System.out.println(us);
		return usService.addUsers(us);
	}

	@RequestMapping("upus")
	public String updateUsers(Users us) {

		System.out.println("us" + us);
		usService.updateUsers(us);
		return "usersmanage";
	}

	@RequestMapping("upin")
	@ResponseBody
	public boolean updateInstitution(Institution in) {
		return usService.updateInstitution(in);
	}

	@RequestMapping("addin")
	@ResponseBody
	public int addInstitution(Institution in, MultipartFile file,
			HttpServletRequest request, HttpSession session) {
		System.out.println(in);
		return usService.addInstitution(in, session);
	}

	@RequestMapping("addc")
	@ResponseBody
	public boolean addChannel(Channel c) {
		System.out.println(c);
		return usService.addChannel(c);
	}

	@RequestMapping("addm")
	public String addMoney(AccountBalance ab, HttpSession session, Model m) {
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session
				.getAttribute("login");
		Map<String, Object> queryAcbyUid = abd.queryAcbyUid(Tools.toInteger(map
				.get("u_id")));
		double object = Tools.toDouble(queryAcbyUid.get("ab_money"));
		ab.setAb_money(ab.getAb_money() + object);
		usService.addMoney(ab);
		return lookInfo(session, m);
	}

	@RequestMapping("addbl")
	@ResponseBody
	public boolean addBusinessLicense(BusinessLicense bl) {
		System.out.println(bl);
		return usService.addBusinessLicense(bl);
	}

	@RequestMapping("personal")
	public String personal(Channel c, Institution in, Users us,
			HttpSession session, MultipartFile file, HttpServletRequest request) {
		in.setIn_certificate("http://127.0.0.1:8080/ThreeItem/upload/"
				+ Upload.fileUpload(file, request));
		System.out.println(in);
		System.out.println(file);
		if (null != usService.personal(c, in, us, session)) {
			return "../index";
		} else {
			return "error";
		}
	}

	@RequestMapping("gr")
	@ResponseBody
	public boolean geren(Users u, Institution in, HttpSession session) {
		return usService.geren(u, in, session);
	}

	@RequestMapping("qin")
	@ResponseBody
	public List<Map<String, Object>> selectInstitution() {
		return usService.selectInstitution();
	}

	@RequestMapping("qu")
	@ResponseBody
	public LayuiQuery queryUsers(Users u, Integer page, Integer limit) {
		return usService.queryUsers(u, page, limit);
	}

	@RequestMapping("selSession")
	public String querySession(HttpSession session, String href) {
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session
				.getAttribute("login");
		if (null != map) {
			href = href.substring(0, href.indexOf("."));
			return href;
		}
		return "../page/login/login";
	}
}
