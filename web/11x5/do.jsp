<%@page contentType="text/html; charset=utf-8"%>

<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<title></title>
</head>
<body id="do-page">

<jsp:include page="../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation"><h4>彩票做号</h4></div>
	<div class="module">
		<div class="row">
			<label class="title">基础号码</label>
			<label><i class="checkbox basecodes checked" value="1"></i>01</label>
			<label><i class="checkbox basecodes checked" value="2"></i>02</label>
			<label><i class="checkbox basecodes checked" value="3"></i>03</label>
			<label><i class="checkbox basecodes checked" value="4"></i>04</label>
			<label><i class="checkbox basecodes checked" value="5"></i>05</label>
			<label><i class="checkbox basecodes checked" value="6"></i>06</label>
			<label><i class="checkbox basecodes checked" value="7"></i>07</label>
			<label><i class="checkbox basecodes checked" value="8"></i>08</label>
			<label><i class="checkbox basecodes checked" value="9"></i>09</label>
			<label><i class="checkbox basecodes checked" value="10"></i>10</label>
			<label><i class="checkbox basecodes checked" value="11"></i>11</label>
		</div>
		<hr/>
		<div class="row">
			<label class="title">一号胆</label>
			<label><i class="checkbox codes1" value="1"></i>01</label>
			<label><i class="checkbox codes1" value="2"></i>02</label>
			<label><i class="checkbox codes1" value="3"></i>03</label>
			<label><i class="checkbox codes1" value="4"></i>04</label>
			<label><i class="checkbox codes1" value="5"></i>05</label>
			<label><i class="checkbox codes1" value="6"></i>06</label>
			<label><i class="checkbox codes1" value="7"></i>07</label>
			<label><i class="checkbox codes1" value="8"></i>08</label>
			<label><i class="checkbox codes1" value="9"></i>09</label>
			<label><i class="checkbox codes1" value="10"></i>10</label>
			<label><i class="checkbox codes1" value="11"></i>11</label>
			<label><i class="checkbox" id="selectall-code1"></i>全选</label>
			<label class="subtitle">出现</label>
			<label><i class="checkbox codes1count" value="0"></i>0</label>
			<label><i class="checkbox codes1count" value="1"></i>1</label>
			<label><i class="checkbox codes1count" value="2"></i>2</label>
			<label><i class="checkbox codes1count" value="3"></i>3</label>
			<label><i class="checkbox codes1count" value="4"></i>4</label>
			<label><i class="checkbox codes1count" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-code1">清</button></label>
		</div> 
		<div class="row" style="background-color:#f7f7f7">
			<label class="title">二号胆</label>
			<label><i class="checkbox codes2" value="1"></i>01</label>
			<label><i class="checkbox codes2" value="2"></i>02</label>
			<label><i class="checkbox codes2" value="3"></i>03</label>
			<label><i class="checkbox codes2" value="4"></i>04</label>
			<label><i class="checkbox codes2" value="5"></i>05</label>
			<label><i class="checkbox codes2" value="6"></i>06</label>
			<label><i class="checkbox codes2" value="7"></i>07</label>
			<label><i class="checkbox codes2" value="8"></i>08</label>
			<label><i class="checkbox codes2" value="9"></i>09</label>
			<label><i class="checkbox codes2" value="10"></i>10</label>
			<label><i class="checkbox codes2" value="11"></i>11</label>
			<label><i class="checkbox" id="selectall-code2"></i>全选</label>
			<label class="subtitle">出现</label>
			<label><i class="checkbox codes2count" value="0"></i>0</label>
			<label><i class="checkbox codes2count" value="1"></i>1</label>
			<label><i class="checkbox codes2count" value="2"></i>2</label>
			<label><i class="checkbox codes2count" value="3"></i>3</label>
			<label><i class="checkbox codes2count" value="4"></i>4</label>
			<label><i class="checkbox codes2count" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-code2">清</button></label>
		</div>
		<div class="row">
			<label class="title">三号胆</label>
			<label><i class="checkbox codes3" value="1"></i>01</label>
			<label><i class="checkbox codes3" value="2"></i>02</label>
			<label><i class="checkbox codes3" value="3"></i>03</label>
			<label><i class="checkbox codes3" value="4"></i>04</label>
			<label><i class="checkbox codes3" value="5"></i>05</label>
			<label><i class="checkbox codes3" value="6"></i>06</label>
			<label><i class="checkbox codes3" value="7"></i>07</label>
			<label><i class="checkbox codes3" value="8"></i>08</label>
			<label><i class="checkbox codes3" value="9"></i>09</label>
			<label><i class="checkbox codes3" value="10"></i>10</label>
			<label><i class="checkbox codes3" value="11"></i>11</label>
			<label><i class="checkbox" id="selectall-code3"></i>全选</label>
			<label class="subtitle">出现</label>
			<label><i class="checkbox codes3count" value="0"></i>0</label>
			<label><i class="checkbox codes3count" value="1"></i>1</label>
			<label><i class="checkbox codes3count" value="2"></i>2</label>
			<label><i class="checkbox codes3count" value="3"></i>3</label>
			<label><i class="checkbox codes3count" value="4"></i>4</label>
			<label><i class="checkbox codes3count" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-code3">清</button></label>
		</div>
		<div class="row" style="background-color:#f7f7f7">
			<label class="title">四号胆</label>
			<label><i class="checkbox codes4" value="1"></i>01</label>
			<label><i class="checkbox codes4" value="2"></i>02</label>
			<label><i class="checkbox codes4" value="3"></i>03</label>
			<label><i class="checkbox codes4" value="4"></i>04</label>
			<label><i class="checkbox codes4" value="5"></i>05</label>
			<label><i class="checkbox codes4" value="6"></i>06</label>
			<label><i class="checkbox codes4" value="7"></i>07</label>
			<label><i class="checkbox codes4" value="8"></i>08</label>
			<label><i class="checkbox codes4" value="9"></i>09</label>
			<label><i class="checkbox codes4" value="10"></i>10</label>
			<label><i class="checkbox codes4" value="11"></i>11</label>
			<label><i class="checkbox" id="selectall-code4"></i>全选</label>
			<label class="subtitle">出现</label>
			<label><i class="checkbox codes4count" value="0"></i>0</label>
			<label><i class="checkbox codes4count" value="1"></i>1</label>
			<label><i class="checkbox codes4count" value="2"></i>2</label>
			<label><i class="checkbox codes4count" value="3"></i>3</label>
			<label><i class="checkbox codes4count" value="4"></i>4</label>
			<label><i class="checkbox codes4count" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-code4">清</button></label>
		</div>
		<div class="row">
			<label class="title">五号胆</label>
			<label><i class="checkbox codes5" value="1"></i>01</label>
			<label><i class="checkbox codes5" value="2"></i>02</label>
			<label><i class="checkbox codes5" value="3"></i>03</label>
			<label><i class="checkbox codes5" value="4"></i>04</label>
			<label><i class="checkbox codes5" value="5"></i>05</label>
			<label><i class="checkbox codes5" value="6"></i>06</label>
			<label><i class="checkbox codes5" value="7"></i>07</label>
			<label><i class="checkbox codes5" value="8"></i>08</label>
			<label><i class="checkbox codes5" value="9"></i>09</label>
			<label><i class="checkbox codes5" value="10"></i>10</label>
			<label><i class="checkbox codes5" value="11"></i>11</label>
			<label><i class="checkbox" id="selectall-code5"></i>全选</label>
			<label class="subtitle">出现</label>
			<label><i class="checkbox codes5count" value="0"></i>0</label>
			<label><i class="checkbox codes5count" value="1"></i>1</label>
			<label><i class="checkbox codes5count" value="2"></i>2</label>
			<label><i class="checkbox codes5count" value="3"></i>3</label>
			<label><i class="checkbox codes5count" value="4"></i>4</label>
			<label><i class="checkbox codes5count" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-code5">清</button></label>
		</div>


		<div class="row" style="background-color:#f7f7f7">
			<label class="title">偶数个数</label>
			<label><i class="checkbox evencount" value="0"></i>0</label>
			<label><i class="checkbox evencount" value="1"></i>1</label>
			<label><i class="checkbox evencount" value="2"></i>2</label>
			<label><i class="checkbox evencount" value="3"></i>3</label>
			<label><i class="checkbox evencount" value="4"></i>4</label>
			<label><i class="checkbox evencount" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-even">清</button></label>
		</div>
		<div class="row">
			<label class="title">合数个数</label>
			<label><i class="checkbox comcount" value="0"></i>0</label>
			<label><i class="checkbox comcount" value="1"></i>1</label>
			<label><i class="checkbox comcount" value="2"></i>2</label>
			<label><i class="checkbox comcount" value="3"></i>3</label>
			<label><i class="checkbox comcount" value="4"></i>4</label>
			<label><i class="checkbox comcount" value="5"></i>5</label>
			<label class="clear-panel"><button class="button red" id="unselectall-com">清</button></label>
		</div>
		<div class="row" style="background-color:#f7f7f7">
			<label class="title">小数个数</label>
			<label><i class="checkbox smcount" value="0"></i>0</label>
			<label><i class="checkbox smcount" value="1"></i>1</label>
			<label><i class="checkbox smcount" value="2"></i>2</label>
			<label><i class="checkbox smcount" value="3"></i>3</label>
			<label><i class="checkbox smcount" value="4"></i>4</label>
			<label><i class="checkbox smcount" value="5"></i>5</label>
			<label  class="clear-panel"><button class="button red" id="unselectall-sm">清</button></label>
		</div>
		<div class="row">
			<label class="title">连号个数</label>
			<label><i class="checkbox concount" value="0"></i>0</label>
			<label><i class="checkbox concount" value="1"></i>1</label>
			<label><i class="checkbox concount" value="2"></i>2</label>
			<label><i class="checkbox concount" value="3"></i>3</label>
			<label><i class="checkbox concount" value="4"></i>4</label>
			<label class="clear-panel"><button class="button red" id="unselectall-con">清</button></label>
		</div>

		<div style="text-align:center">
			<button id="create-button" class="button"><i class="fa fa-pencil-square-o"></i>生成号码</button>
			<button id="analysis-button" class="button"><i class="fa fa-recycle"></i>智能分析</button>
		</div>

		<div id="combination-count" class="clearfix">
			<h4>号码</h4><strong></strong>
		</div>
		<div id="codes-panel">
			<textarea rows="6"></textarea>
		</div>
	</div>
