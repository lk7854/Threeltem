<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Zhi-Yuan广告——个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />
	<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css">

  </head>
  
  <body class="childrenBody">
<form class="layui-form" enctype="multipart/form-data" method="post">
	<div class="layui-col-md3 layui-col-xs12 user_right">
		<div class="layui-upload-list">
			<img class="layui-upload-img layui-circle userFaceBtn userAvatar" id="userFace">
		</div>
	</div>
	<div class="layui-col-md6 layui-col-xs12">
		<div class="layui-form-item" hidden>
			<div class="layui-input-block">
				<input type="text" name="u_id" value="${login.u_id }" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-block">
				<input type="text" value="${login.u_name }" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色</label>
			<div class="layui-input-block">
				<input type="text" value="${login.r_name }" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">账户余额</label>
			<div class="layui-input-inline">
				<input type="text" value="${login.ab_money }￥" readonly class="layui-input layui-readonly">
			</div>
				<button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-normal" onclick="addM()"><i class="layui-icon">&#xe6c6;</i>充值</button>
				<!-- <button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger"><i class="layui-icon">&#xe6c5;</i>提现</button> -->
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">冻结金额</label>
			<div class="layui-input-block">
				<input type="text" value="${login.ab_freezeMoney }￥" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item" hidden>
			<div class="layui-input-block">
				<input type="text" name="in_id" value="${login.in_id }" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">隶属机构</label>
			<div class="layui-input-block">
				<input type="text" value="${login.in_name }" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">地址</label>
			<div class="layui-input-block">
				<input type="text" name="in_address" value="${login.in_address }" lay-verify="required" placeholder="请输入地址" class="layui-input realName">
			</div>
		</div>
		<!-- <div class="layui-form-item">
			<label class="layui-form-label">营业执照</label>
			<button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm"><i class="layui-icon">&#xe615;</i>预览</button>
			<button type="button" class="layui-btn" id="certificate"><i class="layui-icon"></i>重新上传营业执照</button>
		</div>  -->  
		<div class="layui-form-item">
			<label class="layui-form-label">负责人</label>
			<div class="layui-input-block">
				<input type="text" name="in_man" value="${login.in_man }" placeholder="请输入真实姓名" lay-verify="required" class="layui-input realName">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号码</label>
			<div class="layui-input-block">
				<input type="tel" name="in_phone" value="${login.in_phone }" placeholder="请输入手机号码" lay-verify="phone" class="layui-input userPhone">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<textarea name="in_remark" placeholder="请输入内容" class="layui-textarea myself">${login.in_remark }</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button  type="button" class="layui-btn layui-btn-radius" lay-submit lay-filter="formuser">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</div>
</form>
<div id="addMoney" hidden>
			<form class="layui-form" action="" lay-filter="fm" id="fm" method="post">
				<div class="layui-form-item input-item" hidden>
					<label class="layui-form-label">ID</label>
					<div class="layui-input-inline">
						<input type="text" name="ab_id" value="${login.ab_id }">
					</div>
				</div>
		<div class="layui-form-item input-item">
			<label class="layui-form-label">充值</label>
			<div class="layui-input-inline">
				<input type="text" name="ab_money" placeholder="请输入充值金额" autocomplete="of" class="layui-input xMoney" lay-verify="newsName">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe609;</i>充值</button>
				<button type="reset" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">重置</button>
			</div>
		</div>
	</form>
		</div>
<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
<script type="text/javascript" src="js/user/userInfo.js"></script>
<script type="text/javascript" src="js/cacheUserInfo.js"></script>
<script type="text/javascript" src="js/login/login.js"></script>
<script>
			var layer = null;
			var form = null;
			var upload = null;
			layui.use(['layer', 'form','upload'], function() {
				layer = layui.layer;
				form = layui.form;
 				upload = layui.upload;
 				
 				//图片
				upload.render({
				  elem: '#certificate'
				  ,url: '/upload/'
				  ,auto: false
				});
			
				//监听提交
				form.on('submit(formuser)', function(data) {
					$.ajax({
	                url: "LKusers/upin.do",
	                data:data.field,
	                type: "post",
	                success: function (info) {
	                    if (info == 1) {
	                    	layer.msg("修改成功,需重新登录刷新数据！");
	                    	setTimeout(function(){
	                    		parent.location.reload();
	                    	},2000);
	                    }
	                }
	            });
	            return false;
				});
				
    form.on('submit(formDemo)', function(data){
		$("#fm").attr("action",url);
		$("#fm").submit();
	});
				
			});
			 //点击添加弹出模态框进行操作
			 function addM(){
				url="LKusers/addm.do?ab_money="+$(".xMoney").val();
			  	index=layer.open({
				  title: '充值'
				  , type: 1
					,shadeClose: true //点击遮罩层关闭弹窗
					,anim: 4 //弹出动画
				  ,area:['350px','150px']
				  ,content: $("#addMoney")
				}); 
			 }
		</script>
</body>
</html>