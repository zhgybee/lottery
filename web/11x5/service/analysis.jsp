<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.ArrayUtils"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="java.util.Set"%>
<%@page import="com.nest.lottery.system.utils.LotteryUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.nest.lottery.Cai11Xuan5"%>
<%@page import="com.nest.lottery.system.datasource.Data"%>
<%@page import="com.nest.lottery.system.SessionUser"%>
<%@page import="com.nest.lottery.system.utils.ServiceMessage"%>

<%@page contentType="text/html; charset=utf-8"%>

<%
	ServiceMessage message = new ServiceMessage();

	SessionUser sessionuser = SessionUser.getSessionUser(session);
	if(sessionuser != null)
	{
		String mode = request.getParameter("mode");
		
		if(mode.equals("1"))
		{
			String codes = request.getParameter("codes");
			codes = "02 04 06 07 09\n";
			
			String[] combinations = codes.split("\n");
			
			
			Cai11Xuan5 cai11Xuan5 = new Cai11Xuan5();
			Data data =  cai11Xuan5.getData();
			
			List<String> titles = new ArrayList<String>();
			List<Integer> values = new ArrayList<Integer>();
			
			int count = 0;
			for(int i = 0 ; i < data.size() ; i++)
			{
				Datum datum = data.get(i);
				String phase = datum.getString("QH");
				String code = datum.getString("ZJHM");
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
			
			out.println(titles);
			out.println(values);

		}
	}
	else
	{
		message.message(ServiceMessage.FAILURE, "登录用户失效，请重新登录。");
	}
	
	out.println(message);
%>