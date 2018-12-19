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
    elem: '#slotShow'
    ,url: 'LKslot/qs.do' //数据接口
    ,cellMinWidth:true
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 's_name', title: '广告位'}
      ,{field: 'st_name', title: '广告位类型'}
      ,{field: 's_hight', title: '广告位高度', sort: true}
      ,{field: 's_width', title: '广告位宽度', sort: true}
       ,{field: 's_picture', title: '广告位小图(可点击查看大图)',templet:function(f){
    		return "<a href='javascript:void(0)' onclick='ah(this)' purl='"+f.s_picture+"'><img src='"+f.s_picture+"' height='100%' width='100%'/></a>";
    	}}
    	
    	,{field: 's_addtime', title: '添加时间', sort: true}
    	,{field: 's_state', title: '广告位状态',templet:function(f){
      		if(f.s_state==0) return '审核中';
      		if(f.s_state==1) return '未通过';
      		if(f.s_state==2) return '已通过';
      }}
      ,{field: 's_clickcount', title: '广告位点击量', sort: true}
      ,{field: 's_thousandsShow', title: '千次曝光金额', sort: true}
      ,{field: 's_singleclick', title: '单次点击价格', sort: true}
      ,{field: 's_url', title: '广告位地址', sort: true}
      ,{field: 's_remark', title: '结果'}
      ,{field:'uname',title:'添加/修改人',sort:true}
      ,{fixed: 'right',title:'操作',width:110,  align:'center', toolbar: '#barDemo'}
    ]]
    ,done:[slotType(),channel()]
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
     	$.post("jckS/deleteSlot.do",{"sid":data.s_id},function(data){
     		if(data==-1){
   				layer.msg('此广告位正在使用中不能删除');
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
   	if (""==data.field.file && data.field.s_id==-1) {
		layer.msg('文件不能为空');
	}else if(data.field.ch_id==0){
		layer.msg('请选择网站');
	}else if(data.field.st_id==0){
		layer.msg("请选择广告位类型");
	}else{
		$("#placeAnOrder").attr("action",url);
		$("#placeAnOrder").submit();
	}
  }); 
  });
  //点击添加弹出模态框进行操作
  function add(){
  //当点击添加按钮的时候进行清空
  $("#placeAnOrder input:gt(0)").val("");
  url="jckS/addSlot.do";
  	index=layer.open({
	  title: '广告位添加'
	  , type: 1
	,area:['500px','643px']
	  ,content: $("#placeAnOrder")
	}); 
  }
  //点击修改弹出模态框进行操作
  function update(data){	
	 // http://127.0.0.1:8080/ThreeItem
	  url="jckS/updateSlot.do";
	  if(parseInt(data.s_state)==0){
		  layer.msg('此广告位正在审核中不能修改');
		  layer.close(index);
		  $("#placeAnOrder input:gt(0)").val("");
	  }else{
		  $.post("jckS/selIn.do",{"s_id":data.s_id},function(datas){
	   			if(datas==-2){
	   				layer.msg('此广告位使用中不能修改');
	   				layer.close(index);
	   				$("#placeAnOrder input:gt(0)").val("");
	   			}else{
	   				//渲染表单数据
					form.val("fo",data);
				  	index=layer.open({
					  title: '广告位修改'
					  , type: 1
					,area:['500px','620px']
					  ,content: $("#placeAnOrder")
					}); 
	   			}
	   	});
	  }
  }
  //根据登陆人的id查询此登陆人的所有网站
  function channel(){
	  $.get("jckC/selChannel.do",function(data){
		  for(var i=0;i<data.length;i++){
				$("#channel").append("<option value='"+data[i].ch_id+"'>"+data[i].ch_name+"</option>");
			}
			form.render("select");
	  });
  }
  //查询广告位类型的全部数据
  function slotType(){
	$.get("jckST/slotType.do",function(data){
		for(var i=0;i<data.length;i++){
			$("#slotType").append("<option value='"+data[i].st_id+"' id='"+data[i].st_id+"'>"+data[i].st_name+"</option>");
			$("#slotType2").append("<option value='"+data[i].st_id+"' id='"+data[i].st_id+"'>"+data[i].st_name+"</option>");
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
	table.reload('slotShow', {
	  where: {
	  	st_id:$("#slotType2").val(),
	    s_state:$("#PTstate").val()
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
	      <label class="layui-form-label">广告位类型</label>
	     <div class="layui-input-inline">
	     
	      <select name="quiz1" id="slotType2">
	        <option value="">全部</option>
	      </select>
		    </div>
		     <label class="layui-form-label">广告位状态</label>
		    <div class="layui-input-inline">
		      <select name="quiz2" id="PTstate">
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
  	<form class="layui-form"  enctype="multipart/form-data" action="" style="width:80%;" id="placeAnOrder" lay-filter="fo" method="post" hidden>
			<input name="s_id" value="-1" hidden><br>
		<div class="layui-form-item">
			<label class="layui-form-label">广告位名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="s_name" lay-verify="required">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">广告位高度</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="s_hight" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">广告位宽度</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="s_width" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">日均点击量</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="s_clickcount" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">广告位图片</label>
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test">选择文件</button>
			</div>
		</div>
		
		
		<div class="layui-form-item">
			<label class="layui-form-label">千次曝光</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="s_thousandsShow" placeholder="金额" lay-verify="required">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">单次点击</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="s_singleclick" placeholder="金额" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">预览地址</label>
			<div class="layui-input-block">
				<input type="text" name="s_url" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入预览地址">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">广告位类型</label>
			<div class="layui-input-block">
				<select lay-search id="slotType" name="st_id">
    				<option value="0">请选择：</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">所属网站</label>
			<div class="layui-input-block">
				<select lay-search id="channel" name="ch_id">
    				<option value="0">请选择：</option>
				</select>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="button" class="layui-btn layui-btn-primary">取消</button>
		    </div>
		</div>
	</form>
    <table class="layui-hide" id="slotShow" lay-filter="demo"></table>
  </body>
</html>
