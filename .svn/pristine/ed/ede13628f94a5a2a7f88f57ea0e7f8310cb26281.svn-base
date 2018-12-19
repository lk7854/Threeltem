package com.aaa.service.lk;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lk.ChannelDao;
import com.aaa.entity.Channel;
import com.aaa.entity.LayuiQuery;

@Service
public class ChannelService {
	
	@Autowired
	ChannelDao chDao;
	
	public LayuiQuery queryChannel(Channel ch,Integer page,Integer limit){
		Integer offset = 0;
		if (null == page && null == limit) {
			limit = 10;
		} else {
			offset = (page - 1) * limit;
		}
		LayuiQuery layuiQuery=new LayuiQuery(0, null, chDao.queryChannel(ch, null, null).size(), chDao.queryChannel(ch, offset, limit));
		System.out.println(layuiQuery);
		System.out.println(chDao.queryChannel(ch, page, offset).size());
		return layuiQuery;
	}
	
	public List<Map<String, Object>> listSlot(Integer[] ch_ids){
		return chDao.listSlot(ch_ids);
	}
	
	public boolean addChannel(Channel ch){
		int i = chDao.addChannel(ch);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateChannel(Channel ch){
		int i = chDao.updateChannel(ch);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deleteChannel(Integer[] ch_ids){
		// 是否被使用
		List<Map<String, Object>> listSlot = chDao.listSlot(ch_ids);
		System.out.println("listSlot:"+listSlot);
		if (listSlot.size() > 0) {
			return false;// 不能删除
		} else {
			int rs = chDao.deleteChannel(ch_ids);
			if (rs != 0) {
				return true;// 删除成功
			} else {
				return false;// 删除失败
			}
		}
	}

}
