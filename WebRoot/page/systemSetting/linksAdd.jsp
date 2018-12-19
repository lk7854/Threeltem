<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'linksAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />

  </head>
  
  <body class="childrenBody">
<form class="layui-form linksAdd">
	<div class="layui-form-item">
		<div class="layui-upload-list linkLogo">
			<img class="layui-upload-img linkLogoImg">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">网站名称</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input linkName" lay-verify="required" placeholder="请输入网站名称" />
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">网站地址</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input linkUrl" lay-verify="required|url" placeholder="请输入网站地址" />
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">站长邮箱</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input masterEmail" lay-verify="required|email" placeholder="请输入站长邮箱" />
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">展示位置</label>
		<div class="layui-input-block">
			<input type="checkbox" class="layui-input showAddress" lay-text="首页|子页" lay-skin="switch" />
		</div>
	</div>
	<div class="layui-form-item">
		<button class="layui-btn layui-block" lay-filter="addLink" lay-submit>提交</button>
	</div>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/systemSetting/linkList.js"></script>
</body>
</html>
