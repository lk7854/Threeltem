<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'posterManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />
</head>
<body class="childrenBody">
	<form class="layui-form">
		<blockquote class="layui-elem-quote quoteBox">
			<form class="layui-form">
				<div class="layui-inline">
					<div class="layui-input-inline">
						<input type="text" class="layui-input searchVal" placeholder="请输入搜索的网站名称" />
					</div>
					<a class="layui-btn search_btn" data-type="reload">搜索</a>
				</div>
			</form>
		</blockquote>
		<table id="newsList" lay-filter="newsList"></table>
		
		<!--操作-->
		<script type="text/html" id="newsListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		</script>
		<!--审核状态-->
		<script type="text/html" id="newsStatus">
		{{#  if(d.u_state == "2"){ }}
		<span class="layui-red">等待审核</span>
		{{#  } else if(d.u_state == "1"){ }}
		<span class="layui-blue">未通过</span>
		{{#  } else { }}
			审核通过
		{{#  }}}
	</script>
	</form>
	<!-- 添加/修改 -->
		<div id="addORup" hidden>
			<form class="layui-form" action="" lay-filter="fm" id="fm" method="post">
				<div class="layui-form-item input-item" hidden>
					<label class="layui-form-label">ID</label>
					<div class="layui-input-inline">
						<input type="text" name="u_id">
					</div>
				</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="u_name" disabled placeholder="请输入网站名称" autocomplete="on" class="layui-input newsName" lay-verify="newsName">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input type="password" name="u_pwd" disabled placeholder="请选择所属机构" autocomplete="of" class="layui-input notNull" lay-verify="notNull">
			</div>
		</div>
		<div class="layui-form-item input-item" hidden>
			<label class="layui-form-label">操作人</label>
			<div class="layui-input-inline">
				<input type="text" value="${login.u_id }" name="u_id" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">操作人</label>
			<div class="layui-input-inline">
				<input type="text" value="${login.u_name }" disabled class="layui-input">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">用户状态</label>
			<div class="layui-input-inline">
				<!-- <input type="radio" name="u_state" value="0" title="通过" lay-filter="r_r"> -->
				<input type="radio" name="u_state" value="2" title="等待" lay-filter="r_r">
				<input type="radio" name="u_state" value="1" title="驳回" lay-filter="r_r">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">所属机构</label>
			<div class="layui-input-inline">
				<input type="text" name="in_name" disabled placeholder="请选择网站级别" autocomplete="of" class="layui-input notNull" lay-verify="notNull">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">角色</label>
			<div class="layui-input-inline">
				<input type="text" name="r_name" disabled placeholder="请输入日均访问量" autocomplete="of" class="layui-input notNull" lay-verify="notNull">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">当前时间</label>
			<div class="layui-input-inline">
				<jsp:useBean id="time" class="java.util.Date"/>
				<input type="text" value="<%=time%>" disabled class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe609;</i>立即提交</button>
				<button type="reset" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">重置</button>
			</div>
		</div>
	</form>
		</div>
		<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
		<script>
		var $=null;
		var form=null;
		var table=null;
		var data=null;
		var laydate=null;
		var upload=null;
		var url=null;
		var index=null;
		var tableload=null;
		layui.use(['table','form','laydate','upload'], function(){
		   table= layui.table;
		  $=layui.jquery;
		  form=layui.form;
		  laydate=layui.laydate;
		  upload=layui.upload;
			layer.msg('Hello World');//弹出框

		tableload = table.render({
        elem: '#newsList',
        url : 'LKusers/qu.do',
        cellMinWidth : true,
        page : true,
        id : "newsListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'u_id', title: 'ID', width:60, align:"center"},
            {field: 'u_name', title: '用户名', align:"center"},
            {field: 'u_pwd', title: '密码', align:"center"},
            {field: 'u_name', title: '修改人', align:"center"},
            {field: 'u_state', title: '账号状态', align:"center",templet:"#newsStatus"},
            {field: 'in_name', title: '所属机构', align:"center"},
            {field: 'r_name', title: '角色', align:"center"},
            {field: 'u_addtime', title: '注册时间', align:"center"},
            {field: 'u_updatetime', title: '修改时间', align:"center"},
            {title: '操作', width:120, templet:'#newsListBar',fixed:"right",align:"center"}
        ]]
    });
    
    //搜索
    $(".search_btn").on("click",function(){
    	var name =$(".searchVal").val();
        if(name != ''){
            table.reload("newsListTable",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
		        method:"post",
                where: {
                    u_name: name //搜索的关键字
                }
            });
        }else{
            layer.msg("请输入搜索的内容");
        }
    });
    
    //列表操作
    table.on('tool(newsList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
            update(data);
        }
    });
    
    form.on('submit(formDemo)', function(data){
		$("#fm").attr("action",url);
		$("#fm").submit();
	});

});
   //点击修改弹出模态框进行操作
  function update(data){
    url="LKusers/upus.do";
	//渲染表单数据
	form.val("fm",data);
  	index=layer.open({
	  title: '修改客户信息'
	  , type: 1
					,shadeClose: true //点击遮罩层关闭弹窗
					,anim: 4 //弹出动画
	,area:['350px','480px']
	  ,content: $("#addORup")
	}); 
  
  }
</script>
</body>
</html>
