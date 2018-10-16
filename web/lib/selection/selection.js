(
	function($)
	{
		var selectedStatus = function($li)
		{
			$li.attr("isselect", "1");
			$li.css("background-color", "#fff4e3");
		}

		var unSelectStatus = function($li)
		{
			$li.removeAttr("isselect");
			$li.css("background-color", "");
		}

		var clickitem = function(event)
		{
			var $panel = event.data.$panel;

			var options = $panel.data("options");
			var $keyfield = $panel.data("$keyfield");
			var $valfield = $panel.data("$valfield");

			if(!options.ismultiple)
			{
				unSelectStatus($panel.find("ul li"));
			}

			var isselect = $(this).attr("isselect");
			if(isselect == "1")
			{
				unSelectStatus($(this));
			}
			else
			{
				selectedStatus($(this));
			}

			var selectedVals = [];
			var selectedkeys = [];
			$panel.find("ul li[isselect=1]").each(function(i)
			{
				selectedVals[i] = $(this).text();
				selectedkeys[i] = $(this).attr("key");
			});
			$keyfield.val(selectedkeys.join(","))
			$valfield.val(selectedVals.join(","))

			if(!options.ismultiple)
			{
				$("#selector-panel").hide();
			}
			event.stopPropagation();
		}

		var open = function(event)
		{
			var $panel = event.data.$panel;
			var options = $panel.data("options");
			
			var $valfield = $(this);
			var $keyfield = $valfield.data("joint");
			$panel.data("$keyfield", $keyfield);
			$panel.data("$valfield", $valfield);

			var $selectorpanel = $("#selector-panel");
			if($selectorpanel.size() == 0)
			{
				$selectorpanel = $('<div id="selector-panel" style="position:absolute; display:none;"></div>');
				$("body").append($selectorpanel);
				$selectorpanel.on("mousedown", function(event){event.stopPropagation();});
			}
			$selectorpanel.children().detach();
			$selectorpanel.html($panel);
			
			var width = 600;
			var height = 300;

			if(options.mode == "list")
			{
				unSelectStatus($panel.find("ul li"));

				var id = $keyfield.val();
				if(id != "")
				{
					var ids = id.split(",");
					for(var i = 0 ; i < ids.length ; i++)
					{
						var $item = $panel.find("ul li[key='"+ids[i]+"']");
						selectedStatus($item);
					}
				}

				$selectorpanel.css("min-width", $valfield.outerWidth()+"px");
				$selectorpanel.css("max-height", "250px");

				$selectorpanel.css("width", "auto");
				$selectorpanel.css("height", "auto");

				width = $selectorpanel.width();
				height = $selectorpanel.outerHeight();
			}

			var position = $valfield.offset();


			var pagewidth = $(document).width();
			var pageheight = $(document).height();
			if(position.left + width > pagewidth)
			{				
				$selectorpanel.css("left", position.left - width + $valfield.outerWidth());
			}
			else
			{
				$selectorpanel.css("left", position.left);
			}
			if(position.top + height > pageheight)
			{				
				if(position.top < height)
				{
					$selectorpanel.css("top", position.top + $valfield.outerHeight() + 1);
				}
				else
				{
					$selectorpanel.css("top", position.top - height + 1);
				}
			}
			else
			{
				$selectorpanel.css("top", position.top + $valfield.outerHeight() + 1);
			}


			$selectorpanel.show();
			$(window).resize();
		}
		$.fn.selection = function(p1, p2)
		{     
			if(typeof p1 == "string")
			{
				var fun = methods[p1];
				if(fun != null)
				{
					return fun($(this), p2);
				}
			}
			else
			{
				var defaults = 
				{
					url: "",
					ismultiple: false,
					mode: 'list',
					cache: true
				}
				
				var options = $.extend({}, defaults, p1);
				var $fields = this;

				var $panel = $('<div/>');
				$panel.data("options", options);

				this.each
				(
					function()
					{
						var $field = $(this).data("joint");
						if($field == null)
						{
							$field = $('<input type="text">');
						}

						$field.attr("style", $(this).attr("style"));
						$field.attr("class", $(this).attr("class"));
						

						$field.attr("placeholder", $(this).attr("placeholder"));
						$field.show();
						$(this).hide();
						$(this).after($field);

						var title = $(this).attr("title");
						if(title != "")
						{
							$field.val(title);
						}

						$field.data("joint", $(this));
						$(this).data("joint", $field);
						$(this).data("$panel", $panel);
						$field.on("click", {"$panel":$panel}, open);
					}
				);

				if(options.mode == "list")
				{
					$panel.attr("class", "list-container");
					var url = options.url;

					var dictionaries = $("body").data("dictionary");
					if(dictionaries == null)
					{
						$("body").data("dictionary", {});
						dictionaries = $("body").data("dictionary");
					}

					var items = dictionaries[url];
					if(items == null)
					{
						$.ajax
						({
							async:false,
							dataType:"json",
							url:url,
							cache:options.cache,
							success:function(data) 
							{
								items = data;
								dictionaries[url] = items;
							}
						});
					}

					var $items = $('<ul class="item-panel"/>');
					$items.data("items", items);

					$.each(items, function(i, item)
					{
						var $item = $('<li key="'+item.k+'">'+item.v+'</li>');
						$item.on("click", {$panel:$panel}, clickitem);
						if(options.clickitem != null)
						{
							$item.on("click", {$panel:$panel}, options.clickitem);
						}
						$item.on("mouseout", function()
						{
							if($(this).attr("isselect") == null)
							{
								$(this).css("background-color", "");
							}
						});
						$item.on("mouseover", function()
						{
							if($(this).attr("isselect") == null)
							{
								$(this).css("background-color", "#e4efff");
							}
						});
						$items.append($item);
					});
					$panel.html($items);
				}

				$(document).mousedown
				(
					function(e)
					{
						try
						{
							if($(e.target).closest("#selector-panel").size() == 0)
							{
								$("#selector-panel").hide();
							}
						}
						catch(e)
						{
							
						}
					}
				);
			}
		};  


		var methods =
		{
			setId:function($obj, id)
			{
				var $panel = $obj.data("$panel");
				var options = $panel.data("options");
				if(options.mode == "list")
				{
					var $items = $panel.find("ul");
					var items = $items.data("items");
					
					var values = [];
					var ids = id.split(",");
					for(var i = 0 ; i < ids.length ; i++)
					{
						$.each(items, function(j, item)
						{
							if(ids[i] == item.k)
							{
								values.push(item.v);
							}
						});
					}
					
					$obj.val(id);
					var $field = $obj.data("joint");
					if($field != null)
					{
						$field.val(values.join(","));
					}
				}
			}
		};
	}
)
(jQuery);
