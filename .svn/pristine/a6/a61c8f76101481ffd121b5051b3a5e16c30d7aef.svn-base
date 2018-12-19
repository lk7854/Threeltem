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
				url:"fb/fbquery.do",
				cellMinWidth:true,
				page:true,
				cols:[[
					{field:"f_id",title:"编号",sort:true,width:100,fiexed:"left",align:"center"},
					{field:"i_id",title:"订单编号",width:120,align:"center"},
					{field:"f_content",title:"反馈内容",sort:true,align:"center",style:"color:blue;",event:"back"},
					{field:"f_state",title:"状态",sort:true,width:80,align:"center",templet:function(d){
						if(d.f_state==0){return "<span style='color:red'>待处理</span>";}
						if(d.f_state==1){return "<span style='color:black'>已处理</span>";}
					}},
					//{field:"uname",title:"反馈人",width:105,align:"center"},
					{field:"f_time",title:"反馈时间",width:160,sort:true,align:"center"},
					{field:"",title:"处理反馈",align:"center",width:110,toolbar:"#tool",fixed:"right"},
				]],
			});
			//工具栏监听
			table.on('tool(table)',function(obj){
				//获取点击行的数据
				var clickdata = obj.data;
				//获取点击的元素的lay-event属性值
				var clickevent = obj.event;
				//判断
				if(clickevent == "edit"|| clickevent=="back"){
					if(clickdata.f_state==0){
						up(clickdata);
					} else {
						layer.msg("不能重复处理",{icon:5});
					}
				}
			});			
			//监听下拉列表
			form.on("select(selectstate)",function(data){
				query();
			});
		});
		
		function up(row){
			//显示输入框
			layer.prompt({
				formType:0,
				value:row.s_money,
				title:"处理消息",
			},function(value,index){
				var u_id = row.u_id;//反馈人
				var f_id = row.f_id;
				//校验处理信息不能为空
				if(""!=value){
					//发送消息通知
					$.post("fb/handler.do",{"u_id":u_id,"inf_content":value,"f_id":f_id},function(data){
						if(data){
							layer.msg("处理成功",{icon:6});
							layer.close(index);
							treload.reload();
						}
					});
				}else{
					layer.msg("内容不能为空！");
				}
			});
		}
		//查询
		function query(){
			var state = $("#f_state").val();
			treload.reload({
				page: {
		          	curr: 1, //重新从第 1 页开始
		        },
		        method:"post",
				where:{
					f_state:state,
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
			    	<select id="f_state" lay-filter="selectstate">
				      	<option value="-1">所有</option>
				      	<option value="0">待处理</option>
				      	<option value="1">已处理</option>
				    </select>
			    </div>
		    </form>
		</div>
	</blockquote>
	<!-- 数据表格 -->
    <table id="tb" lay-filter="table"></table>
    <!-- 工具栏 -->
    <script type="text/html" id="tool">
		<a class="layui-btn layui-btn-radius layui-btn-xs" lay-event="edit">处理</a>
	</script>
  </body>
</html>
