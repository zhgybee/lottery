<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
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
		int length = NumberUtils.toInt(request.getParameter("length"), 100);

		Data codes = null;		
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			codes = dataSource.find("select top "+(length + 10)+" * from T_11X5 where TYPE = ? order by PHASE desc", type);
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
		
		if(codes != null)
		{
		    Collections.sort(codes, new Comparator<Datum>() 
		    {
		        public int compare(Datum d1, Datum d2) 
		        {
		            return new Integer(d1.getInt("PHASE")).compareTo(d2.getInt("PHASE"));
		        }
		    });
		}
		
		message.resource("data", codes);
	}
	
	out.println(message);
%>