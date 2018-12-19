package com.aaa.controller.lk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Channel;
import com.aaa.entity.Slot;
import com.aaa.service.jck.JckSlotService;
import com.aaa.service.lk.SlotlService;

/**
 * @author Despacito
 * @see 
 * */
@Controller
@RequestMapping("LKslot")
public class SlotlController {
	
	@Autowired
	private SlotlService sService;
	@Autowired
	private JckSlotService jss;
	
	@RequestMapping("qs")
	@ResponseBody
	public Map<String, Object> querySlot(Slot s,Channel c,Integer page,Integer limit){
		List<Map<String, Object>> maps = jss.selSlot(s,c,page,limit);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg","");
		map.put("count",jss.selSlot(s,c, -1, -1).size());
		map.put("data",maps);
		return map;
	}
	
	@RequestMapping("adds")
	@ResponseBody
	public boolean addSlot(Slot s){
		return sService.addSlot(s);
	}
	
	@RequestMapping("ups")
	@ResponseBody
	public boolean updateSlot(Slot s){
		return sService.updateSlot(s);
	}
	
	@RequestMapping("dels")
	@ResponseBody
	public boolean deleteSlot(Integer[] s_ids){
		for (Integer id : s_ids) {
			System.out.println(id);
		}
		return sService.deleteSlot(s_ids);
	}
}
