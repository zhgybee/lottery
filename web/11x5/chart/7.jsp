<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title>隔期重号走势图</title>
</head>
<body>

<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4>隔期重号走势图</h4>
		<div class="toolbar-panel">
			<button class="button lottery-refresh-button" onclick="window.location.reload()">刷新</button>
		</div>
	</div>
	<div class="sub-module chart-module">
		<div id="chart-panel">

			<div id="chart-buttons">
				<a class="button lottery-button" href="0.jsp" target="_blank">号码分布</a>
				<a class="button lottery-button" href="1.jsp" target="_blank">基本走势图</a>
				<a class="button lottery-button" href="2.jsp" target="_blank">和值走势图</a>
				<a class="button lottery-button" href="3.jsp" target="_blank">跨度走势图</a>
				<a class="button lottery-button" href="4.jsp" target="_blank">大小走势图</a>
				<a class="button lottery-button" href="5.jsp" target="_blank">奇偶走势图</a>
				<a class="button lottery-button" href="6.jsp" target="_blank">质合走势图</a>
				<a class="button lottery-disabled-button" href="7.jsp" target="_blank">隔期重号走势图</a>
				<input id="11x5-length" class="lottery-type-field" style="width:80px; text-align:center"/>
				<input id="11x5-type" class="lottery-type-field" style="width:120px; text-align:center"/>
			</div>
			<div id="detailed-panel">
			<table style="width:1725px">
				<thead>
				<tr>
					<th rowspan="2" style="width:100px">期号</th>
					<th rowspan="2" colspan="5" style="width:125px">开奖号码</th>
					<th colspan="6" style="width:150px">隔一期重号</th>
					<th colspan="6" style="width:150px">隔二期重号</th>
					<th colspan="6" style="width:150px">隔三期重号</th>
					<th colspan="6" style="width:150px">隔四期重号</th>
					<th colspan="6" style="width:150px">隔五期重号</th>
					<th colspan="6" style="width:150px">隔六期重号</th>
					<th colspan="6" style="width:150px">隔七期重号</th>
					<th colspan="6" style="width:150px">隔八期重号</th>
					<th colspan="6" style="width:150px">隔九期重号</th>
					<th colspan="6" style="width:150px">隔十期重号</th>
				</tr>
				<tr>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
				</tr>
				</thead>
				<tbody></tbody>
			</table>
			</div>

			<div id="statistics-panel">
			<table style="width:1726px">
				<thead>
				<tr>
					<th rowspan="2" style="width:226px">统计类型</th>
					<th colspan="6" style="width:150px">隔一期重号</th>
					<th colspan="6" style="width:150px">隔二期重号</th>
					<th colspan="6" style="width:150px">隔三期重号</th>
					<th colspan="6" style="width:150px">隔四期重号</th>
					<th colspan="6" style="width:150px">隔五期重号</th>
					<th colspan="6" style="width:150px">隔六期重号</th>
					<th colspan="6" style="width:150px">隔七期重号</th>
					<th colspan="6" style="width:150px">隔八期重号</th>
					<th colspan="6" style="width:150px">隔九期重号</th>
					<th colspan="6" style="width:150px">隔十期重号</th>
				</tr>
				<tr>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
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
		var map = {};
		$(function()
		{
			$("#11x5-type").selection
			({
				url: "../dictionary/list/type.json",
				ismultiple: false,
				clickitem:function()
				{
					window.location.href = '7.jsp?type='+$("#11x5-type").val()+'&length='+$("#11x5-length").val();
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
					window.location.href = '7.jsp?type='+$("#11x5-type").val()+'&length='+$("#11x5-length").val();
				}
			});

			if(length != null)
			{
				$("#11x5-length").selection("setId", length);
			}
			initialise();
		});

		var colors = 
		{
			"1":"yellowrect",
			"2":"greenrect",
			"3":"bluerect",
			"4":"purplerect",
			"5":"seagreenrect",
			"6":"yellowrect",
			"7":"greenrect",
			"8":"bluerect",
			"9":"purplerect",
			"10":"seagreenrect"
		}

		function repeatcontent(codes, prerow, index)
		{
			var content = "";
			
			var repcount = 0;
			if(prerow != null)
			{
				var precodes = prerow["CODE"].split(",");
				repcount = app.repeatcount(codes, precodes);
			}

			for(var i = 0 ; i <= 5 ; i++)
			{
				var value = map[index+'-'+i];
				if(value == null)
				{
					value = 1;
					map[index+'-'+i] = 1;
				}
				if(i == repcount)
				{
					value = '<span class="'+colors[index]+'">'+i+'</span>';
					map[index+'-'+i] = 1;
					
					if(map[index+'-'+i+'-sum'] == null)
					{
						map[index+'-'+i+'-sum'] = 1;
					}
					else
					{
						map[index+'-'+i+'-sum'] += 1;
					}


					if(map[index+'-'+i+'-contemp'] == null)
					{
						map[index+'-'+i+'-contemp'] = 1;
					}
					else
					{
						map[index+'-'+i+'-contemp'] += 1;
					}
				}
				else
				{
					map[index+'-'+i] = value + 1;
					
					if(map[index+'-'+i+'-lose'] == null)
					{
						map[index+'-'+i+'-lose'] = 1;
					}
					else
					{
						map[index+'-'+i+'-lose'] += 1;
					}

					if(map[index+'-'+i+'-contemp'] != null)
					{
						if(map[index+'-'+i+'-con'] == null)
						{
							map[index+'-'+i+'-con'] = map[index+'-'+i+'-contemp'];
						}
						else
						{
							map[index+'-'+i+'-con'] = Math.max(map[index+'-'+i+'-contemp'], map[index+'-'+i+'-con'])
						}
						map[index+'-'+i+'-contemp'] = 0;
					}
				}
				content += '<td class="greycode">'+value+'</td>';
			}

			return content;
		}

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
						content += '<td>'+row["PHASE"]+'</td>';
						content += '<td class="redcode">'+codes[0]+'</td>';
						content += '<td class="redcode">'+codes[1]+'</td>';
						content += '<td class="redcode">'+codes[2]+'</td>';
						content += '<td class="redcode">'+codes[3]+'</td>';
						content += '<td class="redcode">'+codes[4]+'</td>';

						content += repeatcontent(codes, rows[i - 1], 1);
						content += repeatcontent(codes, rows[i - 2], 2);
						content += repeatcontent(codes, rows[i - 3], 3);
						content += repeatcontent(codes, rows[i - 4], 4);
						content += repeatcontent(codes, rows[i - 5], 5);
						content += repeatcontent(codes, rows[i - 6], 6);
						content += repeatcontent(codes, rows[i - 7], 7);
						content += repeatcontent(codes, rows[i - 8], 8);
						content += repeatcontent(codes, rows[i - 9], 9);
						content += repeatcontent(codes, rows[i - 10], 10);

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
					
					for(var i = 1 ; i <= 10 ; i++)
					{
						for(var l = 0 ; l <= 5 ; l++)
						{
							content += '<td>'+(map[''+i+'-'+l+'-sum'] || 0)+'</td>';
						}
					}

					content += '</tr>';

					content += '<tr class="bluerow">';
					content += '<td>最大遗漏值</td>';					
					for(var i = 1 ; i <= 10 ; i++)
					{
						for(var l = 0 ; l <= 5 ; l++)
						{
							content += '<td>'+(map[''+i+'-'+l+'-lose'] || 0)+'</td>';
						}
					}
					content += '</tr>';

					content += '<tr>';
					content += '<td>最大连出值</td>';				
					for(var i = 1 ; i <= 10 ; i++)
					{
						for(var l = 0 ; l <= 5 ; l++)
						{
							content += '<td>'+(map[''+i+'-'+l+'-con'] || 0)+'</td>';
						}
					}
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
