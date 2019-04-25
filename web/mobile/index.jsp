<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page contentType="text/html; charset=utf-8"%>
<%

	if(SessionUser.getSessionUser(session) == null)
	{
		//需要访问后台接口
		SessionUser sessionUser = new SessionUser();
		sessionUser.putAll(new Datum());	
		session.setAttribute("user", sessionUser); 
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title></title>
	<link rel="stylesheet" href="lib/weui/weui.css">
	<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="app.css">
	<style>	
		.weui-grid__icon {height:50px; width:100%; text-align:center}
		.weui-grid__icon i{font-size:50px}
		.weui-grid__label{color:#666666}
	</style>
</head>

<body ontouchstart>

	<div class="weui-25grids" id="universities">
	
		<a class="weui-grid" href="do.html">
			<div class="weui-grid__icon"><i class="fa fa-pencil-square" style="color:#2e8bcc"></i></div>
			<p class="weui-grid__label">做号工具</p>
		</a>
		<a class="weui-grid" href="analysis.html">
			<div class="weui-grid__icon"><i class="fa fa-gear" style="color:#f39c12"></i></div>
			<p class="weui-grid__label">智能分析</p>
		</a>
		<a class="weui-grid" href="recgroup.html">
			<div class="weui-grid__icon"><i class="fa fa-cubes" style="color:#393"></i></div>
			<p class="weui-grid__label">科学组码</p>
		</a>
		<a class="weui-grid" href="calculator.html">
			<div class="weui-grid__icon"><i class="fa fa-calculator" style="color:#e51400"></i></div>
			<p class="weui-grid__label">倍投计算器</p>
		</a>
		<a class="weui-grid" href="chart/0.html">
			<div class="weui-grid__icon"><i class="fa fa-braille" style="color:#ffc40d"></i></div>
			<p class="weui-grid__label">号码分布</p>
		</a>
		<a class="weui-grid" href="chart/1.html">					
			<div class="weui-grid__icon"><i class="fa fa-tachometer" style="color:#e671b8"></i></div>
			<p class="weui-grid__label">基本走势图</p>
		</a>
		<a class="weui-grid" href="chart/2.html">
			<div class="weui-grid__icon"><i class="fa fa-tasks" style="color:#7b4f9d"></i></div>
			<p class="weui-grid__label">和值走势图</p>
		</a>			
		<a class="weui-grid" href="chart/3.html">
			<div class="weui-grid__icon"><i class="fa fa-sitemap" style="color:#8cbf26"></i></div>
			<p class="weui-grid__label">跨度走势图</p>
		</a>
		<a class="weui-grid" href="chart/4.html">
			<div class="weui-grid__icon"><i class="fa fa-reorder" style="color:#ff0097"></i></div>
			<p class="weui-grid__label">大小走势图</p>
		</a>
		<a class="weui-grid" href="chart/5.html">
			<div class="weui-grid__icon"><i class="fa fa-recycle" style="color:#2e8bcc"></i></div>
			<p class="weui-grid__label">奇偶走势图</p>
		</a>
		<a class="weui-grid" href="chart/6.html">
			<div class="weui-grid__icon"><i class="fa fa-puzzle-piece" style="color:#f39c12"></i></div>
			<p class="weui-grid__label">质合走势图</p>
		</a>
		<a class="weui-grid" href="chart/7.html">
			<div class="weui-grid__icon"><i class="fa fa-plus-square" style="color:#393"></i></div>
			<p class="weui-grid__label">隔期走势图</p>
		</a>
		<a class="weui-grid" href="chart/8.html">
			<div class="weui-grid__icon"><i class="fa fa-credit-card" style="color:#e51400"></i></div>
			<p class="weui-grid__label">热码分布</p>
		</a>
		<a class="weui-grid" href="chart/9.html">
			<div class="weui-grid__icon"><i class="fa fa-bullseye" style="color:#ffc40d"></i></div>
			<p class="weui-grid__label">热码走势图</p>
		</a>




	</div>

	<script type="text/javascript" src="lib/jquery.min.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>
