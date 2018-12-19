package com.aaa.service.jck;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckIndentDao;
import com.aaa.dao.jck.JckSlotDao;
import com.aaa.entity.Channel;
import com.aaa.entity.Indent;
import com.aaa.entity.Slot;
import com.aaa.util.tb.help.Tools;
@Service
@Transactional
public class JckSlotService {

	@Autowired
	JckSlotDao jsd;
	@Autowired
	JckIndentDao jid;
	//显示广告位相关信息
	public List<Map<String, Object>> selSlot(Slot s,Channel c,Integer page,Integer limit){
		if (null!=s) {
			if (null!=s.getS_state()&&-1==s.getS_state()) {
				s.setS_state(null);
			}
			if (null!=s.getS_name()) {
				try {
					s.setS_name(new String(s.getS_name().getBytes("iso8859-1"),"utf-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		
		if (page==-1&&limit==-1) {
			page=null;
			limit=null;
		}else {
			page=(page-1)*limit;
		}
		
		return jsd.selSlot(s,c,page,limit);
	}
	public int updateSlot(Slot s){
		return jsd.updateSlot(s);
	}
	//添加一条广告位的信息
	public int addSlot(Slot s,HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		s.setU_id(Tools.toInteger(map.get("u_id")));
		System.out.println(s);
		return jsd.addSlot(s);
	}
	//删除一条广告位的信息
	public int deleteSlot(Integer sid){
		Indent id=new Indent();
		id.setS_id(sid);
		List<Map<String, Object>> selIndents = jid.selIndents(id, null, null, null);
		for (Map<String, Object> map2 : selIndents) {
			if (Integer.parseInt(map2.get("i_state").toString())==5) {
				return -1;
			}
		}
		return jsd.deleteSlot(sid);
	}
	//判断广告位是否正在使用中
	public int selIndent(Slot s){
		Indent i=new Indent();
		i.setS_id(s.getS_id());
		List<Map<String, Object>> selIndents = jid.selIndents(i, null, null, null);
		System.out.println(selIndents.size());
		for (Map<String, Object> map2 : selIndents) {
			if (Integer.parseInt(map2.get("i_state").toString())==5) {
				return -2;
			}
		}
		return 1;
	}
	//查询广告位的使用情况
	public List<Map<String, Object>> selUse(Slot s,Integer page,Integer limit,HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		s.setU_id(Tools.toInteger(map.get("u_id")));
		return jsd.selUse(s, page, limit);
	}
}
