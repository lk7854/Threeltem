package com.aaa.controller.jck;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.jck.PosterTypesService;

@Controller
@RequestMapping("posterTypeCon")
public class PosterTypesController {

	@Autowired
	PosterTypesService pts;
	@RequestMapping("selPosters")
	@ResponseBody
	//广告类型的查询
	public List<Map<String, Object>> selPosters(){
		return pts.selList();
	};
}
