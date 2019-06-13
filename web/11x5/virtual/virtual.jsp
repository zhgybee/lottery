<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../lib/selection/selection.css" />
	<title>虚拟投注</title>
	<style>
	
	#analysis-panel p{margin-bottom:10px; font-size:14px}
	#analysis-panel h5{margin-bottom:5px; font-size:14px}

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

	<div class="sub-module">
		<div style="flex-grow:1">
			<div style="background-color:#ffffff; padding:20px; box-sizing:border-box; display:flex">
				<div style="line-height:25px">
					<div style="font-size:16px">正在销售</div>
					<div style="font-size:12px">20191104期</div>
				</div>
				<div style="">
					<div style="width:40px; height:40px; background-color:#333333; border-radius:5px"></div>
				</div>
				<div style="line-height:25px"><div style="font-size:16px">开奖号码</div><div style="font-size:12px">20191104期</div></div>
				<div style="">
					<div style="width:40px; height:40px; background-color:#ba2636; border-radius:40px"></div>
				</div>
				<div style="">
					<div style="width:40px; height:40px; background-color:#ba2636; border-radius:40px"></div>
				</div>
				<div style="">
					<div style="width:40px; height:40px; background-color:#ba2636; border-radius:40px"></div>
				</div>
				<div style="">
					<div style="width:40px; height:40px; background-color:#ba2636; border-radius:40px"></div>
				</div>
				<div style="">
					<div style="width:40px; height:40px; background-color:#ba2636; border-radius:40px"></div>
				</div>
				<div style="">
					我的金币 2100
				</div>
			</div>
			<div style="display:flex; margin-top:10px">
				<div style="flex-grow:1">
					
					<div style="display:flex; background-color:#aaaaaa; color:#ffffff; align-items:center; height:50px">
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center"><span style="font-size:16px">任选二码</span><span style="font-size:12px">奖金6金币</span></div>
						<div style="border-left:1px solid #ffffff; height:30px"></div>
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center"><span style="font-size:16px">任选三码</span><span style="font-size:12px">奖金19金币</span></div>
						<div style="border-left:1px solid #ffffff; height:30px"></div>
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center"><span style="font-size:16px">任选四码</span><span style="font-size:12px">奖金78金币</span></div>
						<div style="border-left:1px solid #ffffff; height:30px"></div>
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center"><span style="font-size:16px">任选五码</span><span style="font-size:12px">奖金540金币</span></div>
						<div style="border-left:1px solid #ffffff; height:30px"></div>
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center"><span style="font-size:16px">任选六码</span><span style="font-size:12px">奖金90金币</span></div>
						<div style="border-left:1px solid #ffffff; height:30px"></div>
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center"><span style="font-size:16px">任选七码</span><span style="font-size:12px">奖金26金币</span></div>
						<div style="padding:0px 13px; height:100%; display:flex; flex-direction:column; align-items:center; justify-content:center; background-color:#4ab6ef; "><span style="font-size:16px">任选八码</span><span style="font-size:12px">奖金9金币</span></div>
					</div>
					<div style="border-top:5px solid #4ab6ef"></div>
					
					<div style="background-color:#ffffff; padding:30px 20px; box-sizing:border-box;">
						<div style="display:flex; box-sizing:border-box; align-items:center">					
							<div style="margin-right:20px"><div style="font-size:16px; width:60px; height:60px; background-color:#ffaa00; color:#ffffff; display:flex; align-items:center; justify-content:center">选择<br/>号码</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">01</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">02</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">03</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">04</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">05</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">06</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">07</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">08</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">09</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">10</div></div>
							<div style="margin-right:15px"><div style="font-size:16px; width:40px; height:40px; background-color:#aaaaaa; border-radius:40px; color:#ffffff; text-align:center; line-height:40px">11</div></div>
						</div>
						<div style="border-top:1px solid #eeeeee; margin:30px 0px"></div>
						<div style="display:flex; margin-bottom:8px; align-items:center">
							<div style="flex-grow:1">投注号码</div>
							<div style="padding:8px 14px; color:#ff6600; background-color:#fcf8e3; border:1px solid #faebcc; ">您可以从上方选择号码，也可直接粘贴号码</div>
						</div>
						<div>
							<textarea style="border:1px solid #eeeeee; padding:5px; width:100%; height:200px"></textarea>
						</div>


						<div style="display:flex; margin-top:20px; font-size:14px; align-items:center">
							<div>
								已选<span style="color:#ba2636; font-weight:bold; padding:0px 10px">12</span>注 
							</div>
							<div style="margin:0px 30px">·</div>
							<div style="display:flex; align-items:center">
								共<button class="button" style="color:#444444; background-color:#eeeeee; width:30px; height:30px; padding:0px; margin-left:10px; text-align:center; line-height:30px">-</button><input type="text" style="margin:0px 3px; width:40px; height:30px; border:1px solid #eeeeee; text-align:center" value="1"/><button class="button" style="color:#444444; width:30px; height:30px; background-color:#eeeeee; margin-right:10px; text-align:center; line-height:30px">+</button>倍 
							</div>
							<div style="margin:0px 30px">·</div>
							<div>
								共<span style="color:#ba2636; font-weight:bold; padding:0px 10px">209</span>金币
							</div>
						</div>
						<div style="border-top:1px solid #eeeeee; margin:20px 0px 30px 0px"></div>
						<div style="text-align:center">
							<button class="button" style="padding:16px 70px; font-size:18px">投注</button>
						</div>
					</div>

					<div>
					
						<table>
						<thead>
							<tr>
								<th>彩种</th>
								<th>频道</th>
								<th>玩法</th>
								<th>号码</th>
								<th>注数</th>
								<th>倍数</th>
								<th>投注金币</th>
								<th>中奖金币</th>
								<th>投注时间</th>
								<th>开奖号码</th>
							</tr>
						</thead>
						</table>

					</div>
				</div>
				<div style="width:300px; padding-left:10px; box-sizing:border-box;">
				
					
					<div style="height:55px; background-color:#4ab6ef; color:#ffffff; line-height:50px; text-align:center; font-size:16px">
					开奖号码
					</div>
					<div style="background-color:#ffffff; padding:0px 10px">
					
						<ul>
						
							<li style="display:flex; align-items:center; padding:15px 0px; border-bottom:1px solid #eeeeee">
								<div style="width:90px">19060129</div>
								<div style="display:flex; flex-grow:1; justify-content:flex-end">
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
								</div>
							</li>
							<li style="display:flex; align-items:center; padding:15px 0px; border-bottom:1px solid #eeeeee">
								<div style="width:90px">19060129</div>
								<div style="display:flex; flex-grow:1; justify-content:flex-end">
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
									<div style="margin-right:3px; font-size:12px; width:20px; height:20px; background-color:#ba2636; border-radius:30px; color:#ffffff; text-align:center; line-height:20px">01</div>
								</div>
							</li>

						</ul>
					
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
</div>


<script src="../../lib/echarts.min.js"></script>
<script src="../../lib/app.js"></script>
<script src="../../lib/selection/selection.js"></script>

<script type="text/javascript">
	$(function()
	{
	});
</script>

</body>
</html>
