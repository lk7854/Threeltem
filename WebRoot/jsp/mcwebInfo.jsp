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
		var laydate = null;
		layui.use(['layer','table','form','laydate'],function(){
			$ = layui.jquery;
			table = layui.table;//获取layui的表格对象
			layer = layui.layer;
			form = layui.form;
			laydate = layui.laydate;
			layer.msg('Hello World');//弹出框
			/* {"u_id2":5,"u_id":6,"mc_id":103,"mc_type":6,
			"mc_remark":"订单：20180709170700,从冻结金额中扣款,然后从中抽取的钱--->平台账户",
			"mc_money":0.20,"mc_time":"2018-07-15 17:37:00"} */
			//执行一个table示例
			treload = table.render({
				elem:"#tb",
				url:"Mc/query.do?mc_type=7",
				cellMinWidth:true,
				page:true,
				cols:[[
					{field:"mc_id",title:"编号",sort:true,fiexed:"left",align:"center"},
					{field:"mc_type",title:"类型",sort:true,align:"center",templet:function(d){
						return "<i style='color:blue'>广告位盈利</i>";
					}},
					{field:"mc_money",title:"金额(单位：元)",sort:true,align:"center",templet:function(d){
						return "<i style='color:green'>+"+d.mc_money+"</i>";
					}},
					{field:"mc_time",title:"盈利时间",sort:true,align:"center"}
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
				if(clickevent == "check"){//审核
					if(clickdata.in_state==0){
						showWin(clickdata);
					} else {
						layer.msg("不能重复审核",{icon:5});
					}
				}
			});
			laydate.render({
			    elem: '#date'
			});
			laydate.render({
			    elem: '#date2'
			});
		});
		
		function query(){
			var date = $("#date").val();
			var date2 = $("#date2").val();
			treload.reload({
				page: {
		          	curr: 1, //重新从第 1 页开始
		        },
		        method:"post",
				where:{
					startTime:date,
					endTime:date2,
				}
			});
		}
		
		function load(){
			setTimeout("load();",10*1000);
		}
		 
		
	</script>
  </head>
  
  <body>
  	<blockquote class="layui-elem-quote news_search" style="margin-left:10px;margin-top:10px;">
		<div class="layui-inline">
			<form class="layui-form" >
				<label class="layui-form-label">条件：</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="date" id="date" lay-verify="date" placeholder="开始日期" autocomplete="off" class="layui-input">
			    </div>---
			    <div class="layui-input-inline">
			    	<input type="text" name="date" id="date2" lay-verify="date" placeholder="结束日期" autocomplete="off" class="layui-input">
			    </div>
			    <a id="select" onclick="query()" class="layui-btn layui-btn-radius layui-btn-normal">查询</a>
			    <div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">按照起止日期查询</div>
				</div>
		    </form>
		</div>
	</blockquote>
	<!-- 数据表格 -->
    <table id="tb" lay-filter="table"></table>
    
  </body>
</html>
