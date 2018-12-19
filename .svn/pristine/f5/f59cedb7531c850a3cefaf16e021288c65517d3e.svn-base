package com.aaa.service.tb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.FeedBackDao;
import com.aaa.entity.Feedback;
import com.aaa.entity.Information;
import com.aaa.entity.LayuiQuery;

@Service
@Transactional
public class FeedBackService {

	@Autowired
	FeedBackDao fbdao;

	@Autowired
	InformationService is;

	/**
	 * 处理反馈信息
	 * 
	 * @param info
	 * @param f_id
	 * @return
	 */
	public Boolean handler(Information info, Integer f_id) {
		info.setMt_id(7);// 设置类型
		Integer rs = is.addInfo(info);
		Integer uprs = fbdao
				.upFb(new Feedback(f_id, null, null, null, 1, null));
		if (rs == 1 && uprs == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 分页查询反馈信息
	 * 
	 * @param fb
	 * @param offset
	 * @param limit
	 * @return
	 */
	public LayuiQuery query(Feedback fb, Integer page, Integer limit) {
		Integer offset = 0;
		offset = (page - 1) * limit;
		if (null != fb) {
			if (null != fb.getF_state()) {
				if (-1 == fb.getF_state()) {
					fb.setF_state(null);
				}
			}
		}
		List<Map<String, Object>> data = fbdao.query(fb, offset, limit);
		Integer count = fbdao.query(fb, null, null).size();
		return new LayuiQuery(0, null, count, data);
	}
}
