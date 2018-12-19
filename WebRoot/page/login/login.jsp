<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="loginHtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>Ambitious 广告——登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="icon" href="../../favicon.ico">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />
</head>
<body class="loginBody">
	<form class="layui-form" action="LKusers/login.do" lay-filter="fm" method="post">
		<div class="login_face"><img src="images/face.jpg" class="userAvatar"></div>
		<div class="layui-form-item input-item">
			<label for="userName">账号</label>
			<input name="name" type="text" placeholder="请输入账号" autocomplete="on" id="username" class="layui-input" lay-verify="required|username">
		</div>
		<div class="layui-form-item input-item">
			<label for="password">密码</label>
			<input name="pwd" type="password" placeholder="请输入密码" autocomplete="on" id="password" class="layui-input" lay-verify="required|pass">
		</div>
		<div class="layui-form-item input-item" id="imgCode">
			<label for="code">验证码</label>
			<input name="yzm" type="text" placeholder="请输入验证码" autocomplete="on" id="code" class="layui-input" lay-verify="required|yzm">
			<img src="images/code.jpg">
		</div>
		<div class="layui-form-item">
			<button class="layui-btn layui-block" id="btn" lay-filter="login" lay-submit>登录</button>
		</div>
		<div class="layui-form-item layui-row">
			<a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/login/login.js"></script>
	<script type="text/javascript" src="js/cache.js"></script>
	<script>
		var layer = null;
		var form = null;
		layui.use(['layer','upload','form'], function() {
			layer = layui.layer;
			form = layui.form;
			 
          	//表单验证
	        form.verify({
	            username:function(value, item){ //value：表单的值、item：表单的DOM对象
				    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
				      return '用户名不能有特殊字符';
				    }
				    if(/(^\_)|(\__)|(\_+$)/.test(value)){
				      return '用户名首尾不能出现下划线\'_\'';
				    }
				  },
	            pass: [/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格'],
	            yzm:[/jgmxj/,'验证码不正确']
	        });  
			
			//监听提交
			form.on('submit(fm)', function(data) {
				$("#btn").text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
        		setTimeout(function(){
        			$("#btn").text("登录").removeAttr("disabled").removeClass("layui-disabled");
        		},2000);
				var name = $.trim($("#username").val());
				var pwd = $.trim($("#password").val());
				$.ajax({
	                url: "LKusers/login.do",
	                type: "post",
	                data: {"name":name,"pwd":pwd},
	                success: function (info) {
	                    if (info == 1) {
	                        setTimeout(function () {
	                            window.location.href = "http://localhost:8080/ThreeItem/jsp/home.jsp";
	                        }, 1000);
	                    } else{
	                            layer.alert('账号密码错误/账号状态异常！', 
    			  				{icon:5,title:'警告!',offset:'rb',shade:0,anim: 5,time:5000});
	                    } 
	                }
	            });
	            return false;
	        });
		});
		
	</script>
</body>
</html>
