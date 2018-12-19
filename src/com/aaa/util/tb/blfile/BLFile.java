//package com.aaa.util.tb.blfile;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpUtils;
//
//import org.apache.http.HttpResponse;
//import org.apache.http.util.EntityUtils;
//
//import com.alibaba.fastjson.JSON;
//
//public class BLFile {
//
//	/**
//	 * 获取文件处理后的结果
//	 * 
//	 * @param str
//	 * @return
//	 */
//	public Map getBLInfo(String str) {
//		Map map = null;
//		String host = "https://dm-58.data.aliyun.com";
//		String path = "/rest/160601/ocr/ocr_business_license.json";
//		String method = "POST";
//		String appcode = "9a1b7f4c617f4310a01871cb5185b832";// 自己的
//		Map<String, String> headers = new HashMap<String, String>();
//		// 最后在header中的格式(中间是英文空格)为Authorization:APPCODE
//		// 83359fd73fe94948385f570e3c139105
//		headers.put("Authorization", "APPCODE " + appcode);
//		// 根据API的要求，定义相对应的Content-Type
//		headers.put("Content-Type", "application/json; charset=UTF-8");
//		Map<String, String> querys = new HashMap<String, String>();
//		// 对图片内容进行Base64编码
//		String bodys = "{\"image\":\"" + GetBase64.GetImageStr(str) + "\"}";
//		try {、
//			HttpResponse response = HttpUtils.doPost(host, path, method,
//					headers, querys, bodys);
//			System.out.println(response.toString());
//			// 获取response的body
//			// System.out.println(EntityUtils.toString(response.getEntity()));
//			// 将返回的数据转换成map，然后在封装成实体类的对象
//			map = (Map) JSON.parse(EntityUtils.toString(response.getEntity()));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return map;
//	}
// }
