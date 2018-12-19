package com.aaa.service.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckChannelDao;
import com.aaa.dao.jck.JckIndentDao;
import com.aaa.dao.jck.JckSlotTypeDao;
import com.aaa.entity.Channel;
import com.aaa.entity.Indent;

@Service
@Transactional
public class JckChannelService {

	@Autowired
	JckChannelDao jcd;
	//查询所有的网站信息
	public List<Map<String, Object>> selChannel(Channel c){
		return jcd.selChannel(c);
	}
}
