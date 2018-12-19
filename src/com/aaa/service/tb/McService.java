package com.aaa.service.tb;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.MoneyChangeDaoTB;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.MoneyChange;

/**
 * 金额变动表业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class McService {

	@Autowired
	MoneyChangeDaoTB mcdao;

	/**
	 * 查询金额变动记录
	 * 
	 * @param mc
	 * @param page
	 * @param rows
	 * @return
	 */
	public LayuiQuery queryMc(MoneyChange mc, Date startTime, Date endTime,
			Integer page, Integer rows) {
		Integer offset = 0;
		if (null != page && null != rows) {
			offset = (page - 1) * rows;
		} else {
			rows = 10;
		}
		List<Map<String, Object>> data = mcdao.queryMc(mc, startTime, endTime,
				offset, rows);
		Integer count = mcdao.queryMc(mc, startTime, endTime, null, null)
				.size();
		return new LayuiQuery(0, null, count, data);
	}
}
