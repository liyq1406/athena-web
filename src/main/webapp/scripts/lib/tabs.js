/**
 * 
 */

(function( $, undefined ) {
	$.widget("sdcui.tabs", {
		options:{
			maxCount:4
		},
		
		_create:function(){
			this._keySupport();
			this.selectIndex(this.options.pageIndex);
		},
		/**
		*键盘支持
		*/
		_keySupport:function(){
			var tabsId = this.element.attr('id');
			for(var i=0;i<this.options.maxCount;i++){
				$(document).bind('keydown',{combi:'Shift+'+(i+1)},_selectedTab(i,tabsId));
			}
		},
		selectIndex:function(index){
			this.element.find('.ui-tab-item.active:first,>.tab-panel-item.active').removeClass('active');
			this.element.find('.ui-tab-item:eq('+index+')').addClass('active');
			this.element.find('>.tab-panel-item:eq('+index+')').addClass('active');
			this._activeItem();
		},
		/**
		 * 激活tab-item
		 */
		_activeItem:function(){
			var activePanel = this.element.find('>.tab-panel-item.active');
			var index = activePanel.prevAll('.tab-panel-item').length;
			if(!activePanel.hasClass('loaded')&&this.options.urls[index]){
				activePanel.load(this.options.urls[index],function(){
					$(this).addClass('loaded').focus();
				});
			}else{
				activePanel.focus();
			}
		}
	});
	
	function _selectedTab(index,tabsId){
		return function(event,a){
			// window.location.reload();
			window.location.href = window.location.href + "?index=" + index;
			//$('#'+tabsId).tabs('selectIndex',index);
		}
	}
	
})(jQuery);