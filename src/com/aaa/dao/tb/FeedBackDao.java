package com.aaa.dao.tb;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Feedback;

/**
 * 反馈处理表
 * 
 * @author Administrator
 * 
 */
public interface FeedBackDao {

	/**
	 * 查询反馈信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> query(Feedback fb, Integer offset,
			Integer limit);

	/**
	 * 修改反馈信息的状态
	 * 
	 * @param fb
	 * @return
	 */
	public Integer upFb(Feedback fb);

}
