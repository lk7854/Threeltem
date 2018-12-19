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
    <meta charset="utf-8">
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
				url:"indent/identQuery.do",
				// cellMinWidth:true, 
				page:true,
				cols:[[
					{field:"i_id",title:"编号",width:139,sort:true,fiexed:"left",align:"center"},
					{field:"p_name",title:"广告",width:90,align:"center"},
					{field:"s_name",title:"广告位",width:90,align:"center"},
					{field:"i_addTime",title:"创建时间",align:"center"},
					{field:"i_startTime2",title:"实际投放时间",align:"center"},
					{field:"i_endTime2",title:"实际结束时间",align:"center"},
					/* {field:"i_remark",title:"备注",sort:true,align:"center"}, */
					{field:"uname",title:"创建人",width:105,align:"center"},
					{field:"i_state",title:"状态",width:90,sort:true,align:"center",templet:function(d){
						if(d.i_state==0){return "<i style='color:red;'>待审核</i>";}
						if(d.i_state==1){return "已撤销";}
						if(d.i_state==2){return "<i style='color:black;'>未通过</i>";}
						if(d.i_state==3){return "已完成";}
						if(d.i_state==5){return "<i style='color:blue;'>执行中</i>";}
					}},
					{field:"",title:"操作",align:"center",width:139,toolbar:"#tool",fixed:"right"},
				]],
			});
			
			table.on('tool(table)',function(obj){
				//获取点击行的数据
				var clickdata = obj.data;
				//获取点击的元素的lay-event属性值
				var clickevent = obj.event;
				//详情
				if(clickevent == "detail"){
					if(clickdata.i_state!=2 && clickdata.i_state!=0){
						window.open("jsp/iframe2.jsp?i_id="+clickdata.i_id);//根据订单编号查询订单的点击信息
					} else {
						layer.msg("该订单不能查看！",{icon:5});
					}
				}
			});
			//监听下拉列表
			form.on("select(selectstate)",function(data){
				query();
			});
			
		});

		//根据订单编号查询订单
		function query(){
			var id = $("#i_id").val();
			var state = $("#i_state").val();
			treload.reload({
				page: {
		          	curr: 1, //重新从第 1 页开始
		        },
				where:{
					i_id:id,
					i_state:state,
				}
			});
		}
		
	</script>
  </head>
  
  <body>
  	<blockquote class="layui-elem-quote news_search" style="margin-left:10px;margin-top:10px;">
		<div class="layui-inline">
			<form class="layui-form" >
				<label class="layui-form-label">条件：</label>
				<div class="layui-input-inline" style="width:200px;">
			    	<select id="i_state" lay-filter="selectstate">
				      	<option value="-1">所有订单</option>
				      	<option value="0">待审核</option>
				      	<option value="1">已撤销</option>
				      	<option value="2">未通过</option>
				      	<option value="3">已完成</option>
				      	<option value="5">执行中</option>
				    </select>
			    </div>
			    <div class="layui-input-inline">
			    	<input type="text" placeholder="订单编号" id="i_id" class="layui-input search_input">
			    </div>
			    <a id="select" onclick="query()" class="layui-btn layui-btn-radius layui-btn-normal">查询</a>
			    <div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">仅执行中的可以查看点击信息</div>
				</div>
		    </form>
		</div>
	</blockquote>
	<!-- 数据表格 -->
    <table id="tb" lay-filter="table"></table>
    <!-- 工具栏 -->
    <script type="text/html" id="tool">
		<a class="layui-btn layui-btn-radius layui-btn-xs layui-btn-normal" lay-event="detail">查看点击量</a>
		<!--<a class="layui-btn layui-btn-radius layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-radius layui-btn-xs layui-btn-danger" lay-event="check">审核</a>
		<a class="layui-btn layui-btn-radius layui-btn-xs layui-bg-black" lay-event="checkCancel">撤销</a>-->
	</script>
  </body>
</html>
