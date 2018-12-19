package com.aaa.controller.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Indent;
import com.aaa.service.jck.ChargeparService;


@Controller
@RequestMapping("chargepar")
public class ChargeparController {

	@Autowired
	ChargeparService cs;
	@RequestMapping("selChargepar")
	@ResponseBody
	public List<Map<String, Object>> selChargepar(Integer btid){
		return cs.selChargepar(btid);
	}
}
