<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />

  </head>
  
  <body class="childrenBody">
<form class="layui-form" style="width:80%;">
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">登录名</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input userName" lay-verify="required" placeholder="请输入登录名">
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">邮箱</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input userEmail" lay-verify="email" placeholder="请输入邮箱">
		</div>
	</div>
	<div class="layui-row">
		<div class="magb15 layui-col-md4 layui-col-xs12">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block userSex">
				<input type="radio" name="sex" value="男" title="男" checked>
				<input type="radio" name="sex" value="女" title="女">
				<input type="radio" name="sex" value="保密" title="保密">
			</div>
		</div>
		<div class="magb15 layui-col-md4 layui-col-xs12">
			<label class="layui-form-label">会员等级</label>
			<div class="layui-input-block">
				<select name="userGrade" class="userGrade" lay-filter="userGrade">
					<option value="0">注册会员</option>
					<option value="1">中级会员</option>
					<option value="2">高级会员</option>
					<option value="3">钻石会员</option>
					<option value="4">超级会员</option>
				</select>
			</div>
		</div>
		<div class="magb15 layui-col-md4 layui-col-xs12">
			<label class="layui-form-label">会员状态</label>
			<div class="layui-input-block">
				<select name="userStatus" class="userStatus" lay-filter="userStatus">
					<option value="0">正常使用</option>
					<option value="1">限制用户</option>
				</select>
			</div>
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">用户简介</label>
		<div class="layui-input-block">
			<textarea placeholder="请输入用户简介" class="layui-textarea userDesc"></textarea>
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<div class="layui-input-block">
			<button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="addUser">立即添加</button>
			<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">取消</button>
		</div>
	</div>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/user/userAdd.js"></script>
</body>
</html>