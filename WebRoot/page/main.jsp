<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '404.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/public.css" media="all" />

  </head>
  
  <body class="childrenBody">
	<blockquote class="layui-elem-quote layui-bg-green">
		<div id="nowTime"></div>
	</blockquote>
	<div class="layui-row layui-col-space10 panel_box">
		<!-- <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
			<a href="javascript:;" data-url="http://fly.layui.com/case/u/3198216" target="_blank">
				<div class="panel_icon layui-bg-green">
					<i class="layui-anim seraph icon-good"></i>
				</div>
				<div class="panel_word">
					<span>打Call</span>
					<cite>小手点一下，认可靠大家(◍°∇°◍)ﾉﾞ</cite>
				</div>
			</a>
		</div>
		<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
			<a href="javascript:;" data-url="https://github.com/BrotherMa/layuicms2.0" target="_blank">
				<div class="panel_icon layui-bg-black">
					<i class="layui-anim seraph icon-github"></i>
				</div>
				<div class="panel_word">
					<span>论坛</span>
					<cite>用户交流O距离(*￣︶￣)</cite>
				</div>
			</a>
		</div> -->
		<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
			<a href="javascript:;" data-url="https://www.weibo.com/tbandy0618" target="_blank">
				<div class="panel_icon layui-bg-red">
					<i class="layui-anim seraph icon-oschina"></i>
				</div>
				<div class="panel_word">
					<span>微博</span>
					<cite>参与微博话题...</cite>
				</div>
			</a>
		</div>
		<!-- <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
			<a href="javascript:;" data-url="https://github.com/BrotherMa/layuicms2.0" target="_blank">
				<div class="panel_icon layui-bg-orange">
					<i class="layui-anim seraph icon-icon10" data-icon="icon-icon10"></i>
				</div>
				<div class="panel_word userAll">
					<span>我们</span>
					<em>平台用户统计୧(๑•̀◡•́๑)૭</em>
					<cite class="layui-hide">用户中心</cite>
				</div>
			</a>
		</div> -->
		<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
			<a href="javascript:;" data-url="page/systemSetting/icons.jsp">
				<div class="panel_icon layui-bg-cyan">
					<i class="layui-anim layui-icon" data-icon="&#xe857;">&#xe857;</i>
				</div>
				<div class="panel_word outIcons">
					<span>图标</span>
					<em>外部图标</em>
					<cite class="layui-hide">图标管理</cite>
				</div>
			</a>
		</div>
		<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
			<a href="javascript:;">
				<div class="panel_icon layui-bg-blue">
					<i class="layui-anim seraph icon-clock"></i>
				</div>
				<div class="panel_word">
					<span class="loginTime"></span>
					<cite>上次登录时间</cite>
				</div>
			</a>
		</div>
	</div>
	<!-- 内容 -->
	<!-- <blockquote class="layui-elem-quote main_btn">
	</blockquote> -->
	<div class="layui-row layui-col-space10">
		<div class="layui-col-lg6 layui-col-md12">
			<blockquote class="layui-elem-quote title">《用户手册》</blockquote>
			<div class="layui-elem-quote layui-quote-nm history_box magb0">
				<ul class="layui-timeline">
					<li class="layui-timeline-item">
						<i class="layui-icon layui-timeline-axis">&#xe756;</i>
						<div class="layui-timeline-content layui-text">
							<div class="layui-timeline-title">
								<h3 class="layui-inline">Ambitious广告 里程碑版本<span class="layui-red">ThreeItemV2.0版</span>发布　</h3>
								<span class="layui-badge-rim">2018-01-31</span>
							</div>
							<ul>
								<li>
									<blockquote class="layui-elem-quote title">请务必仔细阅读《更新日志》，避免使用中遇到一些简单的问题造成困扰。</blockquote>
								</li>
								<li class="layui-red layedit-tool-help">郑重提示：后期会对此系统继续进行更新开发，请持续关注我们。【依据用户反馈信息，进行开发和功能优化，请大家多多期待】</li>
								<li>开发样式采用的是：最新的layui2.x版本</li>
								<li class="layui-blue">由于开发小组存在一些X因素，所以一些布局和颜色搭配不是太完美，在此跟大家说声抱歉，大家可以根据自己的喜好进行一些调整。</li>
								<li>清除缓存，锁屏，系统公告，功能设定，皮肤设置，快去设置属于你的style吧！<a href="Javascript:;" target="_blank" class="layui-btn layui-btn-xs layui-btn-normal">快去使用吧</a></li>
							</ul>
						</div>
					</li>
					<li class="layui-timeline-item">
						<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<div class="layui-timeline-title">
								<h3 class="layui-inline">系统日志</h3>
								<span class="layui-badge-rim">2017-07-05</span>
							</div>
							<blockquote class="layui-elem-quote title">系统基本参数</blockquote>
			<table class="layui-table magt0">
				<colgroup>
					<col width="150">
					<col>
				</colgroup>
				<tbody>
				<tr>
					<td>用户/权限</td>
					<td class="userRights">${login.u_name }（${login.r_name }）</td>
				</tr>
				<tr>
					<td>当前版本</td>
					<td class="version">ThreeItemV2.0(京ICP备14040xxx号-1)</td>
				</tr>
				<tr>
					<td>开发方</td>
					<td class="author">ThreeItem广告科技有限公司——开发部A组</td>
				</tr>
				</tbody>
			</table>
						</div>
					</li>
					<li class="layui-timeline-item">
						<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<div class="layui-timeline-title">
								<h3 class="layui-inline">期待您的反馈　</h3>
								<span class="layui-badge-rim">2017-06-21</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
   </body>
</html>
