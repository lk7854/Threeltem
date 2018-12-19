package com.aaa.service.tb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.PosterDao;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Poster;

/**
 * 广告的业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class PosterService {

	@Autowired
	PosterDao pdao;

	/**
	 * 修改广告信息
	 * 
	 * @param poster
	 * @return
	 */
	public Boolean Up(Poster poster) {
		Integer rs = pdao.Up(poster);
		if (rs == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 查询广告信息
	 * 
	 * @param poster
	 * @param page
	 * @param limit
	 * @return
	 */
	public LayuiQuery query(Poster poster, Integer page, Integer limit) {
		List<Map<String, Object>> list = null;
		Integer count = 0;
		if (page != -1 && limit != -1) {
			list = pdao.query(poster, limit * (page - 1), limit);
			count = pdao.query(poster, null, null).size();
		}
		// 判断当查询的广告状态为-1时，查询所有的信息，用于页面搜索
		if (null != poster.getP_state()) {
			if (-1 == poster.getP_state()) {
				poster.setP_state(null);
			}
		}
		list = pdao.query(poster, null, null);
		return new LayuiQuery(0, "", count, list);
	}
}
