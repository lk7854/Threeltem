package com.aaa.service.tb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.InformationDao;
import com.aaa.entity.Information;
import com.aaa.entity.LayuiQuery;

/**
 * 消息通知的业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class InformationService {
	@Autowired
	InformationDao id;

	/**
	 * 添加消息通知
	 * 
	 * @param info
	 * @return
	 */
	public Integer addInfo(Information info) {
		return id.addInfo(info);
	}

	/**
	 * 查询通知消息
	 * 
	 * @param info
	 * @return
	 */
	public LayuiQuery query(Information info, Integer page, Integer rows) {
		Integer offset = 0;
		if (null != page && rows != null) {
			offset = (page - 1) * rows;
		} else {
			rows = 10;
		}
		List<Map<String, Object>> data = id.query(info, offset, rows);
		Integer count = id.query(info, null, null).size();
		return new LayuiQuery(0, null, count, data);
	}

	/**
	 * 修改消息
	 * 
	 * @param info
	 * @return
	 */
	public Boolean update(Information info) {
		Integer i = id.update(info);
		if (i == 1) {
			return true;
		}
		return false;
	}

}
