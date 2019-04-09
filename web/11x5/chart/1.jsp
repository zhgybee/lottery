<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title>基本走势图</title>
</head>
<body>

<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4>基本走势图</h4>
		<div class="toolbar-panel">
			<button class="button lottery-refresh-button" onclick="window.location.reload()">刷新</button>
		</div>
	</div>
	<div class="sub-module chart-module">		
		<div id="chart-panel">

			<div id="chart-buttons">
				<a class="button lottery-button" href="0.jsp" target="_blank">号码分布</a>
				<a class="button lottery-disabled-button" href="1.jsp" target="_blank">基本</a>
				<a class="button lottery-button" href="2.jsp" target="_blank">和值</a>
				<a class="button lottery-button" href="3.jsp" target="_blank">跨度</a>
				<a class="button lottery-button" href="4.jsp" target="_blank">大小</a>
				<a class="button lottery-button" href="5.jsp" target="_blank">奇偶</a>
				<a class="button lottery-button" href="6.jsp" target="_blank">质合</a>
				<a class="button lottery-button" href="7.jsp" target="_blank">隔期重号</a>
				<a class="button lottery-button" href="8.jsp" target="_blank">热码</a>
				<a class="button lottery-button" href="9.jsp" target="_blank">热码走势</a>
				<input id="11x5-length" class="lottery-type-field" style="width:80px; text-align:center"/>
				<input id="11x5-type" class="lottery-type-field" style="width:120px; text-align:center"/>
			</div>

			<div id="detailed-panel">
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:100px; min-width:100px">期号</th>
						<th rowspan="2" colspan="5">开奖号码</th>
						<th colspan="11">开奖号码分布</th>
						<th rowspan="2" style="width:60px">重号数</th>
						<th rowspan="2" style="width:60px">连号数</th>
						<th rowspan="2" style="width:60px">和值</th>
						<th rowspan="2" style="width:60px">跨度</th>
						<th rowspan="2" style="width:60px">奇偶比</th>
						<th rowspan="2" style="width:60px">质合比</th>
						<th colspan="6">奇数个数</th>
						<th colspan="6">质数个数</th>
					</tr>
					<tr>
						<th>01</th>
						<th>02</th>
						<th>03</th>
						<th>04</th>
						<th>05</th>
						<th>06</th>
						<th>07</th>
						<th>08</th>
						<th>09</th>
						<th>10</th>
						<th>11</th>
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
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:230px; min-width:230px">统计类型</th>
						<th colspan="11">开奖号码分布</th>
						<th rowspan="2" style="width:60px">重号数</th>
						<th rowspan="2" style="width:60px">连号数</th>
						<th rowspan="2" style="width:60px">和值</th>
						<th rowspan="2" style="width:60px">跨度</th>
						<th rowspan="2" style="width:60px">奇偶比</th>
						<th rowspan="2" style="width:60px">质合比</th>
						<th colspan="6">奇数个数（偶数）</th>
						<th colspan="6">质数个数（合数）</th>
					</tr>
					<tr>
						<th>01</th>
						<th>02</th>
						<th>03</th>
						<th>04</th>
						<th>05</th>
						<th>06</th>
						<th>07</th>
						<th>08</th>
						<th>09</th>
						<th>10</th>
						<th>11</th>
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

	<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
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
					window.location.href = '1.jsp?type='+$("#11x5-type").val()+'&length='+$("#11x5-length").val();
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
					window.location.href = '1.jsp?type='+$("#11x5-type").val()+'&length='+$("#11x5-length").val();
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
						content += '<td>'+row["PHASE"]+'</td>';
						content += '<td class="redcode">'+codes[0]+'</td>';
						content += '<td class="redcode">'+codes[1]+'</td>';
						content += '<td class="redcode">'+codes[2]+'</td>';
						content += '<td class="redcode">'+codes[3]+'</td>';
						content += '<td class="redcode">'+codes[4]+'</td>';


						content += '<td class="K01">'+(codes.indexOf('01') == -1 ? '' : '<span class="redball">01</span>')+'</td>';
						content += '<td class="K02">'+(codes.indexOf('02') == -1 ? '' : '<span class="redball">02</span>')+'</td>';
						content += '<td class="K03">'+(codes.indexOf('03') == -1 ? '' : '<span class="redball">03</span>')+'</td>';
						content += '<td class="K04">'+(codes.indexOf('04') == -1 ? '' : '<span class="redball">04</span>')+'</td>';
						content += '<td class="K05">'+(codes.indexOf('05') == -1 ? '' : '<span class="redball">05</span>')+'</td>';
						content += '<td class="K06">'+(codes.indexOf('06') == -1 ? '' : '<span class="redball">06</span>')+'</td>';
						content += '<td class="K07">'+(codes.indexOf('07') == -1 ? '' : '<span class="redball">07</span>')+'</td>';
						content += '<td class="K08">'+(codes.indexOf('08') == -1 ? '' : '<span class="redball">08</span>')+'</td>';
						content += '<td class="K09">'+(codes.indexOf('09') == -1 ? '' : '<span class="redball">09</span>')+'</td>';
						content += '<td class="K10">'+(codes.indexOf('10') == -1 ? '' : '<span class="redball">10</span>')+'</td>';
						content += '<td class="K11">'+(codes.indexOf('11') == -1 ? '' : '<span class="redball">11</span>')+'</td>';

						var repcount = 0;
						if(i != 0)
						{
							var precodes = rows[i - 1]["CODE"].split(",");
							if(precodes != null)
							{
								repcount = app.repeatcount(codes, precodes);
							}
						}

						content += '<td class="CHS1">'+repcount+'</td>';
						content += '<td class="LHS1">'+concount(codes)+'</td>';


						var total = 0
						var max = null;
						var min = null;
						var oddcount = 0;
						var primecount = 0;
						$.each(codes, function(i, code)
						{
							code = parseInt(code)
							total += code;

							max = Math.max(code, (max || code));
							min = Math.min(code, (min || code));
							if(app.isOdd(code))
							{
								oddcount += 1;
							}
							if(app.isPrime(code))
							{
								primecount += 1;
							}

						});

						content += '<td>'+total+'</td>';
						content += '<td>'+(max - min)+'</td>';
						content += '<td>'+oddcount+':'+(5 - oddcount)+'</td>';
						content += '<td>'+primecount+':'+(5 - primecount)+'</td>';
						content += '<td class="J0">'+(oddcount == 0 ?   '<span class="yellowrect">0</span>' : '')+'</td>';
						content += '<td class="J1">'+(oddcount == 1 ?   '<span class="yellowrect">1</span>' : '')+'</td>';
						content += '<td class="J2">'+(oddcount == 2 ?   '<span class="yellowrect">2</span>' : '')+'</td>';
						content += '<td class="J3">'+(oddcount == 3 ?   '<span class="yellowrect">3</span>' : '')+'</td>';
						content += '<td class="J4">'+(oddcount == 4 ?   '<span class="yellowrect">4</span>' : '')+'</td>';
						content += '<td class="J5">'+(oddcount == 5 ?   '<span class="yellowrect">5</span>' : '')+'</td>';
						content += '<td class="Z0">'+(primecount == 0 ? '<span class="greenrect">0</span>' : '')+'</td>';
						content += '<td class="Z1">'+(primecount == 1 ? '<span class="greenrect">1</span>' : '')+'</td>';
						content += '<td class="Z2">'+(primecount == 2 ? '<span class="greenrect">2</span>' : '')+'</td>';
						content += '<td class="Z3">'+(primecount == 3 ? '<span class="greenrect">3</span>' : '')+'</td>';
						content += '<td class="Z4">'+(primecount == 4 ? '<span class="greenrect">4</span>' : '')+'</td>';
						content += '<td class="Z5">'+(primecount == 5 ? '<span class="greenrect">5</span>' : '')+'</td>';
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
					content += '<td>'+($(".K01 span").length)+'</td>';
					content += '<td>'+($(".K02 span").length)+'</td>';
					content += '<td>'+($(".K03 span").length)+'</td>';
					content += '<td>'+($(".K04 span").length)+'</td>';
					content += '<td>'+($(".K05 span").length)+'</td>';
					content += '<td>'+($(".K06 span").length)+'</td>';
					content += '<td>'+($(".K07 span").length)+'</td>';
					content += '<td>'+($(".K08 span").length)+'</td>';
					content += '<td>'+($(".K09 span").length)+'</td>';
					content += '<td>'+($(".K10 span").length)+'</td>';
					content += '<td>'+($(".K11 span").length)+'</td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td>'+($(".J0 span").length)+'</td>';
					content += '<td>'+($(".J1 span").length)+'</td>';
					content += '<td>'+($(".J2 span").length)+'</td>';
					content += '<td>'+($(".J3 span").length)+'</td>';
					content += '<td>'+($(".J4 span").length)+'</td>';
					content += '<td>'+($(".J5 span").length)+'</td>';
					content += '<td>'+($(".Z0 span").length)+'</td>';
					content += '<td>'+($(".Z1 span").length)+'</td>';
					content += '<td>'+($(".Z2 span").length)+'</td>';
					content += '<td>'+($(".Z3 span").length)+'</td>';
					content += '<td>'+($(".Z4 span").length)+'</td>';
					content += '<td>'+($(".Z5 span").length)+'</td>';
					content += '</tr>';

					content += '<tr class="bluerow">';
					content += '<td>最大遗漏值</td>';
					content += '<td>'+(statisticsmap["YK01"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK02"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK03"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK04"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK06"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK07"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK08"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK09"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK10"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK11"] || 0)+'</td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td>'+(statisticsmap["YJ0"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YJ1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YJ2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YJ3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YJ4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YJ5"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZ0"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZ1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZ2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZ3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZ4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZ5"] || 0)+'</td>';
					content += '</tr>';

					content += '<tr>';
					content += '<td>最大连出值</td>';
					content += '<td>'+(statisticsmap["LK01"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK02"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK03"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK04"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK06"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK07"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK08"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK09"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK10"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK11"] || 0)+'</td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td></td>';
					content += '<td>'+(statisticsmap["LJ0"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LJ1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LJ2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LJ3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LJ4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LJ5"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZ0"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZ1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZ2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZ3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZ4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZ5"] || 0)+'</td>';
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

		function concount(codes)
		{
			codes.sort();
			var count = 0;
			for(var i = 0 ; i < codes.length ; i++)
			{
				if(i < codes.length - 1)
				{
					var code = codes[i];
					if(parseInt(code) + 1 == parseInt(codes[i + 1]))
					{
						count++;
					}
				}
			}
			return count;
		}

	</script>

</body>
</html>
