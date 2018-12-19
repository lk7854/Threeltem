package com.aaa.dao.jck;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Poster;

public interface PosterTypesDao {

	//查询所有的广告类型
	public List<Map<String, Object>> selList();
}
