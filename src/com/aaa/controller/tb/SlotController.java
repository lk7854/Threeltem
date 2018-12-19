package com.aaa.controller.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Slot;
import com.aaa.service.tb.SlotService;

/**
 * 广告位控制层
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("slot")
public class SlotController {
	@Autowired
	SlotService scs;

	@RequestMapping("edit")
	@ResponseBody
	public Boolean editPrice(Slot slot) {
		return null;
	}

	/**
	 * 审核广告位
	 * 
	 * @param s
	 * @return
	 */
	@RequestMapping("check")
	@ResponseBody
	public Boolean check(Slot s) {
		return scs.checkSlot(s);
	}

}
