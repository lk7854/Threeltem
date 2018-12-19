package com.aaa.service.jck;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.jck.JckIndentDao;
import com.aaa.dao.jck.PosterDaos;
import com.aaa.entity.Indent;
import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Poster;
@Service
@Transactional
public class PosterServices {
		@Autowired
		PosterDaos pd;
		@Autowired
		JckIndentDao jid;
		
		//广告的添加
		public int addPoster(Poster p,HttpSession session){
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) session.getAttribute("login");
			p.setU_id(Integer.parseInt(map.get("u_id").toString()));
			return pd.addPoster(p);
		}
		//广告的修改
		public int updatePoster(Poster p,HttpSession session){
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) session.getAttribute("login");
			p.setU_id(Integer.parseInt(map.get("u_id").toString()));
			p.setP_url(null);
			return pd.updatePoster(p);
		}
		//判断广告是否正在使用中
		public int selIdent(Poster p){
			Indent i=new Indent();
			i.setP_id(p.getP_id());
			List<Map<String, Object>> selIndents = jid.selIndents(i, null, null, null);
			for (Map<String, Object> map2 : selIndents) {
				if (Integer.parseInt(map2.get("i_state").toString())==5) {
					return -2;
				}
			}
			return 1;
		}
		//广告的删除
		public int deletePosters(Integer pid){
			Indent id=new Indent();
			id.setP_id(pid);
			List<Map<String, Object>> selIndents = jid.selIndents(id, null, null, null);
			for (Map<String, Object> map2 : selIndents) {
				if (Integer.parseInt(map2.get("i_state").toString())==5) {
					return -1;
				}
			}
			return pd.deletePosters(pid);
		}
		//广告的查询
		public LayuiQuery selPosters(Poster p,Integer page,Integer limit,HttpSession session){
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) session.getAttribute("login");
			Integer offset = 0;
			if (null == page && null == limit) {
				limit = 10;
			} else {
				offset = (page - 1) * limit;
			}
			p.setU_id(Integer.parseInt(map.get("u_id").toString()));
			LayuiQuery layuiQuery=new LayuiQuery(0, null, pd.selPosters(p, null, null).size(), pd.selPosters(p, offset, limit));
			
			return layuiQuery;
		}
		//广告的查询
		public List<Map<String, Object>> selPost(Poster p,HttpSession session){
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) session.getAttribute("login");
			p.setU_id(Integer.parseInt(map.get("u_id").toString()));
			p.setP_state(2);
			return pd.selPosters(p, null, null);
		}
}
