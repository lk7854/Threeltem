package com.aaa.dao.jck;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Poster;

public interface PosterDaos {

	//广告的添加
	public int addPoster(Poster p);
	//广告的修改
	public int updatePoster(Poster p);
	//广告的删除
	public int deletePosters(Integer pid);
	//广告的查询
	public List<Map<String, Object>> selPosters(Poster p,Integer page,Integer limit);
}
