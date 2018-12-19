package com.aaa.util.jck;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Upload {

	//文件上传
	public static String fileUpload(MultipartFile filename,HttpServletRequest request){
		String oldFileName = filename.getOriginalFilename();
		String newFileName="";
		// 判断是否有待上传的文件
		if (!"".equals(oldFileName)) {
			try {
				// 获取保存路径
				String path = request.getSession().getServletContext().getRealPath("upload");

				// 重命名
				UUID randomUUID = UUID.randomUUID();
				// 获取文件后缀：最后一个.的下标
				int index = oldFileName.lastIndexOf(".");
				String suffix = oldFileName.substring(index);
				// 新文件名：全路径
				newFileName = randomUUID.toString() + suffix;

				// 创建新文件
				File newFile = new File(path + "/" + newFileName);

				// 另存为
				filename.transferTo(newFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return newFileName;
	}
}
