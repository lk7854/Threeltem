<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="css/news.css" media="all" /> -->
	<!-- <script type="text/javascript" src="js/jquery-3.1.1.js"></script> -->
	<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
	<script type="text/javascript">
		var $ = null;
		var table = null;
		var layer = null;
		var form = null;
		var treload = null;
		
		layui.use(['layer','table','form'],function(){
			$ = layui.jquery;
			table = layui.table;//获取layui的表格对象
			layer = layui.layer;
			form = layui.form;
			layer.msg('Welcome to zhiyuan advertising!');//弹出框
			//执行一个table示例
			treload = table.render({
				elem:"#tb",
				url:"info/queryInform.do",
				cellMinWidth:true,
				page:true,
				cols:[[					
					{field:"",title:"",fiexed:"left",align:"center",checkbox:true},
					{field:"inf_id",title:"编号",width:90,sort:true,align:"center"},
					{field:"inf_content",title:"消息内容",align:"center"},
					{field:"mt_content",title:"消息类型",sort:true,align:"center"},
					{field:"inf_state",title:"状态",sort:true,align:"center",templet:function(d){
						if(d.inf_state==0){return "<i style='color:green'>已读</i>";}
						if(d.inf_state==1){return "<i style='color:blue'>未读</i>";}
					}},
					{field:"inf_time",title:"通知时间",align:"center"}
				]],
			});
			
			//监听下拉列表
			form.on("select(selectstate)",function(data){
				query();
			});
		});
		
		//根据编号,和广告名查询订单
		function query(){
			var state = $("#query_info_state").val();
			treload.reload({
				page: {
		          	curr: 1, //重新从第 1 页开始
		        },
		        method:"post",
				where:{
					inf_state:state,
				}
			});
		}
		
		function look(){
			//获取所有选中项
			var checkStatus = table.checkStatus('tb')
      		,data = checkStatus.data;
      		var len = data.length;//获取选中数据的长度
      		if(0!=len){
      			var ids = new Array();
      			//获取选中项的ID
      			for(var i=0;i<len;i++){
      				if(data[i].inf_id==1){//只修改未读的信息
      					ids.push(data[i].inf_id);
      				}
      			}
      			$.post("info/update.do",{"ids":ids.toString()},function(data){
      				if(data){
      					treload.reload();
      				}
      			});
      		} else {
      			layer.msg("至少选中一项！");
      		}
      		
		}
	</script>
  </head>
  
  <body>
  	<blockquote class="layui-elem-quote news_search" style="margin-left:10px;margin-top:10px;">
		<div class="layui-inline">
			<form class="layui-form" >
				<label class="layui-form-label">条件：</label>
				<div class="layui-input-inline" style="width:200px;">
			    	<select id="query_info_state" lay-filter="selectstate">
				      	<option value="-1">所有</option>
				      	<option value="0">已读</option>
				      	<option value="1">未读</option>
				    </select>
			    </div>
			    <a id="select" onclick="query()" class="layui-btn layui-btn-radius layui-btn-normal">查询</a>
			    <a onclick="look()" class="layui-btn layui-btn-radius layui-btn-normal">标记为已读</a>
			    <div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">审核需谨慎</div>
				</div>
		    </form>
		</div>
	</blockquote>
	<!-- 数据表格 -->
    <table id="tb" lay-filter="table"></table>
	
  </body>
</html>
