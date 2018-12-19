package com.aaa.test.lk;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aaa.entity.LayuiQuery;
import com.aaa.entity.TreeNode;
import com.aaa.service.lk.ChannelService;
import com.aaa.service.lk.PosterTypeService;
import com.aaa.util.lk.LayuiTreeUtils;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class T {

	@Autowired
	LayuiTreeUtils pd;
	@Autowired
	PosterTypeService pts;
	@Autowired
	ChannelService cService;
	//@Test
	public void m(){
		List<TreeNode> tree = pd.getTree(2);
		Map<String,Object> map = new HashMap<String,Object>();
		
		List<TreeNode> list = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {
			
			if(t.getTitle().contains("订单")){
				list.add(t);
			}
			if(t.getTitle().contains("审核")){
				list.add(t);
			}
			System.out.println(t);
		}
		map.put("contentManagement", list);
		System.out.println(map);
		
		List<TreeNode> list2 = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {
			
			if(t.getTitle().contains("订单")){
				list2.add(t);
			}
			if(t.getTitle().contains("审核")){
				list2.add(t);
			}
			System.out.println(t);
		}
		map.put("memberCenter", list2);
		System.out.println(map);
		
		List<TreeNode> list3 = new ArrayList<TreeNode>();
		for (TreeNode t : tree) {
			
			if(t.getTitle().contains("订单")){
				list3.add(t);
			}
			if(t.getTitle().contains("审核")){
				list3.add(t);
			}
			System.out.println(t);
		}
		map.put("systemeSttings", list3);
		System.out.println(map);
	}
	//@Test
	public void m1(){
		LayuiQuery queryPosterType = pts.queryPosterType(null, 1, 10);
		System.out.println(queryPosterType);
	}
	@Test
	public void m2(){
		LayuiQuery queryPosterType = cService.queryChannel(null, 1, 10);
		System.out.println(queryPosterType);
	}
}
