package com.aaa.dao.tb;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aaa.entity.MoneyChange;

/**
 * 金额变动记录表接口
 * 
 * @author Administrator
 * 
 */
public interface MoneyChangeDaoTB {
	/**
	 * 添加记录
	 * 
	 * @param mc变动记录
	 * @return
	 */
	public Integer addMc(MoneyChange mc);

	/**
	 * 用于网站盈利计算，和广告主的消费记录
	 * 
	 * @param mc
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> queryMc(MoneyChange mc, Date startTime,
			Date endTime, Integer offset, Integer rows);

}
