package com.aaa.service.tb;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.tb.AccBDao;
import com.aaa.dao.tb.ClickTableDao;
import com.aaa.dao.tb.FrozenAssetsDao;
import com.aaa.dao.tb.IndentCheckDao;
import com.aaa.dao.tb.IndentDao;
import com.aaa.dao.tb.MoneyChangeDaoTB;
import com.aaa.entity.AccountBalance;
import com.aaa.entity.ClickTable;
import com.aaa.entity.FrozenAssets;
import com.aaa.entity.Indent;
import com.aaa.entity.IndentCheck;
import com.aaa.entity.Information;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.MoneyChange;
import com.aaa.util.tb.help.Tools;
import com.aaa.util.tb.msg.SendCode;

@Service
@Transactional
public class IndentService {

	@Autowired
	IndentDao idao;
	@Autowired
	IndentCheckDao isdao;
	@Autowired
	InformationService is;
	@Autowired
	AccBDao abdao;
	@Autowired
	MoneyChangeDaoTB mcdao;
	@Autowired
	ClickTableDao ctdao;
	@Autowired
	FrozenAssetsDao fadao;

	/**
	 * 获取广告信息的接口方法
	 * 
	 * @param s_id
	 * @return
	 */
	public Map<String, Object> getOders(Integer s_id) {
		// 查询订单
		Map<String, Object> map = idao.queryIndentBys_id(s_id).get(0);

		// 每获取一次广告信息就是曝光一次
		String i_id = Tools.toStr(map.get("i_id"));
		// 获取当前i_id订单对应的点击量信息
		Map<String, Object> ctmap = ctdao.query(i_id).get(0);
		Integer bg = Tools.toInteger(ctmap.get("ct_views"));// 曝光次数
		bg = bg + 1;// 曝光次数+1
		ClickTable ct = new ClickTable(null, i_id, null, null, bg, null);
		ctdao.update(ct);// 修改曝光次数
		Map<String, Object> rsmap = new HashMap<String, Object>();
		rsmap.put("href", "http://127.0.0.1:8080/ThreeItem/click/go.do?id="
				+ s_id);
		rsmap.put("content-url", map.get("p_url"));
		rsmap.put("poster-Name", map.get("p_name"));
		rsmap.put("slot-Name", map.get("s_name"));
		return rsmap;
	}

