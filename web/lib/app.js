var app = {};
(function (app) 
{
	app.showLoading = function() 
	{
		var $loading = $("#loading-panel");
		if($loading.length == 0)
		{
			var content = '<div id="loading-panel" style="display:none">';
			content += '<div class="loading-mask"></div>';
			content += '<div class="loading-toast"><img src="/images/loading.gif"/></div>';
			content += '</div>';
			$("body").append(content);
			$loading = $("#loading-panel");
		}

		var loadimage = $loading.find(".loading-toast");
		if($(document).scrollTop() > 0)
		{
			loadimage.css("left", $(window).outerWidth(true) / 2 - loadimage.width() / 2);
			loadimage.css("top", $(document).scrollTop() + $(window).outerHeight(true) / 2 - loadimage.height() / 2 - 30);
		}
		else
		{
			loadimage.css("left", $(window).outerWidth(true) / 2 - loadimage.width() / 2);
			loadimage.css("top", $(window).outerHeight(true) / 2 - loadimage.height() / 2 - 30);
		}

		$loading.show();
	}

	app.message = function(text, title) 
	{
		alert(text);
	}

	app.hideLoading = function() 
	{
		var $loading = $("#loading-panel");
		$loading.hide();
	}

	app.getParameter = function(m)
	{
		var sValue = location.search.match(new RegExp("[\?\&]" + m + "=([^\&]*)(\&?)", "i"));
		return sValue ? sValue[1] : sValue;
	}

	app.getContextPath = function()
	{
		var pathname = document.location.pathname;
		var index = pathname.substr(1).indexOf("/");
		var result = pathname.substr(0,index+1);
		return result;
	}

	app.setParameter = function(url, name, value) 
	{
		var r = url;
		if (r != null && r != 'undefined' && r != "") 
		{
			value = encodeURIComponent(value);
			var reg = new RegExp("(^|)" + name + "=([^&]*)(|$)");
			var tmp = name + "=" + value;
			if (url.match(reg) != null) 
			{
				r = url.replace(eval(reg), tmp);
			}
			else 
			{
				if (url.match("[\?]")) 
				{
					r = url + "&" + tmp;
				} 
				else 
				{
					r = url + "?" + tmp;
				}
			}
		}
		return r;
	}

	app.formatdate = function(value, format)
	{
		var date = null;
		if(typeof(value) == "string")
		{
			if(value.indexOf(".") > -1)
			{
				value = value.substring(0, value.indexOf("."));
			}
			value = value.replace(/-/g,"/");
			date = new Date(value);
		}
		else
		{
			date = value;
		}

		var items = 
		{
			"M+": date.getMonth() + 1,
			"d+": date.getDate(),
			"h+": date.getHours(),
			"m+": date.getMinutes(),
			"s+": date.getSeconds(),
			"q+": Math.floor((date.getMonth() + 3) / 3),
			"S": date.getMilliseconds()
		};

		if (/(y+)/.test(format)) 
		{
			format = format.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
		}

		for (var item in items)
		{
			if (new RegExp("(" + item + ")").test(format)) 
			{
				format = format.replace(RegExp.$1, (RegExp.$1.length == 1) ? (items[item]) : (("00" + items[item]).substr(("" + items[item]).length)));
			}
		}
		return format;
	}

	app.toDate = function(text)
	{						
		text = text.replace(/-/g,"/");
		return new Date(text);
	}

	app.createUUID = function()
	{
		var dg = new Date(1582, 10, 15, 0, 0, 0, 0);
		var dc = new Date();
		var t = dc.getTime() - dg.getTime();
		var tl = app.getIntegerBits(t, 0, 31);
		var tm = app.getIntegerBits(t, 32, 47);
		var thv = app.getIntegerBits(t, 48, 59) + '1';
		var csar = app.getIntegerBits(app.rand(4095), 0, 7);
		var csl = app.getIntegerBits(app.rand(4095), 0, 7);
		var n = app.getIntegerBits(app.rand(8191), 0 ,7) + 
		app.getIntegerBits(app.rand(8191), 8, 15) + 
		app.getIntegerBits(app.rand(8191), 0, 7) + 
		app.getIntegerBits(app.rand(8191), 8, 15) + 
		app.getIntegerBits(app.rand(8191), 0, 15);
		return tl + tm  + thv  + csar + csl + n; 
	}

	app.getIntegerBits = function(val, start, end)
	{
		var base16 = app.returnBase(val, 16);
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

	app.returnBase = function(number, base)
	{
		return (number).toString(base).toUpperCase();
	}

	app.rand = function(max)
	{
		return Math.floor(Math.random() * (max + 1));
	}

	app.isOdd = function(number)
	{
		return (number % 2 != 0)
	}

	app.isPrime = function(number)
	{
		for (var i = 2; i <= Math.sqrt(number); i++) 
		{
			if(number % i == 0)
			{
				return false;
			}
		};

		return true;
	}


	app.repeatcount = function(array1, array2)
	{
		var count = 0;
		for(var i = 0 ; i < array1.length ; i++)
		{
			var code = array1[i];
			if(array2.indexOf(code) != -1)
			{
				count++;
			}
		}
		return count;
	}
})(app);