package com.aaa.service.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.PosterCheckDao;
import com.aaa.dao.tb.PosterDao;
import com.aaa.entity.Information;
import com.aaa.entity.Poster;
import com.aaa.entity.PosterCheck;

/**
 * 广告审核表的业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class PosterCheckService {

	@Autowired
	PosterCheckDao pcdao;
	@Autowired
	PosterDao pdao;
	@Autowired
	InformationService is;

	/**
	 * 审核广告信息方法
	 * 
	 * @param poster
	 * @return
	 */
	public Boolean checkPoster(Poster poster) {

		// 添加审核记录
		PosterCheck pc = new PosterCheck();
		// 获取广告编号,审核备注,审核结果,审核人
		pc.setP_id(poster.getP_id());
		pc.setPc_remark(poster.getP_remark());
		pc.setPc_result(poster.getP_state());
		pc.setU_id(1);
		Integer rs = pcdao.addPc(pc);
		// 修改广告的状态为通过/未通过
		Integer rs2 = pdao.Up(poster);
		// 发送消息通知
		Information info = new Information();
		// 消息类型为广告审核通知
		info.setMt_id(1);
		// 消息接收人
		info.setU_id(poster.getU_id());
		// 成功通知或者是失败,都发送消息通知，设置消息内容
		if (pc.getPc_result() == 1) {
			info.setInf_content("广告：" + poster.getP_name()
					+ "的审核结果:未通过;<br>原因是：" + pc.getPc_remark());
		} else if (pc.getPc_result() == 2) {
			info.setInf_content("广告：" + poster.getP_name()
					+ "的审核结果:通过;<br>审核员备注是：" + pc.getPc_remark());
		}
		Integer infors = is.addInfo(info);
		if (rs == 1 && rs2 == 1 && infors == 1) {
			return true;
		}
		return false;
	}
}
