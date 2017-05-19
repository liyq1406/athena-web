/*!
 * SDC UI JavaScript Library v1.0.0
 * http://jquery.com/
 *
 * Copyright 2011, The isoftstone company
 * Dual licensed under the MIT or GPL Version 2 licenses.
 */
(function( $, undefined ) {
	/**
	 * GRID组件
	 * @author  zhouyi
	 * @version 1.0.0
	 * @date 2011-07-20
	 * Depends: 
	 * 	jquery.js,
	 *  jquery.ui.core.js
	 *  sdc.ui.core.js
	 *  $.sdcui.dragSupport
	 */
	var _log = $.sdcui.log;//日记
	
	$.widget("sdcui.grid",$.ui.mouse,$.extend({},$.sdcui.dragSupport,{
		currentPageIndex:1,//当前页
		
		options:{
			editModel:true,
			maxExportSize:2000,
			exportTitle:'gridData'
		},
		/**
		 * 初始化入口
		 */
		_create:function(){
			_log.debug('初始化grid组件...');
			this._initModel();
			this._defaultHtmls();
			this._initAction(); 
			var visiable = this.element.is(":visible"); 
			if(visiable){
				this.contentWidth = this.contentWidth||this.element.width();
				this.element.find('>.grid-header .grid-scroll').width(this.contentWidth); 
				this.element.find('>.grid-header .grid-scroll table').width(this.scrollWidth);
				this.element.find('>.grid-header .grid-scroll table').removeAttr('width');
			} 
			if(this.options.load){
				this.reload();
			}else{
				_activeButtons(this.element);
			}
			
			if(visiable){
				this._resetWidth();//重新设置宽度
			}
			
			this._mouseInit();//初始化拖动
		},
		
		_resetWidth:function(){
			if(this.contentWidth>0){
				this.element.find('.grid-scroll').width(this.contentWidth);
			}else{
				this.element.find('.grid-scroll').width(this.scrollWidth);
			}
			//显示横向滚动条
			if(this.contentWidth>0&&this.contentWidth<this.scrollWidth){
				this.element.find('.grid-scroll>table.grid-table').width(this.scrollWidth);
				this.element.find('.grid-x-scroll').addClass('show');
				this.contentWidth = this._dectetWidth()-this.fixedWidth;
				this.element.find('.grid-x-scroll').width(this.contentWidth);
				this.element.find('.grid-x-scroll').find('>div').width(this.scrollWidth); 
			}else{
				//补充宽度
				var spaceWidth = this.contentWidth-this.scrollWidth;
				this.isFixCol = true;
				var lastTd = this.element.find('tr.row-contral td:last');
				lastTd.width(lastTd.width()+spaceWidth-10);
				this.scrollWidth = this.scrollWidth+spaceWidth-10;
			}
			
			if(this.fixedWidth){
				this.element.find('.grid-fixed').width(this.fixedWidth);
				this.element.find('.grid-fixed').parent().width(this.fixedWidth);
				
			}
		},
		/**
		 * 检查组件的全局宽度
		 */
		_dectetWidth:function(){
			var width = this.options.width||this.element.width();
			return width;
		},
		/**
		 * 鼠标拖动开始
		 */
		_mouseStart: function(event) {
			//col
			//var targetClass = event.target.className;
			var targetElement = $(event.target);
			if(targetElement.hasClass('col')){//拖到控制宽度
				this.currentDrag = targetElement;
				this.targetLeft = targetElement.position().left;
				var colResizeHelper = this.element.find('#col-resize-helper');
				if(colResizeHelper.length==0){
					colResizeHelper = $('<div class="col-resize-helper" id="col-resize-helper"></div>').appendTo(this.element);
				}
				this.helper = colResizeHelper.addClass('resizing').css({
					top:targetElement.position().top,
					left:this.targetLeft,
					width:targetElement.width(),
					height:this.element.find('.grid-content').height()+28
				});
			}
		},
		
		/**
		 * 鼠标拖动过程
		 */
		_mouseDrag: function(event) {
			if(!this.currentDrag)return;
			
			if(this.currentDrag.hasClass('col')){
				if(this.helper){
					this.position = this._generatePosition(event);
					//this.helper.css(this.position);
					var width = this.position.left - this.targetLeft;
					if(width>10){
						this.helper.width(width);
					}
				}
			}
		},
		
		/**
		 * 鼠标拖动结束
		 */
		_mouseStop: function(event) {
			if(this.currentDrag){
				if(this.currentDrag.hasClass('col')){
					//重新设置列宽度
					this._resizeColWidth(this.currentDrag, this.helper.width());
				}
			}
			
			this.helper&&this.helper.removeClass('resizing');
			this.currentDrag = null;
			this.helper=null;
		},
		/**
		 * 设置列宽度
		 */
		_resizeColWidth:function(colElement,width){
			var oldWidth = colElement.width();
			var deltWidth = width - oldWidth;//变化的宽度
			var tableWidth = this.element.find('.grid-scroll >table').width();
			if(deltWidth==0)return;
			
			var colIndex = colElement.prevAll().length;
			if (this.fixedCount > 0) colIndex+=this.fixedCount;
			var col = this.cols[colIndex];
			
			//this.element.find('.grid-header,.grid-content').width(this.element.width());
			
			this.element.find('.grid-scroll .td-width').each(function(){
				$(this).width(this.offsetWidth-2);
			});
			this.element.find('.grid-scroll >table').width(tableWidth + deltWidth);
			this.element.find('.grid-scroll .td-width.'+col.property.replace('.','-')).width(width);
			this.scrollWidth = tableWidth + deltWidth;
			//显示横向滚动条
			if(this.contentWidth<this.scrollWidth){
				this.element.find('.grid-x-scroll').addClass('show');
				this.contentWidth = this._dectetWidth()-this.fixedWidth;
				this.element.find('.grid-x-scroll').width(this.contentWidth);
				this.element.find('.grid-x-scroll').find('>div').width(this.scrollWidth); 
			} else {
				this.element.find('.grid-x-scroll').removeClass('show');
			}
		},
		
		_initModel:function(){
			if(!this.options.cols)return;
			//初始化变量
			this._setPageIndex(this.options.currentPageIndex||1);//当前页
			this.pageCount = this.options.maxPage||1;//最大页
			this.isFixCol = this.isFixCol||false;
			this.cols = [];
			this.fixedCount = 0;
			this.fixedWidth = this.element.find('.table-header-fixed').css('visibility','visible').width();			
			this.colGroups = {};//列名称分组<key=列分组名或caption,value=分组中的列的数目>
			this.scrollWidth = null;
			
			this.showColGroup = false;//是否显示列分组
			
			this.filters = [];//查询过滤条件
			this.params = [];//过滤条件查询时的参数
			
			this._removeList = [];//删除集合初始化 
			/*
			 * 组件宽度
			 */
			if(this.options.scrollHeight){
				this.element.find('.grid-content .grid-fixed,.grid-content .grid-scroll').css('height',this.options.scrollHeight);
			}
			var width = this._dectetWidth();//this.element.width();//$.sdcui.dimensionUtil.parseWidth(this.element,this.options.width);
			var colLength = this.options.cols.length;
			var tableWidth = 0;
			
			//序号列
			if(this.options.showNum==true){
				var numWidth = 25;//this.options.numWidth;
				var numCol = {
						property:'num',
						type:'num',
						fixed:true,
						caption:'num',
						align:'center',
						width:numWidth
					};
				this.cols.push(numCol);
				this.colGroups['num']='num';
				this.fixedCount++;
			}
			//复选框列
			if(this.options.showCheckbox==true){
				var checkboxWidth = 25;//this.options.checkboxWidth;
				var checkboxCol = {
						property:'checkbox',
						type:'checkbox',
						caption:'checkbox',
						fixed:true,
						align:'center',
						width:checkboxWidth
					};
				this.cols.push(checkboxCol);
				this.fixedCount++;
				this.colGroups['checkbox']='checkbox';
			} 
			for(var i=0;i<colLength;i++){//处理参数中的列模型
				var col = $.extend({
					width:100
				},this.options.cols[i]);
				
				if(col.fixed==true){
					this.fixedCount++;
				} else {
					
				}
				if(col.group){//处理列的分组
					this.colGroups[col.group]=(this.colGroups[col.group]||0)+1;
					this.showColGroup = true;
				}else{
					this.colGroups[col.caption]=col.property;
				}
				this.cols.push(col);
				
				//if(i==colLength-1&&tableWidth<width){
				//	var lastWidth =width-tableWidth;
				//	col.width = lastWidth;
				//}
				if(!col.fixed)tableWidth+=parseInt(col.width)+2;
			}
			this.scrollWidth = tableWidth+1;//记录表格中数据table的宽度
			
			this.contentWidth = width-this.fixedWidth;
		},
		/**
		 * 生产默认的html
		 */
		_defaultHtmls:function(){
			if(this.options.initHtml!=true)return;
			this.element.addClass('youi-grid');
			var htmls = [];
			//行，列
			this.element.html(htmls.join(''));
		},
		/**
		 * 解析records为表格的html
		 */
		parseRecords:function(records,totalCount){
			//this.element.find('.grid-content .grid-scroll,.grid-content .grid-fixed').empty();
			var gridContentScroll = this.element.find('.grid-content .grid-scroll').empty();
			var fixedContainer = this.element.find('.grid-content .grid-fixed').empty();
			
			var ctrlHtml;
			var fixedCtrlHtml;
			var fixedCtrlRow = this.element.find('.table-header-fixed tr.row-contral');
			var tableWidth = this.scrollWidth;
			var scrollContainerWidth,fixedWidth;
			if(fixedCtrlRow.length){
				fixedCtrlHtml = fixedCtrlRow.html();
				fixedWidth = fixedCtrlRow.width();
				//tableWidth = this.element.find('.table-header table.grid-table').attr('width');
				ctrlHtml = this.element.find('.table-header tr.row-contral').html();
				ctrlHtml = '<tr class="row-contral">' + ctrlHtml + '</tr>';
				scrollContainerWidth = this.element.width()-fixedWidth;
				//设置父容器的宽度，防止弹出窗口中宽度设置为1的情况
				if (fixedContainer.parent().width() <= 1) {
					fixedContainer.parent().width(fixedWidth+1);
				}
				if (fixedCtrlRow.parents('td:first').width() <= 1) {
					fixedCtrlRow.parents('td:first').width(fixedWidth+1);
				}
			}else{
				ctrlHtml = this.element.find('.grid-header table.grid-table tr:first').html();
				//tableWidth = this.element.find('.grid-header table-header').attr('width')||this.element.find('.grid-header table.grid-table').attr('width');
			}
			//table-header-fixed;
			
			var pageIndex = this.currentPageIndex,
			pageSize  = this.options.pageSize;
			var parseResult = $.sdcui.recordUtils.parseRecords(records,{
				cols:this.cols,//加入回调函数的options中的额外的属性
				idKeys:this.options.idKeys,
				parseRecord:function(index,dataRecord,options){
					return _generateTrHtml(dataRecord,this.cols,this.idKeys,index, false, pageIndex,pageSize);
				},
				parse:function(dataRecords,itemHtmlArray,options){
					var itemHtml = itemHtmlArray[0].join('');
					var fixedItemHtml = itemHtmlArray[1].join('');
					var fixedTableHtml = [''];
					var scrollTableHtml = [];
					var htmls = [];
					if(fixedItemHtml){//存在固定列的情况
						fixedTableHtml.push('<table style="width:'+fixedWidth+'px" class="grid-table" cellpadding="0" cellspacing="1">');
						fixedTableHtml.push(fixedCtrlHtml);
						fixedTableHtml.push(fixedItemHtml);
						fixedTableHtml.push('</table>');
						
						scrollTableHtml.push('<table style="width:'+tableWidth+'px" class="grid-table" cellpadding="0" cellspacing="1">');
						scrollTableHtml.push(ctrlHtml);
						scrollTableHtml.push(itemHtml);
						scrollTableHtml.push('</table>');
					}else{//没有固定列的情况
						scrollTableHtml  = ['<table style="width:'+tableWidth+'px" class="grid-table"  cellpadding="0" cellspacing="1">'];
						//控制行
						scrollTableHtml.push(ctrlHtml);
						scrollTableHtml.push(itemHtml);
						scrollTableHtml.push('</table>');
					}
					return [scrollTableHtml.join(''),fixedTableHtml.join('')];
				}
			});
			//console.info(parseResult[0]);
			gridContentScroll.html(parseResult[0]);
			var fixedContainer = this.element.find('.grid-content .grid-fixed');
			if(fixedContainer.length){
				fixedContainer.html(parseResult[1]);
			}
			
			//if(totalCount){
				this._activePager(totalCount);
			//}
			
			_activeButtons(this.element);
			
			this.lastSelectedIds = null;//清空选择项
			
			this.element.find('.grid-x-scroll').trigger('scroll');
			this._headerScroll(); 
			
			if($.isFunction(this.options.afterParse)){
				this.options.afterParse();
			}
		},
		
		_headerScroll:function(){
			var contentHeight = this.options.scrollHeight||this.element.find('>.grid-content').innerHeight();
			this.contentWidth = this.contentWidth||this.element.width();
			var outHeight = this.element.find('>.grid-content table.grid-table').outerHeight(); 
			this.yScrollShow = this.yScrollShow || false; 
			if(outHeight >=contentHeight && !this.yScrollShow){
				this.element.find('>.grid-header .grid-scroll').width(this.contentWidth-17);
				var lastTd = this.element.find('.grid-header .grid-scroll tr.row-contral td:last');
				lastTd.width(lastTd.width()-17);
				lastTd = this.element.find('.grid-content .grid-scroll tr.row-contral td:last');
				lastTd.width(lastTd.width()-17); 
				this.scrollWidth = this.scrollWidth-17;
				//console.info('begin update:'+this.element.find('>.grid-content .grid-scroll table').width());
				this.element.find('>.grid-header .grid-scroll table').width(this.scrollWidth);
				this.element.find('>.grid-content .grid-scroll table').width(this.scrollWidth);
				//console.info('end update:'+this.element.find('>.grid-content .grid-scroll table').width());
				this.element.find('>.grid-content .grid-scroll table').removeAttr('width');					
				
/*				if (this.isFixCol) {
					this.scrollWidth = this.scrollWidth-17;
					if (this.element.find('>.grid-content .grid-scroll table').width() != this.scrollWidth) {
						
						console.info('begin update:'+this.element.find('>.grid-content .grid-scroll table').width());
						this.element.find('>.grid-content .grid-scroll table').css('width',this.scrollWidth+'px');
						console.info('end update:'+this.element.find('>.grid-content .grid-scroll table').width());
						this.element.find('>.grid-content .grid-scroll table').removeAttr('width');					
					}
				} else {
					this.scrollWidth = this.scrollWidth-17;
				}*/

				
				
				this.yScrollShow = true;
			}	 
		},
		
		selectRecords:function(records) {
			var el = this.element;
			var keyArray = idKeys.split(',');
			$(records).each(function(i,n){
				$(keyArray).each(function(j,v){ 
					$(el).find(">.grid-content tr.row[id='" + n[v] + "']").toggleClass('selected');
				});
				
			}); 
		},
		
		
		/**
		 * 动作监听
		 */
		_initAction:function(){
			//提交按钮
			var gridId = this.options.id;
			$.sdcui.buttonUtils.addButtonActionListener(this.element.find('>.grid-formButtons'),{
				'reset':function(){
					$('#'+gridId).grid('reset');
				},
				'back':function(){
					$('#'+gridId).grid('back');
				},				
				'submit':function(){
					$('#'+gridId).grid('submit');
				}
				
			});
			/**
			 * 表头动作
			 */
			this.element.find('>.grid-header').click(function(event){
				var eventClass = $.sdcui.classUtils.getEventClass(event);
				if(eventClass=='checkbox'){
					if($(event.target).toggleClass('checked').hasClass('checked')){
						$('tr.row',this.parentNode).addClass('selected');
					}else{
						$('tr.row.selected',this.parentNode).removeClass('selected');
					}
					_activeButtons($(this).parent());//按钮激活
				}else if(eventClass=='col'){
					var colHeader = $(event.target);
					if(colHeader.is('.sort')){
						//排序
						$(this.parentNode).grid('toggleSort',colHeader);
					}
				}
			});
			//功能按钮
			
			//行动作
			var cols = this.cols;
			var idKeys = this.options.idKeys;
			var editModel = this.options.editModel;
			var fixedCount = this.fixedCount;
			var clickRowEvent = this.options.clickRowEvent; 
			var afterSelectRowEvent = this.options.afterSelectRowEvent;
			//var options = this.options;
			var gridContent = this.element.find('>.grid-content').bind('click',{widgetId:this.options.id},function(event){
				var target = event.target;
				//寻找样式为row 的 tr节点
				var clickRowTr = findRowTr(target);

				var closeEditor = true;
				if(clickRowTr!=null){
					var record = _getRowRecord(clickRowTr, cols, idKeys); 
					var _rowIndex = $(clickRowTr).prevAll('.row').length + 1; 
					if (clickRowEvent) {
						clickRowEvent.call(clickRowTr, record, _rowIndex);
					}
					if ($('#'+event.data.widgetId).grid('select',clickRowTr,event.ctrlKey, event)){
						//单元格动作
						var cell = $(event.target);
						if(cell.is('td') && cell.parents("div .grid-fixed").length <= 0){ 
							var index = cell.prevAll().length+fixedCount;
							if (cell.parent('tr.row-new').length > 0 || (idKeys.indexOf(cols[index].property) < 0 ) 
									&& (editModel)) {
								var editorOptions = $.extend({
									name:cols[index].editor
									,rowIndex:_rowIndex
									,colIndex:index+1
									,record:record
								},cols[index],{initHtml:true},cols[index].editorOptions);
								if(editorOptions.editor){
									delete editorOptions.width;
									delete editorOptions.editorOptions;
									if(editorOptions.editable){
										$(this).trigger('editor.open',[cell,editorOptions]);
										closeEditor = false;
									}
								}								
							}
							if (afterSelectRowEvent){
								afterSelectRowEvent.call(this,clickRowTr);
							} 
						}
					} 
				}
				
				if(closeEditor&&$.sdcui.editor){//&&this.options.editable
					$(this).editor('close');//关闭表格编辑
				}
			});
			
			if($.sdcui.editor){//&&this.options.editable
				gridContent.editor();//初始化表格编辑
			}
			
			function findRowTr(dom){
				if(!dom)return null;
				var tr;
				var parentDom = dom;
				while(parentDom){
					if($(parentDom).is('tr.row')){
						tr = parentDom;
						break;
					}
					parentDom = parentDom.parentNode;
				}
				return tr;
			}
			//初始化滚动条动作
			
			//纵向滚动条
			this.element.find('>.grid-content .grid-scroll').scroll(function(){
				$('.grid-fixed',this.parentNode.parentNode).scrollTop(this.scrollTop); 
				//关闭编辑器
				$.sdcui.editorFactory&&$.sdcui.editorFactory.closeEditor();
			});
			//横向滚动条
			this.element.find('.grid-x-scroll').scroll(function(){
				$(this).parents('.youi-grid:first').find('.grid-scroll').scrollLeft(this.scrollLeft);
				//console.info(this.scrollLeft); 
			});
			
			//初始化表脚分页导航条的动作
			this.element.find('>.grid-footer').bind('click',function(event){
				var eventClass = $.sdcui.classUtils.getEventClass(event);
				if((' '+event.target.className+' ').indexOf(' disabled ')!=-1){
					return;//不可执行的按钮
				}
				switch(eventClass){
					case 'pAddRow' :
						$(this.parentNode).grid('addRow');
						break;
					case 'pRemoveRow' :
						$(this.parentNode).grid('deleteRow');
						break;
					case 'pFirst' :
						$(this.parentNode).grid('firstPage');
						break;
					case 'pPrev' :
						$(this.parentNode).grid('prevPage');
						break;
					case 'pNext' :
						$(this.parentNode).grid('nextPage');
						break;
					case 'pLast' :
						$(this.parentNode).grid('lastPage');
						break;
					case 'pgo':
						var value = $(this.parentNode).find('input.pageIndex').val();
						if(!value||isNaN(value)||value<1){
							value = 1;
						}
						value = parseInt(value);
						$(this.parentNode).grid('goPage',value);
						break;
					case 'pReload':
						$(this.parentNode).grid('reload');
						break;
				}
			});
			
			this.element.find('.youi-fieldLayout').bind('keydown',function(event){
				if(event.keyCode==13){
					$(this).parent().grid('reload');
				}
			});//this.element.find('>.youi-fieldLayout').bind('keydown',function(event){if(event.keyCode==13){$(this).parent().grid('reload');}});
			var pageSize = this.options.pageSize;
			$.each(this.element.find('.pselect option'),function(i,n){
				if ($(this).attr('value') == pageSize) {
					$(this).attr('selected','selected');
				} else {
					$(this).removeAttr('selected');
				}
			});
			this.element.find('.pselect').bind('change',function(event){
				$(this.parentNode.parentNode.parentNode.parentNode).grid('setPageSize',this.value);
				$(this.parentNode.parentNode.parentNode.parentNode).grid('reload');
				
			});
			//其他按钮
			
			this.options.buttonActions = this.options.buttonActions||{};

			//全部行保存事件
			if(this.options.buttonActions['save']){
				var autoSave = this.options.autoSave;
				this.options.buttonActions['save'] = function(){
					$('#'+gridId).grid('saveRows', false, autoSave);
				}
			}
			var dataFormId = this.options.dataFormId;
			if(dataFormId){
				var editSrc = this.options.editSrc;
				if(this.options.buttonActions['add']){
					this.options.buttonActions['add'] = function(){
						//var operant=(toft.getFormValue(_idField,option.id)!=""?"2":"1");//2-update 1-insert
						$('#'+dataFormId).form('fieldReset').addClass('operant-add').form('open',$.sdcui.resourceUtils.get('grid.add'));
					}
				}
				
				if(this.options.buttonActions['edit']&&this.options.editSrc){
					var isLocalData = true;//本地数据更新
					if(this.options.editSrc)isLocalData = false;
					var idKeys = this.options.idKeys;
					this.options.buttonActions['edit'] = function(){
						var record = $(this).parents('.youi-grid:first').grid('getSelectedRecords')[0];
						if(!record)return;
						var idValues= [];
						var keyArray = idKeys.split(',');
						for(var i=0;i<keyArray.length;i++){
							idValues.push(record[keyArray[i]]||'');
						}
						if(isLocalData){
							$('#'+dataFormId).removeClass('operant-add').form('open',$.sdcui.resourceUtils.get('grid.edit')).form('fillRecord',record);
						}else{//后台查找数据
							var src = editSrc;
							for(var i=0;i<keyArray.length;i++){
								src = 
									$.sdcui.parameterUtils.connectParameter(src,keyArray[i],idValues[i]);
							}
							
							$('#'+dataFormId).removeClass('operant-add').form('find',src).form('open',$.sdcui.resourceUtils.get('grid.edit'));
						}
					}
				}
				
				window[dataFormId+'_afterSubmit'] = function(result){ 
					if (typeof (result.success) == "undefined" || result.success !== false) {
						$('#'+gridId).grid('reload',isLocalData,result);//刷新表格数据
						$('#'+dataFormId).form('close');
					} 			
				};
			}

			if(this.options.buttonActions['remove']){
				this.options.buttonActions['remove'] = function(){
					$(this).parents('.youi-grid:first').grid('removeRecords');
				}
			}
			
			if(this.options.exportXls){
				this.options.buttonActions['exportXls'] = function(){
					$(this).parents('.youi-grid:first').grid('exportXls');
				}
			}
			
			if(this.options.exportTxt){
				this.options.buttonActions['exportTxt'] = function(){
					$(this).parents('.youi-grid:first').grid('exportTxt');
				}
			}
			
			if(this.options.exportPdf){
				this.options.buttonActions['exportPdf'] = function(){
					$(this).parents('.youi-grid:first').grid('exportPdf');
				}
			}
			
			if(this.options.print){
				this.options.buttonActions['print'] = function(){
					$(this).parents('.youi-grid:first').grid('exportPrint');
				}
			}
			
			$.sdcui.buttonUtils.addButtonActionListener(
				this.element.find('.grid-buttons'),this.options.buttonActions);
			
			/**集成layout resize*/
			if(this.options.layoutResize!==false){
				this.element.addClass('layout-resize-handle')
					.bind('layout.resize',function(event){
						//重新计算宽度
						$(this).grid('resize');
					});
			}
		},
		/**
		 * 和layout.resize 集成，layout resize的同时调用该方法.
		 * 重新设置宽度
		 */
		resize:function(){
			var uiWidth = this.element.width();//获取grid组件的宽度
			var fixedWidth = this.element.find('.table-header-fixed:first').width();
			var contentWidth = uiWidth - fixedWidth;
			//
			this.element.find('.grid-scroll').scrollLeft(0).width(contentWidth);
			//显示/隐藏横向滚动条
			var xScrollElement = this.element.find('.grid-x-scroll');
			if(this.scrollWidth>contentWidth){
				xScrollElement.addClass('show').width(contentWidth).find('>div').width(this.scrollWidth);
			}else{
				xScrollElement.removeClass('show');
			}
			this.contentWidth = contentWidth;
		},
		
		validate:function(){
			var fieldLayout = this.element.find('.youi-fieldLayout');
			fieldLayout.find('.youi-field').fieldValidate();
			if(fieldLayout.find('.youi-field.validating,.youi-field.validate-error').length==0){
				return true;
			}
			return false;
		},
		/**
		 * ajax方式访问数据
		 */
		_ajaxDatas:function(){
			if(!this.options.src)return;
			
			if($.isFunction(window[this.options.id+'_beforeSubmit'])){
				if(window[this.options.id+'_beforeSubmit'].apply(this.element[0])==false){
					return;
				}
			}
			//
			var reloadButtonPath = '#'+this.options.id+" .pReload.pButton";
			$(reloadButtonPath).addClass('loading');//值为读取状态
			
			var params = this._getParams();
			$.sdcui.ajaxUtil.ajax({
				url:this.options.src,
				dataType:this.options.srcType,
				data:params.join('&'),
				type:'post',
				id:this.element.attr('id'),
				success:function(results){
					//TODO 异常处理
					//解析载入的数据
					var records,totalCount;
					if(results.result){
						records = results.result.rows ;
						totalCount = results.result.total;
					}else{
						records = results.records;
						totalCount = results.totalCount;
					}
					$('#'+this.id).grid('parseRecords',records,totalCount);
					
					//去掉loading状态
					$(reloadButtonPath).removeClass('loading');
					
				},error:function(){
					$(reloadButtonPath).removeClass('loading');
				}
			});
		},
		
		/**
		 * 激活分页导航条
		 */
		_activePager:function(totalCount){
			if(!totalCount){
				this.element.find('.pPageStat').html($.sdcui.resourceUtils.get('grid.notFound'));
				this.element.find('input.pageIndex').val('');
				this._disableFunButtons(['pFirst','pPrev','pNext','pLast']);
				return;
			}
			//activePager
			var pageIndex = this.currentPageIndex,
				pageSize  = this.options.pageSize,
				pageCount = Math.ceil(totalCount/pageSize);
			this.pageCount = pageCount;
			
			//如果当前页码大于总页数(在删除记录时出现此情况)
			if(pageIndex>pageCount){
				this.currentPageIndex = pageIndex;
				pageIndex = pageCount;
			}
			
			_log.debug('记录总数:'+totalCount+',pageCount:'+pageCount);
			if(pageCount<2){
				//只有一页的情况
				this._disableFunButtons(['pFirst','pPrev','pNext','pLast']);
			}else{
				if(pageIndex==1){//第一页
					this._activeFunButtons(['pNext','pLast']);
					this._disableFunButtons(['pFirst','pPrev']);
				}else if(pageIndex==pageCount){//最后一页
					this._activeFunButtons(['pFirst','pPrev']);
					this._disableFunButtons(['pNext','pLast']);
				}else{
					this._activeFunButtons(['pFirst','pPrev','pNext','pLast']);
				}
			}
			
			var stat;
			
			//pPageStat
			var r1 = (pageIndex-1) * pageSize + 1,
				r2 = pageIndex*pageSize;
			if(r2>totalCount)r2 = totalCount;
			stat = $.sdcui.resourceUtils.get('grid.pagestat',pageIndex,pageCount,totalCount,r1,r2);
			//
			this.element.find('.pPageStat').html(stat);
			this.element.find('input.pageIndex').val(pageIndex);
		},
		
		/**
		 * 激活功能按钮集
		 */
		_activeFunButtons:function(buttonStyleClasses){
			var selectorPtah = '.pButton.'+buttonStyleClasses.join(',.pButton.');
			this.element.find(selectorPtah).removeClass('disabled');
		},
		
		/**
		 * disable功能按钮集
		 */
		_disableFunButtons:function(buttonStyleClasses){
			var selectorPtah = '.pButton.'+buttonStyleClasses.join(',.pButton.');
			this.element.find(selectorPtah).addClass('disabled');
		},
		
		_getParams:function(){
			//
			var params = [];
			params = params.concat(this._getPagerParams());//分页参数
			params = params.concat(this._getQueryParams());
			params = params.concat(this._getSortParams());
			
			if($.isArray(this.parentParams)){
				params = params.concat(this.parentParams);
			}
			return params;
		},
		
		_getQueryParams:function(){
			var params = [];
			if(this.element.find('.youi-fieldLayout').length==0)return params;
			var fieldValues = this.element.find('.youi-fieldLayout').fieldLayout('getFieldValues');
			if(fieldValues){
				$(fieldValues).each(function(){
					if(this.value)params.push($.sdcui.parameterUtils.propertyParameter(this.property,this.value));
				});
			}
			return params;
		},
		/**
		 * 获取排序参数
		 */
		_getSortParams:function(){
			var params = [];
			var countCount = this.cols.length;
			var col;
			//无排序列
			if(this.element.find('th.sort').length==0)return params;
			
			var sorting = this.element.find('th.sort.sorting');
			var sortingIndex = 0;
			if(sorting.length >= 0){
				sortingIndex = sorting.prevAll().length;
				var _cols = $.grep(this.cols, function(n,i){
					  return !n.fixed;
				});
				params.push(_buildSortParam(_cols[sortingIndex]));
			} else {
				for(var i=0;i<countCount;i++){
					if(i==sortingIndex)continue;
					col = this.cols[i];
					if(col.orderBy){
						params.push(_buildSortParam(col));
					}
					col = null;
				}
			}  			

			
			return params;
		},
		setPageSize:function(size) {
			this.options.pageSize = size;
		},
		
		/**
		 * 分页查询参数
		 */
		_getPagerParams:function(){
			var pagerParams = [];
			pagerParams.push('pageNo='+this.currentPageIndex);
			pagerParams.push('pageSize='+this.options.pageSize);
			return pagerParams;
		},
		/**
		 * 设置当前页定位信息
		 */
		_setPageIndex:function(index){
			this.currentPageIndex = parseInt(index);
		},
		
		/**
		 * 显示横向滚动条
		 */
		_showXScroll:function(){
			var width = this.element.width(),
				tableWidth =this.element.find('>.grid-content table').width(); 
			if(width<tableWidth){
				this.element.find('>.grid-x-scroll').width(width).addClass('show')
									.find('>div').width(tableWidth);
			}else{
				this.element.find('>.grid-x-scroll').removeClass('show');
			}
		},
		/**
		 * 排序
		 */
		toggleSort:function(colHeader){
			var index = colHeader.prevAll().length;
			var _cols = $.grep(this.cols, function(n,i){
				  return !n.fixed;
			});
			var col = _cols[index];
			this.element.find('th.sorting').removeClass('sorting');//标识为主排序
			if(colHeader.addClass('sorting').toggleClass('desc').is('.desc')){
				col.orderBy = 'desc';
				colHeader.removeClass('asc');
			}else{
				col.orderBy = 'asc';
				colHeader.addClass('asc');
			}
			this.reload();
		},
		
		/**
		 * 公共访问方法
		 */
		/**
		 * 首页
		 */
		firstPage:function(){
			this.goPage(1);
		},
		/**
		 * 上一页
		 */
		prevPage:function(){
			this.goPage(this.currentPageIndex-1);
		},
		/**
		 * 下一页
		 */
		nextPage:function(){
			this.goPage(this.currentPageIndex+1);
		},
		/**
		 * 尾页
		 */
		lastPage:function(){
			this.goPage(this.pageCount);
		},
		/**
		 * 定位页面
		 * @param index 页面定位
		 */
		goPage:function(index){
			if(index<1){
				index = 1;
			}
			if(this.pageCount>0&&index>this.pageCount){
				index = this.pageCount;
			}
			
			if(this.pageCount==1){
				this.element.find('input.pageIndex').val(1);
			}
			
			if(this.currentPageIndex!=index){
				this._setPageIndex(index);
				this._ajaxDatas();
			}
		},
		/**
		 * 选择行
		 */
		select:function(rowTr,mulitple,event){
			
			var selectedIds = this._getSelectedIds();
			var selectRowEvent = this.options.selectRowEvent;
			var cols = this.cols;
			var idKeys = this.options.idKeys; 
			var el = this.element;
			
			var rowElement = $(rowTr);//按钮单击单元格所在的行
			//设置固定列selected样式
			var fixedRow = null;//固定行
			var scrollRow = null;//可滚动的行
			var rowIndex = $(rowTr).prevAll().length;
			
			if (selectRowEvent){
				var selectedRecords = [];
				$(selectedIds).each(function(i,n){
					var tr = $(el).find(">.grid-content .grid-scroll tr.row[id='" + n + "']");
					selectedRecords.push(_getRowRecord(tr, cols,idKeys));
					
				});  
				if (event && !selectRowEvent.call(this, selectedIds,rowTr,selectedRecords
						,_getRowRecord(rowTr, cols,idKeys), $(event.target),cols 
				)){
					return true;
				}
			}

			if(this.fixedCount>0){
				fixedRow = this.element.find('.grid-content .grid-fixed tr:eq('+rowIndex+')');
				fixedRow.toggleClass('selected');
			}
			scrollRow = this.element.find('.grid-content .grid-scroll tr:eq('+rowIndex+')');
			scrollRow.toggleClass('selected');
			/**
			if ($(rowTr).parents("div .grid-scroll").length > 0) {
				this.element.find(">div  .grid-fixed .grid-table tr[id=\'" + $(rowTr).attr('id') +"\']")
				.toggleClass('selected');
			} else if ($(rowTr).parents("div .grid-fixed").length > 0) {
				this.element.find(">div  .grid-scroll .grid-table tr[id=\'" + $(rowTr).attr('id') +"\']")
				.toggleClass('selected');
			}
			*/
			if(!this.options.showCheckbox && !this.options.multiple){//&&!mulitple
				this.element.find('>.grid-content tr.row.selected')
					.not(scrollRow).not(fixedRow).removeClass('selected');
			}
			
			if(!$(rowTr).hasClass('hasTitle')){
				$(rowTr).addClass('hasTitle').find('>td').not('.validate-error').each(function(){$(this).attr('title',$(this).text())});
			}
			
			if(!this.lastSelectedIds
					||(this.lastSelectedIds&&this.lastSelectedIds.join()!=selectedIds.join())){
				this.lastSelectedIds = selectedIds;
				//回调change函数
				if($.isFunction(window[this.options.id+'_change'])){
					window[this.options.id+'_change'].apply(rowTr,[_getRowRecord(rowTr, cols,idKeys)]);
				}
			}
			//按钮激活
			_activeButtons(this.element);
			
			return true;
		},
		/**
		 * 
		 */
		_getSelectedIds:function(){
			var ids = [];
			this.element.find('>.grid-content .grid-scroll tr.row.selected').each(function(){
				ids.push(this.getAttribute('id'));
			});
			return ids;
		},
		/**
		 * 获得选择行的主键值
		 */
		getSelectedKeys:function(){
			return this._getSelectedIds();
		},
		back:function() {
			window.history.go(-1);
		},
		
		/**
		 * 提交查询
		 */
		submit:function(){
			this.currentPageIndex = 1;//定位到第一页
			//查询条件校验
			//校验
			if(!this.validate()){
				//$.sdcui.
				var errorMessage = [];
				this.element.find('.youi-field.validating,.youi-field.validate-error').each(function(){
					if(this.title)errorMessage.push(this.title);
				});
				$.sdcui.messageUtil.showError(errorMessage.join('\n'));
				return;
			}
			
			this._ajaxDatas();
		},
		isEditedCell:function(){
			return (this._removeList && this._removeList.length > 0) 
		    || this.element.find('.grid-content .grid-scroll .grid-table tr.row-new').length > 0	
		    || this.element.find('.grid-content .grid-scroll .grid-table .edited').length > 0;
		},
		/**
		 * 刷新
		 */
		reload:function(isLocalData,record,isRest){
			if (isRest) {
				this._setPageIndex(1);
			}
			if (this.isEditedCell()) {
				if(window.confirm($.sdcui.resourceUtils.get('grid.confirm.reload.notSubmit'))){
					delete this._removeList;
					if(isLocalData){
						//刷新或增加新的行数据
						this._updateOrAddRow(record);
					}else{
						this._ajaxDatas();
					}
				}				
			} else {
				if(isLocalData){
					//刷新或增加新的行数据
					this._updateOrAddRow(record);
				}else{
					this._ajaxDatas();
				}				
			}


		},
		getBatchRecords:function () {
			var idKeys = this.options.idKeys;
			var cols = this.cols;
			
			//关闭单元格编辑
			if(this.element.find('>.grid-content').editor('close')===false){
				return false;
			}
			var insert = this.options.insertAlias || 'insert';
			var edit = this.options.editAlias || 'edit';
			var del = this.options.delAlias || 'delete';
			//保存行
			var params = [];
			var insertParam = function(rowIndex, node){
				var rowId = node.getAttribute('id');
				
				if(idKeys&&rowId&&rowId.indexOf('row_')==-1){
					var idArray = idKeys.split(',');
					var idValueArray = rowId.split(',');
					for(var i=0;i<idArray.length;i++){
						params.push(insert + '['+rowIndex+'].'+idArray[i]+'='+idValueArray[i]);
					}
				}
				var _cols = $.grep(cols, function(n,i){
					  return !n.fixed;
				});
				$('td',node).each(function(index){
					var col = _cols[index];
					var value;
					if(col&&col.property){
						value = this.getAttribute('value')||this.textContent||this.innerText;
						if(value)params.push(insert + '['+rowIndex+'].'+col.property+'='+value);
					}
					value = null;
				});
			}
			var editIndex = 0;
			var editParam = function(node) {
				var rowId = node.getAttribute('id');  
				if($('td',node).is('.edited')) {
					if (idKeys) {
						var idArray = idKeys.split(',');
						var idValueArray = rowId.split(',');
						for(var i=0;i<idArray.length;i++){
							params.push(edit + '['+editIndex+'].'+idArray[i]+'='+idValueArray[i]);
						}
					}
					var _cols = $.grep(cols, function(n,i){
						  return !n.fixed;
					});
					$('td',node).each(function(index){
						var col = _cols[index];
						var value;
						if(col&&col.property){
							value = this.getAttribute('value')||this.textContent||this.innerText;
							if(value)params.push(edit + '['+editIndex+'].'+col.property+'='+value);
						}
						value = null;
					});
					editIndex++;
				} 
			}
			//非固定列（新增）
			this.element.find('.grid-content .grid-scroll .grid-table tr.row-new').each(function(rowIndex){
				insertParam(rowIndex, this);
			});
			//固定列（新增）
/*			this.element.find('.grid-content .grid-fixed .grid-table tr.row-new').each(function(rowIndex){
				insertParam(rowIndex, this);
			});*/			
			//非固定列（修改） 
			this.element.find('.grid-content .grid-scroll .grid-table tr').not('.row-new').each(function(rowIndex){
				
				editParam(this);
			});			
			//删除行
			if(this._removeList && idKeys) {
				var idArray = idKeys.split(',');
				$(this._removeList).each(function(index,n){
					var idValueArray = n.split(',');
					for(var i=0;i<idArray.length;i++){
						params.push(del + '['+index+'].'+idArray[i]+'='+idValueArray[i]);
					}
				});
				
			} 
			
			if(params.length==0){//不存在变化，直接返回
				return null;
			}
			
			params = params.concat(this._getQueryParams())
			return params;
		},
		validateBatchRecords:function() {
			var gridContent = this.element.find('>.grid-content');
			var triggerEditor = function (cols,record,cell,fixedCount,_rowIndex) {  
				if(cell.is('td') && cell.parents("div .grid-fixed").length <= 0){ 
					var index = cell.prevAll().length+fixedCount; 
					var editorOptions = $.extend({
						name:cols[index].editor
						,rowIndex:_rowIndex
						,colIndex:index+1
						,record:record
					},cols[index],{initHtml:true},cols[index].editorOptions);
					if(editorOptions.editor){
						delete editorOptions.width;
						delete editorOptions.editorOptions;
						editorOptions['isCheck'] = true;
						$(gridContent).trigger('editor.open',[cell,editorOptions]);  
						$(gridContent).trigger('editor.close',[cell]);//关闭表格编辑 
						$(gridContent).trigger("mousedown");  
					}  
						
				}
			} 
			var cols = this.cols;
			var idKeys = this.options.idKeys; 
			var fixedCount = this.fixedCount; 
			//新增行校验
			this.element.find('.grid-content .grid-scroll .grid-table tr.row-new').each(function(i,n){
				var _rowIndex = $(n).prevAll('.row').length + 1; 
				var record = _getRowRecord(n, cols, idKeys);
				$(n).find('td').each(function(k,cell){
					triggerEditor(cols,record,$(cell),fixedCount,_rowIndex);
				});
			});
			//修改列校验
			this.element.find('.grid-content .grid-scroll .grid-table tr').not('.row-new').each(function(index,tr){ 
				var _rowIndex = $(tr).prevAll('.row').length + 1; 
				var record = _getRowRecord(tr, cols, idKeys);
				$(tr).find('td.edited').each(function(i,td){
					triggerEditor(cols,record,$(td),fixedCount,_rowIndex);
				});
				
			});
			var validateMessages = [];
			this.element.find('.youi-editor .validate-error').each(function(){
				validateMessages.push(this.title);
			});
			return validateMessages;
		},
		/**
		 * 批量保存
		 */
		saveRows:function(noReload,isAutoSave){
			//校验信息
			//if(!this.validate()){
			
			var validateMessages = this.validateBatchRecords();
			//状态edited validate-error
			if(validateMessages.length){
				$.sdcui.messageUtil.showError(validateMessages.join('\n'));
				return false;
			}
			
			var params = this.getBatchRecords();
			
			if(!params)return false;
			
			if (!this.options.preSaveRowsEvent || this.options.preSaveRowsEvent.call(this,params)) {
				if(!this.options.saveRowsSrcs)return false;
				
				/** ajax保存全部行*/
				$.sdcui.ajaxUtil.ajax({
					url:this.options.saveRowsSrcs,
					data:params.join('&'),
					grid:this,
					noReload:noReload,
					success:function(result){ 
						if (isAutoSave) { 
							if (result.success && result.success === true) {
								this.grid._updateNewRowId(result);
							} else {
								alert(result.msg);
								this.grid = null;
								return;
							} 
							this.grid._addRowDom(this.grid); 
						}
						this.grid._afterSaveRows(result,this.noReload);
						this.grid = null;
					}
				});	
			}
			
			return params;
		},
		
		_updateNewRowId : function(result) {
			this.element.find('.grid-content .grid-scroll .grid-table tr.row-new').attr('id', result.idKeys);
		}, 
		/**
		 *  批量保存完成后的操作
		 */
		_afterSaveRows:function(result,noReload){ 
			//清除新增，修改，删除记录 
			if (!this.options.afterSaveRowsEvent || this.options.afterSaveRowsEvent.call(this,result)){
				this.clearBatchData();
				noReload!=true&&this.reload();
			}
		},
		clearBatchData:function(){
			delete this._removeList;
			this.element.find('.grid-content .grid-scroll .grid-table tr.row-new').removeClass('row-new');
			this.element.find('.grid-content .grid-scroll .grid-table .edited').removeClass('edited');
		},
		
		addRow:function(){
			this.element.trigger("mousedown"); 
			//如果当前最后一行为空行，则直接返回
			var lastNewRow = this.element.find('tr.row-new:last');
			if(lastNewRow.length&&!lastNewRow.text()){
				return;
			}  
			if (this.options.autoSave && this.options.autoSave === true) {
				//保存之前的修改数据,完成后不刷新表格
				if (!!!this.saveRows(true, this.options.autoSave)){
					this._addRowDom();
				}
			} else {
				this._addRowDom();
			}

		},
		_addRowDom : function(){
			var defaultValue = this.options.defaultAddRecord||{};
			if (defaultValue.count == 0){
				$.each(this.cols,function(i,n){
					defaultValue[n.property] = n.defaultValue;
				});				
			} 
			if($.isFunction(this.options.beforeAddRow)){ 
				this.options.beforeAddRow.apply(this,[defaultValue]);
			}
			
			this._addRow(defaultValue,true);
			
			this.select(this.element.find('>.grid-content .grid-scroll>.grid-table tr:first').next()[0], false);			
		},
		/**
		 * 更新行数据
		 */
		_updateOrAddRow:function(record){
			//TODO
		},
		/**
		 * 增加行
		 */
		_addRow:function(record,isNew){
			var record = record||{};
			
			var gridScrollTable = this.element.find('>.grid-content .grid-scroll>.grid-table');
			var hasRow = gridScrollTable.length;
			
			if(!hasRow){//如果表格增加前没有行，添加容器table 
				//固定列区
				var fixedCtrlRow = this.element.find('>.grid-header .table-header-fixed .row-contral');
				if(this.fixedCount>0){ 
					var fixedCtrlHtml = fixedCtrlRow.html();
					var fixedWidth = fixedCtrlRow.width();
					this.element.find('>.grid-content .grid-fixed').append('<table class="grid-table" width="' + fixedWidth + '" cellspacing="1" cellpadding="0">'+fixedCtrlHtml+'</table>');
					if($.browser.msie) { 
						this.element.find('.grid-content .grid-fixed').parent().width(fixedWidth-1);
					} else {
						this.element.find('.grid-content .grid-fixed').parent().width(fixedWidth+1);
					}
				}
				//表体区
				var ctrlHtml = this.element.find('>.grid-header .grid-scroll .row-contral').html();
				gridScrollTable = 
					$('<table class="grid-table" width="'+this.scrollWidth+'" cellspacing="1" cellpadding="0"><tr>'+ctrlHtml+'</tr></table>');
				this.element.find('>.grid-content .grid-scroll').append(gridScrollTable);
			}
			
			var index = gridScrollTable.find('tr.row').length;
			var pageIndex = this.currentPageIndex,
			pageSize  = this.options.pageSize;
			//将插入的行放在第一列
			var htmlArray = _generateTrHtml(record,this.cols,this.idKeys,0,isNew,pageIndex,pageSize);			
			gridScrollTable.find('tr:first').nextAll().toggleClass('even').toggleClass('old');
			gridScrollTable.find('tr:first').after(htmlArray[0]);
			
			if(this.fixedCount>0){
				this._updateFixedNum(this.cols);
				this.element.find('>.grid-content .grid-fixed .grid-table tr:first').nextAll().toggleClass('even').toggleClass('old');
				
				this.element.find('>.grid-content .grid-fixed .grid-table tr:first').after(htmlArray[1]);
			}
			gridScrollTable = null;
			$(this.element.find('>.grid-content .grid-scroll')).animate({
				scrollTop:this.scrollHeight
			},1000);
		},
		_updateFixedNum:function(cols){
			this.element.find('>.grid-content .grid-fixed .grid-table tr:first').nextAll().each(function(i,node){
				if ($(node).html().indexOf('input') < 0) {
					$(node).find('td').text(i + 2);
				}
			});
		},
		_insertRow:function(record){
			
		},
		/**
		 * 更新行
		 */
		_updateRow:function(record){
			
		},
		/**
		 * 删除行
		 */
		deleteRow:function(){
			if (this.element.find('>.grid-content .grid-scroll tr.row.selected').length == 0) {
				alert($.sdcui.resourceUtils.get('grid.noSelectMsg'));
			}
			if(this.options.idKeys){
				this._removeList = this._removeList||[];
				var ids = this._removeList;
				this.element.find('>.grid-content .grid-scroll tr.row.selected').each(function(){
					if (this.getAttribute('id').indexOf('row_') != 0) {
						ids.push(this.getAttribute('id'));	
					} 
				});
				this.element.find('>.grid-content tr.row.selected').remove();
			}
		},		
		_deleteRow:function(record){
			//alert(1);
		},
		/**
		 * 导出EXCEL
		 */
		exportPrint:function(){
			this._exportRecords('print');
		},
		/**
		 * 导出EXCEL
		 */
		exportXls:function(){
			this._exportRecords('xls');
		},
		/**
		 * 导出EXCEL
		 */
		exportTxt:function(){
			this._exportRecords('txt');
		},
		/**
		 * 导出PDF
		 */
		exportPdf:function(){
			this._exportRecords('pdf');
		},
		
		_exportRecords:function(exportType){
			if(!this.options.src)return;
			var form = $('#'+this.options.id+'_exportHelper');
			var data = '';
			if(this.element.find('.youi-fieldLayout').length){
				var fieldValues = this.element.find('.youi-fieldLayout').fieldLayout('getFieldValues');
				if(fieldValues){
					$(fieldValues).each(function(){
						if(this.value){
							data += ''+this.property+'='+this.value+'&';
						}
					});
				}
			}
			if(!form.length){
				flag = this.options.src.indexOf('?') > 0 ? '&':'?';
				form = $('<form target="_blank" method="post" action="'+this.options.src + flag + data +'exportXls=exportXls"> </form>').appendTo('body',document);
			}
			form.html(this._getExportFormHtmls(exportType));
			form.submit();
		},
		
		_getExportFormHtmls:function(exportType){
			var htmls = [];
			var maxSize = this.options.maxExportSize;//最大导出条数
			//['<form action="'+this.options.src+'" method="post">'];
			//htmls.push('</form>');
			/*
			if(this.element.find('.youi-fieldLayout').length){
				var fieldValues = this.element.find('.youi-fieldLayout').fieldLayout('getFieldValues');
				if(fieldValues){
					$(fieldValues).each(function(){
						if(this.value){
							htmls.push('<input name="'+this.property+'" value="'+encodeURIComponent(this.value)+'" type="hidden"/>');
						}
					});
				}
			}
			*/
			htmls.push('<input name="pager:export" value="'+exportType+'" type="hidden"/>');
			htmls.push('<input name="pager:pageIndex" value="1" type="hidden"/>');
			htmls.push('<input name="pager:pageSize" value="'+maxSize+'" type="hidden"/>');
			htmls.push('<input name="pager:exportTitle" value="'+encodeURIComponent(this.options.exportTitle)+'" type="hidden"/>');
			var colCount = this.cols.length;
			var col,property;
			for(var i=0;i<colCount;i++){
				col = this.cols[i];
				property = col.property;
				if(property!='checkbox'&&property!='num'){
					col.caption=col.caption||'';
					htmls.push('<input name="pager:header" value="'+col.caption+'" type="hidden"/>');
					htmls.push('<input name="pager:property" value="'+col.property+'" type="hidden"/>');
				}
			}
			return htmls.join('');
		},
		/**
		 * 获得选择的集合
		 */
		getSelectedRecords:function(){
			return this.getRecords(true);
		},
		
		/**
		 * 设置行选择
		 */
		setSelectedRecords:function(records){
			var idKeyArray = this.options.idKeys.split(',');
			for(var i=0;i<records.length;i++){
				//idKeys
				var idValues = [];
				for(var j=0;j<idKeyArray.length;j++){
					idValues.push($.sdcui.recordUtils.getPropertyValue(records[i],idKeyArray[j]));
				}
				this.element.find('tr#'+idValues.join()).addClass('selected');
			}
		},
		/**
		 * 获得行记录
		 */
		getRecord:function(rowDoc){
			return _getRowRecord(rowDoc,this.cols, this.options.idKeys);
		},
		triggerCloseEdited:function(){ 
			var gridContent = this.element.find('>.grid-content');
			this.element.find('.grid-content .grid-scroll .grid-table tr.row-new td').each(function(k,cell){
				$(gridContent).trigger('editor.close',[$(cell)]);//关闭表格编辑 
				$(gridContent).trigger("mousedown");  
			});
			this.element.find('.grid-content .grid-scroll .grid-table tr').not('.row-new').each(function(index,tr){  
				$(tr).find('td.editing').each(function(i,td){
					$(gridContent).trigger('editor.close',[$(td)]);//关闭表格编辑 
					$(gridContent).trigger("mousedown"); 
				});
				
			});
			
		},
		loadByParents:function(parentParams){
			this.parentParams = parentParams;
			this._ajaxDatas();
		},
		
		/**
		 *获取当前页面的所有记录
		 */
		getRecords:function(selected){
			var  records = [],
				 idKeys = this.options.idKeys,
				 cols = this.cols;
			this.element.find('>.grid-content .grid-scroll tr.row'+(selected?'.selected':'')).each(function(){ 
				records.push(_getRowRecord(this,cols, idKeys));
			});
			return records;
		},
		
		/**
		 * grid作为field一部分时
		 * form提交使用
		 */
		getFormRecords:function(){ 
			var idKeys = this.options.idKeys;
			var cols = this.cols;
			
			//编辑开关
			this.element.find('>.grid-content').editor('close');
			var insert = this.options.insertAlias || 'insert';
			var edit = this.options.editAlias || 'edit';
			var del = this.options.delAlias || 'delete';
			
			var fixedCount = this.fixedCount;
			//保存行
			var params = {};
			var insertParam = function(rowIndex, node){
				var rowId = node.getAttribute('id');
				var row = {};
				params[insert] = params[insert]||[];
				if(idKeys&&rowId&&rowId.indexOf('row_')!=0){
					var idArray = idKeys.split(',');
					var idValueArray = rowId.split(',');
					
					
					for(var i=0;i<idArray.length;i++){
						row[idArray[i]] = idValueArray[i];
					}
				} 
				$('td',node).each(function(index){
					var col = cols[index+fixedCount];
					var value;
					if(col&&col.property){
						value = this.getAttribute('value')||this.textContent||this.innerText;
						if(value)row[col.property] = value;
					}
					value = null;
				});
				params[insert].push(row);
			}
			var editIndex = 0;
			var editParam = function(node) {
				var rowId = node.getAttribute('id'); 
				var row = {};
				params[edit] = params[edit]||[];				
				if($('td',node).is('.edited')) {
					if (idKeys) {
						var idArray = idKeys.split(',');
						var idValueArray = rowId.split(',');
						for(var i=0;i<idArray.length;i++){
							row[idArray[i]] = idValueArray[i];
						}						
					} 
					$('td',node).each(function(index){
						var col = cols[index+fixedCount];
						var value;
						if(col&&col.property){
							value = this.getAttribute('value')||this.textContent||this.innerText;
							if(value)row[col.property] = value;
						}
						value = null;
					});
					params[edit].push(row);
					editIndex++;
				} 
			}
			//非固定列（新增）
			this.element.find('.grid-content .grid-scroll .grid-table tr.row-new').each(function(rowIndex){
				insertParam(rowIndex, this);
			});
			//固定列（新增）
/*			this.element.find('.grid-content .grid-fixed .grid-table tr.row-new').each(function(rowIndex){
				insertParam(rowIndex, this);
			});*/			
			//非固定列（修改） 
			this.element.find('.grid-content .grid-scroll .grid-table tr').not('.row-new').each(function(rowIndex){
				editParam(this);
			});			
			//删除行
			if(this._removeList && idKeys) {
				var idArray = idKeys.split(','); 
				params[del] = params[del]||[];
				$(this._removeList).each(function(index,n){
					var row = {};
					var idValueArray = n.split(',');
					for(var i=0;i<idArray.length;i++){
						row[idArray[i]] = idValueArray[i];
					}
					params[del].push(row);
				});
				
			} 			
			return params;
		},
		/**
		 * 设置列默认值
		 */
		setColsDefaultValue:function(defaultValues){
			//this.cols
			var defaultValue;
			for(var i=0;i<this.cols.length;i++){
				defaultValue = defaultValues[this.cols[i].property];
				if(defaultValue){
					this.cols[i].defaultValue = defaultValue;
				}
				defaultValue = null;
			}
		},
		/**
		 * 删除记录
		 */
		removeRecords:function(){
			var idKeys = this.options.idKeys;
			if(idKeys&&this.options.removeSrc){
				var idValues = this.getSelectedKeys(),
					idKeyArray = idKeys.split(','),
					idValueArray = [],
					params = [];
				for(var i=0;i<idValues.length;i++){
					idValueArray = idValues[i].split(',');
					for(var j=0;j<idKeyArray.length;j++){
						params.push($.sdcui.parameterUtils.propertyParameter(idKeyArray[j],idValueArray[j]));
					}
					idValueArray = null;
				}
				$('.youi-button.active-2',this.element).addClass('disabled');
				if(idValues.length > 0 && window.confirm($.sdcui.resourceUtils.get('grid.confirm.remove',idValues.length))){

					this.element.find('>.grid-content tr.row.selected').remove();
					if (this.element.find('>.grid-content tr.row').length <= 0
							&& this.currentPageIndex - 1 > 0) {
						this.currentPageIndex = this.currentPageIndex - 1; 
					}
					
					$.sdcui.ajaxUtil.ajax({
						url:this.options.removeSrc,
						data:params.join('&'),
						widgetId:this.options.id,
						success:function(result){
							$('#'+this.widgetId).grid('reload');//刷新表格
						}
					});
				} else {
					$('.youi-button.active-2',this.element).removeClass('disabled');
				}
			}
		},
		/**
		 * 重置查询条件
		 */
		reset:function(){
			this.element.find('.youi-fieldLayout .youi-field').fieldReset();
		},
		/**
		 * 注销
		 */
		destroy:function(){
			this.element.removeClass('youi-grid');
			$.widget.prototype.destroy.apply(this, arguments);
		},
		/**
		 * 设置宽度
		 */
		width:function(width){
			this.element.width(width);
			this.element.find('>.grid-content').width(width);
			//
			this._showXScroll();//显示横向滚动条
		}
	}));
	
	$.extend($.sdcui.grid,{
		version: "1.0.0",//组件版本号
		defaults:{//默认参数
			srcType:'json',
			containerParent:'#system-container',
			delay: 100,//
			editModel:true,//是否可以编辑行数据，false表示只能在新增时行编辑
			distance: 1,
			initHtml:true//是否有组件初始化html
		}
	});
	/**
	 * 生成行html
	 */
	function _generateTrHtml(dataRecord,cols,idKeys,rowIndex,isNew,pageIndex,pageSize){
		var srcollHtmls = [];
		var fixedHtmls = [];
		
		
		var rowId = _getRowId(rowIndex,dataRecord,idKeys);
		var trStyles = ['row',rowIndex%2?'old':'even'];
		if(isNew)trStyles.push('row-new');
		var srcollHtmls = ['<tr id="'+rowId+'" class="'+trStyles.join(' ')+'">'];
		
		var fixedHtmls = ['<tr id="'+rowId+'" class="'+trStyles.join(' ')+'">'];
		var hasFixedCol = false;
		
		for(var i=0;i<cols.length;i++){
			if(cols[i].fixed==true){
				fixedHtmls.push(_generateTdHtml(dataRecord,cols[i],rowIndex, i,pageIndex,pageSize));
				hasFixedCol = true;
			}else{
				srcollHtmls.push(_generateTdHtml(dataRecord,cols[i],rowIndex, i,pageIndex,pageSize));
			}
		}
		if(hasFixedCol){
			fixedHtmls.push('</tr>');
		}else{
			fixedHtmls = [''];
		}
		srcollHtmls.push('</tr>');
		
		return [srcollHtmls.join(''),fixedHtmls.join('')];
	}
	
	/**
	 * 用于生成数据单元格的html
	 */
	function _generateTdHtml(record,col,rowIndex, colIndex,pageIndex,pageSize){
		var htmls = [];
		if(!col||!col.property)return;
		var valueObj = _getColValueFromReocrd(record,col,rowIndex, colIndex),//值对象 包括value 和 text
			value = valueObj.value,
			tdHtml = valueObj.text;

		var cellStyles = [];
		htmls.push('<td');
		
		if(col.align)htmls.push(' align="'+col.align+'"');
		if(col.hidden)htmls.push(' style="display:none"');
		//highlight 高亮样式
		if($.isFunction(col.highlight)&&col.highlight(value,record)){
			cellStyles.push('highlight');
		}
		if(col.convert==='radio'){
			cellStyles.push('radio');
			if(value==='1'||value===true){
				cellStyles.push('radio-checked');
			}
			tdHtml = '<div></div>';
		}
		switch(col.type){
			case 'num'://序号列
				tdHtml = ((pageIndex-1)*pageSize) + rowIndex+1;
				break;
			case 'checkbox'://复选控制列
				cellStyles.push('checkbox');
				tdHtml = '<div></div>';
				break;
			case 'link'://链接
				var tdHtmls = [];
				tdHtmls.push('<a href="#" onclick="');
				tdHtmls.push('link_'+col.property+'(event');
				if(col.params){
					var params = (typeof(col.params)=='string'?col.params.split(','):col.params);
					var paramValues = [];
					$(params).each(function(){
						paramValues.push("'"+$.sdcui.recordUtils.getPropertyValue(record,this)+"'");
					});
					if(paramValues.length){
						tdHtmls.push(',');
						tdHtmls.push(paramValues.join(','));
					}
				}
				tdHtmls.push(');">');
				if(col.img){
					tdHtmls.push('<img class="cell-button" src="'+col.img+'"></img>');
				}else{
					tdHtmls.push(valueObj.text);
				}
				tdHtmls.push('</a>');
				tdHtml = tdHtmls.join('');
				break;
			default:
				
		}
		if(cellStyles.length){
			htmls.push(' class="'+cellStyles.join(' ')+'"');
		}
		if(valueObj.valueAttrHtml){
			htmls.push(valueObj.valueAttrHtml);
		}
		htmls.push('>');
		 
		htmls.push(tdHtml);
		htmls.push('</td>');
		return htmls.join('');
	}
	
	/**
	 * 获得值
	 */
	function _getColValueFromReocrd(record,col,rowIndex,colIndex){
		var  defaultValue,value,text,valueAttrHtml;
		if($.isFunction(col.defaultValue)){//如果默认值为函数
			defaultValue = col.defaultValue(record,col,rowIndex);
		}else{//默认值为普通字符
			defaultValue = col.defaultValue;
		}
		
		value = $.sdcui.recordUtils.getPropertyValue(record,col.property);
		value = value==null?defaultValue:value;//value值
		//convert转换 TODO 函数类型的convert
		var convertArray = $.sdcui.serverConfig.convertArray[col.convert];
		if(col&&col.convert&&convertArray){
			text = convertArray[value]||col.notConvertValue||value;
			var attrValue = value;
			if(!attrValue&&attrValue!=0){
				attrValue = '';
			}
			valueAttrHtml = ' value="'+(value||'')+'" ';
		}else{
			//替换tdHtml中的空格   
			if (typeof value !== "undefined") {
				text = ''+value;
			} else {
				text = '';
			}
			text = text.toString().replace(/\s/g, "&nbsp;" );// 
		}
		
		//自定义渲染
		var renderer = col.renderer;
		

		
		if (renderer) {
			if (typeof renderer === "string") {
				col.renderer = renderer = $.sdcui.formatUtils[renderer];
			} 
			if (typeof renderer === "function") {
				text = renderer.call( 
					col,
					value,  
					record,
					rowIndex,
					colIndex
				); 
			}
			if (!valueAttrHtml||valueAttrHtml==''){
				valueAttrHtml = ' value="'+(value||'')+'" ';
			}
		}
		value = value==null?'':value;//null置为空串
		return {
			value:value,//单元格的值
			text:text,//单元格的显示文本
			valueAttrHtml:valueAttrHtml
		};
	}
	/**
	 * 获得行主键
	 */
	function _getRowId(index,dataRecord,idKeys){
		var rowId;
		if(idKeys){
			var keys = idKeys.split(',');
			var keyValues = [];
			$.each(keys,function(){
				keyValues.push($.sdcui.recordUtils.getPropertyValue(dataRecord,this));
			});
			rowId = keyValues.join();
		}else{
			rowId = 'row_'+index;
		}
		return rowId;
	}
	
	function _getRowRecord(clickRowTr,cols,idKeys) {
		var record = {};
		var rowId = $(clickRowTr).attr('id');
		if(!$(clickRowTr).hasClass('row-new')){//(!$(clickRowTr).hasClass('row-new'))新插入的行不置ID到对象中-zhouyi
			record = _idKeysToRecord(record,idKeys,rowId);
		}
		var _cols = $.grep(cols, function(n,i){
			  return !n.fixed;
		});
		$('td',clickRowTr).each(function(index){
			var col = _cols[index];
			var value;
			if(col&&col.property&&!col.fixed){ 
				value = this.getAttribute('value')||this.textContent||this.innerText;
				if(value)record[col.property] = value;
			}
			value = null;
		});
		return record;
	}
	/**
	 * 把grid组件的idKeys属性写入record
	 */
	function _idKeysToRecord(record,idKeys,idValues){
		var record = record||{};
		if(idKeys&&idValues){
			var idArray = idKeys.split(',');
			var idValueArray = idValues.split(',');
			for(var i=0;i<idArray.length;i++){
				record[idArray[i]] = idValueArray[i];
			}
		}
		return record;
	}
	
	function _activeButtons(gridDom){
		var selectedCount = $('.grid-scroll tr.row.selected',gridDom).length;
		
		if(selectedCount==0){
			$('.youi-button.active-1',gridDom).addClass('disabled');
			$('.youi-button.active-2',gridDom).addClass('disabled');
		}else if(selectedCount==1){
			$('.youi-button.active-1',gridDom).removeClass('disabled');
			$('.youi-button.active-2',gridDom).removeClass('disabled');
		}else{
			$('.youi-button.active-1',gridDom).addClass('disabled');
			$('.youi-button.active-2',gridDom).removeClass('disabled');
		}
	}
	
	function _buildSortParam(col){
		if(!col || !col.orderBy)return '';
		return 'sort='+col.orderBy+'&order='+(col.sortProperty||col.property);
	}
})(jQuery);