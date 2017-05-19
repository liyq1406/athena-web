/*!
 * SDC UI JavaScript Library v1.0.0
 * http://jquery.com/
 *
 * Copyright 2011, The isoftstone company
 * Dual licensed under the MIT or GPL Version 2 licenses.
 */
(function( $, undefined ) {
	/**
	 * 核心组件
	 * @author  zhouyi
	 * @version 1.0.0
	 * @date 2011-07-20
	 * Depends: 
	 * 	jquery.js,
	 *  jquery.ui.core.js
	 */
	$.sdcui = $.sdcui||{};//初始化组件空间
	
	$.extend($.sdcui,{
		version:'1.0.0',
		/**
		 * 服务配置
		 */
		serverConfig:{
			contextPath:'',//web上下文路径
			convertArray:[]//服务字典
		},
		
		resource:{
			keyboardClass:'field-tab',//键盘操作的元素样式
			keyboardFocusClass:'field-tabed',//键盘操作的元素样式
			keyboardContainerClass:'keyboard-container'
		},
		
		/**
		 * $.sdcui.getMessage(source,params)
		 * 国际化配置信息解析工具类
		 */
		getMessage:function(source, params) {
			if ( arguments.length == 1 ) 
				return function() {
					var args = $.makeArray(arguments);
					args.unshift(source);
					return $.sdcui.getMessage.apply( this, args );
				};
			if ( arguments.length > 2 && params.constructor != Array  ) {
				params = $.makeArray(arguments).slice(1);
			}
			if ( params.constructor != Array ) {
				params = [ params ];
			}
			$.each(params, function(i, n) {
				source = source.replace(new RegExp("\\{" + i + "\\}", "g"), n);
			});
			return source;
		},
		
		buttonUtils:{
			/**
			 * $.sdcui.buttonUtils.buildButtonHtml(button);
			 * 创建button的html
			 */
			buildButtonHtml:function(button){
				if(!button&&!button.name)return '';
				return '<span class="ui-button" id="btn_'+button.name+'">'+(button.caption||'')+'</span>';
			}
		},
		
		recordUtils:{
			buildRecords:function(colModels,total){
				var records = {result:{total:total,rows:[]}};
				
				for(var row=0;row<total;row++){
					var record = {};
					for(var i=0;i<colModels.length;i++){
						record[colModels[i].property] = colModels[i].caption+(row+1);
					}
					records.result.rows.push(record);
					record = null;
				}
				return records;
			},
			
			getPropertyValue:function(record,property){
				if(!property)return;
				var value;
				var properties = property.split('.');
				//alert(properties);
				if(properties.length>1){//处理多级属性
					value = record;
					for(var i=0;i<properties.length;i++){
						value = value[properties[i]];
						if(!value)return;
					}
				}else{
					value = record[property];
				}
				return value;
			}
		},
		/**
		 * 数据解析器
		 */
		dataParser:{
			/**
			 * 解析数据列表
			 */
			parseRecords:function(records,rowParser,options,pageSize){
				if(!records.result){
					//结构不符合要求，直接退出
					return ;
				}
				if(!records.result.total){
					//没有记录集，直接退出
					return;
				}
				var rows = records.result.rows,
					rowCount = rows.length,
					pageIndex = 0;
				
				if(records.result.currentPage && records.result.currentPage>1){
					pageIndex = (records.result.currentPage-1) * pageSize;
				}
				
				pageSize = rowCount < pageSize ? rowCount : pageSize;
								
				var htmls = [];
//				for(var i=0;i<rowCount;i++){
//					htmls.push(rowParser(i,rows[i],options));
//				}
				for(var i=0;i<pageSize;i++){
					htmls.push(rowParser(i+pageIndex,rows[i],options));
				}
				return htmls.join('');
			}
		}
	});
	
})(jQuery);