package com.aaa.controller.lk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.TreeNode;
import com.aaa.service.lk.ParentService;
import com.aaa.util.lk.LayuiTreeUtils;

/**
 * @author Despacito
 * @see 菜单栏
 * */
@Controller
@RequestMapping("LKparent")
public class ParentController {
	
	@Autowired
	ParentService pService;
	
	@Autowired
	LayuiTreeUtils treeUtils;
	
	// 菜单栏
	@RequestMapping("gett")
	@ResponseBody
	public Map<String, Object> getTree(HttpSession session) {
		@SuppressWarnings("unchecked")
		Map<String, Object> map1=(Map<String, Object>) session.getAttribute("login");
		List<TreeNode> tree = treeUtils.getTree(Integer.parseInt(map1.get("r_id").toString()));
		Map<String,Object> map = new HashMap<String,Object>();
		
		//contentManagement
		List<TreeNode> list = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {
			
			if(t.getTitle().contains("广告管理")){
				list.add(t);
			}
			if(t.getTitle().contains("广告位管理")){
				list.add(t);
			}
			if(t.getTitle().contains("客户管理")){
				list.add(t);
			}
			if(t.getTitle().contains("网站管理")){
				list.add(t);
			}
			if(t.getTitle().contains("广告类型管理")){
				list.add(t);
			}
			if(t.getTitle().contains("广告位类型管理")){
				list.add(t);
			}
			if(t.getTitle().contains("消息类型管理")){
				list.add(t);
			}
			if(t.getTitle().contains("审核")){
				list.add(t);
			}
			//System.out.println(t);
		}
		map.put("contentManagement", list);
		
		//memberCenter
		List<TreeNode> list2 = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {
			
			if(t.getTitle().contains("我的订单")){
				list2.add(t);
			}
			if(t.getTitle().contains("下订单")){
				list2.add(t);
			}
			if(t.getTitle().contains("订单管理")){
				list2.add(t);
			}
			if(t.getTitle().contains("订单反馈")){
				list2.add(t);
			}
			//System.out.println(t);
		}
		map.put("memberCenter", list2);
		
		//systemeSttings
		List<TreeNode> list3 = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {

			if(t.getTitle().contains("报表")){
				list3.add(t);
			}
			if(t.getTitle().contains("情况")){
				list3.add(t);
			}
			
			//System.out.println(t);
		}
		map.put("systemeSttings", list3);
		
		//seraphApi
		List<TreeNode> list4 = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {

			if(t.getTitle().contains("消息通知")){
				list4.add(t);
			}
			//System.out.println(t);
		}
		map.put("seraphApi", list4);
		return map;
	}
	
	// 中间表
	
	@RequestMapping("qbm")
	@ResponseBody
	public Integer[] queryBym_id(Integer r_id) {
		return pService.queryBym_id(r_id);
	};
	
	// 设置权限
	@RequestMapping("setp")
	@ResponseBody
	public boolean setPermission(Integer r_id, Integer[] m_ids) {
		return pService.addrole_menu(r_id, m_ids);
	}

}
