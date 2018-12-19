package com.aaa.dao.jck;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Channel;
import com.aaa.entity.Slot;

public interface JckSlotDao {

	//查看广告位信息
	public List<Map<String, Object>> selSlot(Slot s,Channel c,Integer page,Integer limit);
	//修改广告位的部分信息
	public int updateSlot(Slot s);
	//添加一条广告位的信息
	public int addSlot(Slot s);
	//删除一条广告位的信息
	public int deleteSlot(Integer sid);
	//查询广告位的使用情况
	public List<Map<String, Object>> selUse(Slot s,Integer page,Integer limit);
}
