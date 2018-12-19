<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文章列表--layui后台管理模板 2.0</title>
    
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
	<form class="layui-form" action="LKPosterType/addpt.do" method="post">
		<div class="layui-form-item input-item">
			<label class="layui-form-label">类型名称</label>
			<div class="layui-input-inline">
				<input type="text" name="pt_name" placeholder="请输入名称" autocomplete="on" class="layui-input newsName" lay-verify="newsName">
			</div>
		</div>
		<div class="layui-form-item input-item" hidden>
			<label class="layui-form-label">添加人</label>
			<div class="layui-input-inline">
				<input type="text" value="${login.u_id }" name="u_id" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">添加人</label>
			<div class="layui-input-inline">
				<input type="text" value="${login.u_name }" readonly class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe609;</i>立即提交</button>
				<button type="reset" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">重置</button>
			</div>
		</div>
	</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/news/newsAdd.js"></script>
</body>
</html>
