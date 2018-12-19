package com.aaa.service.tb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckSlotDao;
import com.aaa.dao.tb.SlotDao;
import com.aaa.entity.Information;
import com.aaa.entity.Slot;
import com.aaa.entity.SlotCheck;
import com.aaa.service.jck.JckSlotService;

/**
 * 广告位审核的业务逻辑层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class SlotService {

	@Autowired
	JckSlotService js;

	@Autowired
	SlotDao sdao;

	@Autowired
	InformationService is;

	@Autowired
	JckSlotDao jsdao;

	/**
	 * 修改广告位的价格信息
	 * 
	 * @return
	 */
	public Boolean edit(Slot s) {
		int rs = jsdao.updateSlot(s);
		if (rs == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 审核广告位的方法
	 * 
	 * @param s
	 * @return
	 */
	public Boolean checkSlot(Slot s) {
		// 添加审核记录
		SlotCheck sc = new SlotCheck(null, s.getS_id(), s.getU_id(), null,
				s.getS_state(), s.getS_remark());
		Integer rs = sdao.addSlotCheck(sc);
		// 修改广告位状态
		// 清空备注，防止备注改变
		s.setS_remark(null);
		s.setS_name(null);
		int urs = js.updateSlot(s);
		Information info = new Information();
		info.setMt_id(2);// 消息类型：广告位审核
		info.setU_id(sc.getU_id());// 消息接收人
		// 发送消息通知
		if (sc.getSc_result() == 2) {
			// 通过
			info.setInf_content(s.getS_name() + "的审核结果：通过；审核员备注："
					+ sc.getSc_remark());
		} else if (sc.getSc_result() == 1) {
			// 未通过
			info.setInf_content(s.getS_name() + "的审核结果：未通过；原因："
					+ sc.getSc_remark());
		}
		Integer irs = is.addInfo(info);
		if (rs == 1 && urs == 1 && irs == 1) {
			return true;
		}
		return false;
	}
}
