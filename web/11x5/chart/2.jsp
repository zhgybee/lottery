<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title>和值走势图</title>
</head>
<body>

<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4>和值走势图</h4>
		<div class="toolbar-panel">
			<button class="button lottery-refresh-button" onclick="window.location.reload()">刷新</button>
		</div>
	</div>
	<div class="sub-module chart-module">
		<div id="chart-panel">

			<div id="chart-buttons">
				<a class="button lottery-button" href="0.jsp" target="_blank">号码分布</a>
				<a class="button lottery-button" href="1.jsp" target="_blank">基本走势图</a>
				<a class="button lottery-disabled-button" href="2.jsp" target="_blank">和值走势图</a>
				<a class="button lottery-button" href="3.jsp" target="_blank">跨度走势图</a>
				<a class="button lottery-button" href="4.jsp" target="_blank">大小走势图</a>
				<a class="button lottery-button" href="5.jsp" target="_blank">奇偶走势图</a>
				<a class="button lottery-button" href="6.jsp" target="_blank">质合走势图</a>
				<a class="button lottery-button" href="7.jsp" target="_blank">隔期重号走势图</a>
				<a class="button lottery-button" href="8.jsp" target="_blank">热码走势图</a>
				<input id="11x5-length" class="lottery-type-field" style="width:80px; text-align:center"/>
				<input id="11x5-type" class="lottery-type-field" style="width:120px; text-align:center"/>
			</div>
			<div id="detailed-panel">
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:100px; min-width:100px">期号</th>
						<th rowspan="2" colspan="5">开奖号码</th>
						<th colspan="31">和值走势</th>
						<th rowspan="2" style="width:50px">和值</th>
						<th rowspan="2" style="width:50px">和尾</th>
					</tr>
					<tr>
						<th>15</th>
						<th>16</th>
						<th>17</th>
						<th>18</th>
						<th>19</th>
						<th>20</th>
						<th>21</th>
						<th>22</th>
						<th>23</th>
						<th>24</th>
						<th>25</th>
						<th>26</th>
						<th>27</th>
						<th>28</th>
						<th>29</th>
						<th>30</th>
						<th>31</th>
						<th>32</th>
						<th>33</th>
						<th>34</th>
						<th>35</th>
						<th>36</th>
						<th>37</th>
						<th>38</th>
						<th>39</th>
						<th>40</th>
						<th>41</th>
						<th>42</th>
						<th>43</th>
						<th>44</th>
						<th>45</th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>

			<div id="statistics-panel">
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:230px; min-width:230px">统计类型</th>
						<th colspan="31">和值走势</th>
						<th rowspan="2" style="width:50px">和值</th>
						<th rowspan="2" style="width:50px">和尾</th>
					</tr>
					<tr>
						<th>15</th>
						<th>16</th>
						<th>17</th>
						<th>18</th>
						<th>19</th>
						<th>20</th>
						<th>21</th>
						<th>22</th>
						<th>23</th>
						<th>24</th>
						<th>25</th>
						<th>26</th>
						<th>27</th>
						<th>28</th>
						<th>29</th>
						<th>30</th>
						<th>31</th>
						<th>32</th>
						<th>33</th>
						<th>34</th>
						<th>35</th>
						<th>36</th>
						<th>37</th>
						<th>38</th>
						<th>39</th>
						<th>40</th>
						<th>41</th>
						<th>42</th>
						<th>43</th>
						<th>44</th>
						<th>45</th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</div>
	<script src="../../lib/app.js"></script>
	<script src="../../lib/selection/selection.js"></script>
	
	<script type="text/javascript">
		
		var type = app.getParameter("type") || 'ah11x5';
		var length = app.getParameter("length") || '100';
		$(function()
		{
			$("#11x5-type").selection
			({
				url: "../dictionary/list/type.json",
				ismultiple: false,
				clickitem:function()
				{
					window.location.href = '2.jsp?type='+$("#11x5-type").val()+'&length='+$("#11x5-length").val();
				}
			});

			if(type != null)
			{
				var titles = $("#11x5-type").selection("setId", type);
				$("title").html($("title").html() + "-" + titles[0]);
			}

			$("#11x5-length").selection
			({
				url: "../dictionary/list/length.json",
				ismultiple: false,
				clickitem:function()
				{
					window.location.href = '2.jsp?type='+$("#11x5-type").val()+'&length='+$("#11x5-length").val();
				}
			});

			if(length != null)
			{
				$("#11x5-length").selection("setId", length);
			}
			initialise();
		});
		
		function initialise()
		{
			app.showLoading();
			$.getJSON("../service/data.jsp?mode=1&length="+$("#11x5-length").val()+"&type="+$("#11x5-type").val(), function(response)
			{
				if(response.status == 1)
				{
					var rows = response.resource.data;
					var $detailed = $("#detailed-panel table tbody");
					var content = '';
					for(var i = 10 ; i < rows.length ; i++)
					{
						var row = rows[i];
						var codes = row["CODE"].split(",")

						content += '<tr>';
						content += '<td class="redcode">'+row["PHASE"]+'</td>';
						content += '<td class="redcode">'+codes[0]+'</td>';
						content += '<td class="redcode">'+codes[1]+'</td>';
						content += '<td class="redcode">'+codes[2]+'</td>';
						content += '<td class="redcode">'+codes[3]+'</td>';
						content += '<td class="redcode">'+codes[4]+'</td>';
						
						var total = 0
						$.each(codes, function(i, code)
						{
							code = parseInt(code)
							total += code;
						});
						content += '<td class="T15">'+(total == 15 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T16">'+(total == 16 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T17">'+(total == 17 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T18">'+(total == 18 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T19">'+(total == 19 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T20">'+(total == 20 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T21">'+(total == 21 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T22">'+(total == 22 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T23">'+(total == 23 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T24">'+(total == 24 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T25">'+(total == 25 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T26">'+(total == 26 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T27">'+(total == 27 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T28">'+(total == 28 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T29">'+(total == 29 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T30">'+(total == 30 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T31">'+(total == 31 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T32">'+(total == 32 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T33">'+(total == 33 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T34">'+(total == 34 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T35">'+(total == 35 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T36">'+(total == 36 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T37">'+(total == 37 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T38">'+(total == 38 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T39">'+(total == 39 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T40">'+(total == 40 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T41">'+(total == 41 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T42">'+(total == 42 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T43">'+(total == 43 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T44">'+(total == 44 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td class="T45">'+(total == 45 ? '<span class="redrect">'+total+'</span>' : '')+'</td>';
						content += '<td>'+total+'</td>';
						content += '<td>'+(total % 10)+'</td>';

						content += '</tr>';
					}
					$detailed.html(content);


					var $statistics = $("#statistics-panel table tbody");
					var tempstatisticsmap = {};
					var statisticsmap = {};
					var $rows = $detailed.find("tr");
					$.each($rows, function(i, row)
					{
						var $cells = $(row).find("td");
						$.each($cells, function(j, cell)
						{
							var $cell = $(cell);
							var classname = "L"+$cell.attr("class");
							var isBingo = ($cell.find("span").length != 0);

							if(tempstatisticsmap[classname] == null)
							{
								tempstatisticsmap[classname] = 0;
							}

							if(isBingo)
							{
								tempstatisticsmap[classname] += 1;
							}

							if(!isBingo || (i == $rows.length - 1))
							{
								statisticsmap[classname] = Math.max((statisticsmap[classname] || 0), (tempstatisticsmap[classname] || 0));
								tempstatisticsmap[classname] = 0;
							}

							classname = "Y"+$cell.attr("class");
							if(tempstatisticsmap[classname] == null)
							{
								tempstatisticsmap[classname] = 0;
							}

							if(!isBingo)
							{
								tempstatisticsmap[classname] += 1;
							}
							
							if(isBingo || (i == $rows.length - 1))
							{
								statisticsmap[classname] = Math.max((statisticsmap[classname] || 0), (tempstatisticsmap[classname] || 0));
								tempstatisticsmap[classname] = 0;
							}
						});						
					});


					content = "";

					content += '<tr>';
					content += '<td>出现总次数</td>';
					content += '<td>'+($(".T15 span").length)+'</td>';
					content += '<td>'+($(".T16 span").length)+'</td>';
					content += '<td>'+($(".T17 span").length)+'</td>';
					content += '<td>'+($(".T18 span").length)+'</td>';
					content += '<td>'+($(".T19 span").length)+'</td>';
					content += '<td>'+($(".T20 span").length)+'</td>';
					content += '<td>'+($(".T21 span").length)+'</td>';
					content += '<td>'+($(".T22 span").length)+'</td>';
					content += '<td>'+($(".T23 span").length)+'</td>';
					content += '<td>'+($(".T24 span").length)+'</td>';
					content += '<td>'+($(".T25 span").length)+'</td>';
					content += '<td>'+($(".T26 span").length)+'</td>';
					content += '<td>'+($(".T27 span").length)+'</td>';
					content += '<td>'+($(".T28 span").length)+'</td>';
					content += '<td>'+($(".T29 span").length)+'</td>';
					content += '<td>'+($(".T30 span").length)+'</td>';
					content += '<td>'+($(".T31 span").length)+'</td>';
					content += '<td>'+($(".T32 span").length)+'</td>';
					content += '<td>'+($(".T33 span").length)+'</td>';
					content += '<td>'+($(".T34 span").length)+'</td>';
					content += '<td>'+($(".T35 span").length)+'</td>';
					content += '<td>'+($(".T36 span").length)+'</td>';
					content += '<td>'+($(".T37 span").length)+'</td>';
					content += '<td>'+($(".T38 span").length)+'</td>';
					content += '<td>'+($(".T39 span").length)+'</td>';
					content += '<td>'+($(".T40 span").length)+'</td>';
					content += '<td>'+($(".T41 span").length)+'</td>';
					content += '<td>'+($(".T42 span").length)+'</td>';
					content += '<td>'+($(".T43 span").length)+'</td>';
					content += '<td>'+($(".T44 span").length)+'</td>';
					content += '<td>'+($(".T45 span").length)+'</td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '</tr>';

					content += '<tr class="bluerow">';
					content += '<td>最大遗漏值</td>';

					content += '<td>'+(statisticsmap["YT15"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT16"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT17"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT18"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT19"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT20"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT21"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT22"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT23"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT24"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT25"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT26"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT27"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT28"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT29"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT30"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT31"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT32"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT33"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT34"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT35"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT36"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT37"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT38"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT39"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT40"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT41"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT42"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT43"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT44"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YT45"] || 0)+'</td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '</tr>';

					content += '<tr>';
					content += '<td>最大连出值</td>';
					content += '<td>'+(statisticsmap["LT15"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT16"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT17"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT18"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT19"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT20"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT21"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT22"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT23"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT24"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT25"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT26"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT27"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT28"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT29"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT30"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT31"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT32"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT33"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT34"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT35"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT36"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT37"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT38"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT39"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT40"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT41"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT42"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT43"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT44"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LT45"] || 0)+'</td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '</tr>';


					$statistics.html(content);

					app.hideLoading();

				}
				else
				{
					app.hideLoading();
					app.message(response.messages);
				}
			});
		}
	</script>

</body>
</html>
