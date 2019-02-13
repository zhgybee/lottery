<%@page import="java.util.Objects"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="com.nest.lottery.system.SystemProperty"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=utf-8"%>
<%

				Connection connection = null;
				try
				{
					connection = DataSource.connection();
					
					DataSource dataSource = new DataSource(connection);
					Datum user = dataSource.get("select * from T_USER where ID = '1'");
					if(user == null)
					{
						response.sendRedirect(SystemProperty.CONTEXTPATH+"/system/page/0001.html");
					}
					else
					{
						SessionUser sessionUser = new SessionUser();
						sessionUser.putAll(user);
						
						session.setAttribute("user", sessionUser); 
						response.sendRedirect(request.getContextPath()+"/app.jsp");
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
	
%>