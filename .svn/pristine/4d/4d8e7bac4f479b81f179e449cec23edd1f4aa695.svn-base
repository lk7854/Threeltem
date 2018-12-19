package com.aaa.service.tb;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckInstitutionDao;
import com.aaa.dao.tb.InstitutionCheckDao;
import com.aaa.entity.Information;
import com.aaa.entity.Institution;
import com.aaa.entity.InstitutionCheck;
import com.aaa.util.tb.help.Tools;
import com.aaa.util.tb.msg.SendCode;

/**
 * 机构审核业务层
 * 
 * @author Administrator
 * 
 */
@Service
@Transactional
public class InstCheckService {

	@Autowired
	InstitutionCheckDao icdao;
	@Autowired
	JckInstitutionDao jidao;

	@Autowired
	InformationService is;

	/**
	 * 机构审核业务方法
	 * 
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public Boolean check(Institution inst, HttpSession session,
			HttpServletRequest req) {
		@SuppressWarnings("rawtypes")
		Map map = (Map) session.getAttribute("login");
		Integer uid = Tools.toInteger(map.get("u_id"));// 获取审核人的ID
		// 添加机构审核记录
		InstitutionCheck instcheck = new InstitutionCheck();
		// 设置审核记录信息，机构编号，审核备注，审核人ID
		instcheck.setIn_id(inst.getIn_id());
		instcheck.setInc_remark(inst.getIn_remark());
		instcheck.setU_id(uid);// 审核人
		instcheck.setInc_result(inst.getIn_state());
		Integer addrs = icdao.addInstCheck(instcheck);// 执行添加
		// 修改状态
		Institution insti = new Institution();
		insti.setIn_id(inst.getIn_id());
		insti.setIn_state(inst.getIn_state());
		int uprs = jidao.updateInstitution(inst);// 执行修改
		// 添加消息通知
		Information info = new Information();
		// 设置消息通知的内容
		info.setU_id(inst.getU_id());// 通知人
		info.setMt_id(5);// 消息类型:机构审核通知
		String infotype = "";
		String info2 = "";
		if (inst.getIn_state() == 1) {
			infotype = "未通过";
			info2 = "原因";
			SendCode.singleSendByPhone(inst.getIn_phone(),
					SendCode.getRegContent(req.getParameter("uname")));
		} else if (inst.getIn_state() == 2) {
			infotype = "已通过";
			info2 = "审核员备注";
		}
		info.setInf_content(inst.getIn_name() + "的审核结果：" + infotype + "；"
				+ info2 + "：" + inst.getIn_remark() + "。");
		Integer infors = is.addInfo(info);// 添加消息通知
		if (addrs == 1 && uprs == 1 && infors == 1) {
			return true;
		}
		return false;
	}
}
