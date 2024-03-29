
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.nest.lottery.system.utils.ThrowableUtils"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.SystemProperty"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();

	String mode = request.getParameter("mode");
	
	if(mode.equals("1"))
	{	
		String name = StringUtils.defaultString(request.getParameter("name"), "");
		String phone = StringUtils.defaultString(request.getParameter("phone"), "");	
		String description = StringUtils.defaultString(request.getParameter("description"), "");		
		Connection connection = null;
		try
		{
			connection = DataSource.connection();			
			DataSource dataSource = new DataSource(connection);			
			SessionUser sessionuser = SessionUser.getSessionUser(session);			
			dataSource.execute("update T_USER set NAME = ?, PHONE = ?, DESCRIPTION = ? where ID = ?", name, phone, description, sessionuser.getString("ID"));			
			connection.commit();
			Datum user = dataSource.get("select * from T_USER where ID = ?", sessionuser.getString("ID"));
			sessionuser.putAll(user);
		}
		catch (SQLException e)
		{
			if(connection != null)
			{
				connection.rollback();
			};
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
		}
		finally
		{
			if(connection != null)
			{
				try
				{
					connection.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}

	}
	
	out.println(message);
%>