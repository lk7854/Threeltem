<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Zhi-Yuan广告——修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />
  </head>
  <body class="childrenBody">
<form class="layui-form" method="post">
	<div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
		<div class="layui-form-item" hidden>
			<div class="layui-input-block">
				<input type="text" name="u_id" value="${login.u_id }" class="layui-input layui-disabled">
				<input type="password" id="oldp" value="${login.u_pwd }" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" value="${login.u_name }" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">旧密码</label>
			<div class="layui-input-block">
				<input type="password" id="oldPwd" value="" placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-block">
				<input type="password" name="u_pwd" value="" placeholder="请输入新密码" lay-verify="required|newPwd" id="newPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" value="" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="formpwd">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/user/user.js"></script>
<script type="text/javascript" src="js/login/login.js"></script>
<script>
			var layer = null;
			var form = null;
			var upload = null;
			layui.use(['layer', 'form','upload'], function() {
				layer = layui.layer;
				form = layui.form;
 				upload = layui.upload;
			
				//监听提交
				form.on('submit(formpwd)', function(data) {
					$.ajax({
	                url: "LKusers/upus.do",
	                data:data.field,
	                type: "post",
	                success: function (info) {
	                    if (info == 1) {
	                    	layer.msg("跳转登录页面！");
	                    	setTimeout(function(){
	                    	window.parent.location = "http://localhost:8080/ThreeItem/page/login/login.jsp";
	                    	},1000);
	                    }
	                }
	            });
	            return false;
				});
				
			});
		</script>
</body>
</html>