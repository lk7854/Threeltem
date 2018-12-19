package com.aaa.controller.lk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.LayuiQuery;
import com.aaa.entity.SlotType;
import com.aaa.service.lk.SlotTypeService;

/**
 * @author Despacito
 * @see 
 * */
@Controller
@RequestMapping("LKSlotType")
public class SlotTypeController {
	
	@Autowired
	private SlotTypeService stService;
	
	@RequestMapping("qst")
	@ResponseBody
	public LayuiQuery querySlotType(SlotType st,Integer page,Integer limit){
		return stService.querySlotType(st, page, limit);
	}
	
	@RequestMapping("addst")
	public String addSlotType(SlotType st){
		System.out.println(st);
		stService.addSlotType(st);
		return "slottype";
	}
	
	@RequestMapping("upst")
	public String updateSlotType(SlotType st){
		System.out.println(st);
		stService.updateSlotType(st);
		return "slottype";
	}
	
	@RequestMapping("delst")
	@ResponseBody
	public boolean deleteSlotType(Integer[] st_ids){
		for (Integer id : st_ids) {
			System.out.println(id);
		}
		return stService.deleteSlotType(st_ids);
	}
}
