package com.aaa.service.jck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckIndentDao;
import com.aaa.dao.jck.JckSlotTypeDao;
import com.aaa.entity.Indent;

@Service
@Transactional
public class JckSlotTypeService {

	@Autowired
	JckSlotTypeDao jctd;
	public List<Map<String, Object>> selSlotType(){
		return jctd.selSlotType();
	}
}
