<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="com.nest.lottery.system.utils.ThrowableUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.nest.lottery.system.utils.SystemUtils"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();
	String mode = request.getParameter("mode");
	Data data = null;
	if(mode.equals("1"))
	{
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			
			String id = SystemUtils.uuid();
			
			data = dataSource.find("select * from T_AGENT order by CREATE_DATE desc");
		}
		catch (SQLException e)
		{
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
			e.printStackTrace();
		} 
		finally
		{
			if(connection != null)
			{
				try
				{
					if(!connection.isClosed())
					{
						connection.close();
					}
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
	}
%>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0">
  <title>荧彩科技</title>
  <link rel="stylesheet" href="res/layui/css/layui.css">
  <link rel="stylesheet" href="res/static/css/index.css">
  
  <style>
	table{background-color:#ffffff; table-layout:fixed; border-collapse:collapse; border-spacing:0px; border-top:1px solid #c5d0dc}
	th, td{font-weight:400; box-sizing:border-box; text-align:center; font-size:15px; overflow:hidden; border-bottom:1px dotted #cccccc; border-right:1px dotted #cccccc}
	th{background-color:#f1f5fa; height:30px; line-height:30px; font-size:12px}
	td{padding:5px; font-size:12px}
  </style>
  
</head>
<body>

<table style="width:100%">
	<tr style="background-color:#eeeeee">
	<td>名称</td>
	<td>姓名</td>
	<td>电话</td>
	<td>地址</td>
	<td>日期</td>
	</tr>
	<% 
		for(int i = 0 ; i < data.size() ; i++)
		{
			Datum datum = data.get(i);
	%>
	<tr>
		<td><%=datum.getString("NAME")%></td>
		<td><%=datum.getString("CONTACTS")%></td>
		<td><%=datum.getString("PHONE")%></td>
		<td><%=datum.getString("ADDRESS")%></td>
		<td><%=SystemUtils.toString( datum.getCalendar("CREATE_DATE", "yyyy-MM-dd") )%></td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>