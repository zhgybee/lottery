<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="java.sql.Connection"%>
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

		Data codes = null;		
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			codes = dataSource.find("select T_11X5_RECOMMEND.*, T_11X5.CODE  from T_11X5_RECOMMEND left join T_11X5 on T_11X5_RECOMMEND.PHASE = T_11X5.PHASE and T_11X5_RECOMMEND.TYPE = T_11X5.TYPE where T_11X5_RECOMMEND.TYPE = ? order by T_11X5_RECOMMEND.PHASE desc", 
					type);
		}
		catch (SQLException e)
		{
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
		
		message.resource("data", codes);
	}
	
	out.println(message);
%>