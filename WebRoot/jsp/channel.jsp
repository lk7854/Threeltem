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
				<div class="layui-inline">
					<button type="button" class="layui-btn layui-btn-normal" onclick="add()">添加网站</button>
				</div>
				<div class="layui-inline">
					<a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
				</div>
			</form>
		</blockquote>
		<table id="newsList" lay-filter="newsList"></table>
		
		<!--操作-->
		<script type="text/html" id="newsListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
		</script>
		<!--审核状态-->
		<script type="text/html" id="newsStatus">
		{{#  if(d.ch_state == "2"){ }}
		<span class="layui-red">等待审核</span>
		{{#  } else if(d.ch_state == "1"){ }}
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
						<input type="text" name="ch_id">
					</div>
				</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">网站名称</label>
			<div class="layui-input-inline">
				<input type="text" name="ch_name" placeholder="请输入网站名称" autocomplete="on" class="layui-input newsName" lay-verify="newsName">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">所属机构</label>
			<div class="layui-input-inline">
				<select name="in_id" lay-filter="notNull">
				  <option value="4">某某公司</option>
				  <option value="5" selected="">某某网站</option>
				</select>
				<!-- <select id="selectinID" onclick="addOptions()"></select> -->
				<!-- <input type="text" name="in_id" placeholder="请选择所属机构" autocomplete="of" class="layui-input notNull" lay-verify="notNull"> -->
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
			<label class="layui-form-label">网站状态</label>
			<div class="layui-input-inline">
				<!-- <input type="text" name="ch_state" placeholder="请输入名称" autocomplete="on" class="layui-input newsName" lay-verify="newsName"> -->
				<input type="radio" name="ch_state" value="2" title="等待" lay-filter="notNull">
				<input type="radio" name="ch_state" value="1" title="驳回" lay-filter="notNull">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">网站级别</label>
			<div class="layui-input-inline">
				<!-- <input type="text" name="gt_id" placeholder="请选择网站级别" autocomplete="of" class="layui-input notNull" lay-verify="notNull"> -->
				<select name="gt_id" lay-filter="notNull">
				  <option value="1">一级</option>
				  <option value="2">二级</option>
				  <option value="3" selected="">三级</option>
				  <option value="4">四级</option>
				  <option value="5">五级</option>
				  <option value="6">六级</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">日均访问量</label>
			<div class="layui-input-inline">
				<input type="text" name="gt_pv" placeholder="请输入日均访问量" autocomplete="of" class="layui-input notNull" lay-verify="notNull">
			</div>
		</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">网站链接</label>
			<div class="layui-input-inline">
				<input type="text" name="ch_url" placeholder="请正确输入网站链接" autocomplete="of" class="layui-input notNull" lay-verify="notNull">
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
        url : 'LKchannel/qch.do',
        cellMinWidth : true,
        page : true,
        id : "newsListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'ch_id', title: 'ID', width:60, align:"center"},
            {field: 'ch_name', title: '网站名', align:"center"},
            {field: 'in_name', title: '所属机构', align:"center"},
            {field: 'u_name', title: '修改人', align:"center"},
            {field: 'ch_state', title: '网站状态', align:"center",templet:"#newsStatus"},
            {field: 'gt_name', title: '网站级别', align:"center"},
            {field: 'gt_pv', title: '日均访问量', align:"center"},
            {field: 'ch_addtime', title: '创建时间', align:"center"},
            {field: 'ch_updatetime', title: '修改时间', align:"center"},
            {field: 'ch_url', title: '网站链接', align:"center"},
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
                    ch_name: name  //搜索的关键字
                }
            });
        }else{
            layer.msg("请输入搜索的内容");
        }
    });
    
    form.verify({
        newsName : function(val){
            if(val == ''){
                return "名称不能为空";
            }
        },
        notNull : function(val){
            if(val == ''){
                return "你有东西忘了填哦";
            }
        }
    });
    
    //批量删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('newsListTable'),
            data = checkStatus.data,
            ch_ids = [];
        if(data.length > 0) {
            for (var i in data) {
                ch_ids.push(data[i].ch_id);
            }
            layer.confirm('确定删除选中的网站？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("LKchannel/delch.do",{
                ch_ids : ch_ids.toString()  //将需要删除的ch_id作为参数传入
                },function(data){
	                if(data==false){
		   				layer.msg('正在使用中,不能删除!');
		   				layer.close(index);
	   				}else{
		   				layer.msg('删除成功');
		   				tableload.reload();
	   				};
                });
                tableload.reload();
                layer.close(index);
            });
        }else{
            layer.msg("请选择需要删除的网站");
        }
    });
    
    //列表操作
    table.on('tool(newsList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
            update(data);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除选中的网站？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("LKchannel/delch.do",{
                ch_ids : data.ch_id  //将需要删除的ch_id作为参数传入
                },function(data){
	                if(data==false){
		   				layer.msg('正在使用中,不能删除!');
		   				layer.close(index);
	   				}else{
		   				layer.msg('删除成功');
		   				tableload.reload();
	   				};
                });
                tableload.reload();
                layer.close(index);
            });
        }
    });
    
    form.on('submit(formDemo)', function(data){
		$("#fm").attr("action",url);
		$("#fm").submit();
	});

});

 //点击添加弹出模态框进行操作
 function add(){
	  url="LKchannel/addch.do";
	  index=layer.open({
	  title: '添加网站'
	  , type: 1
	  ,area:['350px','520px']
	  ,content: $("#addORup")
	}); 
 }
 
   //点击修改弹出模态框进行操作
  function update(data){
    url="LKchannel/upch.do";
	//渲染表单数据
	form.val("fm",data);
  	index=layer.open({
	  title: '修改网站信息'
	  , type: 1
					,shadeClose: true //点击遮罩层关闭弹窗
					,anim: 4 //弹出动画
	,area:['350px','520px']
	  ,content: $("#addORup")
	}); 
  
  };
  function addOptions(){
  	//下拉列表
	$.ajax({
    url:"LKusers/qin.do",
    dataType:'json',
    type:'post',
    success:function(data){
        $.each(data,function(index,item){
            $("#selectinID").append(new Option(item.name,item.id));//往下拉菜单里添加元素
        });
 
        form.render();//菜单渲染 把内容加载进去
    }
	});
	}
  
</script>
</body>
</html>
