<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title></title>
</head>
<body>

<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4>跨度走势图</h4>
		<div class="toolbar-panel">
			<input id="11x5-type" class="lottery-type-field" value="ah11x5" title="安徽11选5"/>
			<button class="button lottery-refresh-button" onclick="window.location.reload()">刷新</button>
		</div>
	</div>
	<div class="sub-module chart-module">
		<div id="chart-panel">
			<div id="detailed-panel">
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:100px">期号</th>
						<th rowspan="2" colspan="5" style="width:125px">开奖号码</th>
						<th colspan="11" style="width:275px">开奖号码分布</th>
						<th colspan="7" style="width:175px">跨度走势</th>
						<th colspan="4" style="width:100px">跨度形态</th>
						<th colspan="3" style="width:75px">跨度012路</th>
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
						<th>4</th>
						<th>5</th>
						<th>6</th>
						<th>7</th>
						<th>8</th>
						<th>9</th>
						<th>10</th>
						<th>奇</th>
						<th>偶</th>
						<th>质</th>
						<th>合</th>
						<th>0路</th>
						<th>1路</th>
						<th>2路</th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<div id="statistics-panel">
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:226px">统计类型</th>
						<th colspan="11" style="width:275px">开奖号码分布</th>
						<th colspan="7" style="width:175px">跨度走势</th>
						<th colspan="4" style="width:100px">跨度形态</th>
						<th colspan="3" style="width:75px">跨度012路</th>
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
						<th>4</th>
						<th>5</th>
						<th>6</th>
						<th>7</th>
						<th>8</th>
						<th>9</th>
						<th>10</th>
						<th>奇</th>
						<th>偶</th>
						<th>质</th>
						<th>合</th>
						<th>0路</th>
						<th>1路</th>
						<th>2路</th>
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
		
		var type = app.getParameter("type");
		$(function()
		{
			$("#11x5-type").selection
			({
				url: "../dictionary/list/type.json",
				ismultiple: false,
				clickitem:function()
				{
					window.location.href = '3.jsp?type='+$("#11x5-type").val();
				}
			});

			if(type != null)
			{
				$("#11x5-type").selection("setId", type);
			}
			initialise();
		});

		function initialise()
		{
			app.showLoading();
			$.getJSON("../service/data.jsp?mode=1&length=100&type="+$("#11x5-type").val(), function(response)
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

						var max = null;
						var min = null;
						$.each(codes, function(i, code)
						{
							code = parseInt(code)
							max = Math.max(code, (max || code));
							min = Math.min(code, (min || code));
						});

						var length = max - min;

						content += '<td class="ZS04">'+(length == 4 ? '<span class="greenrect">4</span>' : '')+'</td>';
						content += '<td class="ZS05">'+(length == 5 ? '<span class="greenrect">5</span>' : '')+'</td>';
						content += '<td class="ZS06">'+(length == 6 ? '<span class="greenrect">6</span>' : '')+'</td>';
						content += '<td class="ZS07">'+(length == 7 ? '<span class="greenrect">7</span>' : '')+'</td>';
						content += '<td class="ZS08">'+(length == 8 ? '<span class="greenrect">8</span>' : '')+'</td>';
						content += '<td class="ZS09">'+(length == 9 ? '<span class="greenrect">9</span>' : '')+'</td>';
						content += '<td class="ZS10">'+(length == 10 ? '<span class="greenrect">10</span>' : '')+'</td>';


						content += '<td class="XT1">'+(app.isOdd(length) ? '<span class="yellowrect">奇</span>' : '')+'</td>';
						content += '<td class="XT2">'+(!app.isOdd(length) ? '<span class="yellowrect">偶</span>' : '')+'</td>';
						content += '<td class="XT3">'+(app.isPrime(length) ? '<span class="bluerect">质</span>' : '')+'</td>';
						content += '<td class="XT4">'+(!app.isPrime(length) ? '<span class="bluerect">合</span>' : '')+'</td>';

						content += '<td class="L0121">'+(length % 3 == 0 ? '<span class="purplerect">0路</span>' : '')+'</td>';
						content += '<td class="L0122">'+(length % 3 == 1 ? '<span class="purplerect">1路</span>' : '')+'</td>';
						content += '<td class="L0123">'+(length % 3 == 2 ? '<span class="purplerect">2路</span>' : '')+'</td>';


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
					content += '<td>'+($(".ZS04 span").length)+'</td>';
					content += '<td>'+($(".ZS05 span").length)+'</td>';
					content += '<td>'+($(".ZS06 span").length)+'</td>';
					content += '<td>'+($(".ZS07 span").length)+'</td>';
					content += '<td>'+($(".ZS08 span").length)+'</td>';
					content += '<td>'+($(".ZS09 span").length)+'</td>';
					content += '<td>'+($(".ZS10 span").length)+'</td>';
					content += '<td>'+($(".XT1 span").length)+'</td>';
					content += '<td>'+($(".XT2 span").length)+'</td>';
					content += '<td>'+($(".XT3 span").length)+'</td>';
					content += '<td>'+($(".XT4 span").length)+'</td>';
					content += '<td>'+($(".L0121 span").length)+'</td>';
					content += '<td>'+($(".L0122 span").length)+'</td>';
					content += '<td>'+($(".L0123 span").length)+'</td>';
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
					content += '<td>'+(statisticsmap["YZS04"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZS05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZS06"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZS07"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZS08"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZS09"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YZS10"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YXT1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YXT2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YXT3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YXT4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YL0121"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YL0122"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YL0123"] || 0)+'</td>';
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
					content += '<td>'+(statisticsmap["LZS04"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZS05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZS06"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZS07"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZS08"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZS09"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LZS10"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LXT1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LXT2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LXT3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LXT4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LL0121"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LL0122"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LL0123"] || 0)+'</td>';
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
