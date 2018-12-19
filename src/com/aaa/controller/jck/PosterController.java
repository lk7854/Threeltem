package com.aaa.controller.jck;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.entity.LayuiQuery;
import com.aaa.entity.Poster;
import com.aaa.service.jck.PosterServices;
import com.aaa.util.jck.Upload;

@Controller
@RequestMapping("posterCon")
public class PosterController {

	@Autowired
	PosterServices ps;
	@RequestMapping("addPoster")
	//广告的添加
	public String addPoster(Poster p,MultipartFile file,HttpServletRequest request,HttpSession session){
		
			
			p.setP_url("http://192.168.43.137:8080/ThreeItem/upload/"+Upload.fileUpload(file, request));
			//进行添加
			ps.addPoster(p, session);
			return "posterManage";
	}
	
	@RequestMapping("updatePoster")
	//广告的修改
	public String updatePoster(Poster p,MultipartFile file,HttpSession session,HttpServletRequest request){
		if (!"".equals(file.getOriginalFilename())) {
			p.setP_url("http://192.168.43.137:8080/ThreeItem/upload/"+Upload.fileUpload(file, request));
		}
		p.setP_state(0);
		//进行修改
		ps.updatePoster(p, session);
		
		return "posterManage";
	};
	@RequestMapping("selectPost")
	@ResponseBody
	//判断广告是否正在使用
	public int selectPost(Poster p){
		return ps.selIdent(p);
	}
	@RequestMapping("deletePosters")
	@ResponseBody
	//广告的删除
	public int deletePosters(Integer pid){
		return ps.deletePosters(pid);
	};
	@RequestMapping("selPosters")
	@ResponseBody
	//广告的查询
	public LayuiQuery selPosters(Poster p,Integer page,Integer limit,HttpSession session){
		return ps.selPosters(p,page,limit,session);
	};
	@RequestMapping("selPost")
	@ResponseBody
	public List<Map<String, Object>> selPost(Poster p,HttpSession session){
		return ps.selPost(p, session);
	}
}
