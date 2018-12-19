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
							<input type="text" class="layui-input searchVal" placeholder="请输入搜索的类型名称" />
						</div>
						<a class="layui-btn search_btn" data-type="reload">搜索</a>
					</div>
					<div class="layui-inline">
						<button type="button" class="layui-btn layui-btn-normal" onclick="add()">添加类型</button>
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
				<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event ="del">删除 </a>
			</script>
		</form>
		<!-- 添加/修改 -->
		<div id="addORup" hidden>
			<form class="layui-form" action="" lay-filter="fm" id="fm" method="post">
				<div class="layui-form-item input-item" hidden>
					<label class="layui-form-label">ID</label>
					<div class="layui-input-inline">
						<input type="text" name="pt_id">
					</div>
				</div>
				<div class="layui-form-item input-item">
					<label class="layui-form-label">类型名称</label>
					<div class="layui-input-inline">
						<input type="text" name="pt_name" placeholder="请输入名称" autocomplete="on" class="layui-input newsName" lay-verify="newsName">
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
					<label class="layui-form-label">当前时间</label>
					<div class="layui-input-inline">
						<jsp:useBean id="time" class="java.util.Date" />
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
			var $ = null;
			var form = null;
			var table = null;
			var data = null;
			var laydate = null;
			var upload = null;
			var url = null;
			var index = null;
			var tableload = null;
			layui.use(['table', 'form', 'laydate', 'upload'], function() {
				table = layui.table;
				$ = layui.jquery;
				form = layui.form;
				laydate = layui.laydate;
				upload = layui.upload;
				layer.msg('Hello World'); //弹出框

				tableload = table.render({
					elem: '#newsList',
					url: 'LKPosterType/qpt.do',
					cellMinWidth: true,
					page: true,
					id: "newsListTable",
					cols: [
						[
							{ type: "checkbox", fixed: "left", width: 50 },
							{ field: 'pt_id', title: 'ID', width: 60, align: "center" },
							{ field: 'pt_name', title: '广告类型', width: 350, align: "center" },
							{ field: 'u_name', title: '添加/修改人', align: "center" },
							{ field: 'pt_updateTime', title: '修改时间', align: "center" },
							{ title: '操作', width: 170, templet: '#newsListBar', fixed: "right", align: "center" }
						]
					]
				});

				//搜索
				$(".search_btn").on("click", function() {
					var name = $(".searchVal").val();
					if(name != '') {
						table.reload("newsListTable", {
							page: {
								curr: 1 //重新从第 1 页开始
							},
							method: "post",
							where: {
								pt_name: name //搜索的关键字
							}
						});
					} else {
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
			    })

				//批量删除
				$(".delAll_btn").click(function() {
					var checkStatus = table.checkStatus('newsListTable'),
						data = checkStatus.data,
						pt_ids = [];
					if(data.length > 0) {
						for(var i in data) {
							pt_ids.push(data[i].pt_id);
						}
						layer.confirm('确定删除选中的广告类型？', { icon: 3, title: '提示信息' }, function(index) {
							$.get("LKPosterType/delpt.do", {
								pt_ids: pt_ids.toString() //将需要删除的pt_id作为参数传入
							}, function(data) {
								if(data == false) {
									layer.msg('正在使用中,不能删除!');
									layer.close(index);
								} else {
									layer.msg('删除成功');
									tableload.reload();
								};
							});
							tableload.reload();
							layer.close(index);
						});
					} else {
						layer.msg("请选择需要删除的广告类型");
					}
				});

				//列表操作
				table.on('tool(newsList)', function(obj) {
					//获取点击的元素的lay-event属性值
					var layEvent = obj.event,
						//获取点击行的数据
						data = obj.data;
					if(layEvent === 'edit') { //编辑
						//alert(JSON.stringify(data));
						//填充数据打开窗口
						update(data);
					} else if(layEvent === 'del') { //删除
						layer.confirm('确定删除选中的广告类型？', { icon: 3, title: '提示信息' }, function(index) {
							$.get("LKPosterType/delpt.do", {
								pt_ids: data.pt_id //将需要删除的pt_id作为参数传入
							}, function(data) {
								if(data == false) {
									layer.msg('正在使用中,不能删除!');
									layer.close(index);
								} else {
									layer.msg('删除成功');
									tableload.reload();
								};
							});
							tableload.reload();
							layer.close(index);
						});
					}
				});

				form.on('submit(formDemo)', function(data) {
					$("#fm").attr("action", url);
					$("#fm").submit();
				});

			});
			//添加
			function add() {
				$("input[name='pt_name']").val("");
				url = "LKPosterType/addpt.do";
				index = layer.open({
					title: '添加类型',
					type: 1,
					area: ['350px', '280px'],
					content: $("#addORup")
				});
			}

			//修改
			function update(data) {
				url = "LKPosterType/uppt.do";
				//渲染表单数据
				form.val("fm", data);
				index = layer.open({
					title: '修改类型',
					type: 1,
					shadeClose: true, //点击遮罩层关闭弹窗
					anim: 4, //弹出动画
					area: ['350px', '280px'],
					content: $("#addORup"),
				});
			};
		</script>
	</body>

</html>