package com.aaa.controller.jck;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Channel;
import com.aaa.service.jck.JckChannelService;
import com.aaa.util.jck.LoginUtil;
import com.aaa.util.tb.help.Tools;
@RequestMapping("jckC")
@Controller
public class JckChannelController {

	
	@Autowired
	JckChannelService jcs;
	@RequestMapping("selChannel")
	@ResponseBody
	/**
	 * 获取所有的网站信息(添加广告位时网站的查询)
	 * @return
	 */
	public List<Map<String, Object>> selChannel(HttpSession session){
		Channel c=new Channel();
		c.setU_id(Tools.toInteger(LoginUtil.getlogin(session).get("u_id").toString()));
		return jcs.selChannel(c);
	}
	@RequestMapping("selCh")
	@ResponseBody
	/**
	 * 获取所有的网站信息(添加订单的网站信息查询)
	 * @return
	 */
	public List<Map<String, Object>> selCh(){
		return jcs.selChannel(null);
	}
}
