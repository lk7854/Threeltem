package com.aaa.service.tb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.InstitutionDao;
import com.aaa.entity.Institution;
import com.aaa.entity.LayuiQuery;

/**
 * 机构信息的业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class InstitutionService {

	@Autowired
	InstitutionDao idao;

	/**
	 * 分页模糊查询机构信息
	 * 
	 * @param inst
	 * @param page
	 * @param limit
	 * @return
	 */
	public LayuiQuery query(Institution inst, Integer page, Integer limit) {
		List<Map<String, Object>> maps = null;
		if (null != inst.getIn_state()) {
			if (inst.getIn_state() == -1) {
				inst.setIn_state(null);
			}
		}
		if (page == -1 && limit == -1) {
			maps = idao.query(inst, null, null);
		} else {
			maps = idao.query(inst, (page - 1) * limit, limit);
		}
		int count = idao.query(inst, null, null).size();
		return new LayuiQuery(0, null, count, maps);
	}
}
