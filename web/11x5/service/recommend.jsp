<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
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
		Map<String, String> firstcodemap = new HashMap<String, String>();
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			codes = dataSource.find("select top 100 T_11X5_RECOMMEND.*, T_11X5.CODE  from T_11X5_RECOMMEND left join T_11X5 on T_11X5_RECOMMEND.PHASE = T_11X5.PHASE and T_11X5_RECOMMEND.TYPE = T_11X5.TYPE where T_11X5_RECOMMEND.TYPE = ? order by T_11X5_RECOMMEND.PHASE desc", 
					type);
			
			Data firstcodes = dataSource.find("select top 100 *  from T_11X5 where TYPE = ? order by PHASE desc", 
					type);
			
			for(Datum firstcode : firstcodes)
			{
				String phase = firstcode.getString("PHASE");
				if(!phase.equals("") && phase.length() > 2)
				{
					String index = phase.substring(phase.length() - 2, phase.length());
					if(index.equals("01"))
					{
						firstcodemap.put(phase, firstcode.getString("CODE"));
					}
				}
			}
			
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
			for(int i = 0 ; i < codes.size() ; i++)
			{
				Datum datum = codes.get(i);
				String phase = datum.getString("PHASE");
				if(!phase.equals("") && phase.length() > 2)
				{
					String index = phase.substring(phase.length() - 2, phase.length());
					if(index.equals("02"))
					{
						try
						{						
							Datum previous = codes.get(i + 1);
							String first = phase.substring(0, phase.length() - 2) + "01";
							previous.put("PHASE", first);
							previous.put("CODE", firstcodemap.get(first));
						}
						catch (Exception e)
						{
							e.printStackTrace();
						} 
					}
				}
			}
		}
		
		message.resource("data", codes);
	}
	
	out.println(message);
%>