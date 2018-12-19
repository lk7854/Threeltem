package com.aaa.test.jck;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aaa.controller.jck.JckSlotController;
import com.aaa.dao.jck.JckSlotDao;
import com.aaa.dao.tb.AccBDao;
import com.aaa.entity.Indent;
import com.aaa.entity.Slot;
import com.aaa.service.jck.JckChannelService;
import com.aaa.service.jck.JckIndentService;
import com.aaa.service.jck.JckSlotService;
import com.aaa.service.jck.JckusersService;
import com.aaa.util.tb.help.Tools;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class T {
	/*@Autowired
	JckusersService jus;*/
	@Autowired
	JckSlotDao jsd;
	@Autowired
	JckSlotService jss;
	@Autowired
	JckChannelService jcs;
	@Autowired
	JckIndentService jis;
	@Autowired
	AccBDao ad;
	@Test
	public void m(){
		/*Map<String, Object> showMyselfInfo = jus.showMyselfInfo(2);
		System.out.println(showMyselfInfo);
		List<Map<String, Object>> selSlot = jsd.selSlot(null, 1, 10);
		for (Map<String, Object> map : selSlot) {
			System.out.println(map);
		}*/
		/*SimpleDateFormat sdt=new SimpleDateFormat("yyyyMMddhhmmss");
		System.out.println("Orader"+sdt.format(new Date()));
		String substring = "1.png".substring("1.png".lastIndexOf("."));
		System.out.println(substring);*/
		/*List<Map<String, Object>> selChannel = jcs.selChannel(null);
		System.out.println(selChannel.size());*/
		/*List<Map<String, Object>> selIndent = jis.selIndent(null, null);
		for (Map<String, Object> map : selIndent) {
			System.out.println(map);
		}*/
//		System.out.println(jis.selIndent(null, 0.1).size());
		Indent s=new Indent();
		/*s.setS_id(7);
		s.setI_state(5);
		Map<String, Object> selIndent = jis.selIndent(s, 0.1);
		System.out.println(selIndent);*/
		/*double floor = Math.round(2.1);
		System.out.println(floor);*/
		/*List<Map<String, Object>> selSlot = jss.selSlot(null, null, 1, 10);
		for (Map<String, Object> map : selSlot) {
			System.out.println(map);
		}*/
		/*Map<String, Object> selSlot = jsc.selSlot(null, null, 1, 10);
		System.out.println(selSlot);*/
		/*Map<String, Object> map2= ad.queryAcbyUid(6);
		double ab_money=Tools.toDouble(map2.get("ab_money"));
		System.out.println(ab_money);*/
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String format = sdf.format(new Date("2018-07-13 10:45:57"));*/
		/*System.out.println(format);*/
//		System.out.println(new Date());
		double indentMoney = jis.getIndentMoney(null);
		System.out.println(indentMoney);
		//System.out.println(jss.updateSlot(new Slot()));
	}
}
