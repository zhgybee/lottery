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
	
	if(mode.equals("1"))
	{
		
		String name = request.getParameter("name");
		String contacts = request.getParameter("contacts");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			
			String id = SystemUtils.uuid();
			
			dataSource.execute("insert into T_AGENT(ID, NAME, CONTACTS, PHONE, ADDRESS, CREATE_DATE) values(?, ?, ?, ?, ?, ?)", id, name, contacts, phone, address, SystemUtils.toString(Calendar.getInstance()));
			
			connection.commit();
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
	
	out.println(message);
%>