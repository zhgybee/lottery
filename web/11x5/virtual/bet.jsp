<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title>虚拟投注</title>
	<style>

	#navigation{background-color:#f3f3f3; height:68px; line-height:60px; border-bottom:8px solid #e7e7e7; box-sizing:border-box}
	#navigation h4{float:left; font-size:20px; font-weight:200; padding-left:15px}
	#navigation .toolbar-panel{float:right; padding-right:15px;}
	table{border:none; table-layout:fixed; border-collapse:collapse; border-spacing:0px; padding:0px; margin:0px; width:100%}
	thead{background-color:#ffffff;}
	table thead th {border:none; margin:0px; padding:15px 0px; text-align:center; background-color:#8dd8ff}
	table thead th > div{border-right:1px solid #ffffff; color:#ffffff}
	table thead th:last-child div{border-right:none}
	table tbody tr{border-bottom:1px solid #eeeeee}
	table tbody td{border:none; padding:15px 0px; margin:0px; background-color:#ffffff; text-align:center}
	table tbody td > div{border-right:1px solid #eeeeee}

	table tbody td > div.status{display:flex; justify-content:center}
	table tbody td > div.status div{background-color:#cccccc; color:#ffffff; width:25px; height:25px; border-radius:25px; line-height:25px; text-align:center}
	table tbody td > div.status .victory{background-color:#ffaa00}
	table tbody td > div.status .fail{background-color:green}
	table tbody td > div .time{color:green}
	table tbody td > div .date{font-size:10px}
	table tbody td > div.code-box{display:flex; justify-content:center}
	table tbody td > div.code-box div{margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:20px; color:#ffffff; text-align:center; line-height:20px}
	table tbody td > div .browse-code-button{color:#ffffff; background-color:#ffaa00; padding:2px 5px; cursor:pointer}
	table tbody td > div .delete-button{color:#ffffff; background-color:#ba2636; padding:2px 5px; cursor:pointer}


	#browse-code-panel{width:600px; height:400px; position:absolute; background-color:#f3f3f3; display:none}
	#browse-code-panel .title{height:50px; background-color:#4ab6ef; color:#ffffff; display:flex; justify-content:space-between; align-items:center; font-size:16px}
	#browse-code-panel .title i{margin-right:20px; font-size:22px; cursor:pointer}
	#browse-code-panel .codes{padding:10px; background-color:#ffffff; overflow-y:scroll; height:345px; border:1px solid #f3f3f3; box-sizing:border-box;}
	</style>
</head>
<body>

<div id="navigation" class="clearfix">
	<h4 style="float:left">更多投注记录</h4>		
	<div style="width:600px; float:right; text-align:right; padding-right:15px">
		选择频道<input id="11x5-type" class="lottery-type-field" value="sd11x5" title="山东11选5" style="margin-left:15px;"/>
	</div>
</div>
<div style="background-color:#eeeeee">
	<table>
		<thead>
			<tr>
				<th style="width:50px"><div>&nbsp;</div></th>
				<th style="width:90px"><div>彩种</div></th>
				<th style="width:100px"><div>期号</div></th>
				<th style="width:80px"><div>玩法</div></th>
				<th style="width:60px"><div>注数</div></th>
				<th style="width:60px"><div>倍数</div></th>
				<th style="width:90px"><div>投注金币</div></th>
				<th style="width:90px"><div>中奖金币</div></th>
				<th style="width:90px"><div>投注时间</div></th>
				<th style="width:130px"><div>开奖号码</div></th>
				<th style="width:80px"><div>投注号码</div></th>
				<th style="width:80px"><div></div></th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>	
</div>

<div id="browse-code-panel">
	<div class="title"><span style="padding-left:20px">投注号码</span><span onclick="closeCodePanel()"><i class="fa fa-close"></i></span></div>
	<div style="background-color:#eeeeee; height:5px"></div>
	<div class="codes"></div>
</div>

<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="../../lib/app.js"></script>
<script src="../../lib/selection/selection.js"></script>

<script type="text/javascript">


	var global = 
	{
		way:{"2":"任选二码", "3":"任选三码", "4":"任选四码", "5":"任选五码", "6":"任选六码", "7":"任选七码", "8":"任选八码"},
		type:(app.getParameter("type") || 'sd11x5'),
		typemap:null
	}


	$(function()
	{
		$("#11x5-type").selection
		({
			url: "../dictionary/list/type.synchro.json",
			ismultiple:false,
			clickitem:function()
			{
				window.location.href = 'bet.jsp?type='+$("#11x5-type").val();
			}
		});
		$("#11x5-type").selection("setId", global['type']);

		$("#browse-code-panel").css("top", ($(window).height() - $("#browse-code-panel").height()) / 2);
		$("#browse-code-panel").css("left", ($(window).width() - $("#browse-code-panel").width()) / 2);

		$.getJSON("../dictionary/map/type.json", function(items)
		{
			global['typemap'] = items;
			getResource();
		});
			

		$("table").on("click", ".browse-code-button", function()
		{
			var id = $(this).closest("tr").attr("code");

			app.showLoading();
			$.getJSON("../service/virtual.jsp?mode=3&id="+id, function(response)
			{		
				app.hideLoading();
				if(response.status == 1)
				{
					var bet = response.resource.bet;

					var code = bet['CODE'];

					var reg = new RegExp(',', "g")
					code = code.replace(reg , '<br/>');
					$("#browse-code-panel .codes").html(code);

					openCodePanel();
				}
				else
				{
					app.message(response.messages);
				}
			});
		});

		$("table").on("click", ".delete-button", function()
		{
			var id = $(this).closest("tr").attr("code");

			app.showLoading();
			$.getJSON("../service/virtual.jsp?mode=5&id="+id, function(response)
			{		
				app.hideLoading();
				if(response.status == 1)
				{
					getResource();
				}
				else
				{
					app.message(response.messages);
				}
			});
		});
	});

	function openCodePanel()
	{
		$("#browse-code-panel").fadeIn();
	}
	function closeCodePanel()
	{
		$("#browse-code-panel").fadeOut();
	}

	function getResource()
	{
		var current = new Date();
		current = app.formatdate(current, "yyyyMMddhhmm");

		app.showLoading();
		$.getJSON("../service/virtual.jsp?mode=4&type="+global['type'], function(response)
		{
			if(response.status == 1)
			{
				var bets = response.resource.bets;

				var text = '';
				$.each(bets, function(i, bet)
				{
					var boxs = "";
					var actualcodes = bet['ACTUALCODE'];
					if(actualcodes != null)
					{
						actualcodes = actualcodes.split(",");
						for(var i = 0 ; i < actualcodes.length ; i++)
						{
							boxs += '<div>'+actualcodes[i]+'</div>';
						}
					}

					var status = '<div>待</div>';
					if(bet['IS_BINGO'] != null)
					{
						status = bet['IS_BINGO'] == 1 ? '<div class="victory">奖</div>' : '<div class="fail">未</div>';
					}

					text += '<tr code="'+bet['ID']+'">';
					text += '	<td><div class="status">'+status+'</div></td>';
					text += '	<td><div>'+global['typemap'][bet['TYPE']]+'</div></td>';
					text += '	<td><div>'+bet['PHASE']+'</div></td>';
					text += '	<td><div>'+global['way'][bet['WAY']]+'</div></td>';
					text += '	<td><div>'+bet['COUNT']+'</div></td>';
					text += '	<td><div>'+bet['MULTIPLE']+'</div></td>';
					text += '	<td><div>'+bet['CHIP']+'</div></td>';
					text += '	<td><div>'+bet['ACHIEVE']+'</div></td>';
					text += '	<td><div><span class="time">'+app.formatdate(bet['CREATE_DATE'], "hh时mm分")+'</span><br/><span class="date">'+app.formatdate(bet['CREATE_DATE'], "yyyy.MM.dd")+'</span></div></td>';
					text += '	<td><div class="code-box">'+boxs+'</div></td>';
					text += '	<td><div><span class="browse-code-button">查看</span></div></td>';
					if(bet['IS_FINISHED'] == '1')
					{
						text += '	<td><div><span class="delete-button">删除</span></div></td>';
					}
					else if((current - app.formatdate(bet['CREATE_DATE'], "yyyyMMddhhmm")) <= 2)
					{
						text += '	<td><div><span class="delete-button" title="2分钟内可撤销">撤销</span></div></td>';
					}
					else
					{
						text += '	<td><div></div></td>';
					}

					text += '</tr>';
				});
				$("table tbody").html(text);


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
