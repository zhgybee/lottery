<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.ArrayUtils"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="java.util.Set"%>
<%@page import="com.nest.lottery.system.utils.LotteryUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.nest.lottery.Cai11Xuan5"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();
	String mode = request.getParameter("mode");
	
	if(mode.equals("1"))
	{
		String codes = request.getParameter("codes");
		String type = request.getParameter("type");
		
		String[] combinations = codes.split("\n");
		
		
		Data data = null;		
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			data = dataSource.find("select top 100 * from T_11X5 where TYPE = ? order by PHASE desc", type);
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
		if(data != null)
		{
		    Collections.sort(data, new Comparator<Datum>() 
		    {
		        public int compare(Datum d1, Datum d2) 
		        {
		            return new Integer(d1.getInt("PHASE")).compareTo(d2.getInt("PHASE"));
		        }
		    });
		}
		
		List<String> titles = new ArrayList<String>();
		List<Integer> values = new ArrayList<Integer>();
		
		int count = 0;
		for(int i = 0 ; i < data.size() ; i++)
		{
			Datum datum = data.get(i);
			String phase = datum.getString("PHASE");
			String code = datum.getString("CODE");
			code = LotteryUtils.sort(code);
			
			if(ArrayUtils.contains(combinations, code))
			{
				if(count != 0)
				{
					titles.add("遗漏期数");
					values.add(count);
				}
				titles.add(phase);
				values.add(0);
				count = 0;
			}
			else
			{
				count++;
				if(i == data.size() - 1)
				{
					titles.add("遗漏期数");
					values.add(count);
				}
			}
		}

		message.resource("values", values);
		message.resource("titles", titles);
	}
	
	out.println(message);
%>