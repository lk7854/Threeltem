package com.aaa.controller.lk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.LayuiQuery;
import com.aaa.entity.PosterType;
import com.aaa.service.lk.PosterTypeService;

/**
 * @author Despacito
 * @see 
 * */
@Controller
@RequestMapping("LKPosterType")
public class PosterTypeController {
	
	@Autowired
	private PosterTypeService ptService;
	
	@RequestMapping("qpt")
	@ResponseBody
	public LayuiQuery queryPosterType(PosterType pt,Integer page,Integer limit){
		return ptService.queryPosterType(pt, page, limit);
	}
	
	@RequestMapping("addpt")
	public String addPosterType(PosterType pt){
		System.out.println(pt);
		ptService.addPosterType(pt);
		return "postertype";
	}
	
	@RequestMapping("uppt")
	public String updatePosterType(PosterType pt){
		System.out.println(pt);
		ptService.updatePosterType(pt);
		return "postertype";
	}
	
	@RequestMapping("delpt")
	@ResponseBody
	public boolean deletePosterType(Integer[] pt_ids){
		for (Integer id : pt_ids) {
			System.out.println(id);
		}
		return ptService.deletePosterType(pt_ids);
	}
}
