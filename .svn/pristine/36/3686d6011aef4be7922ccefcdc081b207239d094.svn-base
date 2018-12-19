<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'show1.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#slot3").show();
			$.get("indent/getOrders.do?s_id="+$("#input").val(),function(data){
				//alert(JSON.stringify(data));
				if(parseInt($("#inpu").val())==1){
					$("#s4").attr('url',data.href);
					$("#s4").attr('src',data['content-url']);
					$("#s4").attr('alt',data['poster-Name']);
				}else if(parseInt($("#inpu").val())==2){
					$("#s1").attr('url',data.href);
					$("#s1").attr('src',data['content-url']);
					$("#s1").attr('alt',data['poster-Name']);
				}else if(parseInt($("#inpu").val())==3){
					$("#s3").attr('url',data.href);
					$("#s3").attr('src',data['content-url']);
					$("#s3").attr('alt',data['poster-Name']);
				}else{
					$("#s2").attr('url',data.href);
					$("#s2").attr('src',data['content-url']);
					$("#s2").attr('alt',data['poster-Name']);
				}
			});
			$("img").click(function(){
				if ($(this).attr("url")!="") {
					window.open($(this).attr("url"));
				}
			});
		});
		function hiddens(){
			$("#slot3").css({"display":"none"});
		}
	</script>
  </head>
  
  <body style="background:url('images/login_bg.jpg') no-repeat center center;">
  	<input value="${s_id }" id="input" hidden>
  	<input value="${st_id }" id="inpu" hidden>
    <span style="color: red;">首页通栏广告 </span>
    <div id="slot2" style="border:1px solid gray; width:100%;height: 200px;">
    	<img alt="" url="" id="s2" src=""  style="width:100%;height:200px;">
    </div>
    <span style="color: red;">固定广告</span>
     <div id="slot1" style="border:1px solid gray; width:100px;height: 100px;display: inline-block;">
    	
    	<img alt="1111" url="" id="s1" src="" style="width:100px;height:100px;">
    </div>
   
    <div id="slot3" style="border:1px solid gray; width:600px;height: 420px;position: absolute;top: 200px; left: 30%;display: none;" onclick="hiddens()">
    	 <span style="color: red;">矩形大型广告</span>
    	<img alt="" url="" id="s3" src=""  style="width:600px;height:400px;">
    </div>
    
   	<div id="slot4" style="border:1px solid gray; width:300px;height: 520px;display: inline-block;position: absolute;right: 0px;">
   		<span style="color: red;">擎天柱广告</span>
    	<img alt="" url="" id="s4" src=""  style="width:300px;height:500px;">
   	</div>
   
  </body>
</html>
