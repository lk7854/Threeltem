package com.aaa.controller.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Indent;
import com.aaa.service.jck.BillingTypeService;


@Controller
@RequestMapping("billingType")
public class BillingTypeController {

	@Autowired
	BillingTypeService bts;
	@RequestMapping("selBil")
	@ResponseBody
	public List<Map<String, Object>> selBil(){
		return bts.selBilling();
	}
}
