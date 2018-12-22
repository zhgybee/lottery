<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../lib/selection/selection.css" />
	<title></title>
	<style>
	
	#analysis-panel p{margin-bottom:10px; font-size:14px}
	#analysis-panel h5{margin-bottom:5px; font-size:14px}

	</style>
</head>
<body>
<jsp:include page="../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation">
		<h4>智能推荐</h4>
		<div class="toolbar-panel">
			<input id="11x5-type" class="lottery-type-field" value="ah11x5" title="安徽11选5"/>
			<button class="button lottery-refresh-button" onclick="window.location.reload()">刷新</button>
		</div>
	</div>
	<div class="sub-module chart-module" id="recommend-panel">
		<div id="recommend-type"><button class="button" id="r1">任选一码</button><button class="button" id="r3">任选三码</button><button class="button" id="r5">任选五码</button></div>
		<div id="chart-panel">
			<div id="detailed-panel">
				<table style="width:900px">
					<thead>
					<tr>
						<th style="width:150px">期号</th>
						<th style="width:300px">开奖号码</th>
						<th>推荐号码</th>
						<th>中奖号码</th>
						<th>推荐情况</th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script src="../lib/app.js"></script>
<script src="../lib/selection/selection.js"></script>

<script type="text/javascript">

	var type = app.getParameter("type");
	var size = app.getParameter("size") || 1;

	$(function()
	{
		$("#11x5-type").selection
		({
			url: "dictionary/list/type.json",
			ismultiple: false,
			clickitem:function()
			{
				window.location.href = 'recommend.jsp?type='+$("#11x5-type").val()+'&size='+size;
			}
		});

		if(type != null)
		{
			$("#11x5-type").selection("setId", type);
		}

		initialise();

		$("#r1").on("click", function()
		{
			window.location.href = 'recommend.jsp?type='+$("#11x5-type").val()+'&size=1';
		});

		$("#r3").on("click", function()
		{
			window.location.href = 'recommend.jsp?type='+$("#11x5-type").val()+'&size=3';
		});

		$("#r5").on("click", function()
		{
			window.location.href = 'recommend.jsp?type='+$("#11x5-type").val()+'&size=5';
		});
	});

	function initialise()
	{

		app.showLoading();
		$.getJSON("service/recommend.jsp?mode=1&type="+$("#11x5-type").val(), function(response)
		{
			app.hideLoading();
			if(response.status == 1)
			{
				var rows = response.resource.data;
				var $recommends = $("#recommend-panel table tbody");
				var content = '';
			
				for(var i = 0 ; i < rows.length ; i++)
				{
					var row = rows[i];
					var groups = $.parseJSON(row["CONTENT"]);
					var group = groups[size];

					var opencodes = "";
					if(row["CODE"] != null)
					{
						opencodes = "";
						var arraycode = row["CODE"].split(",");
						$.each(arraycode, function(index, opencode)
						{
							opencodes += '<span class="redball">'+opencode+'</span>';
						});
					}

					var recommendcodes = "";
					$.each(group, function(index, recommendcode)
					{
						recommendcodes += '<span class="yellowrect">'+recommendcode+'</span>';
					});

					var wincodes = "";
					var description = "";
					if(row["CODE"] != null)
					{
						description = "未中奖";
						var counter = 0;
						var winner = onwinner(rows, i, group, counter);
						if(winner != null)
						{
							winner.counter = winner.counter == 0 ? '当' : winner.counter;
							description = '<span class="purplerect">'+winner.counter+'期中出</span>';
							var array = winner.wincodes;
							$.each(array, function(index, item)
							{
								wincodes += '<span class="greenrect">'+item+'</span>';
							});
						}
					}

					content += '<tr>';
					content += '<td>'+row["PHASE"]+'</td>';
					content += '<td>'+opencodes+'</td>';
					content += '<td>'+recommendcodes+'</td>';
					content += '<td>'+wincodes+'</td>';
					content += '<td>'+description+'</td>';
					content += '</tr>';
				}
				$recommends.html(content);

			}
			else
			{
				app.message(response.messages);
			}
		});
	}

	function getWinCode(opencodes, recommendcodes)
	{
		var codes = [];
		if(opencodes != null)
		{
			opencodes = opencodes.split(",");

			$.each(recommendcodes, function(index, recommendcode)
			{
				if(opencodes.indexOf(recommendcode) != -1)
				{
					codes.push(recommendcode);
				}
			});

		}
		return codes;
	}

	function onwinner(rows, index, recommendcodes, counter)
	{
		if(counter < 6)
		{
			if(index < rows.length)
			{
				var row = rows[index];
				var opencodes = row["CODE"];
				if(opencodes != null)
				{
					var wincodes = getWinCode(opencodes, recommendcodes);
					if(wincodes.length > 0)
					{
						return {"counter":counter, "wincodes":wincodes};
					}
					else
					{
						return onwinner(rows, index - 1, recommendcodes, counter + 1);
					}
				}
			}
		}
		return null;
	}

</script>

</body>
</html>
