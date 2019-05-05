<%@page import="com.nest.lottery.system.utils.ThrowableUtils"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="com.nest.lottery.system.datasource.DataSource"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nest.lottery.system.utils.WeChatUtils"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html; charset=utf-8"%>

<%
	String urlid = StringUtils.defaultString(request.getParameter("state"), "");
	String urlcode = StringUtils.defaultString(request.getParameter("code"), "");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title></title>
	<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<style>	
		#messages{color:#ff6600; text-align:center; margin-top:60px; padding:10px}
		#messages i{color:#aaaaaa; font-size:50px; margin-bottom:20px}
		#messages span{color:#aaaaaa; font-size:12px}
	</style>
</head>

<body>

	<%
		String message = "";
		if(!urlcode.equals(""))
		{
			JSONObject wechatuser = WeChatUtils.getUser(urlcode, session);
			if(wechatuser != null)
			{
				String openid = wechatuser.optString("ID");		
				if(!openid.equals(""))
				{
					

					if(urlid == "")
					{
						
						Connection connection = null;
						try
						{
							connection = DataSource.connection();
							DataSource datasource = new DataSource(connection);
					    	Data users = datasource.find("select * from T_USER where OPENID = ?", openid);
							if(users != null && users.size() == 1)
							{
								Datum user = users.get(0);
								SessionUser sessionUser = new SessionUser();
								sessionUser.putAll(user);	
								session.setAttribute("user", sessionUser); 
								response.sendRedirect(request.getContextPath()+"/mobile/app.html");
							}
							else
							{
								message = "手机版未绑定<br/><span>请在电脑端使用加密狗登陆，进入“个人中心”使用微信扫码绑定</span>";
							}
						}
						catch(SQLException e)
						{
							Throwable throwable = ThrowableUtils.getThrowable(e);
							message = throwable.getMessage();
						}
						finally
						{
							if(connection != null)
							{
								connection.close();
							}
						}
					
					}
					else
					{
						
						Connection connection = null;
						try
						{
							connection = DataSource.connection();
							DataSource datasource = new DataSource(connection);
					    	datasource.execute("update T_USER set OPENID = ? where ID = ?", openid, urlid);
					    	connection.commit();
							message = "绑定成功<br/><span>已绑定微信，请关闭本页面后在公众号中打开软件</span>";
						}
						catch(SQLException e)
						{
							Throwable throwable = ThrowableUtils.getThrowable(e);
							message = throwable.getMessage();
						}
						finally
						{
							if(connection != null)
							{
								connection.close();
							}
						}
					}
					
				}
				else
				{
					message = "获取用户信息失败";
				}
			}
			else
			{
				message = "获取用户信息失败";
			}
		}
		else
		{
			message = "请用正常渠道打开软件";
		}
	%>
	<div id="messages"><i class="fa fa-warning"></i><p><%=message%></p></div>
</body>
</html>
