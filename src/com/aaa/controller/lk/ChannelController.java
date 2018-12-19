package com.aaa.controller.lk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Channel;
import com.aaa.entity.LayuiQuery;
import com.aaa.service.lk.ChannelService;

/**
 * @author Despacito
 * @see 
 * */
@Controller
@RequestMapping("LKchannel")
public class ChannelController {
	
	@Autowired
	private ChannelService chService;
	
	@RequestMapping("qch")
	@ResponseBody
	public LayuiQuery queryChannel(Channel ch,Integer page,Integer limit){
		return chService.queryChannel(ch, page, limit);
	}
	
	@RequestMapping("addch")
	public String addChannel(Channel ch){
		System.out.println(ch);
		chService.addChannel(ch);
		return "channel";
	}
	
	@RequestMapping("upch")
	public String updateChannel(Channel ch){
		System.out.println(ch);
		chService.updateChannel(ch);
		return "channel";
	}
	
	@RequestMapping("delch")
	@ResponseBody
	public boolean deleteChannel(Integer[] ch_ids){
		for (Integer id : ch_ids) {
			System.out.println(id);
		}
		return chService.deleteChannel(ch_ids);
	}
}
