<%@page import="java.util.Set"%>
<%@page import="com.nest.lottery.system.utils.LotteryUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();
	String mode = request.getParameter("mode");
	
	if(mode.equals("1"))
	{
		if(session.getAttribute("sessioncodes") != null)
		{
			message.resource("combinations", session.getAttribute("sessioncodes"));
		}
	}
	
	out.println(message);
%>