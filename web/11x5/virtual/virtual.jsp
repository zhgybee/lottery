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

	#header{background-color:#ffffff; padding:20px; box-sizing:border-box; display:flex; align-items:center}
	#header #progress-text{margin-right:12px; text-align:center}
	#header #progress-text h5{font-size:21px; font-weight:200}
	#header #progress-text p{font-size:12px; color:#4ab6ef}

	#header #progress-countdown{display:flex; align-items:center}
	#header #progress-countdown .time-box{font-weight:bold; font-size:16px; width:40px; height:40px; background-color:#333333; border-radius:5px;; color:#ffffff; text-align:center; line-height:40px}
	#header #progress-countdown .separation{margin:0px 6px}

	#header #previous-text{margin:0px 12px 0px 50px; text-align:center}
	#header #previous-text h5{font-size:21px; font-weight:200}
	#header #previous-text p{font-size:12px; color:#ba2636}

	#header #previous-code{display:flex; align-items:center; flex-grow:1}
	#header #previous-code div{font-size:16px; width:40px; height:40px; background-color:#ba2636; border-radius:40px; margin-right:8px; color:#ffffff; text-align:center; line-height:40px}

	#header #mycoin{display:flex; align-items:center; padding-right:20px}
	#header #mycoin #mycoin-icon{margin-right:6px}
	#header #mycoin #mycoin-icon div{width:40px; height:40px; border-radius:40px; text-align:center; line-height:40px; background-color:#ffaa00; color:#ffffff; font-size:18px}
	#header #mycoin #mycoin-items .coin-count{font-size:14px; color:#ff6600}
	#header #mycoin #mycoin-items .coin-text{font-size:10px; color:#ff6600; margin-left:3px}
	#header #mycoin #mycoin-items .coin-help{font-size:12px; color:green}
	

	#virtual-panel{display:flex; margin-top:10px}
	#virtual-panel #bet-panel{flex-grow:1}
	#virtual-panel #bet-panel #tabs{display:flex; background-color:#aaaaaa; color:#ffffff; align-items:center; height:50px}
	#virtual-panel #bet-panel #tabs .tab{padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center; cursor:pointer}
	#virtual-panel #bet-panel #tabs .tab h5{font-size:16px}
	#virtual-panel #bet-panel #tabs .tab p{font-size:12px}
	#virtual-panel #bet-panel #tabs .tab.selected{background-color:#4ab6ef;}
	#virtual-panel #bet-panel #tabs .separation{border-left:1px solid #ffffff; height:30px}


	#virtual-panel #bet-panel #code-selector{display:flex; box-sizing:border-box; align-items:center; background-color:#fafafa}
	#virtual-panel #bet-panel #code-selector #code-selector-title{margin-right:20px}
	#virtual-panel #bet-panel #code-selector #code-selector-title > div{font-size:16px; width:70px; height:70px; background-color:#ffaa00; color:#ffffff; display:flex; align-items:center; justify-content:center}
	#virtual-panel #bet-panel #code-selector .selector-box{margin-right:15px}
	#virtual-panel #bet-panel #code-selector .selector-box > div{cursor:pointer; font-size:16px; width:40px; height:40px; background-color:#bbbbbb; border-radius:40px; color:#ffffff; text-align:center; line-height:40px}
	#virtual-panel #bet-panel #code-selector .selector-box > div.selected{background-color:#ba2636;}
	#virtual-panel #bet-panel #code-selector #clear-selector-box{}
	#virtual-panel #bet-panel #code-selector #clear-selector-box > div{cursor:pointer; font-size:16px; width:40px; height:40px; background-color:#4ab6ef; border-radius:40px; color:#ffffff; text-align:center; line-height:40px}

	#virtual-panel #bet-panel #code-description{display:flex; margin-bottom:8px; align-items:center}
	#virtual-panel #bet-panel #code-description h5{flex-grow:1}
	#virtual-panel #bet-panel #code-description p{padding:8px 14px; color:#ff6600; background-color:#fcf8e3; border:1px solid #faebcc;}
	#virtual-panel #bet-panel #code-textarea{display:flex}
	#virtual-panel #bet-panel #code-textarea .left{border:1px solid #eeeeee; padding:5px; width:100%; height:130px; background-color:#fafafa; margin-right:3px;}
	#virtual-panel #bet-panel #code-textarea .right{border:1px solid #eeeeee; padding:5px; width:100%; height:130px; margin-left:3px;}


	#virtual-panel #bet-panel #property-panel{display:flex; margin-top:20px; font-size:14px; align-items:center}
	#virtual-panel #bet-panel #property-panel #bet-number span{color:#ba2636; font-weight:bold; padding:0px 10px}
	#virtual-panel #bet-panel #property-panel #multiple-box{display:flex; align-items:center}
	#virtual-panel #bet-panel #property-panel #multiple-box input{ width:40px; height:30px; border:1px solid #eeeeee; text-align:center}
	#virtual-panel #bet-panel #property-panel #multiple-box button{color:#aaaaaa; background-color:#eeeeee; width:30px; height:30px; padding:0px; margin:0px 2px; text-align:center; line-height:30px}
	#virtual-panel #bet-panel #property-panel #multiple-box button:first-child{margin-left:6px}
	#virtual-panel #bet-panel #property-panel #multiple-box button:last-child{margin-right:6px}
	#virtual-panel #bet-panel #property-panel #bet-coin span{color:#ffaa00; font-weight:bold; padding:0px 10px}


	#virtual-panel #bet-panel #property-panel .dot{margin:0px 30px}

	#virtual-panel #wincode-panel{padding-left:10px; box-sizing:border-box;}
	#virtual-panel #wincode-panel h3{height:55px; background-color:#4ab6ef; line-height:50px; text-align:center}
	#virtual-panel #wincode-panel h3 a{color:#ffffff;  font-size:16px;}
	#virtual-panel #wincode-panel #winning-codes{background-color:#ffffff; padding:0px 10px}
	#virtual-panel #wincode-panel #winning-codes ul li{display:flex; align-items:center; padding:15px 0px; border-bottom:1px solid #eeeeee}
	#virtual-panel #wincode-panel #winning-codes ul li h5{width:90px}
	#virtual-panel #wincode-panel #winning-codes ul li h5 span{color:green; font-size:10px;}
	#virtual-panel #wincode-panel #winning-codes ul li .winning-code-box{display:flex; flex-grow:1; justify-content:flex-end}
	#virtual-panel #wincode-panel #winning-codes ul li .winning-code-box div{margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:20px; color:#ffffff; text-align:center; line-height:20px}
	
	#bet-button{text-align:center}
	#bet-button button{padding:16px 70px; font-size:18px; background-color:#bbbbbb}

	#headline{margin-right:30px; text-align:center; background-color:#ba2636; padding:5px 10px;}
	#headline h5{font-size:22px; font-weight:400; color:#ffffff}
	#headline p{font-size:14px; color:#ffffff}

	#browse-code-panel{width:600px; height:400px; position:absolute; background-color:#f3f3f3; display:none}
	#browse-code-panel .title{height:50px; background-color:#4ab6ef; color:#ffffff; display:flex; justify-content:space-between; align-items:center; font-size:16px}
	#browse-code-panel .title i{margin-right:20px; font-size:22px; cursor:pointer}
	#browse-code-panel .codes{padding:10px; background-color:#ffffff; overflow-y:scroll; height:345px; border:1px solid #f3f3f3; box-sizing:border-box;}
	</style>
