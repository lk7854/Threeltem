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
				url:"jckS/showSlot.do",
				cellMinWidth:true,
				page:true,
				cols:[[
					{field:"s_id",title:"编号",sort:true,width:100,fiexed:"left",align:"center"},
					{field:"s_name",title:"名称",sort:true,align:"center"},
					{field:"s_oldPrice",title:"客户定价",sort:true,align:"center",style:"color:red;"},
					{field:"s_money",title:"系统定价",sort:true,align:"center",style:"color:red;font-weight:bold;",
					event:'setPrice'},
					{field:"s_addtime",title:"新增时间",sort:true,align:"center"},
					{field:"s_clickcount",title:"点击量",sort:true,align:"center"},
					{field:"s_state",title:"状态",sort:true,width:80,align:"center",templet:function(d){
						if(d.s_state==0){return "<i style='color:red'>待审核</i>";}
						if(d.s_state==1){return "<i style='color:black'>未通过</i>";}
						if(d.s_state==2){return "<i style='color:blue'>通过</i>";}
					}},
					
					{field:"uname",title:"创建/修改人",width:105,align:"center"},
					{field:"s_updatetime",title:"修改时间",sort:true,align:"center"},
					{field:"",title:"价格变动",align:"center",width:110,toolbar:"#tool",fixed:"right"},
				]],
			});
			
			//工具栏监听
			table.on('tool(table)',function(obj){
				//获取点击行的数据
				var clickdata = obj.data;
				//获取点击的元素的lay-event属性值
				var clickevent = obj.event;
				//判断
				if(clickevent == "edit"){//审核
					if(clickdata.s_state==2){
						showWin(clickdata);
					} else {
						layer.msg("没有审核通过不能够调动价格！",{icon:5});
					}
				}
				//调节价格
				if(clickevent == "setPrice"){
					up(clickdata);
				}
			});			
			//监听下拉列表
			form.on("select(selectstate)",function(data){
				query();
			});
		});
		//提示是否保存新的价格
		function up(row){
			//显示输入框
			layer.prompt({
				formType:0,
				value:row.s_money,
				title:"输入新定价",
			},function(value,index){
				var s_oldPrice = parseInt(row.s_oldPrice);//原价
				var s_id =row.s_id;//广告位价格
				var s_money = parseInt(value);//新定价
				//判断价格是否合理
				if(s_money>s_oldPrice){
					//修改价格
					upPrice(s_id,s_money,index);
				}else{
					layer.msg("定价不能小于，等于原价");
				}
			});
		}
		
		//调动价格
		function showWin(data){
			var rs = null;
			//打开输入窗口
			layer.prompt({
				formType:0,
				value:"",
				title:"输入百分比",
			},function(value,index){
				var reg = /^([1-9]{1}[0-9]{0,1}|0|100)(.d{1,2}){0,1}%$/;
				rs = reg.test(value);
				if(rs){
					var s_id =data.s_id; 
					var s_oldPrice = data.s_oldPrice;
					//计算新的价格
					var u = parseInt(value.toString().replace('%',''))/100;//转换成小数
					var s_money = (u+1)*parseInt(s_oldPrice);
					upPrice(s_id,s_money,index);
				} else {
					layer.alert("输入不正确！",{title:"提示",offset:'rb',icon:2});
				}
			});
		}
		//发送数据,进行修改
		function upPrice(s_id,s_money,index){
			//修改价格
			$.post("jckS/updateSlot.do",{"s_id":s_id,"s_money":s_money},function(data){
				if(data){
					layer.msg("价格变动成功！",{icon:1,offset:'rd'});
					treload.reload();
					layer.close(index);
				}
			});
		}
		
		//查询
		function query(){
			var name = $("#query_s_name").val();
			var state = $("#s_state").val();
			treload.reload({
				page: {
		          	curr: 1, //重新从第 1 页开始
		        },
		        method:"post",
				where:{
					s_name:name,
					s_state:state,
				}
			});
		}
		function show1(id){
			var url = $("#"+id).val();
			var json= 
			{
			  "title": "标题", //相册标题
			  "id": 123, //相册id
			  "start": 0, //初始显示的图片序号，默认0
			  "data": [   //相册包含的图片，数组格式
			  {
			   "alt": "图片名",
			   "pid": 666, //图片id
			   "src": url, //原图地址
			   "thumb": url //缩略图地址
			  }
			]};
			layer.photos({
				photos:json,
				shift:5
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
			    	<select id="s_state" lay-filter="selectstate">
				      	<option value="-1">所有</option>
				      	<option value="0">待审核</option>
				      	<option value="1">未通过</option>
				      	<option value="2">通过</option>
				    </select>
			    </div>
			    <div class="layui-input-inline">
			    	<input type="text" placeholder="名称" id="query_s_name" class="layui-input search_input">
			    </div>
			    <a id="select" onclick="query()" class="layui-btn layui-btn-radius">查询</a>
			    <div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">审核需谨慎</div>
				</div>
		    </form>
		</div>
	</blockquote>
	<!-- 数据表格 -->
    <table id="tb" lay-filter="table"></table>
    <!-- 工具栏 -->
    <script type="text/html" id="tool">
		<a class="layui-btn layui-btn-radius layui-btn-xs" lay-event="edit">上调百分比</a>
	</script>
  </body>
</html>
