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
			
			int[] basecodes = LotteryUtils.toArray(request.getParameterValues("basecodes[]"));
			int[] codes1 = LotteryUtils.toArray(request.getParameterValues("codes1[]"));
			int[] codes1count = LotteryUtils.toArray(request.getParameterValues("codes1count[]"));
			int[] codes2 = LotteryUtils.toArray(request.getParameterValues("codes2[]"));
			int[] codes2count = LotteryUtils.toArray(request.getParameterValues("codes2count[]"));
			int[] codes3 = LotteryUtils.toArray(request.getParameterValues("codes3[]"));
			int[] codes3count = LotteryUtils.toArray(request.getParameterValues("codes3count[]"));
			int[] codes4 = LotteryUtils.toArray(request.getParameterValues("codes4[]"));
			int[] codes4count = LotteryUtils.toArray(request.getParameterValues("codes4count[]"));
			int[] codes5 = LotteryUtils.toArray(request.getParameterValues("codes5[]"));
			int[] codes5count = LotteryUtils.toArray(request.getParameterValues("codes5count[]"));
			int[] evencount = LotteryUtils.toArray(request.getParameterValues("evencount[]"));
			int[] comcount = LotteryUtils.toArray(request.getParameterValues("comcount[]"));
			int[] smcount = LotteryUtils.toArray(request.getParameterValues("smcount[]"));
			int[] concount = LotteryUtils.toArray(request.getParameterValues("concount[]"));

			
			Cai11Xuan5 lotter = new Cai11Xuan5();
			
			Set<int[]> combinations = lotter.combinations(basecodes);
			
			if(codes1 != null && codes1count != null)
			{
				for(int count : codes1count)
				{
					combinations = lotter.filter(combinations, codes1, count);
				}
			}
			
			if(codes2 != null && codes2count != null)
			{
				for(int count : codes2count)
				{
					combinations = lotter.filter(combinations, codes2, count);
				}
			}
			
			if(codes3 != null && codes3count != null)
			{
				for(int count : codes3count)
				{
					combinations = lotter.filter(combinations, codes3, count);
				}
			}
			
			if(codes4 != null && codes4count != null)
			{
				for(int count : codes4count)
				{
					combinations = lotter.filter(combinations, codes4, count);
				}
			}
			
			if(codes5 != null && codes5count != null)
			{
				for(int count : codes5count)
				{
					combinations = lotter.filter(combinations, codes5, count);
				}
			}

			combinations = lotter.filter(combinations, evencount, comcount, smcount, concount);
			
			
			message.resource("combinations", lotter.toString(combinations));
			
			session.setAttribute("sessioncodes", lotter.toString(combinations));
		}
	}
	else
	{
		message.message(ServiceMessage.FAILURE, "登录用户失效，请重新登录。");
	}
	
	out.println(message);
%>