package com.aaa.service.tb;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.ClickTableDao;
import com.aaa.dao.tb.IndentDao;
import com.aaa.entity.ClickTable;
import com.aaa.entity.IpAddress;
import com.aaa.util.tb.help.Tools;

@Service
@Transactional
public class ClickTableService {

	@Autowired
	ClickTableDao ctdao;

	@Autowired
	IndentDao idao;
	@Autowired
	IndentService is;
	@Autowired
	IpAddressService ips;

	public String getTableData(String i_id) throws ParseException {
		List<Map<String, Object>> list = ctdao.getTableData(i_id);
		if (list.size() == 0) {
			return null;
		}
		String data = "Day,访问量（PV）";
		for (Map<String, Object> map : list) {
			Integer count = Tools.toInteger(map.get("count"));
			String date = Tools.getDate(Tools.toStr(map.get("date")),
					"yyyy-MM-dd", "MM/dd/yyyy");
			data = data + "\n" + date + "," + count;
		}
		data = data + "\n";
		return data;
	}

	/**
	 * 统计订单点击表
	 * 
	 * @param i_id
	 * @return
	 */
	public String count(Integer s_id, HttpServletRequest req) {
		String url = "http://localhost:8080/ThreeItem";
		// 先查询订单信息
		Map<String, Object> indentInfo = idao.queryIndentBys_id(s_id).get(0);
		Integer p_id = Tools.toInteger(indentInfo.get("p_id"));// 广告ID
		String i_id = Tools.toStr(indentInfo.get("i_id"));// 订单编号
		Map<String, Object> map = this.query(i_id).get(0);// 获取当前i_id订单的点击量信息
		Integer clicksum = Tools.toInteger(map.get("ct_nums"));// i_id订单点击总次数---点击表中的
		Integer JG = Tools.toInteger(map.get("ct_num"));// 间隔性点击次数
		// 计算订单，总的可以点击的次数
		Integer count = 0;// 可以点击的总次数
		Double i_money = Tools.toDouble(indentInfo.get("i_money"));// 订单金额
		Double s_charge = Tools.toDouble(indentInfo.get("s_singleclick"));// 单价
		count = i_money.intValue() / s_charge.intValue();
		if (clicksum + JG < count) {// 点击次数未达总次数
			// 判断请求ip，请求的ip如果在半个小时内点击过那么旧不计入点击次数
			String IP = Tools.getRemoteHost(req);// 获取IP
			IpAddress ipAddress = new IpAddress(null, IP, null, p_id, i_id);
			ips.addIp(ipAddress);// 添加IP信息
			// 间歇点击次数继续加1
			JG = JG + 1;
			ClickTable ct = new ClickTable();
			ct.setI_id(i_id);
			ct.setCt_num(JG);
			Integer rs = this.update(ct);// 修改间隔点击次数1
			if (rs == 1) {
				// 跳转到广告的连接
				url = Tools.toStr(indentInfo.get("p_formPage"));// 订单中广告的跳转链接
			}
			return "redirect:" + url;
		} else {
			// 跳转到系统的招商页面
			return "redirect:" + url;
		}
	}

	/**
	 * 根据订单ID查询执行中的点击次数
	 * 
	 * @param i_id
	 * @return
	 */
	public List<Map<String, Object>> query(String i_id) {
		return ctdao.query(i_id);
	}

	/**
	 * 修改订单点击表的信息
	 * 
	 * @param ct
	 * @return
	 */
	public Integer update(ClickTable ct) {
		return ctdao.update(ct);
	}

	/**
	 * 添加点击记录
	 * 
	 * @param ct
	 * @return
	 */
	public Boolean addct(ClickTable ct) {
		Integer rs = ctdao.addct(ct);
		if (1 == rs) {
			return true;
		}
		return false;
	}

}
