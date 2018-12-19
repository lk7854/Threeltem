<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
	<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
	<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/data.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/series-label.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
	<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
	<script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>

  </head>
  
  <body>
    <div id="container" style="min-width:400px;height:400px"></div>
	<div id="msg" class="message">
	
	</div>
	<center><a href="javascript:void(0)" onclick="closewin()">关闭</a></center>
	<script>
		function closewin(){ 
			self.opener=null; 
			self.close();
		} 
		var i=10;
		function clock(){
			i=i-1;
			$("#msg").html("该订单暂无点击数据，请稍后来看！当前页面将在"+i+"秒后自动关闭"); 
			if(i>0)
				setTimeout("clock();",1000); 
			else 
				closewin();
		} 
		var chart = null;
		// 获取 CSV 数据并初始化图表
		$.getJSON('http://localhost:8080/ThreeItem/click/getTableData.do',{"i_id":<%= request.getParameter("i_id") %>}, function(csv) {
			if(null==csv){
				clock(); 
			}
			chart = Highcharts.chart('container', {
				data: {
					csv: csv
				},
				title: {
					text: '订单-'+<%= request.getParameter("i_id") %>+'日常访问量'
				},
				subtitle: {
					text: '数据来源: 志远广告'
				},
				xAxis: {
					tickInterval: 3 * 24 * 3600 * 1000, // 坐标轴刻度间隔为3天
					tickWidth: 0,
					gridLineWidth: 1,
					labels: {
						align: 'left',
						x: 3,
						y: -3
					},
					// 时间格式化字符
					// 默认会根据当前的刻度间隔取对应的值，即当刻度间隔为一周时，取 week 值
					dateTimeLabelFormats: {
						week: '%Y-%m-%d'
					}
				},
				yAxis: [{ // 第一个 Y 轴，放置在左边（默认在坐标）
					title: {
						text: null
					},
					labels: {
						align: 'left',
						x: 3,
						y: 16,
						format: '{value:.,0f}'
					},
					showFirstLabel: false
				}, { // 第二个坐标轴，放置在右边
					linkedTo: 0,
					gridLineWidth: 0,
					opposite: true, // 通过此参数设置坐标轴显示在对立面
					title: {
						text: null
					},
					labels: {
						align: 'right',
						x: -3,
						y: 16,
						format: '{value:.,0f}'
					},
					showFirstLabel: false
				}],
				legend: {
					align: 'left',
					verticalAlign: 'top',
					y: 20,
					floating: true,
					borderWidth: 0
				},
				tooltip: {
					shared: true,
					crosshairs: true,
					// 时间格式化字符
					// 默认会根据当前的数据点间隔取对应的值
					// 当前图表中数据点间隔为 1天，所以配置 day 值即可
					dateTimeLabelFormats: {
						day: '%Y-%m-%d'
					}
				},
				plotOptions: {
					series: {
						cursor: 'pointer',
						point: {
							events: {
								// 数据点点击事件
								// 其中 e 变量为事件对象，this 为当前数据点对象
								click: function(e) {
									$('.message').html(Highcharts.dateFormat('%Y-%m-%d', this.x) + ':<br/>  访问量：' + this.y);
								}
							}
						},
						marker: {
							lineWidth: 1
						}
					}
				}
			});
		});
	</script>
  </body>
</html>
