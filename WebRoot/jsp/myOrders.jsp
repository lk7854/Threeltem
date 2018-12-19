<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myOrders.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css">
	<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
	<script>
	 	var $ = null;
		var table = null;
		var layer = null;
		var form = null;
		var t=null;
		layui.use(['layer','table','form'],function(){
			$ = layui.jquery;
			table = layui.table;//获取layui的表格对象
			layer = layui.layer;
			form = layui.form;
		  t=table.render({
		    elem: '#slotShow'
		    ,url: 'jckIn/selIndents.do' //数据接口
		    ,cellMinWidth:true
		    ,page: true //开启分页
		    ,cols: [[ //表头
		     	{field:"i_id",title:"订单编号",width:138,sort:true,fiexed:"left",align:"center"},
		     	{field:"p_name",title:"广告名",width:160,sort:true,align:"center"},
		     	{field:"p_formPage",title:"广告链接",width:160,sort:true,align:"center"},
		     	{field:"s_name",title:"广告位",width:90,align:"center"},
		     	{field:"i_money",title:"订单金额",width:90,align:"center"},
				{field:"i_startTime",title:"预计投放时间",width:160,align:"center"},
				{field:"i_endTime",title:"预计结束时间",width:160,align:"center"},
				{field:"i_startTime2",title:"实际开始时间",width:160,align:"center"},
				{field:"i_endTime2",title:"实际结束时间",width:160,align:"center"},
				{field:"i_state",title:"状态",width:90,sort:true,align:"center",templet:function(d){
					if(d.i_state==0){return "<i style='color:red;'>审核中</i>";}
					if(d.i_state==1){return "已撤销";}
					if(d.i_state==2){return "<i style='color:black;'>未通过</i>";}
					if(d.i_state==3){return "已完成";}
					if(d.i_state==5){return "<i style='color:blue;'>执行中</i>";}
				}},
				{field:"i_addTime",title:"创建时间",width:160,align:"center"},
				{field:"",title:"操作",width:120,align:"center",toolbar:"#tool",fixed:"right"}
		    ]]
  	});
		table.on('tool(table)',function(obj){
			//获取点击行的数据
			var clickdata = obj.data;
			var clickevent = obj.event;
			//判断
			if(clickevent == "detail"){
				if(clickdata.i_state==0){
					layer.msg("未通过审核不能进行反馈",{icon:5});
				}else if(clickdata.f_state==undefined&&clickdata.i_state!=0){
					checkCancel(clickdata.u_id,clickdata.i_id);
				}else{
					layer.msg("此订单已反馈过不能再次反馈",{icon:5});
				};
			}else if(clickevent=="xufei"){
				if(clickdata.i_state==1){
					layer.msg("订单已撤销不能进行续费",{icon:5});
				}else if(clickdata.f_state==undefined){
					layer.prompt({
						formType:0,//输入框类型，支持0（文本）默认1（密码）2（多行文本）
						value:"0",
						title:"充值金额",
						btn:['充值','取消'],
						area:['200px','150px']
					},function(value,ind){
						if(value==""){
							layer.msg("充值金额不能为空");
						}else if(value<=0){
							layer.msg("充值金额不能小于0元");
						}else{
							//单次曝光金额
						  	var s_thousandsShow=parseInt(clickdata.s_thousandsShow)/1000;
						  	//单次点击金额
						  	var s_singleclick=parseInt(clickdata.s_singleclick);
						  	//每天的点击量
						  	var s_clickcount= parseInt(clickdata.s_clickcount);
						  	//计算每天的收费钱数
						  	var dayCount=(s_thousandsShow+s_singleclick)*s_clickcount;
						  	//计算天数
						  	var day=value/dayCount;
							$.post("jckIn/xufei.do",{"money":value,"day":day,"i_money":parseInt(clickdata.i_money)+parseInt(value),"i_id":clickdata.i_id,"u_id":clickdata.u_id},function(d){
								
								if(d.m==-1){
									layer.msg("账户余额不足，请充值。",{icon:5});
									layer.close(ind);
								}else{
									layer.msg("充值成功,续费"+day+"天,将于"+d.i_endTime+"广告停止投放,请及时看消息",{time:8000});
									layer.close(ind);
									t.reload();
								}
							});
						};
					});
					/* xufei(clickdata.u_id,clickdata.i_id); */
				}if(clickdata.i_state==3){
					layer.msg("订单已结束不能进行续费",{icon:5});
				}
			}
		});
  	});
  	//点击反馈按钮的时候触发
  	function checkCancel(u_id,i_id){
			layer.prompt({
				formType:2,
				value:"",
				title:"反馈原因",
				area:['200px','150px'],
			},function(value,index,ele){
				if(value.length==0){
					layer.msg("原因必填",{icon:5});
				}else{
					layer.close(index);//关闭本窗体
					layer.confirm("确定反馈编号为：<i style='color:red;font-weight:bold;'>"+i_id+"</i>的订单？",{
					icon:3,
					title:"请注意"
					},function(ci){	
						//alert(JSON.stringify(value));
						feedback(u_id,i_id,value);
						layer.close(ci);
					});
				}
			});
		}
		function feedback(u_id,i_id,value){
			$.post("feedbackCon/addFeedback.do",{"u_id":u_id,"i_id":i_id,"f_content":value},function(data){
				if(data==1){
					layer.msg("反馈成功！",{icon:6});
					t.reload();
				}
			});
		}
		function searchInfo(){
		table.reload('slotShow', {
		  where: { 
		  	i_state:$("#i_state").val(),
		  	i_id:$("#i_id").val()
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
				      	<option value="">全部订单</option>
				      	<option value="0">审核中</option>
				      	<option value="1">已撤销</option>
				      	<option value="2">未通过</option>
				      	<option value="5">执行中</option>
				      	<option value="3">已完成</option>
				    </select>
			    </div>
			    <div class="layui-input-inline">
			    	<input type="text" placeholder="订单编号" id="i_id" class="layui-input search_input">
			    </div>
			    <a id="select" onclick="searchInfo()" class="layui-btn layui-btn-radius layui-btn-normal">查询</a>
			    
		    </form>
		</div>
	</blockquote>
  	 <script type="text/html" id="tool">
		<a class="layui-btn layui-btn-radius layui-btn-xs layui-btn-normal" lay-event="detail">反馈</a>
		<a class="layui-btn layui-btn-radius layui-btn-xs layui-btn-normal" lay-event="xufei">续费</a>
	</script>
    <table class="layui-hide" id="slotShow" lay-filter="table"></table>
  </body>
</html>
