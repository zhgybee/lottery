<%@page import="com.nest.lottery.system.utils.SystemUtils"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page contentType="text/html; charset=utf-8"%>

<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<div class="left" id="menu-module" style="width:260px; background-color:#323232">
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
		 	<img src="/lottery/resource/usericon/<%=usericon%>" />		 
		 </div>
		 <div id="useritem" class="left">
		 	<h5><%=sessionuser.getString("NAME")%><span>学员</span></h5>
		 	<time><%=date%></time>
		 </div>
	</div>
	<nav>
		<ul>
			<li><a href="/lottery/app.jsp"><i class="fa fa-home"></i>首页</a></li>
			<li><a href="/lottery/11x5/do.jsp" target="_blank"><i class="fa fa-pencil-square"></i>做号</a></li>
			<li><a href="/lottery/11x5/analysis.jsp" target="_blank"><i class="fa fa-cog"></i>智能分析</a></li>
			<li><a href="/lottery/11x5/chart/1.jsp" target="_blank"><i class="fa fa-area-chart"></i>基本走势图</a></li>
			<li><a href="/lottery/11x5/chart/2.jsp" target="_blank"><i class="fa fa-area-chart"></i>和值走势图</a></li>
			<li><a href="/lottery/11x5/chart/3.jsp" target="_blank"><i class="fa fa-area-chart"></i>跨度走势图</a></li>
			<li><a href="/lottery/11x5/chart/4.jsp" target="_blank"><i class="fa fa-area-chart"></i>大小走势图</a></li>
			<li><a href="/lottery/11x5/chart/5.jsp" target="_blank"><i class="fa fa-area-chart"></i>奇偶走势图</a></li>
			<li><a href="/lottery/11x5/chart/6.jsp" target="_blank"><i class="fa fa-area-chart"></i>质合走势图</a></li>
			<li><a href="/lottery/11x5/chart/7.jsp" target="_blank"><i class="fa fa-area-chart"></i>隔期重号走势图</a></li>
			<li><a href="/lottery/member/manager.jsp" target="_blank"><i class="fa fa-user"></i>个人中心</a></li>
		</ul>
	</nav>
</div>	
<script type="text/javascript">		
$(function()
{
	$("#menu-module").height( Math.max($(window).height(), $("#menu-module").height()) );
});
</script>
