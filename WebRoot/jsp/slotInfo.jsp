<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'slotInfo.jsp' starting page</title>
    
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
var index=null;
layui.use(['table','form'], function(){
   table= layui.table;
  $=layui.jquery;
  form=layui.form;
  table.render({
    elem: '#slotShow'
    ,url: 'jckS/showSlot.do' //数据接口
    ,cellMinWidth:true
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 's_name', title: '广告位名'}
      ,{field: 's_hight', title: '广告位高度', sort: true}
      ,{field: 's_width', title: '广告位宽度', sort: true} 
      ,{field: 's_singleclick', title: '单次点击价格', sort: true}
      ,{field: 's_thousandsShow', title: '千次曝光价格', sort: true}
       ,{field: 's_clickcount', title: '广告位点击量', sort: true}
      ,{field: 'st_name', title: '广告位类型'}
      ,{field: 's_picture', title: '广告位小图',templet:function(f){
      		return "<img src="+f.s_picture+" style='height:100%;width:100%;' />";
      }}
      ,{field: 'ch_name', title: '网站'}
      ,{field: 'gt_pv', title: '日均访问量', sort: true}
      ,{fixed: 'right', align:'center', toolbar: '#barDemo'}
    ]]
    ,done:[slotType(),channel(),showPoster()]
  });
  //图片层的监听事件
  layer.photos({
	  photos: '#layer-photos-demo'
	  ,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
	});
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent == 'detail'){
	      layer.open({
	      type:1
	      ,shade:0
		  ,title: '广告位预览(图中带彩色部分为广告位)'
		  ,area:['928px','580px']
		  ,content: $("#div1")
		  ,shadeClose:false
		  ,maxmin:true
		  ,moveOut: true
		}); 
		if(images(data)){
				
				$("#layer-photos-demo").append("<img layer-src='"+data.s_picture+"' src='"+
					data.s_picture+"' alt='网站-->"+data.ch_name+",广告位类型-->"+data.st_name+",广告位-->"+
					data.s_name+"'  height='300px;' width='300px;' sid='"+data.s_id+"'/>");
					$("#img").remove();
		}
    } else if(layEvent == 'order'){
    	$("#placeAnOrder input").val("");
    	$.get("jckIn/getIndentMoney.do",function(dat){
    		if(dat==0){
    			//填充表单
				form.val("fo",data);
				//打开新建订单的窗口
		      	index=layer.open({
				  title: '订单制作'
				  , type: 1
				  ,area:['520px']
				  ,content: $("#placeAnOrder")
				}); 
    		}else{
    			layer.confirm("您有超出预算的订单，超出"+dat+"元，是否续费(续费原则：从余额里面扣除)？",{
	  				btn:['续费','取消']
	  				,yes:function(inde,layero){
	  					$.get("jckIn/updateMoney.do",function(da){
	  						if (da==1) {
								layer.msg("续费成功！可以下订单啦",{icon:6});
							}else if(da==-1){
								layer.msg("金额不足请充值",{icon:5});
							}else{
								layer.msg("续费失败",{icon:5});
							}
	  					});
	  				}
  				});
    		}
    	}); 
      	
    }
  });
	
  form.on('submit(demo1)', function(data){
  
  	//总价格/((千次曝光的价格/1000+单次点击的价格)*每天的这个广告位的点击量)
  	//预算金额(订单金额)
  	var i_money=data.field.i_money;
  	//单次曝光金额
  	var s_thousandsShow=parseInt(data.field.s_thousandsShow)/1000;
  	//单次点击金额
  	var s_singleclick=parseInt(data.field.s_singleclick);
  	//每天的点击量
  	var s_clickcount= parseInt(data.field.s_clickcount);
  	//计算每天的收费钱数
  	var dayCount=(s_thousandsShow+s_singleclick)*s_clickcount;
  	//计算天数
  	var day=i_money/dayCount;
  	$.get("jckIn/selMoney.do",{"money":i_money},function(d){
  		if(d==1){
  			$.get("jckIn/selInd.do",{"s_id":data.field.s_id,"day":day},function(da){
		  		if(''==da){
		  			layer.confirm("此广告将在审核后(审核时间为一天内)进行投放，预计"+(parseInt(day)==0?"投放天数不足一":"投放"+parseInt(day))+"天,是否继续下单？",{
		  				btn:['继续','取消']
		  				,yes:function(inde,layero){
		  					data.field.day=day;
		  					data.field.i_startTime=new Date();
		  					$.post("jckIn/addIndent.do",data.field,function(dat){
					  			layer.msg("添加订单成功！");
					  			layer.close(index);
						  	});
		  				}
		  				,btn2:function(ind){
		  					layer.close(index);
		  				}
		  			});
		  		}else{
		  			data.field.day=day;
		  			data.field.i_startTime=new Date(da.i_endTime);
		  			layer.confirm("您的订单将预计在"+da.i_endTime+"进行投放，预计"+(parseInt(day)==0?"投放天数不足一":"投放"+parseInt(day))+"天,是否继续?",{
		  				btn:['继续','取消']
		  				,yes:function(inde,layero){
		  					$.post("jckIn/addIndent.do",data.field,function(dat){
						  		if(dat==-1){
						  			layer.msg("账户余额不足，请充值");
						  		}else{
						  			layer.msg("添加订单成功！");
						  			layer.close(index);
						  		}
						  	});
		  				}});
		  		}
		  	});
  		}else{
  			layer.msg("余额不足，请先充值再下订单！");
			layer.close(index);
  		}
  	});
  	
  	return false;
  	//alert(JSON.stringify(data));
  });
});

