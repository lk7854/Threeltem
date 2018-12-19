package com.aaa.service.lk;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lk.SlotlDao;
import com.aaa.entity.Slot;

@Service
public class SlotlService {
	
	@Autowired
	SlotlDao sDao;
	
	public List<Map<String, Object>> querySlot(){
		return sDao.querySlot();
	}
	
	public boolean addSlot(Slot s){
		int i = sDao.addSlot(s);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateSlot(Slot s){
		int i = sDao.updateSlot(s);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deleteSlot(Integer[] s_ids){
			int rs = sDao.deleteSlot(s_ids);
			if (rs != 0) {
				return true;// 删除成功
			} else {
				return false;// 删除失败
			}
	}

}
