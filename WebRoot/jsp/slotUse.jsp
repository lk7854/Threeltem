<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'advertiserStatement.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--jckS/selUse.do
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css">
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
  tableload=table.render({
    elem: '#slotShow'
    ,url: 'jckS/selUse.do' //数据接口
    ,cellMinWidth:true
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 's_name', title: '广告位'}
      ,{field: 'st_name', title: '广告位类型'}
    	,{field: 's_addtime', title: '添加时间', sort: true}
    	,{field: 's_state', title: '广告位状态',templet:function(f){
      		if(f.s_state==0) return '审核中';
      		if(f.s_state==1) return '未通过';
      		if(f.s_state==2) return '已通过';
      }}
     /*  ,{field: 'i_state', title: '广告位情况',templet:function(f){
      		if(f.s_state==0||f.s_state==1||f.s_state==2||f.s_state==3) return '未使用';
      		if(f.s_state==5) return '正在使用中';
      }} */
      ,{field: 'ch_name', title: '所属网站', sort: true}
      ,{field: 'cou', title: '使用次数', sort: true}
      ,{field: 's_addtime', title: '添加时间', sort: true}
      ,{field:'uname',title:'添加/修改人'}
    ]]
    });
  });
  </script>
  </head>
  
  <body>
   	 <table class="layui-hide" id="slotShow" lay-filter="demo"></table>
  </body>
</html>
