<%@page import="com.nest.lottery.Cai11Xuan5"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();

	SessionUser sessionuser = SessionUser.getSessionUser(session);
	if(sessionuser != null)
	{
		String mode = request.getParameter("mode");
		
		if(mode.equals("1"))
		{
			Cai11Xuan5 cai11Xuan5 = new Cai11Xuan5();
			Data data =  cai11Xuan5.getData();
			
			message.resource("data", data);
		}
	}
	else
	{
		message.message(ServiceMessage.FAILURE, "登录用户失效，请重新登录。");
	}
	
	out.println(message);
%>