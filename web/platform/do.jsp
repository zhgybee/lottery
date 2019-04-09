<%@page import="java.util.Objects"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="com.nest.lottery.system.SystemProperty"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=utf-8"%>
<%

	String name = request.getParameter("name");	
	String rnd = Objects.toString(session.getAttribute("rnd"), null);
	String encryptrnd = request.getParameter("encryptrnd");
	
	if(rnd != null)
	{
		if(encryptrnd != null)
		{
			String serencryptrnd = new com.softkey.SoftKey().StrEnc(rnd, "LOTTERY1234567890ZHAGY1234567890");
			if(serencryptrnd.trim().equals(encryptrnd.trim()))
			{
				Connection connection = null;
				try
				{
					connection = DataSource.connection();
					
					DataSource dataSource = new DataSource(connection);
					
					if(name != null)
					{
						Datum user = dataSource.get("select * from T_USER where SECRETKEY = ?", name);
						if(user == null)
						{
							response.sendRedirect(SystemProperty.CONTEXTPATH+"/system/page/0001.html");
						}
						else
						{
							if(user.getString("STATUS").equals("1"))
							{
								response.sendRedirect(SystemProperty.CONTEXTPATH+"/system/page/0003.html");
							}
							else
							{
								SessionUser sessionUser = new SessionUser();
								sessionUser.putAll(user);
								
								session.setAttribute("user", sessionUser); 
								response.sendRedirect(request.getContextPath()+"/app.jsp");
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
							connection.close();
						}
						catch (SQLException e)
						{
							e.printStackTrace();
						}
					}
				}
			}
			else
			{
				response.sendRedirect(SystemProperty.CONTEXTPATH+"/system/page/0001.html");
			}
		}
		else
		{
			response.sendRedirect(SystemProperty.CONTEXTPATH+"/system/page/0001.html");
		}
	}
	else
	{
		response.sendRedirect(SystemProperty.CONTEXTPATH+"/system/page/0001.html");
	}
	
%>