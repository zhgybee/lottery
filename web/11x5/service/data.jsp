<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
<%@page import="com.nest.lottery.Cai11Xuan5"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();

	String mode = request.getParameter("mode");
	
	if(mode.equals("1"))
	{
		String type = request.getParameter("type");
		int length = NumberUtils.toInt(request.getParameter("length"), 0);
		Cai11Xuan5 cai11Xuan5 = new Cai11Xuan5();
		Data data =  cai11Xuan5.getData(type, length);
		message.resource("data", data);
	}
	
	out.println(message);
%>