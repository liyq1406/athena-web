/**
 * 
 */
(function($) {
	var _log = $.sdcui.log;

	$.widget("sdcui.menu", {

		options : {

		},

		_create : function() {
			this.element.addClass('youi-menu');

			// 默认打开
			// 99010103

			var activePanel = null;
			if (this.options.selected) {
				var selectedMenuItem = this.element.find('#'
						+ this.options.selected);
				if (selectedMenuItem.length) {
					// selectedMenuItem.addClass('selected');
					this._showTrace(selectedMenuItem);
					//2012-05-08 muwei
					activePanel = selectedMenuItem.parents(
							'.menu-bar-content:first').prev().prev();
				}
			}
			//if (activePanel == null){
			//	activePanel = this.element.find('.menu-bar-title:first');
			//}
			//默认打开第一节菜单
			//var activeLength = this.element.find('.active').length;
			//alert(activeLength);
			//if(activeLength>0){
			//	this.active(activePanel);
			//}
			if(activePanel!=null){
				this.active(activePanel);
				var contentElement = activePanel.next().next();
				contentElement.find('li ul').each(function(i,n){
					if ($(n).find('a.menu-a.selected').length > 0) {
						return;
					} else {
						$(n).toggleClass("collapse");
					}
				});
				
			}
			//
			this._initAction();
		},

		_showTrace : function(selectedMenuItem) {
			var parent = selectedMenuItem;
			var traces = [];
			while (parent.length) {
				traces.push(parent.find('>span').text());
				parent = parent.parents('.menu-item:first');
			}

			// traces = traces;

			$('#system-title')
					.html(traces.reverse().join(' <span> | </span> '));
		},

		active : function(barElement) {
			this.element.find('.active').removeClass('active');
			var contentElement = barElement.next().next();
			barElement.addClass('active');
			contentElement.addClass('active');
			//2012-05-08 muwei
			var upContentElement = barElement.next();
			upContentElement.addClass('active');
			//2012-05-08 muwei
			var downContentElement = barElement.next().next().next();
			downContentElement.addClass('active');
		},

		_initAction : function() {
			var temp = "";
			var tempBarTitle = "";
			this.element.bind('click', function(event) {
				// $(this).parents('.youi-menu:first').menu('active',$(this));
				var target = event.target;
				if ($(event.target).is("span.expandable.expanded")){
					$(event.target).parent("li.menu-item").find('ul').toggleClass("collapse");
				}
				else if ($.sdcui.classUtils.hasClass(event.target, 'menu-span')) {
					var menuBar = $(event.target).parent();
					var parMenuBar = menuBar.parent();
					if (menuBar.is('.menu-bar-title')) {
						var activeLength = $(this).find('.active').length;
						if(activeLength==0){
							$(this).menu('active', menuBar);
						}else if(activeLength>0){
							$(this).find('.active').removeClass('active');
							if(temp!=''&&temp[0].outerHTML!=menuBar[0].outerHTML){
								$(this).menu('active', menuBar);
							}
						}

					}
					menuBar.next().next().find('li ul').each(function(i,n){
						if ($(n).find('a.menu-a.selected').length > 0) {
							return;
						} else {
							$(n).addClass("collapse");
						}
					});
					temp = menuBar;
				} else if ($.sdcui.classUtils.hasClass(event.target,
						'menu-bar-title')) {
					var menuBar = $(event.target);
					var activeLength = $(this).find('.active').length;
					if(activeLength==0){
						$(this).menu('active',menuBar);
					}else if(activeLength>0){
						$(this).find('.active').removeClass('active');
						if(tempBarTitle!=''&&tempBarTitle[0].outerHTML!=menuBar[0].outerHTML){
							$(this).menu('active', menuBar);
						}
					}
					menuBar.next().next().find('li ul').each(function(i,n){
						if ($(n).find('a.menu-a.selected').length > 0) {
							return;
						} else {
							$(n).addClass("collapse");
						}
					});
					tempBarTitle = menuBar;
				}  else if ($(event.target).parent().is(".expandable.expanded")) {
					$(event.target).parent(".expandable.expanded")
					.parent("li.menu-item").find('ul').toggleClass("collapse");
				}
			});
		}
	});

})(jQuery);