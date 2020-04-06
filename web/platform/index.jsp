<%@page contentType="text/html; charset=utf-8"%>
<%
	String rnd = (new Integer((int)(Math.random() * 65535) + 1)).toString() + (new Integer((int)(Math.random() * 65535) + 1)).toString();
	session.setAttribute("rnd", rnd);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/app.css" />
	<link rel="stylesheet" href="../lib/font-awesome/css/font-awesome.min.css" />
	<style>
		.textedit{border:none; height:30px; background-color:transparent; color:#ffffff; font-size:16px; filter:alpha(opacity=80); opacity:0.8;}
		form i{color:#ffffff; margin-right:10px; filter:alpha(opacity=60); opacity:0.6;}
		hr{margin:2px 0px 0px 0px; border-top:1px solid #ffffff; border-left:none; border-right:none; border-bottom:none; filter:alpha(opacity=50); opacity:0.5;}
		.system-message-panel{ background-color:#fcf8e3; border:1px solid #faebcc; overflow:hidden; width:1000px; margin:0px auto; padding:10px; line-height:20px; }
		.system-message-panel p{padding:15px; color:#8a6d3b; font-size:15px}
		.system-message-panel p i{margin-right:4px}
	</style>
</head>

<body>

<div style="top:0px; right:0px; bottom:0px; left:0px; height:100%; min-width:1000px; position:absolute; width:100%;">
	<div style="height:100%; position:relative; width:100%; background:transparent url('background5.jpg') no-repeat scroll center top / cover; padding:20px; box-sizing:border-box">
		<div class="system-message-panel">公司于2020年4月12日进行软件功能升级，届时可能会导致部分用户软件无法正常使用！如若不能使用请联系您上级代理商重新激活！如有疑问请联系微信 yczb999999注明荧彩科技</div>
		<div id="login-container" style="display:none; width:350px; filter:alpha(opacity=30); opacity:0.3; position:absolute; height:520px; background-color:#ffffff"></div>
		
		<div id="login-panel" style="display:none; position:absolute; width:350px;">
			<div style="height:340px; text-align:center; line-height:540px; filter:alpha(opacity=30); opacity:0.3;">			
				<i class="fa fa-lock" style="color:#ffffff; font-size:250px" id="lock-icon"></i>	
			</div>
			<form id="login-form" method="post" action="do.jsp" style="width:300px; margin:0px auto">

				<input type="hidden" name="rnd" id="rnd" value="<%=session.getAttribute("rnd") %>" />
				<input type="hidden" name="encryptrnd" id="encryptrnd" value="" />
				<input type="hidden" name="name" id="name" />

				<div style="padding-left:40px; position:relative;"><i class="fa fa-user" style="font-size:23px; position:absolute; top:4px; left:10px; "></i><input type="text" class="textedit" id="checkstring" style="filter:alpha(opacity=60); opacity:0.6; font-weight:100" value="请插入加密狗" readonly="readonly"/></div>
				<hr/>
				
				<div style="margin-top:20px; text-align:center"><button onclick="login()" type="button" class="button login-button" id="login-button" style="cursor:pointer; width:100%; height:40px; background-color:#00B7EE; color:#ffffff">登录</button></div>

				<div>
					<div style="margin-top:30px; font-size:14px; cursor:pointer; text-align:center"><a href="SetUp.exe" style="color:#ffffff; filter:alpha(opacity=60); opacity:0.6;">加密狗驱动下载</a></div>
				</div>

				<div style="clear:both"></div>

			</form>
		</div>
		

		<div style="border-top:1px solid rgba(255, 255, 255, 0.15); bottom:5px; height:80px; line-height:80px; position:absolute; width:100%; color: #e9edf2;">
			<div style="margin:0px auto; max-width:1200px; text-align:center">
			Copyright © 2016-2017 51ycai.com All Rights Reserved. 荧彩科技 版权所有
			</div>
		</div>
	</div>
</div>


<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="Syunew3.js"></script>

</body>
</html>
