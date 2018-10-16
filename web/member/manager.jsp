<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page contentType="text/html; charset=utf-8"%>
<%
	SessionUser sessionuser = SessionUser.getSessionUser(session);		
%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<title></title>
</head>
<body>
<jsp:include page="../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation"><h4>会员中心</h4></div>
	<div class="module">
		<div class="form-panel">

			<ul>
			<li class="clearfix">
				<div class="left field-panel" style="width:50%;">姓名<input type="text" id="name" value="<%=sessionuser.getString("NAME")%>"/></div>
				<div class="left field-panel" style="width:50%;">手机号<input type="text" id="phone" value="<%=sessionuser.getString("PHONE")%>"/></div>
			</li>
			<li class="clearfix">
				<div class="left field-panel" style="width:100%;">备注<textarea id="description"></textarea></div>
			</li>
			<li class="button-panel">
				<button id="save-button" class="button"><i class="fa fa-pencil-square-o"></i>保存</button>
			</li>
			</ul>
		
		</div>
	</div>
</div>


<script src="../lib/app.js"></script>

<script type="text/javascript">

$(function()
{
	

	$("#save-button").on("click", function()
	{
		var parameter = {};
		parameter.name = $("#name").val();
		parameter.phone = $("#phone").val();
		$.post("../service/member.jsp?mode=1", parameter, function(response)
		{
			if(response.status == 1)
			{
				app.message("保存成功");
			}
			else
			{
				app.message(response.messages);
			}
		}, "json");
	});


});

</script>

</body>
</html>
