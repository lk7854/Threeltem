package com.aaa.dao.tb;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Information;

/**
 * 消息通知的借口方法
 * 
 * @author Administrator
 * 
 */
public interface InformationDao {

	/**
	 * 添加信息通知
	 * 
	 * @param info消息通知对象
	 * @return
	 */
	public Integer addInfo(Information info);

	/**
	 * 查询通知消息
	 * 
	 * @param info
	 * @return
	 */
	public List<Map<String, Object>> query(Information info, Integer offset,
			Integer rows);

	/**
	 * 修改消息表
	 * 
	 * @param info
	 * @return
	 */
	public Integer update(Information info);

}