</div>

<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="../lib/app.js"></script>

<script type="text/javascript">

$(function()
{
	$("#create-button").on("click", function()
	{
		creator();
	});

	$("#analysis-button").on("click", function()
	{
		window.open('analysis.jsp');
	});

	$(".checkbox").on("click", function()
	{
		var classname = $(this).attr("class");
		if(classname.indexOf("checked") != -1)
		{
			$(this).removeClass("checked");
		}
		else
		{
			$(this).addClass("checked");
		}
	});

	$("#unselectall-even").on("click", function()
	{
		unselectall($('.evencount'));
	});
	$("#unselectall-com").on("click", function()
	{
		unselectall($('.comcount'));
	});
	$("#unselectall-sm").on("click", function()
	{
		unselectall($('.smcount'));
	});
	$("#unselectall-con").on("click", function()
	{
		unselectall($('.concount'));
	});
	
	for(var i = 1 ; i <= 5 ; i++)
	{
		$("#selectall-code"+i).on("click", {index:i}, function(event)
		{
			var index = event.data.index;
			var classname = $(this).attr("class");
			if(classname.indexOf("checked") != -1)
			{
				selectall($('.codes'+index));
			}
			else
			{
				unselectall($('.codes'+index));
			}
		});

		$("#unselectall-code"+i).on("click", {index:i}, function(event)
		{
			var index = event.data.index;
			unselectall($('.codes'+index+', .codes'+index+'count, #selectall-code'+index+''));
		});
	}

});

