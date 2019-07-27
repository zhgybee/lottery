<%@page import="com.nest.lottery.system.utils.SystemUtils"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page contentType="text/html; charset=utf-8"%>

<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<div class="left" id="menu-module" style="width:220px; background-color:#323232">
	<%
		SessionUser sessionuser = SessionUser.getSessionUser(session);	
		String usericon = sessionuser.getString("ICON");
		if(usericon.equals(""))
		{
			usericon = "user.png";
		}
		String date = sessionuser.getString("CREATE_DATE");
		date = SystemUtils.toString(SystemUtils.toCalendar(date, "yyyy-MM-dd"), "yyyy.M.dd");
	%>
	<div id="user-panel" class="clearfix">
		 <div id="usericon" class="left">		 
		 	<img src="/resource/usericon/<%=usericon%>" />		 
		 </div>
		 <div id="useritem" class="left">
		 	<h5><%=sessionuser.getString("NAME")%><span><%=sessionuser.getString("CODE")%></span></h5>
		 	<time><%=date%></time>
		 </div>
	</div>
	<nav>
		<ul>
			<li><a href="/app.jsp"><i class="fa fa-home"></i>首页</a></li>
			<li><a href="/11x5/do.jsp" target="_blank"><i class="fa fa-pencil-square"></i>做号</a></li>
			<%
				if(sessionuser.getString("CODE").equals("000001") || sessionuser.getString("CODE").equals("000000") || sessionuser.getString("CODE").equals("000002") || sessionuser.getString("CODE").equals("000003"))
				{
			%>
			<li><a href="/11x5/virtual/virtual.jsp" target="_blank"><i class="fa fa-tachometer"></i>虚拟投注</a></li>
			<%
				}
			%>

			<li><a href="/11x5/analysis.jsp" target="_blank"><i class="fa fa-cog"></i>智能分析</a></li>
			<li><a href="/11x5/recommend.jsp" target="_blank"><i class="fa fa-tasks"></i>智能推荐</a></li>
			<li><a href="/11x5/recgroup.jsp" target="_blank"><i class="fa fa-recycle"></i>科学组码</a></li>
			<li><a href="/11x5/calculator/calculator.jsp" target="_blank"><i class="fa fa-building-o"></i>倍投计算器</a></li>
			<li><a href="/11x5/chart/0.jsp" target="_blank"><i class="fa fa-area-chart"></i>彩票走势图</a></li>
			<li><a href="/member/manager.jsp" target="_blank"><i class="fa fa-user"></i>个人中心</a></li>
		</ul>
	</nav>
</div>	
<script type="text/javascript">		
$(function()
{
	$("#menu-module").height($(window).height());

	if($("#master-module .sub-module").css("padding") == "15px")
	{
		$("#master-module .sub-module").height( $(window).height() - $("#navigation").outerHeight() - 30);
	}
	if($("#master-module .sub-module").css("padding") == "7px")
	{
		$("#master-module .sub-module").height( $(window).height() - $("#navigation").outerHeight() - 14);
	}
	else
	{
		$("#master-module .sub-module").height( $(window).height() - $("#navigation").outerHeight());
	}
});
</script>
