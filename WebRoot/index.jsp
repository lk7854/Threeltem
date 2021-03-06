<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>Ambitious 广告——首页</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<!-- Load fonts -->
		<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'>

		<!--Load styles -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
		<link rel="stylesheet" type="text/css" href="css/animate.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">

		<!-- layui -->
		<link rel="stylesheet" href="layui-v2.3.0/layui/css/layui.css">

		<!-- layui -->
		<script type="text/javascript" src="layui-v2.3.0/layui/layui.js"></script>
		<script type="text/javascript" src="js/login/login.js"></script>
		<script>var layer = null;
var form = null;
var laydate = null;
var upload = null;
var element = null;
layui.use(['layer', 'form', 'laydate', 'upload', 'element'], function() {
	layer = layui.layer;
	form = layui.form;
	laydate = layui.laydate;
	upload = layui.upload;
	element = layui.element;

	//日期
	laydate.render({
		elem: '#date1'
	});

	//图片
	upload.render({
		elem: '#certificate',
		url: '/upload/',
		auto: false
	});

	//表单验证
	form.verify({
		username: function(value, item) { //value：表单的值、item：表单的DOM对象
			if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
				return '用户名不能有特殊字符';
			}
			if(/(^\_)|(\__)|(\_+$)/.test(value)) {
				return '用户名首尾不能出现下划线\'_\'';
			}
		},
		pwd: [/^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格'],
		inname: function(value, item) { if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) { return '机构名不能有特殊字符'; } if(/(^\_)|(\__)|(\_+$)/.test(value)) { return '机构名首尾不能出现下划线\'_\''; } if(/^\d+\d+\d$/.test(value)) { return '机构名不能全为数字'; } },
		address: function(value, item) { if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) { return '地址不能有特殊字符'; } if(/(^\_)|(\__)|(\_+$)/.test(value)) { return '地址首尾不能出现下划线\'_\''; } if(/^\d+\d+\d$/.test(value)) { return '地址不能全为数字'; } },
		inman: function(value, item) { if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) { return '负责人不能有特殊字符'; } if(/(^\_)|(\__)|(\_+$)/.test(value)) { return '负责人首尾不能出现下划线\'_\''; } if(/^\d+\d+\d$/.test(value)) { return '负责人不能全为数字'; } },
		inphone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！'],
	});

	//单选按钮单击事件
	form.on('radio(r_r)', function(data) {
		//layer.msg('显示'+ (this.checked ? 'true' : 'false'), {offset: '6px'});
		//alert(data.value);
		rr(data);
	});

	function rr(obj) {
		//alert(obj.value);
		var r = obj.value;
		if(r == "3") {
			//alert("隐藏");
			$("#d1").hide();
			$("#i1").hide();
		} else {
			//alert("显示");
			$("#d1").show();
			$("#i1").show();
		}
	};

	//监听提交
	form.on('submit(formDemo)', function(data) {
		layer.msg("asaffaf");
		//alert(JSON.stringify(data.field));
		/* if (""==data.field.file && data.field.p_id==-1) {
			layer.msg('文件不能为空');
		}else{
			$("#placeAnOrder").attr("action",url);
			$("#placeAnOrder").submit();
		} */
	});

});</script>
	</head>

	<body>
		<header>
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<a class="navbar-brand" href="#"><img src="favicon.ico" alt="Seven HTML theme" /></a>
						<a class="navbar-brand" href="#" style="font-size:30px;margin-top: 10px;">Ambitious 广告</a>
						<a class="navbar-brand" href="#" style="margin-top: 15px;"><b>效果意料之外,服务情理之中,您最放心的选择——</b><i>志远广告科技有限公司</i></a>
					</div>
					<div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li>
								<a data-scroll href="index.html#home">首页</a>
							</li>
							<li>
								<a data-scroll href="index.html#services">设计理念</a>
							</li>
							<li>
								<a data-scroll href="index.html#portfolio">成果演示</a>
							</li>
							<li>
								<a data-scroll href="index.html#about">我们的团队</a>
							</li>
							<li>
								<a data-scroll href="index.html#contact">加入我们</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div id="home" class="jumbotron slide">
			<div class="container">
				<span>大内容、大数据</span>
				<h1>品效合一 抢占先机</h1>
				<h1>面向区域企业提供整合营销推广服务</h1>
				<a href="page/login/login.jsp" class="btn btn-lg btn-primary button--ujarak" >登录</a>
			</div>
		</div>
		<!-- Start services section -->
		<section id="services">
			<div class="container">
				<header>
					<h2 class="wow fadeInDown">设计是我们的燃料</h2>
					<p class="wow fadeInUp" data-wow-delay="0.1s">Lorem存有悲坐阿梅德，consectetur adipiscing ELIT，sed的tempor和活力，使劳动和悲伤，一些重要的事情要做eiusmod。多年来，我会来的，谁将会nostrud aliquip了她锻炼的优势，使刺激措施，如果学区和长寿。
					</p>
				</header>
				<div class="row">
					<div class="col-md-4">
						<div class="service-item text-right wow fadeInUp">
							<div class="service-text">
								<h3>设计</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod empor incididunt ut labore et dolore magna aliqua.
								</p>
							</div>
							<div class="service-icon">
								<i class="fa fa-diamond"></i>
							</div>
						</div>
						<div class="service-item text-right wow fadeInUp" data-wow-delay="0.1s">
							<div class="service-text">
								<h3>编码</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod empor incididunt ut labore et dolore magna aliqua.
								</p>
							</div>
							<div class="service-icon">
								<i class="fa fa-code"></i>
							</div>
						</div>
					</div>
					<div class="col-md-4 text-center">
						<img src="img/phone.png" alt="Phone" />
					</div>
					<div class="col-md-4">
						<div class="service-item text-left wow fadeInUp">
							<div class="service-text">
								<h3>摄影</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod empor incididunt ut labore et dolore magna aliqua.
								</p>
							</div>
							<div class="service-icon">
								<i class="fa fa-camera"></i>
							</div>
						</div>
						<div class="service-item text-left wow fadeInUp" data-wow-delay="0.1s">
							<div class="service-text">
								<h3>应用</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod empor incididunt ut labore et dolore magna aliqua.
								</p>
							</div>
							<div class="service-icon">
								<i class="fa fa-cubes"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</section>
		<!-- End services section -->

		<!-- Start portfolio section -->
		<section id="portfolio">
			<header>
				<h2 class="wow fadeInDown">到目前为止我们做了什么</h2>
				<p class="wow fadeInUp" data-wow-delay="0.1s">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
				</p>
			</header>
			<div class="content" id="filter-controls">
				<nav class="centered-pills clearfix">
					<ul class="nav nav-pills">
						<li>
							<a href="javascript:void(0);" class="filter active" data-filter="all">所有</a>
						</li>
						<li>
							<a href="javascript:void(0);" class="filter" data-filter=".mockups">样机</a>
						</li>
						<li>
							<a href="javascript:void(0);" class="filter" data-filter=".icons">图标</a>
						</li>
						<li>
							<a href="javascript:void(0);" class="filter" data-filter=".ui-kits">UI套件</a>
						</li>
						<li>
							<a href="javascript:void(0);" class="filter" data-filter=".templates">模板</a>
						</li>
					</ul>
				</nav>
				<div class="projects row">
					<figure class="mix all portfolio-item icons col-md-3 col-sm-6">
						<img class="img-responsive" src="img/portfolio/adena.png" alt="Adena icons pack" />
						<figcaption class="mask">
							<h3>Adena icons pack</h3>
							<span>Icons</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item ui-kits col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/atom.png" alt="Atom UI Kit" />
						<figcaption class="mask">
							<h3>Atom UI Kit</h3>
							<span>UI Kits</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item icons col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/flat.png" alt="60 flat icons" />
						<figcaption class="mask">
							<h3>60 flat icons</h3>
							<span>Icons</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item mockups col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/ipad.jpg" alt="iPad mockup" />
						<figcaption class="mask">
							<h3>iPad Mockup</h3>
							<span>Mockups</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item templates col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/ket.jpg" alt="Ket singlpage PSD template" />
						<figcaption class="mask">
							<h3>Ket Web template</h3>
							<span>Tempaltes</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item templates col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/mentum.png" alt="Mentum web theme" />
						<figcaption class="mask">
							<h3>Mentum web theme</h3>
							<span>Templates</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item web mockups col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/modern-phone.jpg" alt="Smartphone mockup" />

						<figcaption class="mask">
							<h3>Smartphone mockup</h3>
							<span>Mockups</span>
						</figcaption>
					</figure>
					<figure class="mix portfolio-item print ui-kits col-md-3  col-sm-6">
						<img class="img-responsive" src="img/portfolio/sven.jpg" alt="Sven UI Kit" />
						<figcaption class="mask">
							<h3>Sven UI Kit</h3>
							<span>UI Kits</span>
						</figcaption>
					</figure>

				</div>
			</div>
		</section>
		<!-- End portfolio section -->
		<div class="copyrights">Collect from
			<a href="http://www.cssmoban.com/" title="网站模板">网站模板</a>
		</div>
		<!-- Start about section -->
		<section id="about">
			<div class="container">
				<header>
					<h2 class="wow fadeInDown">认识我们的团队</h2>
					<p class="wow fadeInUp" data-wow-delay="0.1s">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
					</p>
				</header>
				<div class="row">
					<div class="col-sm-4 wow fadeInUp">
						<div class="team-member">
							<div class="member-photo">
								<img src="img/team/team-3.jpg" class="img-responsive" alt="Team member 1">
								<div class="overlay">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing.
									</p>
									<ul class="social">
										<li>
											<a href=""><i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a href=""><i class="fa fa-twitter"></i></a>
										</li>
										<li>
											<a href=""><i class="fa fa-pinterest"></i></a>
										</li>
									</ul>
								</div>
							</div>
							<div class="basic-info">
								<h4>John Doe</h4>
								<span>Graphic designer</span>
							</div>
						</div>
					</div>
					<div class="col-sm-4 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-member">
							<div class="member-photo">
								<img src="img/team/team-2.jpg" class="img-responsive" alt="Team member 1">
								<div class="overlay">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing.
									</p>
									<ul class="social">
										<li>
											<a href=""><i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a href=""><i class="fa fa-twitter"></i></a>
										</li>
										<li>
											<a href=""><i class="fa fa-pinterest"></i></a>
										</li>
									</ul>
								</div>
							</div>
							<div class="basic-info">
								<h4>John Doe</h4>
								<span>Graphic designer</span>
							</div>
						</div>
					</div>
					<div class="col-sm-4 wow fadeInUp" data-wow-delay="0.2s">
						<div class="team-member">
							<div class="member-photo">
								<img src="img/team/team-1.jpg" class="img-responsive" alt="Team member 3">
								<div class="overlay">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing.
									</p>
									<ul class="social">
										<li>
											<a href=""><i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a href=""><i class="fa fa-twitter"></i></a>
										</li>
										<li>
											<a href=""><i class="fa fa-pinterest"></i></a>
										</li>
									</ul>
								</div>
							</div>
							<div class="basic-info">
								<h4>John Doe</h4>
								<span>Graphic designer</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End about section -->
		<!-- Start  section -->
		<section id="contact">
			<header>
				<h2 class="wow fadeInDown">加入我们</h2>
				<p class="wow fadeInUp" data-wow-delay="0.1s">
					<b style="color:red;">温馨提示：</b>凡注册用户均需<u style="color:orange;"><b>等待审核才能登录使用</b></u>，时间为 <i style="color:blue;"><b>1-2个工作日</b></i>，<b style="font-size:18px;">我们会以短信的形式通知您</b>敬请谅解...
				</p>
			</header>
			<div class="container" style="margin-left:500px;">
				<div class="left">
					<div class="right">
						<div id="registe" class="form-container col-xs-12 col-md-5">
							<div class="divider">
								<span style="color:orange;font-size:18px;">ி_企业注册</span>
							</div>
							<form class="layui-form" action="LKusers/personal.do" enctype="multipart/form-data" method="post">
								<div style="border:solid 1px orange;width: 300px;">
								<div class="layui-form-item input-item">
									<label class="layui-form-label">账号</label>
									<div class="layui-input-inline">
										<input type="text" id="username" name="u_name" required lay-verify="required|username" placeholder="请输入账号" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item input-item" hidden>
									<label class="layui-form-label">密码</label>
									<div class="layui-input-inline">
										<input type="text" id="pwd" value="123456" name="u_pwd" readonly required lay-verify="required|pwd" placeholder="默认登录密码：123456" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item input-item">
									<label class="layui-form-label">我是</label>
									<div class="layui-input-block">
										<input type="radio" id="r_radio3" name="r_id" value="3" title="广告主" lay-filter="r_r" checked>
										<input type="radio" id="r_radio4" name="r_id" value="4" title="网站主" lay-filter="r_r">
									</div>
								</div>
								</div>
								<!-- 机构表+网站表 --><span style="color:blue;font-size:16px;">☺_信息完善</span><br>
								<i id="i1" hidden>__网站__✎</i>
								<div id="d1" style="border:solid 1px blue;width: 300px;" hidden>
								<div class="layui-form-item input-item" >
									<label class="layui-form-label">网站名</label>
									<div class="layui-input-inline">
										<input type="text" name="ch_name" lay-verify="" placeholder="请输入网站名" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item input-item" >
									<label class="layui-form-label">点击量</label>
									<div class="layui-input-inline">
										<input type="text" name="gt_pv" lay-verify="" placeholder="请输入网站点击量/日" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item input-item" >
									<label class="layui-form-label">链接</label>
									<div class="layui-input-inline">
										<input type="text" name="ch_url" lay-verify="" placeholder="请输入网站链接地址" autocomplete="on" class="layui-input">
									</div>
								</div>
								</div>
								<i id="i2">__机构__✎</i>
								<div style="border:solid 1px blue;width: 300px;">
								<div class="layui-form-item input-item">
									<label class="layui-form-label">机构名</label>
									<div class="layui-input-inline">
										<input type="text" id="inname" name="in_name" lay-verify="required|inname" placeholder="请输入机构名" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item input-item">
									<label class="layui-form-label">地址</label>
									<div class="layui-input-inline">
										<input type="text" id="address" name="in_address" required lay-verify="required|address" placeholder="请输入机构地址" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">营业照</label>
								  	<div class="layui-upload">
								  		<button type="button" class="layui-btn" id="certificate"><i class="layui-icon"></i>上传营业执照</button>
									</div>
								</div>   
								<div class="layui-form-item input-item">
									<label class="layui-form-label">负责人</label>
									<div class="layui-input-inline">
										<input type="text" id="inman" name="in_man" required lay-verify="required|inman" placeholder="请输入负责人" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item input-item">
									<label class="layui-form-label">手机号</label>
									<div class="layui-input-inline">
										<input type="text" id="inphone" name="in_phone" required lay-verify="required|inphone" placeholder="请输入手机号" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item layui-form-text input-item">
									<label class="layui-form-label">备注</label>
									<div class="layui-input-inline">
										<textarea name="in_remark" placeholder="例:这是一个（广告/网站）主" class="layui-textarea"></textarea>
									</div>
								</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn layui-btn-radius layui-btn-warm" lay-submit lay-filter="formDemo">立即提交</button>
										<button type="reset" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End contact section -->
		<!-- Start footer section -->
		<footer>
			<div class="container">
				<p class="copyright">
					&copy; Ambitious :
					<a href="#" target="_blank">
						<b></b></a>-More Templates
					<a href="http://www.cssmoban.com/" target="_blank" title="Ambitious 广告">志远广告科技有限公司</a> - Collect from
					<a href="http://www.cssmoban.com/" title="Ambitious 广告" target="_blank">(京ICP备14040xxx号-1)</a>
				</p>
				<ul class="social">
					<li class="wow bounceIn">
						<a href="#/RqhEjP" target="_blank"><i class="fa fa-facebook"></i></a>
					</li>
					<li class="wow bounceIn" data-wow-delay="0.1s">
						<a href="#/hUfpSB" target="_blank"><i class="fa fa-twitter"></i></a>
					</li>
					<li class="wow bounceIn" data-wow-delay="0.2s">
						<a href="#/k9zAy5" target="_blank"><i class="fa fa-dribbble"></i></a>
					</li>
					<li class="wow bounceIn" data-wow-delay="0.3s">
						<a href="#/FPjuCE" target="_blank"><i class="fa fa-behance"></i></a>
					</li>
					<li class="wow bounceIn" data-wow-delay="0.4s">
						<a href="#/UYjGTR" target="_blank"><i class="fa fa-pinterest"></i></a>
					</li>
					<li class="wow bounceIn" data-wow-delay="0.5s">
						<a href="#/r4xzR4" target="_blank"><i class="fa fa-google"></i></a>
					</li>
				</ul>
				<a href="index.html#home" data-scroll class="back-to-top"><i class="fa fa-chevron-up"></i></a>
			</div>
		</footer>
		<!-- End footer section -->
	<!-- Load jQuery -->
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>

	<!-- Load Booststrap -->
	<script type="text/javascript" src="js/bootstrap.js"></script>

	<!-- Load custom js plugins -->
	<script type="text/javascript" src="js/jquery.mixitup.js"></script>
	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/wow.js"></script>
	<script type="text/javascript" src="js/smooth-scroll.js"></script>

	<!-- Load custom js for theme -->
	<script type="text/javascript" src="js/app.js"></script>
</body>
</html>