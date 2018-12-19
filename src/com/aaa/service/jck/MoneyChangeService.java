package com.aaa.service.jck;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.MoneyChangeDao;
import com.aaa.util.tb.help.Tools;

@Service
@Transactional
public class MoneyChangeService {

	@Autowired
	MoneyChangeDao mcd;
	public String selMoneyChange(String i_id) throws ParseException{
		List<Map<String, Object>> list=mcd.selMoneyChange(i_id);
		if (list.size() == 0) {
			return null;
		}
		String data = "Day,每天的消费金额量（PV）";
		for (Map<String, Object> map : list) {
			double count = Tools.toDouble(map.get("sum"));
			String date = Tools.getDate(Tools.toStr(map.get("time")),
					"yyyy-MM-dd", "MM/dd/yyyy");
			data = data + "\n" + date + "," + count;
		}
		data = data + "\n";
		return data;
	}
}
