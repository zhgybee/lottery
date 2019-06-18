<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
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
		//做号
		int size = NumberUtils.toInt(request.getParameter("size"), 5);
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
		int[] oddncount = LotteryUtils.toArray(request.getParameterValues("oddncount[]"));
		int[] pricount = LotteryUtils.toArray(request.getParameterValues("pricount[]"));
		int[] smcount = LotteryUtils.toArray(request.getParameterValues("smcount[]"));
		int[] concount = LotteryUtils.toArray(request.getParameterValues("concount[]"));
		
		Cai11Xuan5 lotter = new Cai11Xuan5();
		
		Set<int[]> combinations = lotter.combinations(size, basecodes);
		
		if(codes1 != null && codes1count != null)
		{
			combinations = lotter.filter(combinations, codes1, codes1count);
		}
		
		if(codes2 != null && codes2count != null)
		{
			combinations = lotter.filter(combinations, codes2, codes2count);
		}
		
		if(codes3 != null && codes3count != null)
		{
			combinations = lotter.filter(combinations, codes3, codes3count);
		}
		
		if(codes4 != null && codes4count != null)
		{
			combinations = lotter.filter(combinations, codes4, codes4count);
		}
		
		if(codes5 != null && codes5count != null)
		{
			combinations = lotter.filter(combinations, codes5, codes5count);
		}

		combinations = lotter.filter(combinations, oddncount, pricount, smcount, concount);
		
		
		message.resource("combinations", lotter.toString(combinations));
		
		session.setAttribute("sessioncodes", lotter.toString(combinations));
	}
	else if(mode.equals("2"))
	{
		//虚拟投注生成号码		
		int size = NumberUtils.toInt(request.getParameter("size"), 5);
		int[] basecodes = LotteryUtils.toArray(request.getParameterValues("basecodes[]"));	
		if(basecodes != null)
		{
			Cai11Xuan5 lotter = new Cai11Xuan5();		
			Set<int[]> combinations = lotter.combinations(size, basecodes);			
			message.resource("combinations", lotter.toString(combinations));
		}
	}
	
	out.println(message);
%>