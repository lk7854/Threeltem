package com.aaa.service.lk;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lk.PosterTypeDao;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.PosterType;

@Service
public class PosterTypeService {
	
	@Autowired
	PosterTypeDao ptDao;
	
	public LayuiQuery queryPosterType(PosterType pt,Integer page,Integer limit){
		Integer offset = 0;
		if (null == page && null == limit) {
			limit = 10;
		} else {
			offset = (page - 1) * limit;
		}
		LayuiQuery layuiQuery=new LayuiQuery(0, null, ptDao.queryPosterType(pt, null, null).size(), ptDao.queryPosterType(pt, offset, limit));
		System.out.println(layuiQuery);
		System.out.println(ptDao.queryPosterType(pt, page, offset).size());
		return layuiQuery;
	}
	
	public List<Map<String, Object>> listPoster(Integer[] pt_ids){
		return ptDao.listPoster(pt_ids);
	}
	
	public boolean addPosterType(PosterType pt){
		int i = ptDao.addPosterType(pt);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updatePosterType(PosterType pt){
		int i = ptDao.updatePosterType(pt);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deletePosterType(Integer[] pt_ids){
		// 是否被使用
		List<Map<String, Object>> listPoster = ptDao.listPoster(pt_ids);
		System.out.println("listPoster:"+listPoster);
		if (listPoster.size() > 0) {
			return false;// 不能删除
		} else {
			int rs = ptDao.deletePosterType(pt_ids);
			if (rs != 0) {
				return true;// 删除成功
			} else {
				return false;// 删除失败
			}
		}
	}

}
