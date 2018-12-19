package com.aaa.controller.jck;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.entity.Channel;
import com.aaa.entity.Slot;
import com.aaa.service.jck.JckSlotService;
import com.aaa.util.jck.Upload;
import com.aaa.util.tb.help.Tools;
import com.fasterxml.jackson.databind.util.JSONPObject;


@Controller
@RequestMapping("jckS")
public class JckSlotController {

	@Autowired
	JckSlotService jss;
	
	@RequestMapping("showSlot")
	@ResponseBody
	/**
	 * 广告位的分页查询(广告位的查询)
	 * @param s
	 * @param page
	 * @param limit
	 * @return
	 */
	public Map<String, Object> selSlot(Slot s,Channel c,Integer page,Integer limit){
		s.setS_state(2);
		List<Map<String, Object>> maps = jss.selSlot(s,c,page,limit);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg","");
		map.put("count",jss.selSlot(s,c, -1, -1).size());
		map.put("data",maps);
		System.out.println(map);
		return map;
	}
	@RequestMapping("showSl")
	@ResponseBody
	/**
	 * 广告位的分页查询(审核时的查询)
	 * @param s
	 * @param page
	 * @param limit
	 * @return
	 */
	public Map<String, Object> selSl(Slot s,Channel c,Integer page,Integer limit){
		List<Map<String, Object>> maps = jss.selSlot(s,c,page,limit);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg","");
		map.put("count",jss.selSlot(s,c, -1, -1).size());
		map.put("data",maps);
		return map;
	}
	@RequestMapping("updateSlot")
	public String updateSlot(Slot s,HttpSession session,MultipartFile file,HttpServletRequest request){
		
		
		if (!"".equals(file.getOriginalFilename())) {
			s.setS_picture("http://192.168.43.137:8080/ThreeItem/upload/"+Upload.fileUpload(file, request));
		}
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		s.setU_id(Tools.toInteger(map.get("u_id")));
		s.setS_state(0);
		//修改广告位信息
		jss.updateSlot(s);
		return "slotManage";
	}
	
	@RequestMapping("addSlot")
	public String addSlot(Slot s,MultipartFile file,HttpServletRequest request,HttpSession session){
		s.setS_picture("http://192.168.43.137:8080/ThreeItem/upload/"+Upload.fileUpload(file, request));
		//进行添加
		jss.addSlot(s, session);
		return "slotManage";
	}
	@RequestMapping("selIn")
	@ResponseBody
	public int selIn(Slot s){
		return jss.selIndent(s);
	}
	@RequestMapping("deleteSlot")
	@ResponseBody
	public int deleteSlot(Integer sid){
		return jss.deleteSlot(sid);
	}
	@RequestMapping("selUse")
	@ResponseBody
	//查询广告位的使用情况
	public Map<String, Object> selUse(Slot s,Integer page,Integer limit,HttpSession session){
		List<Map<String, Object>> maps= jss.selUse(s, page, limit,session);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg","");
		map.put("count",jss.selUse(s, null, null,session).size());
		map.put("data",maps);
		return map;
	}
}
