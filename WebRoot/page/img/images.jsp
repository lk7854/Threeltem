<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图片总数--layui后台管理模板</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />
  </head>
  
  <body class="childrenBody">
<form class="layui-form">
	<blockquote class="layui-elem-quote news_search" style="height:25px;">
		<div class="layui-inline">
			<input type="checkbox" name="selectAll" id="selectAll" lay-filter="selectAll" lay-skin="primary" title="全选">
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-sm layui-btn-danger batchDel">批量删除</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-sm uploadNewImg">上传新图片</a>
		</div>
	</blockquote>
	<ul class="layer-photos-demo" id="Images"></ul>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/img/images.js"></script>
</body>
</html>