<%@page import="com.nest.lottery.system.utils.LotteryUtils"%>
<%@page import="java.util.Set"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="org.apache.commons.lang3.ArrayUtils"%>
<%@page import="com.nest.lottery.system.utils.SystemUtils"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.nest.lottery.system.datasource.Datum"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	String type = request.getParameter("type");
	String mode = StringUtils.defaultString(request.getParameter("mode"), "1");
	int length = NumberUtils.toInt(request.getParameter("length"), 100);
	
	Data items = null;
	Connection connection = null;
	try
	{						
		connection = DataSource.connection();
		DataSource dataSource = new DataSource(connection);
		items = dataSource.find("select top "+length+" * from T_11X5 where TYPE = ? order by PHASE desc", type);
		
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

	if(items != null)
	{
		Map<String, Integer> numbermap = new HashMap<String, Integer>();
		for(Datum item : items)
		{
			String[] codes = item.getString("CODE").split(",");
			for(String code : codes)
			{
				Integer number = numbermap.get(code);
				if(number == null)
				{
					number = 0;
				}
				numbermap.put(code, number + 1);
			}
		}									
		
		List<Map.Entry<String, Integer>> numbers = new ArrayList<Map.Entry<String, Integer>>(numbermap.entrySet());	
	    Collections.sort(numbers, new Comparator<Map.Entry<String, Integer>>() 
	    {
	        public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) 
	        {
	            return o1.getValue().compareTo(o2.getValue());
	        }
	    });




		Cai11Xuan5 lotter = new Cai11Xuan5();
		Set<int[]> combinations = lotter.combinations(new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11});

		if(mode.equals("1"))
		{
			String[] codes = new String[]{};
			int[] index = new int[]{numbers.size() - 1, numbers.size() - 2, numbers.size() - 3, numbers.size() - 4, numbers.size() - 5, numbers.size() - 6, numbers.size() - 7, 0, 1};
			int[] randoms = SystemUtils.random(new int[7], 10); 
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[0] - 1] ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[1] - 1] ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[2] - 1] ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[3] - 1] ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[4] - 1] ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[5] - 1] ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( index[randoms[6] - 1] ).getKey());
			
			combinations = lotter.filter(combinations, new int[]{NumberUtils.toInt(codes[0]), NumberUtils.toInt(codes[1]), NumberUtils.toInt(codes[2])}, new int[]{1 ,2});
			combinations = lotter.filter(combinations, new int[]{NumberUtils.toInt(codes[3]), NumberUtils.toInt(codes[4]), NumberUtils.toInt(codes[5]), NumberUtils.toInt(codes[6])}, new int[]{2, 3});
	
		}
		else if(mode.equals("2"))
		{
			
			String[] codes = new String[]{};
			codes = ArrayUtils.add(codes, numbers.get( numbers.size() - 1 ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( numbers.size() - 2 ).getKey());
			codes = ArrayUtils.add(codes, numbers.get( numbers.size() - 3 ).getKey());			
			combinations = lotter.filter(combinations, new int[]{NumberUtils.toInt(codes[0]), NumberUtils.toInt(codes[1]), NumberUtils.toInt(codes[2])}, new int[]{1, 2});			
			codes = new String[]{};			
			int[][] codegroup = new int[][]
			{
				{2, 3, 6, 9, 10},
				{1, 3, 5, 8, 10},
				{2, 4, 7, 9, 11},
				{2, 5, 6, 7, 9},
				{1, 2, 3, 4, 5}
			};
			int[] randoms = SystemUtils.random(new int[1], 5); 			
			combinations = lotter.filter(combinations, codegroup[randoms[0]], new int[]{2, 3});
		}


		List<String> resources = lotter.toString(combinations);		
		message.resource("codes", resources);
		
		

		if(items != null)
		{
		    Collections.sort(items, new Comparator<Datum>() 
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
		for(int i = 0 ; i < items.size() ; i++)
		{
			Datum datum = items.get(i);
			String phase = datum.getString("PHASE");
			String code = datum.getString("CODE");
			code = LotteryUtils.sort(code);
			
			if(resources.contains(code))
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
				if(i == items.size() - 1)
				{
					titles.add("遗漏期数");
					values.add(count);
				}
			}
		}
		
		int gt3count = 0;
		int umwincount = 0;
		int wincount  = 0;
		for(int value : values)
		{
			if(value >= 3)
			{
				gt3count++;
			} 
			if(value != 0)
			{
				umwincount++;
			}
			else
			{
				wincount++;
			}
		}
		message.resource("values", values);
		message.resource("titles", titles);
		message.resource("gt3count", gt3count);
		message.resource("wincount", wincount);
		message.resource("proportion", new Integer(gt3count).doubleValue()/new Integer(umwincount).doubleValue());
	}
	
	
	
	out.println(message);
%>