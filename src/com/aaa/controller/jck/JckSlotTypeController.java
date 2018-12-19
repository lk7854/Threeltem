package com.aaa.controller.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.jck.JckSlotTypeService;
@RequestMapping("jckST")
@Controller
public class JckSlotTypeController {

	@Autowired
	JckSlotTypeService jsts;
	@RequestMapping("slotType")
	@ResponseBody
	/**
	 * 获取所有的广告类型信息
	 * @return
	 */
	public List<Map<String, Object>> selSlotType(){
		return jsts.selSlotType();
	}
}
