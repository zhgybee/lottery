<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../css/app.css" />

	<style>
		body{font-size:16px}
		.cont-form li{padding:10px; overflow:hidden}
		.cont-form li div{float:left; margin-right:20px; width:200px}
		.cont-form li input.text{height:30px; line-height:30px; padding:0px 5px; width:100px; margin-right:5px}
		.cont-form li select{height:30px; line-height:30px; padding:0px 5px; width:100px; margin-right:5px}

		.set-tab{overflow:hidden; border-bottom:1px solid #eeeeee; margin:10px 10px}
		.set-tab li{float:left; margin-right:20px; padding:10px 10px; cursor:pointer}
		.set-tab li.active{color:red; border-bottom:3px solid red}


		.set-cont li{padding:10px; overflow:hidden}
		.set-cont li input.text{height:30px; line-height:30px; padding:0px 5px; width:100px; margin-right:5px; width:50px; text-align:center}

	
		.mod-submit{text-align:center; margin-top:20px}
		.mod-submit button{padding:10px 50px; font-size:20px; font-weight:100; border-radius:5px}

		thead th{font-weight:400; border-bottom:1px solid #eeeeee; padding:20px}
		tbody td{font-weight:400; border-bottom:1px solid #eeeeee; padding:20px; text-align:center}
		tbody td em{font-weight:400; font-style:normal }
	</style>

</head>
<body>

<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation"><h4>倍投计算器</h4></div>

	<div class="sub-module">

	<div>
		<div class="bd" style="margin:20px">
			<div class="mod-select" style="display:none">
				<label class="k">投注彩种</label>

				<span class="v caiztab none">
					 <label class="pre"><input type="radio" id="11x5" class="radio_ck" name="xw"  value="sywsd" play="sywsd">11选5</label>
				</span>
			</div>
			<ul class="cont-form">
				<li class="clearfix">
					<div class="pre prew">
						<label class="k">彩种玩法</label>
						<span class="v caizselect">
							<select name="a3" class="input-small sywsd none">
								<option value="6">任二</option>
								<option value="19">任三</option>
								<option value="78">任四</option>
								<option value="540">任五</option>
								<option value="90">任六</option>
								<option value="26">任七</option>
								<option value="9">任八</option>
								<option value="13">前一直选</option>
								<option value="130">前二直选</option>
								<option value="65">前二组选</option>
								<option value="1170">前三直选</option>
								<option value="195">前三组选</option>
							</select>
						</span> 
					</div>
					<div class="pre"> 
						<label class="k">单注奖金</label> 
						<span class="v"><input class="text input-small" tabindex="4"  type="text" id="bonus" value="11"  maxlength="9" style="color: #CC0000">元</span>
					</div>
					<div class="pre">
						<label class="k">已经投入</label>
						<span class="v"><input class="text input-small" tabindex="4"  type="text"  id="fin_input" value="0" maxlength="5">元</span>
					</div>
				</li>
				<li class="clearfix">
					<div class="pre">
						<label class="k">投注注数</label>
						<span class="v"><input class="text input-small" tabindex="4" type="text"  id="zhu" value="1" maxlength="9">注</span>
					</div>
					<div class="pre">
						<label class="k">投注期数</label>
						<span class="v"><input class="text input-small" tabindex="4" type="text"  id="qi_max" value="10" maxlength="9">期</span>
					</div>
					<div class="pre">
						<label class="k">起始倍数</label>
						<span class="v"><input class="text input-small" tabindex="4"  type="text" id="init_time" value="1" maxlength="9">倍</span>
					</div>
				</li>
			</ul>
			<div class="profit-set">
				<ul class="set-tab clearfix">
					<li class="active" target="t1">
						按利润率计算
					</li>
					<li  target="t2">
						按利润计算
					</li>
				</ul>
				<div class="set-cont-box">
					<ul class="set-cont" id="t1">
						<li>
							<label style="cursor: pointer">
								<input type="radio" checked="checked"  mode='1' name="radio" value="0" style="cursor: pointer">
								<span>全程盈利润率<input class="text input-xmini" value="50" type="text" id="win_percent" style="margin-left:50px; margin-right:5px">%</span> 
							</label>
						</li>
						<li class="dissel">
							<label style="cursor: pointer">
								<input type="radio"   name="radio"  mode='2' value="0" style="cursor: pointer">
								<span>分段盈利润率<span style="margin-left:50px">前</span><input class="text input-xmini" disabled="disabled" value="5" type="text" id="pre_qi" style="margin-left:5px; margin-right:5px">期利润率<input class="text input-xmini" disabled="disabled" id="pre_win_percent" value="50" type="text" style="margin-left:5px; margin-right:5px">%，之后利润率<input class="text input-xmini" id="next_win_percent" disabled="disabled" value="30" type="text" style="margin-left:5px; margin-right:5px">%</span> </label>
						</li>
					</ul>
					<!-- 按利润计算 -->
					<ul class="set-cont" style="display:none" id="t2">
						<li>
							<label style="cursor: pointer">
								<input type="radio"  name="radio2" checked="checked" mode='3' style="cursor: pointer">
								<span>全程利润<input class="text input-xmini" value="100" type="text" id="solid_win" style="margin-left:50px; margin-right:5px">元</span> </label>
						</li>
						<li class="dissel">
							<label style="cursor: pointer">
								<input type="radio"  name="radio2" mode='4' style="cursor: pointer"><span>分段利润<span style="margin-left:50px">前</span><input class="text input-xmini" disabled="disabled" id="pre_qi2" value="5" type="text" style="margin-left:5px; margin-right:5px">期利润<input class="text input-xmini" disabled="disabled"   id="pre_win_solid" value="100" type="text" style="margin-left:5px; margin-right:5px">元，之后利润<input class="text input-xmini" disabled="disabled" value="100" id="next_win_solid"  type="text" style="margin-left:5px; margin-right:5px">元</span> </label>
						</li>
					</ul>

					<div class="mod-submit">
						<button class="button btn-large3 btn-large2-primary">立即计算</button>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div style="margin:20px">
		<div class="gc-total" style="display:none">
			<span class="btn-large3 btn-large2-primary">使用该方案追号</span>
			<b class="total-dot">总计：当前您累计追号 <em>10</em> 期</a>，累计投入 <em>52</em> 元，中奖奖金 <em>56</em> 元，中奖奖金 <em>56</em> 元</b>
		</div>
		<p class="count-result-hd count-bt-hd" style="margin:20px; color:#ff6600">
			<span>根据以上条件设置，生成投注方案如下：</span>
		</p>

		<table width="100%" class="count-bt-table">
			<thead>
				<tr class="bd">
					<th>期数</th>
					<th>倍数</th>
					<th><span title="在当前期中，为了满足利润设置的条件，你应该要投入的金额">当期投入</span></th>
					<th><span title="当前期之前（包括当前期）你已经投入的金额">累计投入</span></th>
					<th>当期中奖奖金</th>
					<th><span title="合计利润=中奖的理论奖金-累计投入">合计利润</span></th>
					<th><span title="利润率=合计利润/累计投入">利润率</span></th>
				</tr>
			</thead>
			<tbody id="toshow"><tr ><td colspan="7" style="padding-top:20px; text-align:center">暂未生成投注方案！</td></tr></tbody>
		</table>
	</div>

	</div>

</div>

<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="calculator.js"></script>

<script>
$(function()
{
	$("#11x5").click();

	$(".set-tab li").on("click", function()
	{
		$(".set-tab li").removeClass("active");
		$(this).addClass("active");

		$(".set-cont").hide();

		$("#"+$(this).attr("target")).show();
	})
})
</script>
</body>
</html>
