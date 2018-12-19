package com.aaa.controller.jck;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.jck.MoneyChangeService;

@Controller
@RequestMapping("moneyCh")
public class MoneyChangeController {

	@Autowired
	MoneyChangeService mcs;
	@RequestMapping("selMoneyChange")
	@ResponseBody
	public String selMoneyChange(String i_id) throws ParseException{
		return mcs.selMoneyChange(i_id);
	}
}
