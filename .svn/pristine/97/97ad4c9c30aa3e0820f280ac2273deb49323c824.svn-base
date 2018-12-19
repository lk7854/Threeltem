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
	<script type="text/javascript" src="js/ordersInfo.js"></script>
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
					{field:"s_addtime",title:"新增时间",sort:true,align:"center"},
					{field:"s_clickcount",title:"点击量",sort:true,align:"center"},
					{field:"s_state",title:"状态",sort:true,width:80,align:"center",templet:function(d){
						if(d.s_state==0){return "<i style='color:red'>待审核</i>";}
						if(d.s_state==1){return "<i style='color:black'>未通过</i>";}
						if(d.s_state==2){return "<i style='color:blue'>通过</i>";}
					}},
					{field:"uname",title:"创建/修改人",width:105,align:"center"},
					{field:"s_updatetime",title:"修改时间",sort:true,align:"center"},
					{field:"",title:"操作",align:"center",width:150,toolbar:"#tool",fixed:"right"},
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
					if(clickdata.s_state==0){
						showWin(clickdata);
					} else {
						layer.msg("不能重复审核",{icon:5});
					}
				}
			});
			//监听下拉列表
			form.on("select(selectstate)",function(data){
				query();
			});
		});
		
		//审核订单
		function showWin(data){
			//渲染表单数据
			form.val("fm",data);
			//打开窗口
			var index = layer.open({
				title:"订单详情",
				type:1,
				icon:6,
				shadeClose:true,//点击遮罩层关闭弹窗
				anim:4,//弹出动画
				content:$('#content'),
				area: ['500px', '450px'],//宽高
				btn:['通过','驳回','取消'],
				btnAlign:'c',
				yes:function(){
					checkindent(index,2);//通过
				},
				btn2:function(){
					checkindent(index,1);//驳回
					return false;
				}
			});
		}
		
		//详情窗口
		function showWinDetails(data){
			form.val("fm",data);
			//打开窗口
			var index = layer.open({
				title:"订单详情",
				type:1,
				icon:6,
				shadeClose:true,//点击遮罩层关闭弹窗
				anim:4,//弹出动画
				content:$('#content'),
				area: ['500px', '450px']//宽高
			});
		}
		
		//审核订单，返回审核备注信息
		function checkindent(openindex,statecode){
			var remark = "";
			//输入层
			layer.prompt({
				formType:2,//输入框类型，支持0（文本）默认1（密码）2（多行文本）
				value:"",
				title:"审核备注(可以为空)",
				area:['200px','150px']
			},function(value,index){
				remark = value;
				layer.close(index);//关闭输入层
				var title = "";
				if(statecode == 2){title="通过";}
				if(statecode == 1){title="驳回";}
				layer.confirm("确定"+title+"?",{icon:3,title:"审核提示"},function(i){
					//提交数据
					//广告编号
					var s_id = $("#s_id").val();
					var u_id = $("#u_id").val();
					var s_name = $("#s_name").val();
					$.post("slot/check.do",{
						"s_id":s_id,
						"s_name":s_name,
						"s_state":statecode,
						"s_remark":remark,
						"u_id":u_id
					},function(data){
						if(data){
							layer.msg("操作成功！",{icon:1});
							treload.reload();
						} else {
							layer.msg("操作失败！",{icon:5});
						}
					});
					layer.close(i);//关闭确认通过窗口
					layer.close(openindex);//关闭open窗口
				});
			});
		}
		//根据编号,和广告名查询订单
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
		<a class="layui-btn layui-btn-radius layui-btn-xs " lay-event="detail">详情</a>
		<a class="layui-btn layui-btn-radius layui-btn-xs layui-btn-danger" lay-event="check">审核</a>
	</script>
	<!-- 详情框 -->
    <div hidden id="content">
    	<form id="fm" method="post" style="width:100%; margin-top:5px;" lay-filter="fm" class="layui-form">
    		<div class="layui-form-item">
			    <label class="layui-form-label">编号</label>
			    <div class="layui-input-block">
			      <input readonly="readonly" style="width:330px;" id="s_id" name="s_id" required  lay-verify="required" class="layui-input">
			    </div>
			 </div>
    		<div class="layui-form-item">
			    <label class="layui-form-label">名称</label>
			    <div class="layui-input-block" style="width:330px;">
				    <input type="text" id="s_name" name="s_name" style="width:330px;" required  lay-verify="required" class="layui-input">
			    </div>
			 </div>
    		<div class="layui-form-item">
			    <label class="layui-form-label">类型</label>
			    <div class="layui-input-block">
			      <input type="text" name="st_name" style="width:330px;" required  lay-verify="required" class="layui-input">
			    </div>
			</div>
    		<div class="layui-form-item">
			    <label class="layui-form-label">点击量</label>
			    <div class="layui-input-block">
			      <input type="text" name="s_clickcount" style="width:330px;" required  lay-verify="required" class="layui-input">
			    </div>
			</div>
    		<div class="layui-form-item">
			    <label class="layui-form-label">备注</label>
			    <div class="layui-input-block">
			      <input type="text" name="s_remark" style="width:330px;" required  lay-verify="required" class="layui-input">
			    </div>
			</div>
			<input type="text" hidden id="img1" name="s_picture">
			<input hidden name="u_id" id="u_id">
    	</form>
    	<label class="layui-form-label">预览</label>
    	<div class="layui-btn-group " style="width:70%;text-align: left;">
			<a class="layui-btn" onclick="show1('img1')">广告位</a>
		</div>
    </div>   
    
  </body>
</html>
