package com.aaa.service.jck;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.PosterTypesDao;
@Service
@Transactional
public class PosterTypesService {
		@Autowired
		PosterTypesDao pt;
		
		//广告的查询
		public List<Map<String, Object>> selList(){
			return pt.selList();
		}
}
