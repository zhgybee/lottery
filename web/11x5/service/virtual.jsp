<%@page import="com.nest.lottery.system.utils.ThrowableUtils"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.nest.lottery.system.utils.SystemUtils"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="org.json.JSONObject"%>
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
	SessionUser sessionuser = SessionUser.getSessionUser(session);	

	ServiceMessage message = new ServiceMessage();
	String mode = request.getParameter("mode");
	
	if(mode.equals("1"))
	{
		String type = request.getParameter("type");

		Data data = null;	
		Datum user = null;		
		Data bets = null;
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			user = dataSource.get("select * from T_USER where ID = ?", sessionuser.getString("ID"));
			data = dataSource.find("select top 15 * from T_11X5 where TYPE = ? order by PHASE desc", type);
			
			
			bets = dataSource.find("select T_BET.ID, T_BET.CODE, T_BET.WAY, T_BET.BONUS, T_BET.MULTIPLE, T_11X5.CODE as 'ACTUAL' from T_BET left join T_11X5 on T_BET.TYPE = T_11X5.TYPE and T_BET.PHASE = T_11X5.PHASE where T_BET.CREATE_USER_ID = ? and T_BET.IS_FINISHED = '0'", sessionuser.getString("ID"));
			
			Set<String> sqls = new HashSet<String>();
			for(Datum bet : bets)
			{
				int way = bet.getInt("WAY");				
				int multiple = bet.getInt("MULTIPLE");
				int bonus = bet.getInt("BONUS");
				String betcode = bet.getString("CODE");
				String actualcode = bet.getString("ACTUAL");
				String[] groups = betcode.split(",");
				
				if(!actualcode.equals(""))
				{
					boolean isBingo = false;
					groups:for(String group : groups)
					{
						int number = 0;					
						String[] codes = group.split(" ");					
						for(String code : codes)
						{
							if(actualcode.indexOf(code) != -1)
							{
								number++;
							}
						}
						if(number == way)
						{
							isBingo = true;
							break groups;
						}	
					}	
					if(isBingo)
					{
						int achieve = bonus * multiple;
						sqls.add("update T_BET set ACTUALCODE = '"+actualcode+"', IS_BINGO='1', ACHIEVE='"+achieve+"', IS_FINISHED='1' where ID = '"+bet.getString("ID")+"'");
						sqls.add("update T_USER set CHIP = CHIP + "+achieve+" where ID = '"+sessionuser.getString("ID")+"'");
					}
					else
					{
						sqls.add("update T_BET set ACTUALCODE = '"+actualcode+"', IS_BINGO='0', ACHIEVE='0', IS_FINISHED='1' where ID = '"+bet.getString("ID")+"'");
					}
				}
			}
			
			for(String sql : sqls)
			{
				dataSource.execute(sql);
			}
			connection.commit();
			
			bets = dataSource.find("select top 10 * from T_BET where CREATE_USER_ID = ? and TYPE = ? order by CREATE_DATE desc", sessionuser.getString("ID"), type);

			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
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
		
		JSONObject property = new JSONObject();
		if(type.equals("gd11x5"))
		{
			property.put("max", "42");
			property.put("start", "09:30");
			property.put("interval", 15 * 60);
		}
		else if(type.equals("jx11x5"))
		{
			property.put("max", "42");
			property.put("start", "09:30");
			property.put("interval", 15 * 60);
		}
		else if(type.equals("sd11x5"))
		{
			property.put("max", "43");
			property.put("start", "09:00");
			property.put("interval", 15 * 60);
		}
		else if(type.equals("sh11x5"))
		{
			property.put("max", "45");
			property.put("start", "09:30");
			property.put("interval", 15 * 60);
		}

		message.resource("user", user);
		message.resource("bets", bets);
		message.resource("property", property);
		message.resource("data", data);
	}
	else if(mode.equals("2"))
	{
		String type = request.getParameter("type");
		String way = request.getParameter("way");
		String phase = request.getParameter("phase");
		String count = request.getParameter("count");
		String code = request.getParameter("code");		
		String multiple = request.getParameter("multiple");
		String chip = request.getParameter("chip");
		String bonus = request.getParameter("bonus");
		
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			
			dataSource.execute("insert into T_BET(ID, WAY, TYPE, PHASE, CODE, COUNT, MULTIPLE, CHIP, BONUS, ACHIEVE, IS_FINISHED, CREATE_USER_ID, CREATE_DATE) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)", 
					SystemUtils.uuid(), way, type, phase, code, count, multiple, chip, bonus, "", "0", sessionuser.getString("ID"));

			dataSource.execute("update T_USER set CHIP = CHIP - "+chip+" where ID = '"+sessionuser.getString("ID")+"'");
			
			connection.commit();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
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
	else if(mode.equals("3"))
	{
		String id = request.getParameter("id");
		Datum bet = null;
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			
			bet = dataSource.get("select * from T_BET where ID = ?", id);			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
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
		message.resource("bet", bet);
	}
	else if(mode.equals("4"))
	{
		String type = request.getParameter("type");
		Data bets = null;
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);
			
			bets = dataSource.find("select * from T_BET where CREATE_USER_ID = ? and TYPE = ? order by CREATE_DATE desc", sessionuser.getString("ID"), type);			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
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
		message.resource("bets", bets);
	}
	else if(mode.equals("5"))
	{
		String id = request.getParameter("id");
		Connection connection = null;
		try
		{						
			connection = DataSource.connection();
			DataSource dataSource = new DataSource(connection);			
			dataSource.execute("delete from T_BET where ID = ?", id);	
			connection.commit();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			Throwable throwable = ThrowableUtils.getThrowable(e);
			message.message(ServiceMessage.FAILURE, throwable.getMessage());
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



