</head>
<body>
<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module"style="background-color:#eeeeee">

	<div id="navigation" class="clearfix">
		<h4 style="float:left">虚拟投注平台</h4>		
		<div style="width:600px; float:right; text-align:right; padding-right:15px">
			选择频道<input id="11x5-type" class="lottery-type-field" value="ah11x5" title="安徽11选5" style="margin-left:15px;"/>
		</div>
	</div>

	<div class="sub-module" style="padding:7px;">

		<div id="header">

			<div id="headline">			
				<h5>山东</h5>
				<p>11选5</p>
			</div>

			<div id="progress-text">
				<h5></h5>
				<p></p>
			</div>
			<div id="progress-countdown">
				<div class="time-box" id="hour-box">00</div>
				<div class="separation">:</div>
				<div class="time-box" id="minute-box">00</div>
				<div class="separation">:</div>
				<div class="time-box" id="second-box">00</div>
			</div>

			<div id="refresh-button" style="margin-left:12px">
				<button class="button" style="width:40px; height:40px">刷新</button>
			</div>
			

			<div id="previous-text">
				<h5>开奖号码</h5>
				<p></p>
			</div>
			<div id="previous-code"></div>
			<div id="mycoin">
				<div id="mycoin-icon" style=""><div>币</div></div>
				<div id="mycoin-items"><span class="coin-count"></span><br/><span class="coin-help" title="每次登陆获得10枚金币，同一天登陆多次金币不累加。">如何获得？</span></div>
			</div>
		</div>

		<div id="virtual-panel">
			<div id="bet-panel">				
				<div id="tabs">
					<div class="tab" code="2" coin="6"><h5>任选二码</h5><p>奖金6金币</p></div>
					<div class="separation"></div>
					<div class="tab" code="3" coin="19"><h5>任选三码</h5><p>奖金19金币</p></div>
					<div class="separation"></div>
					<div class="tab" code="4" coin="78"><h5>任选四码</h5><p>奖金78金币</p></div>
					<div class="separation"></div>
					<div class="tab selected" code="5" coin="540"><h5>任选五码</h5><p>奖金540金币</p></div>
					<div class="separation"></div>
					<div class="tab" code="6" coin="90"><h5>任选六码</h5><p>奖金90金币</p></div>
					<div class="separation"></div>
					<div class="tab" code="7" coin="26"><h5>任选七码</h5><p>奖金26金币</p></div>
					<div class="separation"></div>
					<div  class="tab" code="8" coin="9"><h5>任选八码</h5><p>奖金9金币</p></div>
				</div>
				<div style="border-top:5px solid #4ab6ef"></div>
				
				<div style="background-color:#ffffff; padding:20px 10px; box-sizing:border-box;">

					<div id="code-selector">					
						<div id="code-selector-title"><div>选择<br/>号码</div></div>
						<div class="selector-box"><div code="01">01</div></div>
						<div class="selector-box"><div code="02">02</div></div>
						<div class="selector-box"><div code="03">03</div></div>
						<div class="selector-box"><div code="04">04</div></div>
						<div class="selector-box"><div code="05">05</div></div>
						<div class="selector-box"><div code="06">06</div></div>
						<div class="selector-box"><div code="07">07</div></div>
						<div class="selector-box"><div code="08">08</div></div>
						<div class="selector-box"><div code="09">09</div></div>
						<div class="selector-box"><div code="10">10</div></div>
						<div class="selector-box"><div code="11">11</div></div>
						<div id="clear-selector-box"><div>清</div></div>
					</div>

					<div style="border-top:1px solid #eeeeee; margin:20px 0px"></div>

					<div id="code-description">
						<h5>投注号码</h5>
						<p>您可以从上方选择号码，也可直接粘贴号码</p>
					</div>
					<div id="code-textarea">
						<textarea class="left" readonly="true"></textarea>
						<textarea class="right" placeholder="生成的号码粘贴到此编辑框中"></textarea>
					</div>



					<div id="property-panel">
						<div id="bet-number">
							已选<span>0</span>注 
						</div>
						<div class="dot">·</div>
						<div id="multiple-box">
							共<button id="minus-button" class="button">-</button><input type="text" value="1"/><button class="button" id="plus-button">+</button>倍 
						</div>
						<div class="dot">·</div>
						<div id="bet-coin">
							共<span>0</span>金币
						</div>
					</div>

					<div style="border-top:1px solid #eeeeee; margin:20px 0px 30px 0px"></div>
					<div id="bet-button">
						<button class="button">投注</button>
					</div>

				</div>


				<div style="margin-top:30px">
				
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
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					<div style="text-align:right; margin-top:10px"><button class="button" style="padding:8px 10px" onclick="toBets()">更多投注记录</button></div>
				</div>
			</div>
			<div id="wincode-panel">
				<h3><a href="../chart/0.jsp" target="_blank">开奖号码</a></h3>
				<div id="winning-codes">				
					<ul></ul>				
				</div>				
			</div>
		</div>
	</div>
	
