package com.aaa.dao.tb;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.Poster;

/**
 * 广告表的接口
 * 
 * @author Administrator
 * 
 */
public interface PosterDao {
	/**
	 * 查询广告信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> query(Poster poster, Integer page,
			Integer limit);

	/**
	 * 修改广告信息
	 * 
	 * @param poster
	 *            广告
	 * @return
	 */
	public Integer Up(@Param("post") Poster poster);
}
