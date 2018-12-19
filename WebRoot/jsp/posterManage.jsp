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
<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css">
	<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
</head>
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
  tableload=table.render({
    elem: '#posterShow'
    ,url: 'posterCon/selPosters.do' //数据接口
    ,cellMinWidth:true
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'p_name', title: '广告'}
      ,{field: 'pt_name', title: '广告类型', sort: true}
      ,{field: 'p_url', title: '广告图片小图(可点击查看大图)',templet:function(f){
      		return "<a href='javascript:void(0)' onclick='ah(this)' purl='"+f.p_url+"'><img src='"+f.p_url+"' height='100%' width='100%'/></a>";
      }}
       ,{field: 'p_formPage', title: '广告链接', sort: true}
      ,{field: 'p_state', title: '广告状态', sort: true,templet:function(f){
      		if(f.p_state==0) return '审核中';
      		if(f.p_state==1) return '未通过';
      		if(f.p_state==2) return '已通过';
      }}
      ,{field: 'p_remark', title: '结果', sort: true}
      ,{fixed: 'right',title:'操作',  align:'center', toolbar: '#barDemo'}
    ]]
    ,done:[posterType()]
  });
  upload.render({
    elem: '#test'
    ,url: '/upload/'
    ,auto: false
    //,multiple: true
    /* ,bindAction: '#dem'
    ,done: function(res){
      console.log(res);
      //alert(res);
    } */
  });
   table.on('tool(demo)', function(obj){
    var data = obj.data;
     if(obj.event === 'del'){
     	$.post("posterCon/deletePosters.do",{"pid":data.p_id},function(data){
     		if(data==-1){
   				layer.msg('此广告正在投放或者使用中不能删除');
   				layer.close(index);
   			}else{
   				layer.msg('删除成功');
   				tableload.reload();
   			};
     	});
    } else if(obj.event === 'edit'){
    	update(data);
    };
  });
	  form.on('submit(demo1)', function(data){
	   	if (""==data.field.file && data.field.p_id==-1) {
			layer.msg('文件不能为空');
		}else{
			$("#placeAnOrder").attr("action",url);
			$("#placeAnOrder").submit();
		}
	  });
  });
  //当点击提交按钮的时候触发
  function submitp(){
  	$("input[name='file']").val();
  }
  //点击添加弹出模态框进行操作
  function add(){
  //当点击添加按钮的时候进行清空
  $("input[name='p_name']").val("");
  $("input[name='p_formPage']").val("");
  url="posterCon/addPoster.do";
  	index=layer.open({
	  title: '广告添加'
	  , type: 1
	,area:['480px','500px']
	  ,content: $("#placeAnOrder")
	}); 
  }
  //点击修改弹出模态框进行操作
  function update(data){
  url="posterCon/updatePoster.do";
  	$.post("posterCon/selectPost.do",{"p_id":data.p_id},function(datas){
   			if(datas==-2){
   				layer.msg('此广告正在投放或者使用中不能修改');
   				layer.close(index);
   				$("input[name='p_name']").val("");
   			}else{
   				//渲染表单数据
				form.val("fo",data);
			  	index=layer.open({
				  title: '广告修改'
				  , type: 1
				,area:['480px','500px']
				  ,content: $("#placeAnOrder")
				}); 
   			}
   	});
  
  }
  function posterType(){
	$.get("posterTypeCon/selPosters.do",function(data){
		for(var i=0;i<data.length;i++){
			$("#posterType").append("<option value='"+data[i].pt_id+"' id='"+data[i].pt_id+"'>"+data[i].pt_name+"</option>");
			$("#posterType2").append("<option value='"+data[i].pt_id+"' id='"+data[i].pt_id+"'>"+data[i].pt_name+"</option>");
		}
		form.render("select");
	});
}
  //显示图片
  function ah(a){
  	layer.open({
	  title: '图片显示'
	  ,offset: 't'
	  ,content: "<img src='"+$(a).attr("purl")+"' hight='100%' width='100%'/>"
	});   
  }
  function searchInfo(){
	table.reload('posterShow', {
	  where: {
	  	pt_id:$("#posterType2").val(),
	    p_state:$("#Pstate").val()
	  }
	});
}
  </script>
  </head>
  
  <body>
  	<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
	  <legend>操作</legend>
	  <div>
	    <form class="layui-form" action="">
	     
	    <div class="layui-form-item">
	    <button type="button" class="layui-btn layui-btn-normal" onclick="searchInfo()" lay-filter="sel">查询</button>
	    <button type="button" class="layui-btn layui-btn-normal" onclick="add()">添加</button>
	      <label class="layui-form-label">广告类型</label>
	     <div class="layui-input-inline">
	     
	      <select name="quiz1" id="posterType2">
	        <option value="">全部</option>
	      </select>
		    </div>
		     <label class="layui-form-label">广告状态</label>
		    <div class="layui-input-inline">
		      <select name="quiz2" id="Pstate">
		        <option value="">全部</option>
		        <option value="2">通过</option>
		        <option value="0">审核中</option>
		        <option value="1">未通过</option>
		      </select>
	    </div>
	    </div>
	    </form>
	  </div>
	</fieldset>
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	 <!-- <button class="layui-btn layui-btn-normal" onclick="update()">修改</button>
	  <button class="layui-btn layui-btn-normal">删除</button> -->
  	<form class="layui-form"  enctype="multipart/form-data" action="" style="width:80%;" id="placeAnOrder" lay-filter="fo" method="post" hidden>
			<input name="p_id" value="-1" hidden><br>
		<div class="layui-form-item">
			<label class="layui-form-label">广告名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="p_name" lay-verify="required">
			</div>
		</div><br><br>
		<div class="layui-form-item">
		<label class="layui-form-label">广告图片</label>
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test">选择文件</button>
			</div>
		</div><br>
		<div class="layui-form-item">
			<label class="layui-form-label">广告地址</label>
			<div class="layui-input-block">
				<input type="text" name="p_formPage" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入广告地址">
			</div>
		</div><br>
		<div class="layui-form-item">
			<label class="layui-form-label">广告类型</label>
			<div class="layui-input-block">
				<select lay-search id="posterType" name="pt_id">
    		
				</select>
			</div>
		</div><br><br>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="button" class="layui-btn layui-btn-primary">取消</button>
		    </div>
		</div>
	</form>
    <table class="layui-hide" id="posterShow" lay-filter="demo"></table>
  </body>
</html>
