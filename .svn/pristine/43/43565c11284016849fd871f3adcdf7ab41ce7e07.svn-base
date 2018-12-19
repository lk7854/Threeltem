package com.aaa.controller.jck;





import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.RevokeIndent;
import com.aaa.service.jck.RevokeindentService;

@Controller
@RequestMapping("revokeCon")
public class RevokeIndentController {

	@Autowired
	RevokeindentService ris;
	@RequestMapping("addRevoke")
	@ResponseBody
	public int addRevoke(RevokeIndent r){
		return ris.addRevoke(r);
	}
	//查询
	@RequestMapping("selRevoke")
	@ResponseBody
	public List<Map<String, Object>> selRevoke(RevokeIndent r){
		return ris.selRevoke(r);
	}
}
