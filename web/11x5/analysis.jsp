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
	<div id="navigation"><h4>智能分析</h4></div>
	<div class="sub-module" id="analysis-panel">

		<div class="clearfix" style="overflow:hidden">
			<div class="left" style="width:50%; padding:20px; box-sizing:border-box">
				<p>1、请将要分析的号码，复制到右边的数据框中。每一柱一行，每个号码以空格分开。</p>
				<p>2、选择用于计算遗漏的彩票</p>
				<input id="11x5-type" class="lottery-type-field" style="width:100%" value="ah11x5" title="上海11选5"/>
				<button id="starting-button" class="button" style="width:140px; height:30px; border-radius:5px; margin-top:10px; font-size:16px; height:35px"><i class="fa fa-recycle" style="font-size:15px; margin-right:5px"></i>分析遗漏</button>
			</div>
			<div class="right" style="width:50%; padding:20px; box-sizing:border-box;">
				<h5>号码</h5>
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

	app.showLoading();
	$.post("service/sessioncodes.jsp?mode=1", function(response)
	{
		app.hideLoading();
		if(response.status == 1)
		{
			var codes = "";
			var combinations = response.resource.combinations; 
			if(combinations != null)
			{
				$.each(combinations, function(i, combination)
				{
					codes += combination+'\n';
				});
				$("#codes-panel textarea").val(codes);
			}
		}
		else
		{
			app.message(response.messages);
		}
	}, "json");



	createChart([], []);
	$("#starting-button").on("click", function()
	{
		var parameter = {};
		parameter["codes"] = $("#codes-panel textarea").val();
		parameter["type"] = $("#11x5-type").val();
		app.showLoading();
		$.post("service/analysis.jsp?mode=1", parameter, function(response)
		{
			app.hideLoading();
			if(response.status == 1)
			{
				var titles = response.resource.titles;
				var values = response.resource.values;
				createChart(titles, values);
			}
			else
			{
				app.message(response.messages);
			}
		}, "json");

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
