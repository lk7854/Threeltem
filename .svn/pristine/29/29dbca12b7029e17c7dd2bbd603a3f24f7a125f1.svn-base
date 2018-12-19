<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myselfInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui/css/layui.css">
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
	layui.use('form', function(){
		  var form = layui.form;
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    return true;
		  });
		});
	</script>
  </head>
  
  <body>
    <form class="layui-form" action="jckUs/updateMyself.do" method="post">
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名</label>
	    <div class="layui-input-block">
	    	<input type="text" name="u_id" value="${ju.u_id }" hidden>
	      <input type="text" name="u_name" value="${ju.u_name }"  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">公司</label>
	    <div class="layui-input-block">
	    <input type="text" name="in_id" value="${ju.in_id }" hidden>
	      <input type="text" name="in_name" value="${ju.in_name }" required  lay-verify="required" placeholder="请输入公司名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">公司地址</label>
	    <div class="layui-input-block">
	      <input type="text" name="in_address" value="${ju.in_address }" required  lay-verify="required" placeholder="请输入公司地址" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">公司负责人</label>
	    <div class="layui-input-block">
	      <input type="text" name="in_man" value="${ju.in_man }" required  lay-verify="required"  placeholder="请输入负责人" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">负责人电话</label>
	    <div class="layui-input-block">
	      <input type="text" name="in_phone" value="${ju.in_phone }" required  lay-verify="required" placeholder="请输入负责人电话" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <textarea name="in_remark"  placeholder="备注" class="layui-textarea">${ju.in_remark }</textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
 

  </body>
</html>