function creator()
{
	var basecodes = [];
	$('.basecodes.checked').each(function(i, element)
	{
		basecodes.push( $(element).attr("value") );
	});

	var codes1 = [];
	$('.codes1.checked').each(function(i, element)
	{
		codes1.push( $(element).attr("value") );
	});
	var codes1count = [];
	$('.codes1count.checked').each(function(i, element)
	{
		codes1count.push( $(element).attr("value") );
	});

	var codes2 = [];
	$('.codes2.checked').each(function(i, element)
	{
		codes2.push( $(element).attr("value") );
	});
	var codes2count = [];
	$('.codes2count.checked').each(function(i, element)
	{
		codes2count.push( $(element).attr("value") );
	});

	var codes3 = [];
	$('.codes3.checked').each(function(i, element)
	{
		codes3.push( $(element).attr("value") );
	});
	var codes3count = [];
	$('.codes3count.checked').each(function(i, element)
	{
		codes3count.push( $(element).attr("value") );
	});

	var codes4 = [];
	$('.codes4.checked').each(function(i, element)
	{
		codes4.push( $(element).attr("value") );
	});
	var codes4count = [];
	$('.codes4count.checked').each(function(i, element)
	{
		codes4count.push( $(element).attr("value") );
	});

	var codes5 = [];
	$('.codes5.checked').each(function(i, element)
	{
		codes5.push( $(element).attr("value") );
	});
	var codes5count = [];
	$('.codes5count.checked').each(function(i, element)
	{
		codes5count.push( $(element).attr("value") );
	});

	var evencount = [];
	$('.evencount.checked').each(function(i, element)
	{
		evencount.push( $(element).attr("value") );
	});
	var comcount = [];
	$('.comcount.checked').each(function(i, element)
	{
		comcount.push( $(element).attr("value") );
	});
	var smcount = [];
	$('.smcount.checked').each(function(i, element)
	{
		smcount.push( $(element).attr("value") );
	});
	var concount = [];
	$('.concount.checked').each(function(i, element)
	{
		concount.push( $(element).attr("value") );
	});


	var parameter = {};
	parameter["basecodes"] = basecodes;
	parameter["codes1"] = codes1;
	parameter["codes1count"] = codes1count;
	parameter["codes2"] = codes2;
	parameter["codes2count"] = codes2count;
	parameter["codes3"] = codes3;
	parameter["codes3count"] = codes3count;
	parameter["codes4"] = codes4;
	parameter["codes4count"] = codes4count;
	parameter["codes5"] = codes5;
	parameter["codes5count"] = codes5count;
	parameter["evencount"] = evencount;
	parameter["comcount"] = comcount;
	parameter["smcount"] = smcount;
	parameter["concount"] = concount;


	app.showLoading();
	$.post("service/do.jsp?mode=1", parameter, function(response)
	{
		app.hideLoading();
		if(response.status == 1)
		{
			var codes = "";
			var combinations = response.resource.combinations; 
			$.each(combinations, function(i, combination)
			{
				codes += combination+'\n';
			});
			$("#codes-panel textarea").val(codes);
			$("#combination-count strong").html("共"+combinations.length+"注");
		}
		else
		{
			app.message(response.messages);
		}
	}, "json");
}

function selectall($checkboxs)
{
	$.each($checkboxs, function(i, checkbox)
	{
		$(checkbox).addClass("checked");
	});
}

function unselectall($checkboxs)
{
	$.each($checkboxs, function(i, checkbox)
	{
		$(checkbox).removeClass("checked");
	});
}

</script>

</body>
</html>
