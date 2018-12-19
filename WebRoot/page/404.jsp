<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '404.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />

  </head>
  
  <body class="childrenBody">
	<div class="noFind">
		<div class="ufo">
			<i class="seraph icon-test ufo_icon"></i>
			<i class="layui-icon page_icon">&#xe638;</i>
		</div>
		<div class="page404">
			<i class="layui-icon">&#xe61c;</i>
			<p>我勒个去，页面被外星人挟持了!</p>
		</div>
	</div>
	<script type="text/javascript" src="layui/layui.js"></script>
   </body>
</html>
