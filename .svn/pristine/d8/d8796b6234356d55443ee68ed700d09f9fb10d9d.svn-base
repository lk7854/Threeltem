<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userGrade.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />

  </head>
 <body class="childrenBody">
<form class="layui-form" onkeydown="if(event.keyCode==13) return false;">
	<blockquote class="layui-elem-quote">
		<a class="layui-btn layui-btn-sm addGrade">新增等级</a>　<span class="layui-word-aux">其实这里应该有些说明性的东西，但是因为语文没有学好，没办法，还是需要的人自己写点描述吧</span>
	</blockquote>
	<table id="userGrade" lay-filter="userGrade"></table>
	<script type="text/html" id="gradeIcon">
		{{#  if(d.gradeIcon === 'icon-vip1'){ }}
		<span class="seraph vip1 {{d.gradeIcon}}"></span>
		{{#  } else if(d.gradeIcon === 'icon-vip2'){ }}
		<span class="seraph vip2 {{d.gradeIcon}}"></span>
		{{#  } else if(d.gradeIcon === 'icon-vip3'){ }}
		<span class="seraph vip3 {{d.gradeIcon}}"></span>
		{{#  } else if(d.gradeIcon === 'icon-vip4'){ }}
		<span class="seraph vip4 {{d.gradeIcon}}"></span>
		{{#  } else if(d.gradeIcon === 'icon-vip5'){ }}
		<span class="seraph vip5 {{d.gradeIcon}}"></span>
		{{#  } else if(d.gradeIcon === 'icon-vip6'){ }}
		<span class="seraph vip6 {{d.gradeIcon}}"></span>
		{{#  } else if(d.gradeIcon === 'icon-vip7'){ }}
		<span class="seraph vip7 {{d.gradeIcon}}"></span>
		{{#  }}}
	</script>
	<script type="text/html" id="gradeBar">
		<input type="checkbox" name="gradeStatus" lay-filter="gradeStatus" lay-skin="switch" lay-text="启用|禁用" checked>
	</script>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/user/user.js"></script>
</body>
</html>