package com.aaa.service.lk;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lk.SlotTypeDao;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.SlotType;


@Service
public class SlotTypeService {
	
	@Autowired
	SlotTypeDao stDao;
	
	public LayuiQuery querySlotType(SlotType st,Integer page,Integer limit){
		Integer offset = 0;
		if (null == page && null == limit) {
			limit = 10;
		} else {
			offset = (page - 1) * limit;
		}
		LayuiQuery layuiQuery=new LayuiQuery(0, null, stDao.querySlotType(st, null, null).size(), stDao.querySlotType(st, offset, limit));
		System.out.println(layuiQuery);
		System.out.println(stDao.querySlotType(st, page, offset).size());
		return layuiQuery;
	}
	
	public List<Map<String, Object>> listSlot(Integer[] st_ids){
		return stDao.listSlot(st_ids);
	}
	
	public boolean addSlotType(SlotType st){
		int i = stDao.addSlotType(st);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateSlotType(SlotType st){
		int i = stDao.updateSlotType(st);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deleteSlotType(Integer[] st_ids){
		// 是否被使用
		List<Map<String, Object>> listSlot = stDao.listSlot(st_ids);
		System.out.println("listSlot:"+listSlot);
		if (listSlot.size() > 0) {
			return false;// 不能删除
		} else {
			int rs = stDao.deleteSlotType(st_ids);
			if (rs != 0) {
				return true;// 删除成功
			} else {
				return false;// 删除失败
			}
		}
	}

}
