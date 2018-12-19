<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
	<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
	<script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>
	<script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
</head>
<body>
	<div id="container" style="min-width:400px;height:400px"></div>
	<center><a href="javascript:void(0)" onclick="clsoe()">关闭</a></center>
	<script>
		function clsoe(){
			self.opener=null; 
			self.close();
		}
	
		$.get("../webuser/getData.do",{"u_id":'<%= request.getParameter("ids") %>'},function(map){
			var data1 = map.data;
			var chart = Highcharts.chart('container', {
				chart: {
					type: 'column'
				},
				title: {
					text: '网站主盈利情况'
				},
				subtitle: {
					text: '数据来源: 志远广告'
				},
				xAxis: {
					categories: [
						'一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'
					],
					crosshair: true
				},
				yAxis: {
					min: 0,
					title: {
						text: '盈利额(单位：元)'
					}
				},
				tooltip: {
					// head + 每个 point + footer 拼接成完整的 table
					headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
						'<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
					footerFormat: '</table>',
					shared: true,
					useHTML: true
				},
				plotOptions: {
					column: {
						borderWidth: 0
					}
				},
				series: data1
			});
		});
		
	</script>
</body>
</html>