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
			layer.msg('Hello World');//弹出框
			
			//执行一个table示例
			treload = table.render({
				elem:"#tb",
				url:"webuser/query.do",
				cellMinWidth:true,
				page:true,
				cols:[[
					{field:"",title:"编号",fiexed:"left",align:"center",checkbox:true},
					{field:"in_id",title:"编号",sort:true,width:100,fiexed:"left",align:"center"},
					{field:"in_name",title:"机构名",sort:true,align:"center"},
					{field:"in_man",title:"负责人",sort:true,align:"center"},
					{field:"in_phone",title:"机构电话",sort:true,align:"center"},
					{field:"in_addtime",title:"提交时间",sort:true,align:"center"},
					{field:"in_state",title:"状态",sort:true,width:80,align:"center",templet:function(d){
						if(d.in_state==0){return "<i style='color:red'>待审核</i>";}
						if(d.in_state==1){return "<i style='color:black'>未通过</i>";}
						if(d.in_state==2){return "<i style='color:blue'>通过</i>";}
					}},
					{field:"u_name",title:"所属账号",width:105,align:"center"},
					{field:"in_updatetime",title:"修改时间",sort:true,align:"center"}
				]],
			});
			
			table.on('tool(table)',function(obj){
				//获取点击行的数据
				var clickdata = obj.data;
				//获取点击的元素的lay-event属性值
				var clickevent = obj.event;
				//判断
				if(clickevent == "detail"){
					//即查看详情,,进行操作
					//alert("查看详情="+JSON.stringify(clickdata));
					//填充数据，并打开详情窗口
					showWinDetails(clickdata);
				}
			});
		});
		
		//根据编号,和广告名查询订单
		function query(){
			var name = $("#query_in_name").val();
			treload.reload({
				page: {
		          	curr: 1, //重新从第 1 页开始
		        },
		        method:"post",
				where:{
					u_name:name,
				}
			});
		}
		
		function look(){
			 var checkStatus = table.checkStatus('tb')
      		,data = checkStatus.data;
      		var len = data.length;//选中项
      		if(len<=5){
	      		//获取选中项的u_id
	      		var ids= new Array();
	      		for(var i=0;i<len;i++){
	      			ids.push(data[i].u_id);
	      		}
	      		window.open("jsp/iframe.jsp?ids="+ids.toString());
	      		
      		} else {
      			layer.alert("最多选中五项！",{icon:2});
      		}
		}
	</script>
  </head>
  
  <body>
  	<blockquote class="layui-elem-quote news_search" style="margin-left:10px;margin-top:10px;">
		<div class="layui-inline">
			<form class="layui-form" >
				<label class="layui-form-label">条件：</label>
			    <div class="layui-input-inline">
			    	<input type="text" placeholder="机构名" id="query_in_name" class="layui-input search_input">
			    </div>
			    <a id="select" onclick="query()" class="layui-btn layui-btn-radius layui-btn-normal">查询</a>
			    <a class="layui-btn layui-btn-radius layui-btn-normal" onclick="look()" >查看选中项盈利情况</a>
		    </form>
		</div>
	</blockquote>
	<!-- 数据表格 -->
    <table id="tb" lay-filter="table"></table>
  </body>
</html>
