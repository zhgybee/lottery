<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../lib/selection/selection.css" />
	<title>科学组码</title>
	<style>
	
	#analysis-panel p{margin-bottom:10px; font-size:14px}
	#analysis-panel h5{margin-bottom:5px; font-size:14px}

	</style>
</head>
<body>
<jsp:include page="../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4 style="float:left">科学组码</h4>
		
		<div style="width:600px; float:right; text-align:right; padding-right:15px">
			选择方式<input id="recommend-mode" class="lottery-type-field" style="border:1px solid #cccccc; margin-left:15px;" value="1" title="推荐240注"/>
		</div>
		
	
	</div>
	<div class="sub-module" id="analysis-panel">

		<div class="clearfix" style="overflow:hidden">
			<div class="left" style="width:50%; padding:20px; box-sizing:border-box">
				<p>1、请选择生成组码的地方台彩票及期数。</p>
				<p>2、点击计算按钮生成号码组</p>


				<div class="clearfix">
				<input id="11x5-length" class="lottery-type-field" style="width:48%; float:left" value="100" title="100期"/>
				<input id="11x5-type" class="lottery-type-field" style="width:48%; float:right" value="ah11x5" title="安徽11选5"/>
				</div>

				<button id="starting-button" class="button" style="width:140px; height:30px; border-radius:5px; margin-top:10px; font-size:16px; height:35px"><i class="fa fa-recycle" style="font-size:15px; margin-right:5px"></i>计算</button>
				<p id="resource-panel" style="margin-top:10px"></p>
			</div>
			<div class="right" style="width:50%; padding:20px; box-sizing:border-box;">
				<div id="combination-count" class="clearfix">
					<h5 style="float:left; margin-right:10px">号码</h5><strong style="color:red; float:left; font-size: 14px; font-weight: 400;"></strong>
				</div>
				<div id="codes-panel">
					<textarea style="height:200px; width:100%; border:1px solid #cccccc; padding:5px; font-size:14px"></textarea>
				</div>	
			</div>
		</div>
		<hr/>
		<div id="chart" style="width:100%; height:550px; margin-top:20px"></div>
	</div>
</div>


<script src="../lib/echarts.min.js"></script>
<script src="../lib/app.js"></script>
<script src="../lib/selection/selection.js"></script>

<script type="text/javascript">
	var chart = echarts.init(document.getElementById('chart'));
	$(function()
	{
		$("#11x5-type").selection
		({
			url: "dictionary/list/type.json",
			ismultiple: false
		});
		$("#11x5-length").selection
		({
			url: "dictionary/list/length.json",
			ismultiple: false
		});

		$("#recommend-mode").selection
		({
			url: "dictionary/list/recommendmode.json",
			ismultiple: false
		});

		createChart([], []);
		$("#starting-button").on("click", function()
		{
			var parameter = {};
			parameter["type"] = $("#11x5-type").val();
			parameter["length"] = $("#11x5-length").val();
			parameter["mode"] = $("#recommend-mode").val();
			
			app.showLoading();
			$.post("service/recgroup.jsp", parameter, function(response)
			{
				app.hideLoading();
				if(response.status == 1)
				{
					var titles = response.resource.titles;
					var values = response.resource.values;
					createChart(titles, values);
					
					var codes = "";
					var combinations = response.resource.codes; 
					$.each(combinations, function(i, combination)
					{
						codes += combination+'\n';
					});
					$("#codes-panel textarea").val(codes);
					$("#combination-count strong").html("共"+combinations.length+"注");

					var proportion = parseFloat(response.resource.proportion);
					proportion = (proportion * 100).toFixed(2)

					$("#resource-panel").html('大等于3期未中数共<span style="color:#ff6600">'+response.resource.gt3count+'</span>次　占比<span style="color:#ff6600">'+proportion+'%</span>');
				}
				else
				{
					app.message(response.messages);
				}
			}, "json");

		});

		$("#codes-panel textarea").on("mouseover", function(e)
		{
			$(this).select();
		});

	});

	function createChart(titles, values)
	{
		var option = 
		{
			title: {
				text: '智能数据遗漏走势图',
				x:'center',
				show: true,
			},
			grid: 
			{  
				left:'40px',
				right:'80px',
				top:'60px',
				bottom:'85px'
			},
			tooltip: {},
			xAxis: 
			{
				axisLabel:
				{
					interval:0,
					rotate:90
				},
				data:titles,
				name:'期号'
			},
			yAxis:{},
			series: 
			[{
				type:'line',
				data:values,
				label: 
				{
					normal: 
					{
						show: true,
						position:'top',
					},
				},

			}]
		};
		chart.setOption(option);
	}
</script>

</body>
</html>
