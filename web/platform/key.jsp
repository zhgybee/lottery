<%@page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>

<body>

<textarea id="keys" style="width:100%; height:500px;"></textarea>
<input id="name" /><input id="code" /><div id="description"></div>
<button onclick="startor()">生成</button>

<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="Syunew3.js"></script>
<script type="text/javascript">

var isConnect = 0;
$(function()
{


	//如果是IE10及以下浏览器，则跳过不处理
	if(navigator.userAgent.indexOf("MSIE")>0 && !navigator.userAgent.indexOf("opera") > -1)
	{
		alert("请使用谷歌、火狐、360（急速模式）或IE10以上浏览器访问");
		return;
	}

	try
	{
		var s_pnp = new SoftKey3W();
		s_pnp.Socket_UK.onopen = function() 
		{
			isConnect = 1;
		} 

		s_pnp.Socket_UK.onmessage = function(Msg) 
		{
			var PnpData = JSON.parse(Msg.data);
			if(PnpData.type == "PnpEvent")
			{
				if(PnpData.IsIn) 
				{
					unlock();
				}
				else
				{
					lock();
				}
			}
		} 

		s_pnp.Socket_UK.onclose = function()
		{

		}
	}
	catch(e)  
	{  
		alert(e.name + ": " + e.message);
		return false;
	}  


});

function unlock()
{
	$("#description").html('加密狗已插入');
	console.log("加密狗已插入");
	testing();
}
function lock()
{
	$("#description").html('请插入加密狗');

	

}

function startor()
{
	var key = $("#name").val();
	var code = $("#code").val();
	var uuid = createUUID();
	var sql = "INSERT INTO T_USER(ID, CODE, ICON, NAME, LOGINNAME, PASSWORD, ROLE, SECRETKEY, CREATE_DATE) VALUES('"+uuid+"', '"+code+"', '', '', '', '', '10000000', '"+key+"', CURRENT_TIMESTAMP);"
	var keys = $("#keys").val();
	keys += sql+'\n';
	$("#keys").val(keys);
}

	
function testing(callback) 
{
    if(isConnect == 0)
    {
		lock();
        alert ("未能检测到加密狗，请确定驱动是否安装。");
		return;
    }

   	var DevicePath;
	var ret;
	var n;
	var mylen;
	var ID_1;
	var ID_2;
	var addr;
	try
	{

		var s_simnew1 = new SoftKey3W();
			
		s_simnew1.Socket_UK.onopen = function() 
		{
			s_simnew1.ResetOrder();
		} 

	    s_simnew1.Socket_UK.onmessage = function(Msg) 
	    {
	        var UK_Data = JSON.parse(Msg.data);
	        if(UK_Data.type != "Process")
			{
				return;
			}
	        switch(UK_Data.order) 
	        {
	            case 0:
					s_simnew1.FindPort(0);
					break;
	            case 1:
					if( UK_Data.LastError != 0)
					{
						if(callback != null)
						{
							alert ("未发现加密狗，请插入加密狗");
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					DevicePath = UK_Data.return_value;
					s_simnew1.GetID_1(DevicePath);
	                break;
				case 2:
					if(UK_Data.LastError != 0)
					{
						if(callback != null)
						{
							alert("返回ID号错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					ID_1 = UK_Data.return_value;
					s_simnew1.GetID_2(DevicePath);
	                break;
	             case 3:
					if( UK_Data.LastError != 0)
					{
						if(callback != null)
						{
							alert("取得ID错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					ID_2 = UK_Data.return_value;
					$("#name").val(toHex(ID_1) + toHex(ID_2));
					s_simnew1.ContinueOrder();
					startor();
	                break;
	             case 4:
					addr = 0;
					s_simnew1.YReadEx(addr, 1, "ffffffff", "ffffffff", DevicePath);
	                break;
	            case 5:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("读数据时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					s_simnew1.GetBuf(0);//发送命令从数据缓冲区中数据
	                break;
	            case 6:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("调用GetBuf时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					mylen = UK_Data.return_value;
					addr = 1;
					s_simnew1.YReadString(addr,mylen, "ffffffff", "ffffffff", DevicePath);
	                break;
	            case 7:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("读取字符串时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					addr = 20;
					s_simnew1.YReadEx(addr, 1, "ffffffff", "ffffffff", DevicePath);
	                break;
	            case 8:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("读数据时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					s_simnew1.GetBuf(0);
	                break;
	            case 9:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("调用GetBuf时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					mylen = UK_Data.return_value;
					addr = 21;
					s_simnew1.YReadString(addr, mylen, "ffffffff", "ffffffff", DevicePath);
	                break;
	             case 10:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("读取字符串时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					s_simnew1.EncString("333ssssss", DevicePath);
	                break;
	             case 11:
					if( UK_Data.LastError != 0)
					{ 
						if(callback != null)
						{
							alert("进行加密运行算时错误，错误码为："+UK_Data.LastError.toString());
						}
						s_simnew1.Socket_UK.close();
						return;
					} 
					s_simnew1.Socket_UK.close();
					if(callback != null)
					{
						callback();
					}
	                break;
            }
			
	    } 
	    s_simnew1.Socket_UK.onclose = function()
		{

	    }
	}
	catch (e) 
	{
		alert(e.name + ": " + e.message);
	}


}



var digitArray = new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');

function toHex(n) 
{
	var result = ''
	var start = true;

	for ( var i = 32; i>0; ) 
	{
		i -= 4;
		var digit = ( n >> i ) & 0xf;

		if (!start || digit != 0) 
		{
			start = false;
			result += digitArray[digit];
		}
	}
	return ( result == '' ? '0' : result );
}



function createUUID()
{
	var dg = new Date(1582, 10, 15, 0, 0, 0, 0);
	var dc = new Date();
	var t = dc.getTime() - dg.getTime();
	var tl = getIntegerBits(t, 0, 31);
	var tm = getIntegerBits(t, 32, 47);
	var thv = getIntegerBits(t, 48, 59) + '1';
	var csar = getIntegerBits(rand(4095), 0, 7);
	var csl = getIntegerBits(rand(4095), 0, 7);
	var n = getIntegerBits(rand(8191), 0 ,7) + 
	getIntegerBits(rand(8191), 8, 15) + 
	getIntegerBits(rand(8191), 0, 7) + 
	getIntegerBits(rand(8191), 8, 15) + 
	getIntegerBits(rand(8191), 0, 15);
	return tl + tm  + thv  + csar + csl + n; 
}

function getIntegerBits(val, start, end)
{
	var base16 = returnBase(val, 16);
	var quadArray = new Array();
	var quadString = '';
	var i = 0;
	for(i = 0 ; i < base16.length ; i++)
	{
		quadArray.push(base16.substring(i, i+1));    
	}
	for(i = Math.floor(start/4) ; i <= Math.floor(end/4) ; i++)
	{
		if(!quadArray[i] || quadArray[i] == '') 
			quadString += '0';
		else 
			quadString += quadArray[i];
	}
	return quadString;
}

function returnBase(number, base)
{
	return (number).toString(base).toUpperCase();
}
function rand(max)
{
	return Math.floor(Math.random() * (max + 1));
}

</script> 

</body>
</html>
