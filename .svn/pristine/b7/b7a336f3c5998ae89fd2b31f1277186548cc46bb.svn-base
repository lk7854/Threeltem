package com.aaa.service.tb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.InstitutionDao;
import com.aaa.dao.tb.WebUserDao;
import com.aaa.entity.Data;
import com.aaa.entity.Institution;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Users;
import com.aaa.util.tb.help.Tools;

/**
 * 网站主信息业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class WebUserService {

	@Autowired
	WebUserDao wudao;
	@Autowired
	InstitutionDao idao;

	public LayuiQuery query(Users u, Integer page, Integer rows) {
		Integer offset = 0;
		if (null != page && rows != null) {
			offset = (page - 1) * rows;
		} else {
			rows = 10;
		}
		List<Map<String, Object>> rs = wudao.query(u, offset, rows);
		Integer count = wudao.query(u, null, null).size();
		return new LayuiQuery(0, null, count, rs);
	}

	/**
	 * 网站主，盈利情况查询
	 * 
	 * @param u_id
	 *            用户ID
	 * @return
	 */
	public Map<String, Object> getTableData(Integer[] u_id) {
		// 最终的结果
		Map<String, Object> rsmap = new HashMap<String, Object>();
		List<Data> datalist = new ArrayList<Data>();
		for (int i = 0; i < u_id.length; i++) {
			List<Map<String, Object>> list = wudao.getTableDate(u_id[i]);
			if (list.size() == 0) {
				List<Object> lo = new ArrayList<Object>();
				Data data1 = new Data();
				for (int j = 0; j < 12; j++) {
					lo.add(0);
				}
				Institution inst = new Institution();
				inst.setU_id(u_id[i]);
				List<Map<String, Object>> rs = idao.query(inst, null, null);
				data1.setName(Tools.toStr(rs.get(0).get("in_name")));
				data1.setData(lo);
				datalist.add(data1);
				continue;
			}
			Data data = pck1(list);
			datalist.add(data);
		}
		rsmap.put("data", datalist);
		return rsmap;
	}

	private Data pck1(List<Map<String, Object>> list) {
		List<Object> lo = new ArrayList<Object>();
		Data data1 = new Data();
		// 第一个数据
		Map<String, Object> map1 = list.get(0);
		Integer month1 = Tools.toInteger(map1.get("month"));
		String name = Tools.toStr(map1.get("inname"));
		// 判断这个数据是否哪一个月开始的、
		for (int i = 1; i <= 12; i++) {
			if (i == month1) {
				if (i != 1) {
					// 前面差了几个数据就往里面添加及格0
					for (int j = 0; j < month1 - 1; j++) {
						lo.add(0);
					}
					data1.setName(name);
					data1.setData(lo);
				}
			}
		}
		// data1
		// Data [name=某某网站, data=[0, 0, 0]]
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object o = map.get("count");
			lo.add(o);
		}
		return data1;
	}
}
