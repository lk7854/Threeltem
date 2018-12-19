package com.aaa.service.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.IndentCheckDao;
import com.aaa.entity.IndentCheck;

/**
 * 审核记录表的业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class IndentCheckService {

	@Autowired
	IndentCheckDao idao;

	/**
	 * 添加审核记录
	 * 
	 * @param is
	 * @return
	 */
	public Boolean addRecord(IndentCheck is) {
		Integer i = idao.addRecord(is);
		if (i == 1) {
			return true;
		}
		return false;
	}
}