</div>

<div id="browse-code-panel">
	<div class="title"><span style="padding-left:20px">投注号码</span><span onclick="closeCodePanel()"><i class="fa fa-close"></i></span></div>
	<div style="background-color:#eeeeee; height:5px"></div>
	<div class="codes"></div>
</div>

<script src="../../lib/app.js"></script>
<script src="../../lib/selection/selection.js"></script>

<script type="text/javascript">


	var global = 
	{
		isbet:false,
		phase:'',
		way:{"2":"任选二码", "3":"任选三码", "4":"任选四码", "5":"任选五码", "6":"任选六码", "7":"任选七码", "8":"任选八码"},
		type:(app.getParameter("type") || 'sd11x5'),
		typemap:null
	}


	$(function()
	{

		$("#browse-code-panel").css("top", ($(window).height() - $("#browse-code-panel").height()) / 2);
		$("#browse-code-panel").css("left", ($(window).width() - $("#browse-code-panel").width()) / 2);

		$.getJSON("../dictionary/map/type.json", function(items)
		{
			global['typemap'] = items;
			getResource();
		});


		$("#11x5-type").selection
		({
			url: "../dictionary/list/type.synchro.json",
			ismultiple:false,
			clickitem:function()
			{
				window.location.href = 'virtual.jsp?type='+$("#11x5-type").val();
			}
		});

		$("#11x5-type").selection("setId", global['type']);

		

		$("#headline h5").html( $("#11x5-type").data("joint").val().replace("11选5", "") );
			

		$("#tabs .tab").on("click", function()
		{
			$("#tabs .tab").removeClass("selected");
			$(this).addClass("selected");
		});

		$("#code-selector .selector-box div").on("click", function()
		{
			$(this).toggleClass("selected");
			createCode();
		});

		$("#code-selector #clear-selector-box div").on("click", function()
		{
			$("#code-selector .selector-box div").removeClass('selected');
			createCode();
		});

		$("#minus-button").on("click", function()
		{
			var number = parseInt($("#multiple-box input").val());
			$("#multiple-box input").val( Math.max(1, number - 1) );
			setBetDetails();
		});


		$("#plus-button").on("click", function()
		{
			var number = parseInt( $("#multiple-box input").val() );
			$("#multiple-box input").val( number + 1 );
			setBetDetails();
		});

		$("#refresh-button button").on("click", function()
		{
			getResource();
		});

		
		$("#code-textarea .right").on("focusin", function(){setBetDetails();});
		$("#code-textarea .right").on("focusout", function(){setBetDetails();});
		$("#code-textarea .right").on("keypress", function(){setBetDetails();});
		$("#code-textarea .right").on('input', function(){setBetDetails();})

		$("#bet-button button").on("click", function()
		{
			if(global['isbet'])
			{
				var $selector = $("#tabs .tab.selected");
				var codes = getCodes()

				var parameter = {};				
				parameter['type'] = global['type'];
				parameter['way'] = $selector.attr("code");
				parameter['phase'] = global.phase;
				parameter['code'] = codes.join(",");
				parameter['count'] = codes.length;
				parameter['multiple'] = $("#multiple-box input").val();
				parameter['chip'] = $("#bet-coin span").text();
				parameter['bonus'] = $selector.attr("coin");

				app.showLoading();
				$.post("../service/virtual.jsp?mode=2", parameter, function(response)
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
				}, "json");
			}
			else
			{
			}
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

		app.showLoading();
		$.getJSON("../service/virtual.jsp?mode=1&type="+global['type'], function(response)
		{
			if(response.status == 1)
			{
				var property = response.resource.property;
				var rows = response.resource.data;
				var user = response.resource.user;
				var bets = response.resource.bets;

				$("#mycoin-items .coin-count").html(user['CHIP']+'<span class="coin-text">枚</span>');
				
				var text = '';
				$.each(rows, function(i, row)
				{
					var codes = row["CODE"].split(",");
					var phase = row['PHASE'];
					var time = row["TIME"];
					text += '<li>';
					text += '	<h5>'+phase+'<br><span>'+time.substring(10, 13)+'时'+time.substring(14, 16)+'分</span></h5>';
					text += '	<div class="winning-code-box">';
					text += '		<div>'+codes[0]+'</div>';
					text += '		<div>'+codes[1]+'</div>';
					text += '		<div>'+codes[2]+'</div>';
					text += '		<div>'+codes[3]+'</div>';
					text += '		<div>'+codes[4]+'</div>';
					text += '	</div>';
					text += '</li>';

					if(i == 0)
					{
						
						$("#previous-text p").html(phase+'期');
						$("#previous-code").html('<div>'+codes[0]+'</div><div>'+codes[1]+'</div><div>'+codes[2]+'</div><div>'+codes[3]+'</div><div>'+codes[4]+'</div>');



						var nextPhase = getNextPhase(phase, property['max']);
						$("#progress-text p").html(nextPhase['phase'] + '期');
						global.phase = nextPhase['phase'];
			

						if(nextPhase['sameday'])
						{
							time = app.toDate( time );
							var space = property['interval'] - Math.ceil( (current.getTime() - time.getTime()) / 1000 );
							if(space > 0)
							{
								countDown(space);
								startBet();
								$("#progress-text h5").text('正在销售');
							}
							else
							{
								startBet();
								//stopBet();
								$("#progress-text h5").text('等待开奖');

							}
						}
						else
						{
							//统一8点开始投注，8点半停止等待开奖
							var time0800 = app.toDate( nextPhase['date'] + " 08:00:01" );

							if(current.getTime() < time0800.getTime())
							{
								stopBet();
								$("#progress-text h5").text('已结束');
							}
							else
							{
								var time0830 = app.toDate( nextPhase['date'] + " 08:30:01" );

								var space = Math.ceil( (time0830.getTime() - current.getTime()) / 1000 );
								if(space > 0)
								{
									countDown(space);
									startBet();
									$("#progress-text h5").text('正在销售');
								}
								else
								{
									stopBet();
									$("#progress-text h5").text('等待开奖');
								}

							}

						}


					}
				});

				$("#winning-codes ul").html(text);

				text = '';
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

	function startBet()
	{
		global['isbet'] = true;
		$("#bet-button button").css("background-color", "#4ab6ef");
	}
	function stopBet()
	{
		global['isbet'] = false;
		$("#bet-button button").css("background-color", "#bbbbbb");
		$("#bet-button button").attr("title", "等待开奖时不能投注");
	}

	function countDown(times)
	{
		$("#progress-text h5").text('正在销售');
		var timer = null;
		timer = setInterval(function()
		{
			var hour = 0,
			minute = 0,
			second = 0;
			if(times > 0)
			{
				hour = Math.floor(times / 3600);
				minute = Math.floor(times / 60) - (hour * 60);
				second = times - (hour * 3600) - (minute * 60);
			}
			else
			{
				clearInterval(timer);
				getResource();
			}

			if(hour <= 9)
			{
				hour = '0' + hour;
			}
			if(minute <= 9)
			{
				minute = '0' + minute;
			}
			if(second <= 9)
			{
				second = '0' + second;
			}

			$("#hour-box").text(hour);
			$("#minute-box").text(minute);
			$("#second-box").text(second);
			times--;

		},1000);

	}

	function getNextPhase(phase, max)
	{
		var date = phase.substring(0, 8);
		phase = phase.substring(8, 11);

		if(max == phase)
		{
			date = date.substring(0, 4) + "/" + date.substring(4, 6) + "/" + date.substring(6, 8);
			var time = new Date(date);
			time.setDate(time.getDate() + 1);

			return {phase:app.formatdate(time, 'yyyyMMdd') + "01", sameday:false, date:date};
		}
		else
		{
			return {phase:date+""+(parseInt(phase) + 1), sameday:true};
		}
	}

	function createCode()
	{
		
		var basecodes = [];
		$("#code-selector .selector-box div").each(function()
		{
			var classname = $(this).attr("class");
			if(classname != null && classname.indexOf("selected") != -1)
			{
				basecodes.push($(this).attr("code"));
			}
		});

		var size = $("#tabs .selected").attr("code") || '5';

		var parameter = {};
		parameter["basecodes"] = basecodes;
		parameter["size"] = size;

		app.showLoading();
		$.post("../service/do.jsp?mode=2", parameter, function(response)
		{
			app.hideLoading();
			if(response.status == 1)
			{
				var codes = "";
				var combinations = response.resource.combinations || []; 
				$.each(combinations, function(i, combination)
				{
					codes += combination+'\n';
				});
				$("#code-textarea .left").val(codes);
				setBetDetails();
			}
			else
			{
				app.message(response.messages);
			}
		}, "json");
	}

	function setBetDetails()
	{
		var codes = getCodes()
		$("#bet-number span").html(codes.length);

		var coin = codes.length * 2;

		var number = parseInt( $("#multiple-box input").val() );
		coin = coin * number;

		$("#bet-coin span").html(coin);
	}

	function getCodes()
	{
		var text = "";
		text += $("#code-textarea .left").val();
		text += $("#code-textarea .right").val();

		var texts = text.split('\n');
		texts = unique(texts);
		var codes = [];
		for(var i = 0 ; i < texts.length ; i++)
		{
			if(texts[i] != "")
			{
				codes.push(texts[i]);
			}
		}
		return codes;
	}

	function unique(array) 
	{
		return Array.from(new Set(array))
	}

	function toBets()
	{
		window.open('bet.jsp?type='+global.type);
	}
</script>

</body>
</html>
