package com.aaa.controller.tb;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.dao.tb.AccBDao;
import com.aaa.entity.AccountBalance;
import com.aaa.util.tb.help.Tools;
import com.aaa.util.tb.help.getNum;
import com.aaa.util.tb.msg.SendCode;

/**
 * 发送验证码
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("send")
public class SendController {

	@Autowired
	AccBDao abdao;

	@RequestMapping("upmoney")
	@ResponseBody
	public Boolean upab(AccountBalance ab, HttpSession session) {
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session
				.getAttribute("login");
		Integer uid = Tools.toInteger(map.get("u_id"));
		ab.setU_id(uid);
		// 获取原有余额
		Map<String, Object> map2 = abdao.queryAcbyUid(uid);//
		Double abmoney = Tools.toDouble(map2.get("ab_freezeMoney"));
		// 计算新余额
		abmoney = abmoney + ab.getAb_freezeMoney();
		// 设置新余额
		Integer rs = abdao.accbUp(ab);
		if (rs == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 发送单条信息验证
	 * 
	 * @param phone
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("single")
	@ResponseBody
	public Integer send(String phone) {
		Integer code = getNum.getCode();
		SendCode.singleSendByPhone(phone, SendCode.getCode1(code));
		return code;
	}

}
