package com.aaa.dao.lk;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Slot;

public interface SlotlDao {
	
	public List<Map<String, Object>> querySlot();
	
	public int addSlot(Slot s);

	public int updateSlot(Slot s);

	public int deleteSlot(Integer[] s_ids);

}
