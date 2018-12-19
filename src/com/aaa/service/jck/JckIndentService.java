package com.aaa.service.jck;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckIndentDao;
import com.aaa.dao.tb.AccBDao;
import com.aaa.dao.tb.FrozenAssetsDao;
import com.aaa.dao.tb.MoneyChangeDaoTB;
import com.aaa.entity.AccountBalance;
import com.aaa.entity.Feedback;
import com.aaa.entity.FrozenAssets;
import com.aaa.entity.Indent;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.MoneyChange;
import com.aaa.util.tb.help.Tools;

@Service
@Transactional
public class JckIndentService {

	@Autowired
	JckIndentDao jid;
	@Autowired
	AccBDao ad;
	@Autowired
	MoneyChangeDaoTB mcd;
	@Autowired
	FrozenAssetsDao fad;
	//添加订单
	public synchronized int AddIndent(Indent i,double day,HttpSession session){
		
		session.setAttribute("s_id", i.getS_id());
		
		SimpleDateFormat sdt=new SimpleDateFormat("yyyyMMddhhmmss");
		i.setI_id(sdt.format(new Date()));
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		i.setU_id(Integer.parseInt(map.get("u_id").toString()));
		//根据自己的用户id进行查询自己的账号金额信息
		Map<String, Object> map2= ad.queryAcbyUid(Tools.toInteger(i.getU_id()));
		Double ab_money= Tools.toDouble(map2.get("ab_money")) ;
		Double ab_freezeMoney=Tools.toDouble(map2.get("ab_freezeMoney"));
		//要修改账号余额表里的数据，要在金额变动表里加一条数据，要添加一条订单
		//Tools.toDouble((Tools.toInteger(ab_money.toString())-Tools.toInteger(i.getI_money()).toString())
		//Tools.toInteger(ab_money.toString())+Tools.toInteger(i.getI_money())
		AccountBalance accb=new AccountBalance(null, i.getU_id(), null, null, null);
		//账户余额表的冻结金额
		accb.setAb_freezeMoney(ab_freezeMoney+i.getI_money());
		//账户余额表的剩余金额
		accb.setAb_money(ab_money-i.getI_money());
		//更改账户余额表的金额
		//添加变动记录
		MoneyChange mc=new MoneyChange(null, 4, i.getI_money(), null, i.getU_id(),null, "订单:"+i.getI_id()+"冻结金额");
		//计算预计开始时间
		Integer count=(i.getI_startTime()+"").length();
		//添加订单
		if (jid.AddIndent(i, day,count)==1) {
			//更改账户余额表的金额--添加一条账号余额记录--添加一条冻结金额记录
			if (ad.accbUp(accb)==1&&mcd.addMc(mc)==1&&fad.addFrozenAssets(new FrozenAssets(i.getI_id(), 0.0, null, null))==0) {
				return 1;
			}
		}
		return 0;
	}
	//计算订单余额是否充足
	public int getMoney(double money,HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		Integer uid=Integer.parseInt(map.get("u_id").toString());
		Map<String, Object> map2 = ad.queryAcbyUid(uid);
		if (Tools.toDouble(map2.get("ab_money"))>money) {
			return 1;
		}
		return 0;
	}
	//判断订单冻结记录里面是否有订单扣费成负数的，如果有不让下订单，先进行充值再进行下订单
	public double getIndentMoney(HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		Integer uid=Integer.parseInt(map.get("u_id").toString());
		//根据用户id查询订单状态为3(完成)的订单，是否有扣成负数的
		Indent i=new Indent();
		i.setI_state(3);
		i.setU_id(uid);
		List<Map<String, Object>> selIndents = jid.selIndents(i, null, null, null);
		double money=0;
		for (Map<String, Object> map2 : selIndents) {
			FrozenAssets FrozenMoneys = fad.querFrozenMoneyByi_id(Tools.toStr(map2.get("i_id")));
			if (FrozenMoneys.getFrozenMoney()<0) {
				money-=FrozenMoneys.getFrozenMoney();
			}
		}
		return money;
	}
	//修改订单冻结记录表里面当前用户金额为负数的冻结金额，进行续费
	public int updateMoney(HttpSession session){
		@SuppressWarnings("unchecked")
		Map<String, Object> map=(Map<String, Object>) session.getAttribute("login");
		Integer uid=Integer.parseInt(map.get("u_id").toString());
		//根据用户id查询订单状态为3(完成)的订单，是否有扣成负数的
		Indent i=new Indent();
		i.setI_state(3);
		i.setU_id(uid);
		int ii=0;
		double money=0;
		//获取该用户的账户余额
		Map<String, Object> map1= ad.queryAcbyUid(Tools.toInteger(i.getU_id()));
		Double ab_money= Tools.toDouble(map1.get("ab_money")) ;
		if (ab_money<=0) {
			return -1;
		}
		List<Map<String, Object>> selIndents = jid.selIndents(i, null, null, null);
		for (Map<String, Object> map2 : selIndents) {
			FrozenAssets FrozenMoneys = fad.querFrozenMoneyByi_id(Tools.toStr(map2.get("i_id")));
			if (FrozenMoneys.getFrozenMoney()<0) {
				//计算该用户的订单中被扣负金额的总金额，将总金额直接添加到运营商的账户上同时扣除该广告主相对应的账户金额
				money-=FrozenMoneys.getFrozenMoney();
				FrozenMoneys.setFrozenMoney(0.0);
				ii=fad.update(FrozenMoneys);
			}
		}
		AccountBalance accb=new AccountBalance();
		//该广告主所剩金额扣除相对应的金额
		accb.setU_id(uid);
		accb.setAb_money(ab_money-money);
		ad.accbUp(accb);
		//为运营商直接加金额
		Map<String, Object> m= ad.queryAcbyUid(5);
		double abmoney= Tools.toDouble(m.get("ab_money")) ;
		accb.setU_id(5);
		accb.setAb_money(abmoney+money);
		ad.accbUp(accb);
		//添加一条金额变动记录
		if (0!=money) {
			MoneyChange mc=new MoneyChange();
			mc.setU_id(uid);
			mc.setU_id2(5);
			mc.setMc_money(money);
			mc.setMc_type(1);
			mc.setMc_remark("订单后续续费金额");
			mcd.addMc(mc);
		}
		return ii;
	}
	//查询订单
	public LayuiQuery selIndents(Indent i,Integer page,Integer limit,Feedback f){
		Integer offset = 0;
		if (null == page && null == limit) {
			limit = 10;
		} else {
			offset = (page - 1) * limit;
		}
		// 判断，条件为空时查询全部
		if ("" == i.getI_id())
			i.setI_id(null);
		// 判断状态码-1时查询所有订单
		if (null != i.getI_state() && -1 == i.getI_state())
			i.setI_state(null);
		List<Map<String, Object>> list = jid.selIndents(i, offset, limit,f);
		Integer count = jid.selIndents(i, null, null,null).size();
		LayuiQuery lq = new LayuiQuery();
		lq.setCode(0);
		lq.setCount(count);
		lq.setData(list);
		return lq;
	}
	//根据订单中的广告位id进行查询该广告位下面是否有订单，如果有返回值，没有返回空值
	public Map<String, Object> selIndent(Indent i,double d){
		List<Map<String, Object>> selIndent = jid.selIndent(i,d);
		for (Map<String, Object> map : selIndent) {
			System.out.println(map);
			if (Tools.toInteger(map.get("i_state"))==5||Tools.toInteger(map.get("i_state"))==0) {
				return map;
			}
		}
		return null;
	}
	//续费订单金额
	public Map<String, Object> xufei(Indent i,double money,double day, HttpSession session) {
		//根据订单编号查询相关的信息（没有修改之前）
		List<Map<String, Object>> selIndent = jid.selIndent(i, null);
		Date date = (Date) selIndent.get(0).get("i_endTime");
		i.setI_endTime(date);
		//获取该用户的账户余额
		Map<String, Object> map1= ad.queryAcbyUid(Tools.toInteger(i.getU_id()));
		Double ab_money= Tools.toDouble(map1.get("ab_money")) ;
		Map<String, Object> map=new HashMap<String, Object>();
		if (ab_money<=money) {
			map.put("m", "-1");
			return map;
		}
		//修改订单金额
		jid.updateIndent(i, day);
		//扣除该用户相关订单金额
		AccountBalance acc=new AccountBalance();
		acc.setAb_freezeMoney(ab_money+money);
		acc.setAb_money(ab_money-money);
		acc.setU_id(i.getU_id());
		ad.accbUp(acc);
		//冻结金额的修改
		/*FrozenAssets query = fad.querFrozenMoneyByi_id(i.getI_id());
		FrozenAssets frozenAssets=new FrozenAssets();
		frozenAssets.setI_id(i.getI_id());
		frozenAssets.setFrozenMoney(query.getFrozenMoney()+money);
		fad.update(frozenAssets);*/
		//变动记录表的添加
		MoneyChange mc=new MoneyChange();
		mc.setU_id(i.getU_id());
		mc.setMc_money(money);
		mc.setMc_type(1);
		mc.setMc_remark("编号："+i.getI_id()+"的续费金额");
		mcd.addMc(mc);
		
		selIndent = jid.selIndent(i, null);
		map=selIndent.get(0);
		map.put("m", "1");
		return map;
	}
	//广告主的消费情况
	public List<Map<String, Object>> selMoneyChange(MoneyChange mc){
		List<Map<String, Object>> queryMc = mcd.queryMc(mc, null, null, null, null);
		return null;
	}
}