//自己的广告显示
function showPoster(){
	$.post("posterCon/selPost.do",function(data){
		for(var i=0;i<data.length;i++){
			$("#poster").append("<option value='"+data[i].p_id+"'>"+data[i].p_name+"</option>");
		}
		
	});
}
//判断点击的照片在弹出层中是否存在，如果存在不让再次添加节点
function images(data){
var falg;
$("#layer-photos-demo img").each(function(){
			if($(this).attr("sid")==data.s_id)
			{
				falg= false;
				return false;
			}
			else
				falg= true;
		});
	return falg;
}

//添加广告位类型
function slotType(){
	$("#slotType").append("<option value='0'>请选择：</option>");
	$.post("jckST/slotType.do",function(data){
		for(var i=0;i<data.length;i++){
			$("#slotType").append("<option value="+data[i].st_id+">"+data[i].st_name+"</option>");
		}
		form.render("select");
	});
	
}
//添加网站
function channel(){
	$("#channel").append("<option value='0'>请选择：</option>");
	$.post("jckC/selCh.do",function(data){
		for(var i=0;i<data.length;i++){
			$("#channel").append("<option value="+data[i].ch_id+">"+data[i].ch_name+"</option>");
		}
		form.render("select");
	});
}
//进行搜索查询
function searchInfo(){
	table.reload('slotShow', {
	  where: { 
	  	st_id:$("#slotType").val(),
	    ch_id:$("#channel").val(),
	    s_name: $("#sname").val() ,
	    s_hight:$("#shight").val(),
	    s_width:$("#swidth").val(),
	    s_clickcount:$("#sclickcount").val(),
	  }
	});
}

</script>
				
<body>
	<input id="publ" hidden>
	<form class="layui-form" action="" style="width:80%;" id="placeAnOrder" lay-filter="fo" method="post" hidden>
		<input name="day" id="day" hidden>
		<input name="i_startTime" id="startTime" hidden>
		<div class="layui-form-item">
			<label class="layui-form-label">网站名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" name="ch_name" lay-verify="required" disabled>
			</div>
		</div>
		<input name="s_id" hidden>
		<div class="layui-form-item">
			<label class="layui-form-label">广告位名称</label>
			<div class="layui-input-block">
				<input type="text" name="s_name" class="layui-input linksName" lay-verify="required" disabled>
			</div>
		</div>
		<input name="st_id" hidden>
		<div class="layui-form-item">
			<label class="layui-form-label">广告位类型</label>
			<div class="layui-input-block">
    				<input type="text" name="st_name" class="layui-input linksName" lay-verify="required" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="padding-right: -10px;">千次曝光￥</label>
			<div class="layui-input-block">
				<input type="text" name="s_thousandsShow" class="layui-input linksName" lay-verify="required" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">单次点击￥</label>
			<div class="layui-input-block">
				<input type="text" name="s_singleclick" class="layui-input linksName" lay-verify="required" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">日均点击量</label>
			<div class="layui-input-block">
				<input type="text" name="s_clickcount" class="layui-input linksName" lay-verify="required" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">预算金额</label>
			<div class="layui-input-block">
				<input type="text" name="i_money" class="layui-input linksName" lay-verify="required" placeholder="请输入预算金额">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">广告</label>
			<div class="layui-input-block">
				<select lay-search id="poster" name="p_id">
    		
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
 <blockquote class="layui-elem-quote news_search"><div class="demoTable">
 	<form class="layui-form" method="post" action="jckIn/selIndents.do">
 	  网站：
    <div class="layui-inline" style="width: 110px;">
        <select lay-search id="channel">
    		
		</select>
    </div>
      广告位类型：
    <div class="layui-inline" style="width: 110px;">
    	<select lay-search id="slotType" >
    		
		</select>
    </div>
 	 广告位：
    <div class="layui-inline">
        <input class="layui-input" placeholder="广告位" style="width: 100px;" id="sname">
    </div>
    	广告位高度：
    <div class="layui-inline">
        <input class="layui-input" style="width: 100px;"  id="shight" placeholder="<">
    </div>
    广告位宽度：
    <div class="layui-inline">
        <input class="layui-input" style="width: 100px;" id="swidth" placeholder="<">
    </div>
    广告位点击量：
    <div class="layui-inline">
        <input class="layui-input" style="width: 100px;" id="sclickcount" placeholder="<">
    </div>
    <input type="button" class="layui-btn" value="搜索" onclick="searchInfo()">
    </form>
</div></blockquote>
<table class="layui-hide" id="slotShow" lay-filter="demo"></table>
<!-- 操作广告位 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">预览</a>
  <a class="layui-btn layui-btn-xs" lay-event="order">下订单</a>
</script>
<div id="div1" hidden style="padding: 3px;">
<div id="layer-photos-demo" class="layer-photos-demo">
	<img src="" layer-src="" id="img" height="300px;" width="300px;" sid="">
</div>
</div>
</body>
</html>
