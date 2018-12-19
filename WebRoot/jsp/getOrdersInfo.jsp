<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getOrdersInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
	 <script type="text/javascript">
	 	var $ = null;
	 	var form = null;
	 	layui.use(['jquery','form'],function(){
	 		$ = layui.jquery;
	 		form = layui.form;
	 		
	 	});
	 	
	 	function query() {
	 		var id = $("#s_id").val();
	 		if(""!=id){
		 		$.get("indent/getOrders.do",{"s_id":id},function(data){
		 			$("#return").html(JSON.stringify(data));
		 		}); 
	 		} else {
	 			layer.alert("编号不能为空!",{title:"提示",offset:"rb",shade:0});
	 		}	
	 	}
	 </script>
  </head>
  
  <body>
  	<!-- <blockquote class="layui-elem-quote news_search" style="margin-left:10px;margin-top:10px;">
		<div class="layui-inline" style="margin-left:375px;">
			<form class="layui-form">
				<label class="layui-form-label" style="width:200px;">广告位编号：</label>
			    <div class="layui-input-inline">
			    	<input type="text" id="s_id" class="layui-input search_input">
			    </div>
			    <a id="select" onclick="query()" class="layui-btn layui-btn-radius layui-btn-normal">查询</a>
		    </form>
		</div>
	</blockquote> -->
	<center>
		<div style="width:400px;font-size: 20px; text-align: left;">
			参数说明：<br>
			请求URL：http://localhost:8080/ThreeItem/indent/getOrders.do?s_id=a<br>
			参数s_id:本系统中广告位的编号，a是值<br>
			href：广告点击连接路径；<br>
			content-url：广告内容路径；<br>
			poster-Name：广告名称；<br>
			slot-Name：广告位名称；<br>
		</div>
	</center>
	<hr>
  	<div id="return" style="width:100%;font-size: 20px;"></div>
  </body>
</html>