	/**
	 * 撤销订单
	 * 
	 * @param indent
	 * @param bt_name
	 * @param cp_money
	 * @return
	 */
	public Boolean rollback(Indent indent, HttpSession session) {
		// 获取完整的订单信息
		Indent in = new Indent();
		in.setI_id(indent.getI_id());
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) this
				.select(in, null, null, null).getData().get(0);// 订单信息
		String i_id = Tools.toStr(map.get("i_id"));
		Map<String, Object> map2 = ctdao.query(i_id).get(0);// 获取当前i_id订单的点击量信息
		Integer clicksum = Tools.toInteger(map2.get("ct_nums"));// 这个订单的单次点击总量
		// i_id订单点击总次数---点击表中的
		Integer JG = Tools.toInteger(map2.get("ct_num"));// 间隔性点击次数
		Integer bg = Tools.toInteger(map2.get("ct_views"));// 间隔曝光次数
		Integer bgsum = Tools.toInteger(map2.get("ct_exposureCount"));// 曝光总次数
		if (0 != JG + bg) {
			Double s_singleclick = Tools.toDouble(map.get("s_singleclick"));// CPC收费标准
			Double s_thousandsShow = Tools.toDouble(map.get("s_thousandsShow"));// CPM收费标准
			Double jgmoney = JG * s_singleclick;// 点击费
			// 曝光费
			Double bgmoney = Tools.toDouble(bg) / Tools.toDouble(1000)
					* s_thousandsShow;
			// 该扣的钱
			Double money = jgmoney + bgmoney;
			// 扣钱的操作
			// 先获取这个订单，对应的冻结金额
			Double fmoney = Tools.toDouble(map.get("frozenMoney"));// 订单的冻结金额
			Double newmoney = fmoney - money;// 计算剩余的钱
			System.out.println(newmoney);
			System.out.println(money);
			Integer u_id = Tools.toInteger(map.get("iuid"));// 下单人
			// 将剩余的钱退回到原账户余额，并且修改 订单的冻结金额为0,同时修改这个人的总得冻结金额
			if (newmoney > 0) {
				// 下单人的账户余额加钱
				Map<String, Object> mapm = abdao.queryAcbyUid(u_id);// 下单人账户信息
				Double uidMoney = Tools.toDouble(mapm.get("ab_money"));// 下单人账户余额
				// 下单人总的冻结金额
				Double fuidMoney = Tools.toDouble(mapm.get("ab_freezeMoney"));
				uidMoney = uidMoney + newmoney;// 退款+原余额-->新余额
				fuidMoney = fuidMoney - fmoney;// 总冻结金额-此次撤单的冻结金额-->新的总的冻结金额
				AccountBalance ab = new AccountBalance();
				ab.setU_id(u_id);// 账户人
				ab.setAb_money(uidMoney);// 新余额
				ab.setAb_freezeMoney(fuidMoney);// 总冻结金额
				abdao.accbUp(ab);// 修改总冻结金额，和账户余额
				Double m1 = money * 0.005;// 平台收的钱
				Double m2 = money - m1;// 网站主盈利的钱
				// 更新平台余额
				// 从冻结金额中扣款-->平台余额，添加变动记录
				MoneyChange adminmc = new MoneyChange(null, 5, money, null,
						u_id, 5, "订单：" + i_id + "，撤销时，计算点击数和曝光数，从订单冻结金额中扣款的盈利！");
				mcdao.addMc(adminmc);
				Map<String, Object> adminmap = abdao.queryAcbyUid(5);// 平台账户信息
				Double m0 = Tools.toDouble(adminmap.get("ab_money"));// 平台账户余额
				m0 = m0 + m1;// 平台余额+此次扣钱的盈利->新的平台余额
				AccountBalance adminab = new AccountBalance(null, 5, m0, null,
						null);
				abdao.accbUp(adminab);// 更新平台金额

				// 更新网站主余额
				Integer suid = Tools.toInteger(map.get("suid"));// 订单中广告位的所属用户
				Map<String, Object> wz = abdao.queryAcbyUid(suid);// 这个网站主的账户信息
				Double m3 = Tools.toDouble(wz.get("ab_money"));
				m3 = m3 + m2;
				AccountBalance m3ab = new AccountBalance(null, suid, m3, null,
						null);
				abdao.accbUp(m3ab);// 修改这个网站主的账户余额
				// 添加网站主的变动记录,平台的变动记录
				MoneyChange mc2 = new MoneyChange(null, 7, m2, null, 5, suid,
						"订单：" + i_id + "，撤销结算时，网站主盈利，广告位：" + map.get("s_id")
								+ "的盈利");
				mcdao.addMc(mc2);
				// 修改订单对应的冻结金额 为0
				FrozenAssets fa = new FrozenAssets();
				fa.setI_id(i_id);
				fa.setFrozenMoney(0.0);
				fadao.update(fa);// 更新订单冻结金额
			}
			// 间隔点击次数，千次曝光，清零
			clicksum = JG + clicksum;// 计算总得单机次数
			bgsum = bg + bgsum;// 计算总得曝光次数
			ClickTable ctclicksum = new ClickTable(null, i_id, clicksum, 0, 0,
					bgsum);
			ctdao.update(ctclicksum);// 更新订单的点击信息
		}
		// 修改订单状态为撤单
		in.setI_state(1);
		in.setI_endTime2(new Date());
		// 实际结束时间
		@SuppressWarnings("unchecked")
		Integer loginuid = Tools.toInteger(((Map<String, Object>) session
				.getAttribute("login")).get("u_id"));
		in.setUpu_id(loginuid);// 修改人
		idao.checkIndent(in);
		return true;
	}

	/**
	 * 分页条件查询订单
	 * 
	 * @param ident
	 * @param page
	 * @param limit
	 * @return
	 */
	public LayuiQuery select(Indent ident, Integer page, Integer limit,
			Integer inst_uid) {
		Integer offset = 0;
		if (null == page && null == limit) {
			limit = 10;
		} else {
			offset = (page - 1) * limit;
		}
		// 判断，条件为空时查询全部
		if ("" == ident.getI_id())
			ident.setI_id(null);
		// 判断状态码-1时查询所有订单
		if (null != ident.getI_state() && -1 == ident.getI_state())
			ident.setI_state(null);
		List<Map<String, Object>> list = idao.select(ident, offset, limit,
				inst_uid);
		Integer count = idao.select(ident, null, null, inst_uid).size();
		LayuiQuery lq = new LayuiQuery();
		lq.setCode(0);
		lq.setCount(count);
		lq.setData(list);
		return lq;
	}

	/**
	 * 修改订单信息
	 * 
	 * @param indent
	 * @param session
	 * @return
	 */
	public Boolean update(Indent indent, HttpSession session) {
		if (null != session) {
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) session
					.getAttribute("login");
			indent.setU_id(Tools.toInteger(map.get("u_id")));// 审核人
		}
		Integer rs = idao.checkIndent(indent);
		if (1 == rs) {
			return true;
		}
		return false;
	}

	/**
	 * 审核
	 * 
	 * @param indent
	 * @return
	 */
	public Boolean check(Indent indent, IndentCheck is, HttpSession session) {
		@SuppressWarnings("unchecked")
		// 获取登录人的信息
		Map<String, Object> map = (Map<String, Object>) session
				.getAttribute("login");
		// 设置其他信息
		is.setIc_result(indent.getI_state());// 审核结果
		is.setU_id(Tools.toInteger(map.get("u_id")));// 审核人
		// 冻结金额
		AccountBalance ab = new AccountBalance();
		// 冻结人
		ab.setU_id(indent.getU_id());
		// 计算冻结后的金额
		Map<String, Object> users = abdao.queryAcbyUid(indent.getU_id());
		Double newmoney = Tools.toDouble(users.get("ab_money"));// 当前金额
		Double dingdanjine = indent.getI_money();
		Double money = newmoney - dingdanjine;// 当前金额减去订单金额
		Double dongjie = Tools.toDouble(users.get("ab_freezeMoney"));// 之前的冻结金额
		// 冻结后的金额,当前订单应冻结的金额+之前账户冻结的金额
		ab.setAb_freezeMoney(dongjie + dingdanjine);// 当前订单要冻结的金额+之前账户的冻结金额
		ab.setAb_money(money);// 剩下的金额
		// 修改金额表信息
		Integer abrs = abdao.accbUp(ab);
		// 添加订单冻结金额表
		FrozenAssets fa = new FrozenAssets(indent.getI_id(), dongjie, null,
				null);
		Integer fasaddrs = fadao.update(fa);
		// 添加金额变动记录
		MoneyChange mc = new MoneyChange();
		// 变动人
		mc.setU_id(indent.getU_id());
		// 变动金额
		mc.setMc_money(dingdanjine);
		// 变动类型，订单扣款
		mc.setMc_type(4);
		// 变动备注
		mc.setMc_remark("下订单扣款！");
		// 添加变动记录
		Integer mcrs = mcdao.addMc(mc);
		// 添加审核记录
		Integer isrs = isdao.addRecord(is);

		// 先清空备注，防止备注被改
		indent.setI_remark(null);
		// 添加点击表的，该订单广告的点击记录
		ClickTable ct = new ClickTable(null, indent.getI_id(), null, null, null);
		Integer addctRs = ctdao.addct(ct);
		// 发送消息通知
		Information info = new Information();
		info.setMt_id(3);// 消息类型-订单审核
		// 判断审核结果根据结果，设定消息内容
		if (indent.getI_state() == 2) {
			// 未通过
			info.setInf_content("订单编号为：" + indent.getI_id()
					+ "的审核结果：未通过；<br>原因：" + indent.getI_remark());
		} else if (indent.getI_state() == 5) {
			// 通过
			info.setInf_content("订单编号为：" + indent.getI_id()
					+ "的审核结果：通过,正在等待投放；<br>审核员备注：" + indent.getI_remark());
			indent.setI_startTime2(new Date());
		}
		// 修改订单信息
		Integer rs = idao.checkIndent(indent);
		if (abrs == 1 && fasaddrs == 1 && isrs > 0 && rs > 0 && addctRs == 1
				&& mcrs == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 用于定时器扣除订单费用
	 */
	@SuppressWarnings("deprecation")
	public void koufei() {
		// 按照点击次数扣钱，扣完钱将次数加到
		Indent indent = new Indent();
		indent.setI_state(5);
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = (List<Map<String, Object>>) this
				.select(indent, null, null, null).getData();// 查询所有的执行中的订单
		// 遍历所有的订单
		for (Map<String, Object> map : list) {
			System.out.println(map);
			// 扣去每个订单的间隔点击次数，计算的金额
			// 查询每个订单的点击信息
			String i_id = Tools.toStr(map.get("i_id"));
			Map<String, Object> map2 = ctdao.query(i_id).get(0);// 获取当前i_id订单的点击量信息
			Integer clicksum = Tools.toInteger(map2.get("ct_nums"));// 这个订单的单次点击总量
			// i_id订单点击总次数---点击表中的
			Integer JG = Tools.toInteger(map2.get("ct_num"));// 间隔性点击次数
			Integer bg = Tools.toInteger(map2.get("ct_views"));// 间隔曝光次数
			Integer bgsum = Tools.toInteger(map2.get("ct_exposureCount"));// 曝光总次数
			// 如果单次点击次数 和 曝光次数都是0那么这次不用计算
			if (0 != JG + bg) {
				Double s_singleclick = Tools.toDouble(map.get("s_singleclick"));// CPC收费标准
				Double s_thousandsShow = Tools.toDouble(map
						.get("s_thousandsShow"));// CPM收费标准
				Double jgmoney = JG * s_singleclick;// 点击费
				// 曝光费
				Double bgmoney = Tools.toDouble(bg) / Tools.toDouble(1000)
						* s_thousandsShow;
				// 该扣的钱
				Double money = jgmoney + bgmoney;
				// 扣钱的操作
				// 先获取这个订单，对应的冻结金额
				Double fmoney = Tools.toDouble(map.get("frozenMoney"));// 订单的冻结金额
				Double newmoney = fmoney - money;// 计算剩余的钱
				System.out.println(newmoney);
				System.out.println(money);
				Integer u_id = Tools.toInteger(map.get("iuid"));// 下单人
				if (newmoney <= money * 5) {
					// 估算，剩下的钱，小于当前扣的前的5倍，即：剩下的钱不够扣5次，如果不够 发送短信通知
					String content = SendCode
							.getXufeiIndent(i_id, newmoney, 15);// 发送短信通知
					SendCode.singleSendByPhone("17335593539", content);
					// System.out.println("发送短信通知");
				}
				jisuan(map, i_id, clicksum, JG, bg, bgsum, money, newmoney,
						u_id);
			}
		}
	}

	/**
	 * 
	 * @param map
	 *            订单信息
	 * @param i_id
	 *            订单编号
	 * @param clicksum
	 *            订单的单次点击总次数
	 * @param JG
	 *            间隔单次点击次数
	 * @param bg
	 *            间隔曝光次数
	 * @param bgsum
	 *            曝光总次数
	 * @param money
	 *            此次该扣的钱
	 * @param newmoney
	 *            冻结金额扣完此次该扣的钱后剩余的钱
	 * @param u_id
	 *            下单人
	 */
	private void jisuan(Map<String, Object> map, String i_id, Integer clicksum,
			Integer JG, Integer bg, Integer bgsum, Double money,
			Double newmoney, Integer u_id) {

		// 保存新的订单的冻结金额信息
		fadao.update(new FrozenAssets(i_id, newmoney, null, null));
		// 并从钱中抽取金额加到平台和对应网站主的账户
		Double m1 = money * 0.005;// 平台抽取的钱
		Double m2 = money - m1;// 网站主盈利的钱

		// 修改平台余额
		// 添加金额变动明细，此次扣的钱-->到平台账户
		MoneyChange mc = new MoneyChange(null, 5, money, null, u_id, 5, "订单："
				+ i_id + ",从冻结金额中扣款--->平台账户");
		mcdao.addMc(mc);// 添加金额变动记录
		Map<String, Object> mapm = abdao.queryAcbyUid(5);// 平台账户信息
		Double m0 = Tools.toDouble(mapm.get("ab_money"));// 平台账户余额
		System.out.println("平台原余额：" + m0);
		m0 = m0 + m1;// 此次扣的钱中平台抽取的钱+平台余额->新的平台余额
		MoneyChange mc0 = new MoneyChange(null, 6, m1, null, u_id, 5, "订单："
				+ i_id + ",从冻结金额中扣款,然后从中抽取的钱--->平台账户");
		mcdao.addMc(mc0);// 添加金额变动记录
		System.out.println("平台新余额：" + m0);
		AccountBalance ab = new AccountBalance(null, 5, m0, null, null);
		abdao.accbUp(ab);// 更新平台金额

		Integer suid = Tools.toInteger(map.get("suid"));// 订单中广告位的所属用户
		Map<String, Object> wz = abdao.queryAcbyUid(suid);// 这个网站主的账户信息
		Double m3 = Tools.toDouble(wz.get("ab_money"));
		System.out.println("网站主原来的余额：" + m3);
		m3 = m3 + m2;// 网站主原余额+此次盈利的钱-->新的余额
		AccountBalance m3ab = new AccountBalance(null, suid, m3, null, null);
		abdao.accbUp(m3ab);// 修改这个网站主的账户余额
		System.out.println("网站主的新余额：" + m3);
		// 添加网站主的变动记录
		MoneyChange mc2 = new MoneyChange(null, 7, m2, null, 5, suid,
				"网站主盈利，广告位：" + map.get("s_id") + "的盈利");
		mcdao.addMc(mc2);
		// 间隔点击次数，千次曝光，清零
		clicksum = JG + clicksum;// 计算总得单机次数
		bgsum = bg + bgsum;// 计算总得曝光次数
		ClickTable ctclicksum = new ClickTable(null, i_id, clicksum, 0, 0,
				bgsum);
		ctdao.update(ctclicksum);// 更新订单的点击信息
		if (newmoney <= 0) {
			// 订单结束执行
			// 更新订单状态，和实际结束时间
			Indent indent = new Indent();
			indent.setI_id(i_id);
			indent.setI_state(3);// 更新为完成状态
			indent.setI_endTime2(new Date());// 添加实际的结束时间
			this.update(indent, null);// 更新\
		}
	}

}
