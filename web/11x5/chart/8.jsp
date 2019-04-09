<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title>号码分布</title>
	<style>
	td{font-size:15px}
	#chart-panel table .c1{background-color:#fafafa; color:#cccccc; width:38px; height:38px; line-height:38px; display:block; text-align:center; box-sizing:border-box; padding-top:0px; margin-left:1px}
	#chart-panel table .c2{background-color:#eeeeee; color:#cccccc; width:38px; height:38px; line-height:38px; display:block; text-align:center; box-sizing:border-box; padding-top:0px; margin-left:1px}
	#chart-panel table .c3{background-color:#b9eeff; color:#aaaaaa; width:38px; height:38px; line-height:38px; display:block; text-align:center; box-sizing:border-box; padding-top:0px; margin-left:1px}
	#chart-panel table .c4{background-color:#ffc15f; color:#ffffff; width:38px; height:38px; line-height:38px; display:block; text-align:center; box-sizing:border-box; padding-top:0px; margin-left:1px}
	#chart-panel table .c5{background-color:#ff5949; color:#ffffff; width:38px; height:38px; line-height:38px; display:block; text-align:center; box-sizing:border-box; padding-top:0px; margin-left:1px}


	</style>
</head>
<body>
<jsp:include page="../../menu.jsp" flush="true"></jsp:include>
<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4>号码分布</h4>
		<div class="toolbar-panel">
			<button class="button lottery-refresh-button" onclick="window.location.reload()">刷新</button>
		</div>
	</div>
	<div class="sub-module chart-module">		
		<div id="chart-panel">

			<div id="chart-buttons">
				<a class="button lottery-button" href="0.jsp" target="_blank">号码分布</a>
				<a class="button lottery-button" href="1.jsp" target="_blank">基本</a>
				<a class="button lottery-button" href="2.jsp" target="_blank">和值</a>
				<a class="button lottery-button" href="3.jsp" target="_blank">跨度</a>
				<a class="button lottery-button" href="4.jsp" target="_blank">大小</a>
				<a class="button lottery-button" href="5.jsp" target="_blank">奇偶</a>
				<a class="button lottery-button" href="6.jsp" target="_blank">质合</a>
				<a class="button lottery-button" href="7.jsp" target="_blank">隔期重号</a>
				<a class="button lottery-disabled-button" href="8.jsp" target="_blank">热码</a>
				<a class="button lottery-button" href="9.jsp" target="_blank">热码走势</a>
				<input id="11x5-merge" class="lottery-type-field" style="width:80px; text-align:center"/>
				<input id="11x5-type" class="lottery-type-field" style="width:120px; text-align:center"/>
			</div>

			<div id="detailed-panel">
				<table>
					<thead>
					<tr>
						<th rowspan="2" style="width:400px; min-width:400px">期号</th>
						<th colspan="11">号码分布</th>
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
		var length = 500
		var merge = app.getParameter("merge") || "10";
		$(function()
		{
			$("#11x5-type").selection
			({
				url: "../dictionary/list/type.json",
				ismultiple: false,
				clickitem:function()
				{
					window.location.href = '8.jsp?type='+$("#11x5-type").val()+'&merge='+$("#11x5-merge").val();
				}
			});

			if(type != null)
			{
				var titles = $("#11x5-type").selection("setId", type);
				$("title").html($("title").html() + "-" + titles[0]);
			}

			$("#11x5-merge").selection
			({
				url: "../dictionary/list/merge.json",
				ismultiple: false,
				clickitem:function()
				{
					window.location.href = '8.jsp?type='+$("#11x5-type").val()+'&merge='+$("#11x5-merge").val();
				}
			});

			if(merge != null)
			{
				$("#11x5-merge").selection("setId", merge);
			}

			initialise();
		});

		function initialise()
		{
			let number = parseInt(merge);
			app.showLoading();
			$.getJSON("../service/data.jsp?mode=1&length="+length+"&type="+$("#11x5-type").val(), function(response)
			{
				if(response.status == 1)
				{
					var rows = response.resource.data;


					let start = "";
					let summap = {};
					for(var i = 0 ; i < rows.length ; i++)
					{
						var row = rows[i];
						let index = i % number;
						if(index == 0)
						{
							summap = {};
							start = row["PHASE"];
						}

						var codes = row["CODE"].split(",");
						$.each(codes, function(j, code)
						{
							summap[code] = (summap[code] || 0) + 1;
						});

						if(index == number - 1)
						{
							let content = "";
							content += '<tr>';
							content += '<td style="height:40px">'+start+'期 至 '+row["PHASE"]+'期</td>';


							content += '<td class="K01" style="width:40px"><span class="'+getColor(number, (summap['01'] || 0))+'">'+(summap['01'] || 0)+'</span></td>';
							content += '<td class="K02" style="width:40px"><span class="'+getColor(number, (summap['02'] || 0))+'">'+(summap['02'] || 0)+'</span></td>';
							content += '<td class="K03" style="width:40px"><span class="'+getColor(number, (summap['03'] || 0))+'">'+(summap['03'] || 0)+'</span></td>';
							content += '<td class="K04" style="width:40px"><span class="'+getColor(number, (summap['04'] || 0))+'">'+(summap['04'] || 0)+'</span></td>';
							content += '<td class="K05" style="width:40px"><span class="'+getColor(number, (summap['05'] || 0))+'">'+(summap['05'] || 0)+'</span></td>';
							content += '<td class="K06" style="width:40px"><span class="'+getColor(number, (summap['06'] || 0))+'">'+(summap['06'] || 0)+'</span></td>';
							content += '<td class="K07" style="width:40px"><span class="'+getColor(number, (summap['07'] || 0))+'">'+(summap['07'] || 0)+'</span></td>';
							content += '<td class="K08" style="width:40px"><span class="'+getColor(number, (summap['08'] || 0))+'">'+(summap['08'] || 0)+'</span></td>';
							content += '<td class="K09" style="width:40px"><span class="'+getColor(number, (summap['09'] || 0))+'">'+(summap['09'] || 0)+'</span></td>';
							content += '<td class="K10" style="width:40px"><span class="'+getColor(number, (summap['10'] || 0))+'">'+(summap['10'] || 0)+'</span></td>';
							content += '<td class="K11" style="width:40px"><span class="'+getColor(number, (summap['11'] || 0))+'">'+(summap['11'] || 0)+'</span></td>';
							content += '</tr>';

							$("tbody").append(content);
						}


					}


					app.hideLoading();
				}
				else
				{
					app.hideLoading();
					app.message(response.messages);
				}
			});
		}

		function getColor(number, count)
		{
			var space =  number / 5;
			if(space * 1 >= count)
			{
				return "c1";
			}
			else if(space * 2 >= count)
			{
				return "c2";
			}
			else if(space * 3 >= count)
			{
				return "c3";
			}
			else if(space * 4 >= count)
			{
				return "c4";
			}
			else if(space * 5 >= count)
			{
				return "c5";
			}

			
		}

	</script>

</body>
</html>
