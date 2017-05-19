/*!
 * SDC UI JavaScript Library v1.0.0
 * http://jquery.com/
 *
 * Copyright 2011, The isoftstone company
 * Dual licensed under the MIT or GPL Version 2 licenses.
 */
(function($, undefined) {
	/**
	 * GRID组件
	 * 
	 * @author zhouyi
	 * @version 1.0.0
	 * @date 2011-07-20 Depends: jquery.js, jquery.ui.core.js sdc.ui.core.js
	 */

	$.extend($.sdcui.resource, {
		grid : {
			PAGESTAT : $.sdcui.getMessage('{0}/{1}页,共{2}条记录.'),
			num : $.sdcui.resource.i18n['C_Number'],
			pagePrev : $.sdcui.resource.i18n['C_UpPage']+'[F9]',
			pageNext : $.sdcui.resource.i18n['C_DownPage']+'[F10]',
			pageFirst : $.sdcui.resource.i18n['C_HomePage']+'[Home]',
			pageLast : $.sdcui.resource.i18n['C_EndPage']+'[End]'
		}
	});
	
	$.extend($.sdcui.resource, {
		grid1 : {
			PAGESTAT : $.sdcui.getMessage('{0}/{1}页,共{2}条记录.'),
			num : $.sdcui.resource.i18n['C_Number'],
			pagePrev : $.sdcui.resource.i18n['C_UpPage']+'[F4]',
			pageNext : $.sdcui.resource.i18n['C_DownPage']+'[F5]',
			pageFirst : $.sdcui.resource.i18n['C_HomePage']+'[F2]',
			pageLast : $.sdcui.resource.i18n['C_EndPage']+'[F3]'
		}
	});

	$.widget("sdcui.grid",
					{
						/**
						 * 默认参数
						 */
						options : {
							defaultColWidth : 75, // 默认列宽度
							defaultAlign : 'center',
							pageSize : 10, // 每页记录条数
							enableCutPage : true,//是否允许分页
							showCheckbox : false, // 显示复选框
							checkedOnlyOne : false, //是否单选
							showNum : true// 显示序号列
						},
						/** ********************************************************** */
						paramsQuery : null, //查询条件
						currentPage : 1,		//当前页码
						fixedColModels : [],// 固定列
						colModels : [], // 列模型
						maxGroupLevel : 1, // 最大表头分组层次
						colspans : [], // 列表头合并描述
						totalPage : 0, //总页数
						/** ********************************************************** */
						/**
						 * 初始化
						 */
						_create : function() {

							this.element
									.addClass('ui-' + this.widgetName)
									.addClass($.sdcui.resource.keyboardContainerClass);
							this._initModels();// 初始化模型数据
							this._defaultHtmls();// 生成HTML
							this._initAction();// 初始化表格动作
							this._initRecords();// 加载初始化数据
						},

						/**
						 * 初始化GRID模型
						 */
						_initModels : function() {
							// 初始化相关变量
							this.colModels = [];
							this.maxGroupLevel = 1;
							this.colspans = [];
							
							if (!this.options.cols)
								return;

							this._initIsChangedModel();
							this._initNumModel();
							this._initCheckboxModel();
							this._initColModel(this.options.cols, 1, []);// 支持多级分组
						},
						
						/**
						 * 列模型初始化
						 */
						_initColModel : function(cols, parentLevel, captions,isChildCol) {
							var counts = 0;
							var col;// 列模型
							for ( var i = 0; i < cols.length; i++) {
								col = cols[i];
								if (col.group == true && $.isArray(col.cols)) {// 分组对象
									var prevColCount = this.colModels.length;
									var childCount = this._initColModel(
											col.cols, parentLevel + 1, captions
													.concat(col.caption), true);
									counts += childCount;
									// 存储表头列合并信息
									this.colspans[prevColCount] = {
										rowIndex : parentLevel,
										colIndex : prevColCount,
										colspan : childCount
									};
									// 起始行 - 结束行
								} else if (cols[i].property) {// 属性
									// 封装列模型对象
									var colModel = $.extend(
													{},
													col,
													{
														captions : captions.concat(col.caption),
														width 	 : col.width || this.options.defaultColWidth,
														align    : col.align || this.options.defaultAlign
													});
									if (isChildCol != true && cols[i].fixed) {// 非group下的列可以作为固定列
										this.fixedColModels.push(colModel);
									} else {
										// 将处理的一个列模型添加到整个列模型中去
										this.colModels.push(colModel);
										this.maxGroupLevel = Math.max(colModel.captions.length);
										counts++;
									}
									colModel = null;
								}
								col = null;
							}
							return counts;
						},

						/**
						 * 组织js生成的html
						 */
						_defaultHtmls : function() {
							if (this.options.initHtml !== false) {
								var htmls = [];
								htmls.push(this._buildQueryFormHtml());// 查询条件块
								htmls.push(this._buildButtonsHtml());// 按钮
								htmls.push(this._buildHeaderHtml());// 表头
								htmls.push(this._buildContentHtml());// 表体
								htmls.push(this._buildFooterHtml());
								this.element.html(htmls.join(''));
								
								this._bindClickToButtons();								
							}
						},
						
						_buildQueryFormHtml : function() {
							return '<div class="grid-query"></div>';
						},
						
						/**
						 * 组织按钮区的HTML生成
						 */
						_buildButtonsHtml : function() {
							var htmls = [];

							var buttons = this.options.buttons;
							if (buttons) {
								htmls.push('<div class="grid-buttons">');
								for ( var i = 0; i < buttons.length; i++) {
									if (!buttons[i].hidden){
										// $.sdcui.buttonUtils.buildButtonHtml(buttons[i])生成一个Button
										htmls.push($.sdcui.buttonUtils
												.buildButtonHtml(buttons[i]));
									}
								}
								htmls.push('</div>');
							}
							return htmls.join('');
						},
						
						//2012-4-13 往span按钮上绑定click事件
						_bindClickToButtons : function() {
							var buttons = this.options.buttons;
							if (buttons) {
								for ( var i = 0; i < buttons.length; i++) {
									//为Button绑定click事件								
									if(buttons[i].action){
										$('#btn_'+buttons[i].name).click( 
											buttons[i].action
										);
									}
								}
							}
							//如果存在分页，则绑定首页、上一页、下一页、尾页事件
							if (this.options.enableCutPage == true){
								var id = this.element.attr("id");
								//首页
								$('#btn_pageFirst'+ id).click( 
									function(){$('#'+id).grid('firstPage');}
								);
								//上一页
								$('#btn_pagePrev'+ id).click( 
									function(){$('#'+id).grid('prevPage');}
								);
								//下一页
								$('#btn_pageNext'+ id).click( 
									function(){$('#'+id).grid('nextPage');}
								);
								//尾页
								$('#btn_pageLast'+ id).click(
									function(){$('#'+id).grid('lastPage');}
								);
							}
						},
						
						/*
						 * 设置查询条件(查询条件和currentPage 当currentPage不存在时，为1)
						 */
						setQueryParams : function(params) {
							this.currentPage = 1;
							if (params == null){
								this.paramsQuery = null;
							} else {
								this.paramsQuery = [];
								for (var i=0; i<params.length; i++){
									var vParam = params[i].split("=");
									if (vParam[0].indexOf("currentPage") != -1){       
										//获取并设置当前页
										this.currentPage = parseInt(vParam[1]);
										continue;
									} else {
										//获取并设置查询条件
										this.paramsQuery.push(params[i]);
										continue;
									}
								}
							}
						},
						
						/*
						 * 设置查询条件(只设置查询条件，不设置currentPage)
						 */
						setQueryParamsDefaultPage : function(params) {
							if (params == null){
								this.paramsQuery = null;
							} else {
								this.paramsQuery = [];
								for (var i=0; i<params.length; i++){
									var vParam = params[i].split("=");
									if (vParam[0].indexOf("currentPage") == -1){       								
										//获取并设置查询条件
										this.paramsQuery.push(params[i]);
										continue;
									}
								}
							}
						},
						
						/*
						 * 设置当前页码
						 * 当前页码
						 */
						setCurrentPage : function(currPage) {
							if (this.totalPage >= currPage){
								this.currentPage = currPage;
							}
						},
						
						/*
						 * 获取翻页的查询条件
						 * increment 在当前页码增加/减少的数量
						 */
						getQueryParams : function(increment) {
							var params = jQuery.extend(true,[],this.paramsQuery);
							if (increment){
								params.push("currentPage="+ (this.currentPage+increment));
							} else {
								params.push("currentPage="+ this.currentPage);
							}
							return params;
						},
						
						/*
						 * 获取页码参数
						 * 
						 */
						getCurrentPageParams:function(currPage){
							var params = [];
							params.push("currentPage="+ currPage);
							return params;
						},
						
						/*
						 * 获取当前页码
						 */
						getCurrentPage : function() {
							return this.currentPage;
						},
						
						/*
						 * 获取显示行数
						 */
						getPageSize : function() {
							return this.options.pageSize;
						},
						
						/*
						 * 第一页
						 */
						firstPage : function() {
							if(this.paramsQuery != null) {
								var grid = this;
								var params = jQuery.extend(true,[],this.paramsQuery);
								if(this.currentPage > 1){
									params.push("currentPage=1");
									this._ajaxLoad(params,function(){
										grid.currentPage = 1;
									});
								  }else {
									 if (this.totalPage > 0){
										showPromptMsg('red',$.sdcui.resource.i18n['C_FirstPage']);
									 }
								 }
								return false;
							}
						},
						
						/*
						 * 上一页
						 */
						prevPage : function() {
							if(this.paramsQuery != null) {
								var grid = this;
								var params = jQuery.extend(true,[],this.paramsQuery);
								if(this.currentPage > 1){
									params.push("currentPage="+(this.currentPage-1));
									this._ajaxLoad(params,function(){
										grid.currentPage--;
									});
								}else {
									if (this.totalPage > 0){
									  showPromptMsg('red',$.sdcui.resource.i18n['C_FirstPage']);
									}
								}
					    		return false;
							}
						},
						
						/*
						 * 下一页
						 */
						nextPage : function() {
							if(this.paramsQuery != null) {
								var grid = this;
								var params = jQuery.extend(true,[],this.paramsQuery);
								if(this.currentPage < this.totalPage){
									params.push("currentPage="+(this.currentPage+1));
									this._ajaxLoad(params,function(){
										grid.currentPage++;
									});
								}else{
									if (this.totalPage > 0){
										showPromptMsg('red',$.sdcui.resource.i18n['C_LastPage']);
									}
								}
					    		return false;
							}
						},

						/*
						 * 最后一页
						 */
						lastPage : function() {
							if(this.paramsQuery != null) {
								var grid = this;
								var params = jQuery.extend(true,[],this.paramsQuery);
								if(this.currentPage < this.totalPage){
									params.push("currentPage="+this.totalPage);
									this._ajaxLoad(params,function(){
										grid.currentPage = grid.totalPage;
									});
								}else{
									if (this.totalPage > 0){
										showPromptMsg('red',$.sdcui.resource.i18n['C_LastPage']);
									}
								}
								return false;
							}
						},
						
						/**
						 * 通过列模型生成表头
						 */
						_buildHeaderHtml : function() {
							var htmls = [];
							htmls.push(_buildHeaderFromColModels(
									this.colModels, this.colspans,
									this.maxGroupLevel));
							return htmls.join('');
						},
						
						/**
						 * 表内容 hzg 2012-2-8 update
						 */
						_buildContentHtml : function() {
							var htmls = [];
							htmls.push(_buildContentFromColModels(
									this.colModels, this.colspans,
									this.maxGroupLevel));
							return htmls.join('');
							
							//return '<div class="grid-content"></div>';
						},
						
						/**
						 * 表脚 翻页
						 */
						_buildFooterHtml : function() {
							var footer = '';
							var id = this.element.attr("id");
							if(this.options.enableCutPage){
								footer = '<div class="grid-footer">'
								if(this.options.hotkey=='grid1'){//定制grid翻页快捷键
									footer = footer
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pageFirst' + id,
												caption : $.sdcui.resource.grid1['pageFirst']
											})
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pagePrev' + id,
												caption : $.sdcui.resource.grid1['pagePrev']
											})
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pageNext' + id,
												caption : $.sdcui.resource.grid1['pageNext']
											})
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pageLast' + id,
												caption : $.sdcui.resource.grid1['pageLast']
											})
											+ '<span class="pagestat"></span></div>';
								}else{
									footer = footer
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pageFirst' + id,
												caption : $.sdcui.resource.grid['pageFirst']
											})
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pagePrev' + id,
												caption : $.sdcui.resource.grid['pagePrev']
											})
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pageNext' + id,
												caption : $.sdcui.resource.grid['pageNext']
											})
									+ $.sdcui.buttonUtils
											.buildButtonHtml({
												name : 'pageLast' + id,
												caption : $.sdcui.resource.grid['pageLast']
											})
											+ '<span class="pagestat"></span></div>';
								}
							}
							return footer;
						},


						/**
						 * 组件事件
						 */
						_initAction : function() {
							var op = this.options;
							this.element.addClass('tabFocus');
							this.element.bind('tab.focus',function(event,/*prev(上一个元素)或next(下一个元素)*/options){
								//获取以前的焦点所在行
								var focusElem = options.elem;
								if(focusElem.is('tr')){ 
									if(!focusElem.hasClass('selected')){   	//当前行选中
										$(this).addClass('focusd');
										var tBody = focusElem.parent();
										var srcTr = $(tBody).find(".selected");
										if (srcTr.length > 0){
											$(srcTr[0]).removeClass('selected');
										}
										focusElem.addClass('selected');
										changeTdOutputStyle(event,op,focusElem); //生成input或者取消input
										var inputField = focusElem.find('input[type=text]:first');
										if(inputField.length){
											inputField.addClass($.sdcui.resource.keyboardFocusClass);
											focusElem.removeClass($.sdcui.resource.keyboardFocusClass);
											$(inputField[0]).focus(); //设置input元素聚焦
											$(inputField[0]).select();
										}
									} else {
										//找出表格的上一个元素为焦点元素
										focusElem.removeClass('selected');
										if (!$(this).hasClass('focusd')){
											$(this).addClass('focusd');
											focusElem.addClass('selected');
											changeTdOutputStyle(event,op,focusElem); //生成input或者取消input
											var inputField = focusElem.find('input[type=text]:first');
											if(inputField.length){
												inputField.addClass($.sdcui.resource.keyboardFocusClass);
												focusElem.removeClass($.sdcui.resource.keyboardFocusClass);
												$(inputField[0]).focus(); //设置input元素聚焦
												$(inputField[0]).select();
											}
										} else {
											var currentElem = focusElem.prev();
											if (focusElem[0].id == currentElem[0].id) {
												$(this).addClass('focusd');
												currentElem.addClass('selected');
												changeTdOutputStyle(event,op,currentElem); //生成input或者取消input
												var inputField = currentElem.find('input[type=text]:first');
												if(inputField.length){
													inputField.addClass($.sdcui.resource.keyboardFocusClass);
													currentElem.removeClass($.sdcui.resource.keyboardFocusClass);
													$(inputField[0]).focus(); //设置input元素聚焦
													$(inputField[0]).select();
												}									
											} else {
												//找出表格的上一个元素为焦点元素
												var inputField = currentElem.find('input[type=text]:first');
												if(inputField.length){
													inputField.removeClass($.sdcui.resource.keyboardFocusClass);
												}
												currentElem.removeClass($.sdcui.resource.keyboardFocusClass);
												$(this).removeClass('focusd');
												$(document).keyboardsupport('prev');
											}
										}
									}

									//如果类型是鼠标点击
									if(options.type == 'mousedown'){
										var inputField = options.curElem.find('input[type=text]');
										if(inputField.length){
											inputField.addClass($.sdcui.resource.keyboardFocusClass);
											trElem.removeClass($.sdcui.resource.keyboardFocusClass);
											$(inputField[0]).focus(); //设置input元素聚焦
											$(inputField[0]).select();
										}
									}									
								}
							}).bind('tab.blurs',function(event,/*焦点元素*/options){
								var blurElem = options.elem;
								var type = options.type;
								var lastInput;
								var firstInput
								var blurElemTr = null;
								if(blurElem.is('tr')){ //无编辑列
									blurElemTr = blurElem ;
									blurElemTr.removeClass('selected');
								}else if(blurElem.is('input')){
									blurElemTr = blurElem.parents('tr');
									lastInput =  blurElemTr.find('input[type=text]:last').get(0);
									firstInput = blurElemTr.find('input[type=text]:first').get(0);
									if((type == 'next' && blurElem[0] == lastInput)){
										blurElemTr.removeClass('selected');
										changeTdOutputStyle(event,op,blurElemTr);	
									}
									if(type == 'prev' && blurElem[0] == firstInput){
										blurElemTr.removeClass('selected');
										changeTdOutputStyle(event,op,blurElemTr);
									}
									if(type == 'mousedown'){
										blurElemTr.removeClass('selected');
										changeTdOutputStyle(event,op,blurElemTr);
									}
								}		
								if (blurElemTr.next().length < 1){
									$(this).removeClass('focusd');
								}
								blurElemTr.addClass('selected');
							});
							
//							//行动作
//							var cols = this.cols;
//							var idKeys = this.options.idKeys;
//							var editModel = this.options.editModel;
//							var fixedCount = this.fixedCount;
//							var clickRowEvent = this.options.clickRowEvent; 
//							var afterSelectRowEvent = this.options.afterSelectRowEvent;
//							var gridContent = this.element.find('>.grid-content').bind('click',{widgetId:this.options.id},function(event){
//								var target = event.target;
//								//寻找样式为row 的 tr节点
//								var clickRowTr = findRowTr(target);
//
//								var closeEditor = true;
//								if(clickRowTr!=null){
									//changeCell();
//									var record = _getRowRecord(clickRowTr, cols, idKeys); 
//									var _rowIndex = $(clickRowTr).prevAll('.row').length + 1; 
//									if (clickRowEvent) {
//										changeCell();
//										clickRowEvent.call(clickRowTr, record, _rowIndex);
//									}
//									if ($('#'+event.data.widgetId).grid('select',clickRowTr,event.ctrlKey)){
//										//单元格动作
//										var cell = $(event.target);
//										if(cell.is('td') && cell.parents("div .grid-fixed").length <= 0){ 
//											var index = cell.prevAll().length+fixedCount;
//											if (cell.parent('tr.row-new').length > 0 || (idKeys.indexOf(cols[index].property) < 0 ) 
//													&& (editModel)) {
//												var editorOptions = $.extend({
//													name:cols[index].editor
//													,rowIndex:_rowIndex
//													,colIndex:index+1
//													,record:record
//												},cols[index],{initHtml:true},cols[index].editorOptions);
//												if(editorOptions.editor){
//													delete editorOptions.width;
//													delete editorOptions.editorOptions;
//													$(this).trigger('editor.open',[cell,editorOptions]);
//													closeEditor = false;
//												}								
//											}
//											if (afterSelectRowEvent){
//												afterSelectRowEvent.call(this,clickRowTr);
//											} 
//										}
//									} 
//								}
//								if(closeEditor&&$.sdcui.editor){//&&this.options.editable
//									$(this).editor('close');//关闭表格编辑
//								}
//							});
//							
//							if($.sdcui.editor){//&&this.options.editable
//								gridContent.editor();//初始化表格编辑
//							}
//							
//							function changeCell(){
//								
//							}
//							
//							function findRowTr(dom){
//								if(!dom)return null;
//								var tr;
//								var parentDom = dom;
//								while(parentDom){
//									if($(parentDom).is('tr.grid-row')){
//										tr = parentDom;
//										break;
//									}
//									parentDom = parentDom.parentNode;
//								}
//								return tr;
//							}
						},
						
						/**
						 * 加载初始化数据
						 */
						_initRecords : function() {
							if (this.options.autofill == true) {// 模拟数据
								this._parseRecords($.sdcui.recordUtils.buildRecords(this.colModels,this.options.pageSize));
							} else if (this.options.records) {// 从参数中加载数据
								this._parseRecords(this.options.records);
							}
						},
						
						/**
						 * 解析数据
						 */
						_parseRecords : function(records) {
							// 数据写入grid-content中
							var htmls = [];
							var options = {
								colModels : this.colModels,
								keyFields : this.options.keyFields //keyFields:['uth'],//主键
							};// 参数
							//判断更改当前页
							var totalCount = records.result.total;
							var pageIndex = records.result.currentPage;
							var pageSize = this.options.pageSize;
							var pageCount = Math.ceil(totalCount / pageSize);
							if (pageCount < pageIndex){
								pageIndex = pageCount;
								records.result.currentPage = pageCount;
							}
							//写内容
							htmls.push('<table width="100%" cellspacing="1" cellpadding="0" class="grid-table">');
							// 生成控制行
							htmls.push('<tr>');
							htmls.push(this.element.find('>.grid-header tr:first').html());
							htmls.push('</tr>');

							// sdc.ui.core.js
							htmls.push($.sdcui.dataParser.parseRecords(records,
									function(rowIndex, record, options) { //主要调用此方法
										return _buildRowHtml(rowIndex, record,
												options);
									}, options, this.options.enableCutPage == true ? this.options.pageSize : records.result.total));
							htmls.push('</table>');
							this.element.find('>.grid-content').html(
									htmls.join(''));
							// 写分页信息
							if(!pageIndex){
								if(totalCount>0){
									pageIndex = 1;
								}else{
									pageIndex = 0;
								}								
							} else {
								if (totalCount == 0){
									pageIndex = 0;
								}
							}
							this.totalPage = pageCount;
							var r1 = (pageIndex - 1) * pageSize + 1, r2 = pageIndex * pageSize;
							if (r2 > totalCount)
								r2 = totalCount;
							var stat = $.sdcui.resource.grid.PAGESTAT([
									pageIndex, pageCount, totalCount ]);
							this.element.find('>.grid-footer .pagestat').html(
									stat);
						},

						/**
						 * 初始化是否改变组建
						 */
						_initIsChangedModel : function() {
							 this.colModels.push({
								property : 'isValueChanged',
								caption : '',
								align : 'center',
								captions : [ '' ],
								width : 0
							});
						},
						
						/**
						 * 初始化复选框组建
						 */
						_initCheckboxModel : function() {
							this.options.showCheckbox && this.colModels.push({
								property : 'checkbox',
								caption : '',
								align : 'center',
								renderer:this.options.showCheckboxRenderer,
								captions : [ '' ],
								width : 25
							});
						},
						
						/**
						 * 初始化序号组建
						 */
						_initNumModel : function() {
							this.options.showNum && this.colModels.push({
								property : 'num',
								caption : $.sdcui.resource.grid['num'],// num:'序号',
								captions : [ $.sdcui.resource.grid['num'] ],
								width : 25
							});
						},

						
						/**
						 */
						_ajaxLoad : function(params ,success) {
							params = params || [];
							params.push("pageSize=" + this.options.pageSize);
							this.options.params = params;
							//ajax请求
							var grid = this;
							ajaxRequest(params, this.options.src, function(results){
								if (showPromptRequestMsg(results)){
									//操作成功
									if(!results.result.parameter.list || results.result.parameter.list==""){
										results.result.parameter.list=[];
									}
									var records = grid.getRecords(results.result);
									grid._parseRecords(records);
									//grid中数据加载完后获取焦点
									if (results.result.parameter.list.length > 0){
										grid.focus();
								 	}
									grid = null;
									if(success){
										success(results);
									}
									return true;
								}else{
									//操作失败
									results.result.parameter.list=[];
									var records = grid.getRecords(results.result);
									grid._parseRecords(records);
									grid = null;
									return false;
								}
							});
						},
						
						/**
						 * ajax数据整体提交
						 */
						_ajaxSubmit : function(params, rebulid, success) {
							//ajax提交数据
							var grid = this;
							ajaxRequest(params, this.options.submitSrc, function(results){
								if (showPromptRequestMsg(results)){
									if(rebulid && rebulid == true){
										//操作成功
										if(!results.result.parameter.list || results.result.parameter.list==""){
											results.result.parameter.list=[];
										}
										var records = grid.getRecords(results.result);
										grid._parseRecords(records);
										grid = null;
									}
									//回调函数
									if(success){
										success(results);
									}
									 return true;
								}else{
									if(rebulid && rebulid == true){
										//操作失败
										results.result.parameter.list=[];
										var records = grid.getRecords(results.result);
										grid._parseRecords(records);
										grid = null;
									}
									return false;
								}
							});
						},
						
						load : function(params ,success) {
							this._ajaxLoad(params , success);
						},
						
						validate : function(){
							return _validateEditRow(this.options);
						},
						
						submit : function(params, rebulid, success) {
							//验证数据
							if (!_validateEditRow(this.options)){
								return false;
							}
							//获取数据集
							var records = this.getValueChangedAll();
							params.push(records);
							//提交数据
							this._ajaxSubmit(params, rebulid, success);
						},
						
						parseRecords:function(records){
							this._parseRecords(records);
						},
						
						/**
						 * 清空表结果
						 */
						clearRecords:function(){
							this.currentPage = 1;
							this.paramsQuery = null;
							var records={'result':{'total':0,'rows':[]}};
							this._parseRecords(records);
						},
						
						parseResult:function(results){
							var currResult;
							if (results.result){
								currResult = results.result;
							} else {
								currResult = results;
							}
							if (showPromptRequestMsg(currResult)){
								//操作成功
								if(!currResult.parameter.list || currResult.parameter.list==""){
									currResult.parameter.list=[];
								}
								var records = this.getRecords(currResult);
								this._parseRecords(records);
								return true;
							}else{
								//操作失败
								currResult.parameter.list=[];
								var records = this.getRecords(currResult);
								this._parseRecords(records);
								return false;
							}
						},
						
						/*
						 * 粘贴数据
						 */
						parseRecord : function(results){
							var currResult;
							if (results.result){
								currResult = results.result;
							} else {
								currResult = results;
							}
							//操作成功
							if(!currResult.parameter.list || currResult.parameter.list==""){
								currResult.parameter.list=[];
							}
							var records = this.getRecords(currResult);
							this._parseRecords(records);
						},
						
						/*
						 * 替换选中行的数据
						 */
						parseResultRow : function(record){
							//获取选中行
							var trRow = $('tr.grid-row.selected');
							//获取tr中的td
							for ( var i = 0; i < this.colModels.length; i++) {
								//获取值
								var tdValue = "";
								var colModel = this.colModels[i];
								if (colModel.bind){
						        	tdValue = getPropertyValue(record, colModel.bind);
						        }else{
						        	tdValue = getPropertyValue(record, colModel.property); //record[colModel.property]
						        }
						        if (!tdValue && colModel.defValue){
						        	tdValue = colModel.defValue;
						        }
								if (tdValue){
									if(colModel.internation){
										tdValue=$.sdcui.resource.i18n[tdValue];
									}
								}
								//更改值
								$(trRow).find('td.'+ colModel.property).text(tdValue);
							}
							//修改tr的ID
							var keyValues = [];
							if (this.options.keyFields) {
								for ( var i = 0; i < this.options.keyFields.length; i++) {
									keyValues.push(getPropertyValue(record, this.options.keyFields[i])); //return value = record[property];
								}
							}
							if (keyValues.length) {
								rowId = keyValues.join();
							} else {
								rowId = 'row_' + rowIndex;
							}
							$(trRow).attr('id',rowId)
						},
						
						/**
						 * 获取grdi记录格式
						 */
						getRecords : function(currResult) {
							currResult.total_page = currResult.total_page?currResult.total_page:0;
							currResult.currentPage = currResult.currentPage?currResult.currentPage:1;
							var records = {
								result : {
									total : currResult.total_page < 1 ? currResult.parameter.list.length : currResult.total_page,
									rows : currResult.parameter.list,
									currentPage : currResult.parameter.currentPage
								}
							};
							return records
						},
						
						/**
						 * 获取选中行的数据
						 */
						getSelectedRecord : function() {
							var row = this.element.find('.grid-row.'
									+ $.sdcui.resource.keyboardFocusClass
									+ ':first');
							if (!row.length)
								return null;
							var record = {};

							var rowId = row.attr('id');
							var keyValues = rowId.split(',');

							if (this.options.keyFields) {
								for ( var i = 0; i < this.options.keyFields.length; i++) {
									record[this.options.keyFields[i]] = keyValues[i];
								}
							}
							var colModels = this.colModels;
							row.find('td.cell').each(function(index) {
								var value = this.getAttribute('value');
								if (value) {
									record[colModels[index].property] = value;
								}
							});
							return record;
						},
						
						/**
						 * 增加行
						 */
						addRow : function(record) {
							var options = {
								colModels : this.colModels,
								keyFields : this.options.keyFields
							};
							//设置当前行ID
							var rowIndex = this.element
									.find('.grid-content tr.grid-row').length;
							rowIndex =	(this.currentPage-1) * this.options.pageSize + rowIndex;
							
							this.element.find('.grid-content tbody').append(
									_buildRowHtml(rowIndex, record || {},
											options));
						},
						
						/**
						 * 删除行
						 */
						deleteRow : function(rowId) {
							var tabedRow;
							if (rowId) {
								tabedRow = this.element.find('tr#' + rowId
										+ '.grid-row');
							} else {
								tabedRow = this.element
										.find('tr.grid-row.field-tabed');
							}

							if (tabedRow.length) {
								var nextRow = tabedRow.next();
								tabedRow.remove();
								nextRow.addClass('field-tabed');
							}
						},
						
						/**
						 * 删除行
						 */
						deleteRowByValue : function(value) {
							var tabedRows = this.element.find('tr#.grid-row');
							for (i=0; i<tabedRows.length; i++){
								var currId = tabedRows[i].id+",";
								if (currId.indexOf(value+",") != -1){
									var currRow = $(tabedRows[i])
									var nextRow = currRow.next();
									currRow.remove();
									nextRow.addClass('field-tabed');
								}
							}
						},
						
                        /**
                         * 删除勾选的行
                         */
						deleteCheckBoxedRow : function (){
							var selRows = this.element.find('tr.grid-row:has(input[type=checkbox]:checked)')
							if (selRows.length<1){
								return false;
							} else {
								for(var i=0;i<selRows.length;i++){
									var nextRow = $(selRows[i]).next();
									$(selRows[i]).remove();
									nextRow.addClass('field-tabed');
								}
							}
						},
						
						/**
						 * 删除选中行
						 */
						deleteSelectedRow : function() {
							var currRow = this.element.find('tr.grid-row.selected');
							if (currRow.length > 0) {
								//获取当前行
								var currNum = parseInt(currRow.find('.num').html());
								var currentClass ;               //当前行样式
								var oldClass ;                   //基数行样式
								var evenClass ;                  //偶数行样式
								//获取下一行
								var nextRow = currRow.next();   //下一行
								if(nextRow.length > 0){
									//获取当前行样式
									if(currRow.hasClass('selected')){
										currRow.removeClass('selected')
									}
									if(currRow.hasClass('ed')){
										currRow.removeClass('ed')
									}
									currentClass = currRow.attr("class"); 
									//获取基数行或偶数行样式
									if (currNum % 2 == 1){
										oldClass = currentClass;
										evenClass = nextRow.attr("class");
									} else {
										oldClass = nextRow.attr("class");
										evenClass = currentClass ;
									}
									//循环改变样式和序号
									while (nextRow.length > 0){
										//设置序号
										nextRow.find('.num').html(currNum)
										//设置样式
										if (currNum % 2 == 1){
											nextRow.attr("class",oldClass)
										} else {
											nextRow.attr("class",evenClass)
										}
										currNum = currNum + 1;
										nextRow = nextRow.next();
									}
								}
								//设置下一行样式的选中状态
								currRow.next().addClass('selected');
								currRow.next().addClass('ed')
								//删除当前行
								currRow.remove();
							}
						},
						
						/**
						 * 全选或全选取消
						 */
						selectedAll : function() {
							if(this.element.find('tr.grid-row :input[type=checkbox]').length){
								var foucsElem = this.element.find(".selected");
								if(foucsElem.is('input')){
									foucsElem = foucsElem.parents('tr');
								}
								var selectedCount = this.element
									.find('tr.grid-row input:checked').length;
								if(selectedCount == this.element.find('tr.grid-row').length){
									this.element.find('tr.grid-row').removeClass('checked');
									$("#" +this.options.id + " :checkbox").attr('checked','');
								}else{
									this.element.find('tr.grid-row').addClass('checked');
									$("#" +this.options.id + " :checkbox").attr('checked','checked');
								}
							}
							
						},
						
						/**
						 * 选中单行或取消
						 */
						selected : function() {
							if(this.element.find('tr.grid-row :input[type=checkbox]').length){
								var foucsElem = this.element.find(".selected");
								if(foucsElem.is('input')){
									foucsElem = foucsElem.parents('tr');
								}
								if(foucsElem.find('input:checked').length){
									if(this.options.checkedOnlyOne){
										$("#" +this.options.id + " tr").removeClass('checked');
										$("#" +this.options.id + " :checkbox").attr('checked','');
									}
									foucsElem.removeClass('checked');
									foucsElem.find(':input[type=checkbox]').attr('checked','');
								}else{
									if(this.options.checkedOnlyOne){
										$("#" +this.options.id + " tr").removeClass('checked');
										$("#" +this.options.id + " :checkbox").attr('checked','');
									}
									foucsElem.addClass('checked');
									foucsElem.find(':input[type=checkbox]').attr('checked','checked');
								}
							}
						},
						
						/**
						 * 获取选择行
						 */
						getSelected : function(flag) {
							var record = {};
							var count = 0;
							var tabedRow = this.element
									.find('tr.grid-row.selected');
							if(!flag){
								return tabedRow;
							}
							if (tabedRow.length) {
								return _getRecordFromRow(tabedRow, this.options,count++);
							}
							return record;
						},
						
						/**
						 * 获取指定num的行
						 */
						getSelectedByRowNum:function(num){
							var count = 0;
							var tds = this.element.find('.num');
							var td = null;
							if(tds.length){
								for(var i = 0 ; i < tds.length ; i++){
									if($(tds[i]).text() == num){
										td = tds[i];
										break;
									}
								}
							}
							if ($(td).length < 1){
								return $(td)
							} else {
								var tr = $(td).parent();
								return _getRecordFromRow(tr, this.options,count++);
							}
						},
	
						/**
						 * 获取全部选中的行
						 */
						getSelectedAll : function() {
							var records = [];
							var options = this.options;
							var count = 0;
							this.element
									.find('tr.grid-row:has(input[type=checkbox]:checked)')
									.each(function(){records = records.concat(_getRecordFromRow(
														$(this), options,count++));
											});
							return records;
						},
						
						/**
						 * 获取行数据改变的集合（列名）
						 */
						getValueChangedAll : function() {
							var records = [];
							var options = this.options;
							var count = 0;
							this.element
									.find('tr.grid-row:has(input[id=isValueChanged]&&input[value=true])')
									.each(function(){records = records.concat(_getRecordFromRow(
														$(this), options,count++));
											});
							return records;
						},
						
						/**
						 * 获取指定的列（列名）
						 */
						getSelectedColumnValue : function(columnName) {
							var records = [];
							var options = this.options;
							var count = 0;
							this.element
									.find('tr.grid-row:has(input[type=checkbox]:checked)')
									.each(function(){
											var idStr = $(this).attr('id');
											var idArray = idStr.split(',');
											for ( var i = 0; i < options.keyFields.length; i++) {
												if (options.keyFields[i]==columnName){
													records.push(idArray[i]);
												}
											}
											});
							return records;
						},
						
						/**
						 * 获取指定的列（列名）数据集合
						 */
						getColumnValue : function(columnName) {
							var records = [];
							var options = this.options;
							var count = 0;
							this.element
									.find('tr.grid-row')
									.each(function(){
											var idStr = $(this).attr('id');
											var idArray = idStr.split(',');
											for ( var i = 0; i < options.keyFields.length; i++) {
												if (idArray[i]&&options.keyFields[i]==columnName){
													records.push(idArray[i]);
												}
											}
											});
							return records;
						},
						
						/**
						 * 获取全部行
						 */
						getRecordAll : function() {
							var records = [];
							var options = this.options;
							var count = 0;
							this.element
									.find('tr.grid-row')
									.each(function(){records = records.concat(_getRecordFromRow(
														$(this), options,count++));
											});
							return records;
						},
						
						/**
						 * 聚焦
						 */
						focus:function(){
							var ctrList = $(document).find("."+$.sdcui.resource.keyboardClass);
							for(var i=0; i<ctrList.length; i++){
								if ($(ctrList[i]).hasClass($.sdcui.resource.keyboardFocusClass)){
									if ($(ctrList[i]).is('tr')){
										var parentCtr = $(ctrList[i]).parents('.tabFocus:first');
										if (parentCtr[0].id==this.element[0].id){
											break;
										}						
									} 
									$(document).keyboardsupport("next");						
								}
							}
						},
						
						/**
						 * 注销
						 */
						destroy : function() {
							$.Widget.prototype.destroy.apply(this, arguments);
						}
					});
/**********************************************************************************************************************/
//以下为静态方法	
	function _getRecordFromRow(rowElement, options,count) {
		var record = [];
		var idStr = rowElement.attr('id');
		var idArray = idStr.split(',');
		for ( var i = 0; i < options.keyFields.length; i++) {
			if (idArray[i]){
			//	record[options.keyFields[i]] = idArray[i];
				record.push('list['+ count + '].' + options.keyFields[i] +'='+ idArray[i]);
			//	record[options.keyFields[i]] = $(rowElement).find("."+ options.keyFields[i]).html();
			} else {
				record.push('list['+ count + '].' + options.keyFields[i] + '=');
			}
		}
		return record;
	}

	/**
	 *  构建tr
	 */
	function _buildRowHtml(rowIndex, record, options) {
		var htmls = [];
		var styles = [ 'grid-row' ];//设置表格行样式
		styles.push($.sdcui.resource.keyboardClass); //field-tab
		// grid-row field-tab even
		styles.push(rowIndex % 2 == 1 ? 'old' : 'even');
		var rowId;

		var keyValues = [];
		//判断是否设置主键
		if (options.keyFields) {
			for ( var i = 0; i < options.keyFields.length; i++) {
				keyValues.push(getPropertyValue(record, options.keyFields[i])); //return value = record[property];
			}
		}
		if (keyValues.length) {
			rowId = keyValues.join();
		} else {
			rowId = 'row_' + rowIndex;
		}
		// 生成tr
		htmls.push('<tr id="' + rowId + '" class="');
		htmls.push(styles.join(' '));
		htmls.push('"');

		htmls.push('>');

		for ( var i = 0; i < options.colModels.length; i++) {
			htmls.push(_buildCellHtml(rowIndex, record, options.colModels[i],i));
		}

		htmls.push('</tr>');

		return htmls.join('');
	}
	
	/**
	 *  构建td
	 */
	function _buildCellHtml(rowIndex, record, colModel,colIndex) {
		var htmls = [], tdValue;
        if (colModel.bind){
        	tdValue = getPropertyValue(record, colModel.bind);
        }else{
        	tdValue = getPropertyValue(record, colModel.property); //record[colModel.property]
        }
        if (!tdValue && colModel.defValue){
        	tdValue = colModel.defValue;
        }
        
		//<td class="cell blh fieldText" value="BL00394">BL00394</td>
		var cellStyles = [ 'cell' ];
		cellStyles.push(colModel.property);
		var property = [];
		//validate setting
		if(colModel.dataType){
			property.push("dataType ='" +colModel.dataType +"'");
		}
		if(colModel.biaos){
			property.push("biaos ='" +colModel.biaos +"'");
		}
		if(colModel.isPlus){
			property.push("isPlus =" +colModel.isPlus +"");
		}
		if(colModel.notNull){
			property.push("notNull ='" +colModel.notNull +"'");
		}
		if(colModel.caption){
			property.push("caption ='" +colModel.caption +"'");
		}
		if(colModel.limitedLength){
			property.push("limitedLength ='" +colModel.limitedLength +"'");
		}
		if(colModel.maxLength){
			property.push("maxLength ='" +colModel.maxLength +"'");
		}
		if(colModel.currentwarehouse){
			property.push("currentwarehouse ='" +colModel.currentwarehouse +"'");
		}
		if(colModel.checkchange){
			property.push("checkchange ='" +colModel.checkchange +"'");
		}
		if(colModel.bind){
			property.push("bind ='" +colModel.bind +"'");
		}
		if (colModel.editor)
			cellStyles.push(colModel.editor);
		htmls.push('<td class="' + cellStyles.join(' ') +  ' " '+ property.join(' '));
		htmls.push(' style="width:' + (colModel.width) + 'px;" ');
		if (colModel.align){
			htmls.push(' align="' + colModel.align + '" ');
		}
		if (tdValue){
			if(colModel.internation){
				tdValue=$.sdcui.resource.i18n[tdValue];
			}
		}
		htmls.push(' value="' + tdValue + '" ');
		htmls.push('>');
		htmls.push(_buildCellContentHtml(rowIndex, tdValue, record, colModel,colIndex));
		htmls.push('</td>');
		return htmls.join('');
	};
	
	
	/**
	 * 根据列模型集合生成表头html
	 * @param colModels
	 * @returns
	 */
	function _buildHeaderFromColModels(colModels, colspans, maxGroupLevel,
			headerHeight) {
		var htmls = [];

		htmls
				.push('<div class="grid-header"><table width="100%" cellspacing="1" cellpadding="0" class="grid-table">');
		// 宽度控制辅助行
		htmls.push('<tr>');
		for ( var col = 0; col < colModels.length; col++) {
			htmls.push('<td ');
			htmls.push(' style="width:' + (colModels[col].width) + 'px;" ');
			htmls.push('></td>');

		}
		htmls.push('</tr>');

		for ( var row = 0; row < maxGroupLevel; row++) {
			htmls.push('<tr>');
			for ( var col = 0; col < colModels.length; col++) {
				htmls.push(_buildHeaderCellHtml(colModels[col], row, col,
						colspans, maxGroupLevel, headerHeight));
			}
			htmls.push('</tr>');
		}
		htmls.push('</table></div>');

		return htmls.join('');
	}
	;
	
	
	/**
	 * hzg 2012-2-8 create
	 * 根据列模型集合生成表头html
	 * @param colModels
	 * @returns
	 */
	function _buildContentFromColModels(colModels, colspans, maxGroupLevel,
			headerHeight) {
		var htmls = [];

		htmls
				.push('<div class="grid-content"><table width="100%" cellspacing="1" cellpadding="0" class="grid-table">');
		// 宽度控制辅助行
		htmls.push('<tr>');
		for ( var col = 0; col < colModels.length; col++) {
			htmls.push('<td ');
			htmls.push(' style="width:' + (colModels[col].width) + 'px;" ');
			htmls.push('></td>');
		}
		htmls.push('</tr>');
	
		htmls.push('</table></div>');

		return htmls.join('');
	};
	
	
	/**
	 * 表头单元格内容
	 */
	function _buildHeaderCellHtml(colModel, row, col, colspans, maxGroupLevel,
			headerHeight) {
		var htmls = [];
		var cellCaptions = colModel.captions || [];
		htmls.push('<td class="hcell" ');
		if (maxGroupLevel == 1) {
			htmls.push(' style="height:' + (headerHeight || 25) + 'px" ');
		} else if (row == cellCaptions.length - 1) {// 表头单元格合并处理-行合并
			htmls.push(' rowspan="' + (maxGroupLevel - cellCaptions.length + 1)
					+ '" ');
		} else if (row >= cellCaptions.length) {// 隐藏行合并的空白单元格
			htmls.push(' style="display:none;" ');
		} else {// 表头单元格合并处理-列合并
			if (colspans[col] && colspans[col].rowIndex == row + 1) {
				htmls.push(' colspan="' + colspans[col].colspan + '"');
			} else {
				htmls.push(' style="display:none;" ');
			}
		}
		htmls.push('>');
		if(colModel.property == "checkbox"){
			//htmls.push('<input type="checkbox"></input>');
		}else{
			htmls.push(cellCaptions[row] || '');
		}
		htmls.push('</td>');
		return htmls.join('');
	}
	;

	
	/**
	 * 生成单元格里面的值
	 */
	function _buildCellContentHtml(rowIndex, tdValue, record, colModel,colIndex) {
		var htmls = [];
		var tdHtml = '';
		  //自定义渲染
		var renderer = colModel.renderer;
		if (renderer) {  
			if (typeof renderer === "function") {
				tdHtml = renderer.call(colModel,record,tdValue,rowIndex,colIndex); 
			} 
		} else {
			if (colModel.property == 'checkbox') {
			//	tdHtml = '<span class="ui-icon"></span>';
				tdHtml = '<input type="checkbox"></input>';
			} else if (colModel.property == 'num') {
				tdHtml = (rowIndex + 1);
			} else if (colModel.property == 'isValueChanged') {
				tdHtml = '<input id="isValueChanged" name="isValueChanged" type="Hidden" value=false></input>';
			}
			//else if (colModel.editor =='fieldText') {
			 //	tdHtml = '<input type="text" value="' + tdValue + '" class="field-tab" "></input>'
			 //}  
			else {
				tdHtml = tdValue;
			}
		} 
		htmls.push(tdHtml);
		return htmls.join('');
	}
	;

	/**
	 * 通过属性从记录集中得到相应的值
	 * @returns value = record[property]
	 */
	function getPropertyValue(record, property) {
		if (!property||!record)
			return;
		var value;
		var properties = property.split('.');
		// alert(properties);
		if (properties.length > 1) {// 处理多级属性
			value = record;
			for ( var i = 0; i < properties.length; i++) {
				value = value[properties[i]];
				if (!value)
					return;
			}
		} else {
			value = record[property];
		}
		return value;
	}
	;
	
	/**
	 * 验证行数据
	 */
	function _validateEditRow(options) {
		var srcTr = $(document).find(".ed");
		if (srcTr.length > 0 ){
			var itds = srcTr.find('.fieldText');
			var itdsName = [];
			for(var i = 0 ; i < itds.length ; i++){
				itdsName.push($(itds[i]).attr('class').split(' ')[1]);
			}
			itdsName = itdsName.join(' ');//edit input id
			var idStr = srcTr.attr('id');
			var idArray = idStr.split(',');//original values of keyFields
			//numbers of keyFields is more than idArray
			for ( var i = 0; i < options.keyFields.length; i++) {
				//hidden item or not
				if(itdsName.indexOf(options.keyFields[i]) != -1){
					var editField = srcTr.find('td.'+options.keyFields[i]);
					var editInput = srcTr.find('.'+options.keyFields[i]+' :input');
					var editValue = editInput.val();
					//构造验证的option
					var tdOption = {};
					
					if(editField.attr('dataType')){
						tdOption['dataType'] = editField.attr('dataType');
					}
					if(editField.attr('isPlus')){
						tdOption['isPlus'] = editField.attr('isPlus');
					}
					if(editField.attr('notNull')){
						tdOption['notNull'] = editField.attr('notNull');
					}
					if(editField.attr('caption')){
						tdOption['caption'] = editField.attr('caption');
					}
					if(editField.attr('limitedLength')){
						tdOption['limitedLength'] = editField.attr('limitedLength');
					}
					if(editField.attr('maxLength')){
						tdOption['maxLength'] = editField.attr('maxLength');
					}
					if(editField.attr('currentwarehouse')){
						tdOption['currentwarehouse'] = editField.attr('currentwarehouse');
					}
					
					$(editInput).removeClass('validate-error');
					//validate gridInput
					if(!validateInput(editValue,tdOption,editInput)){
						$(editInput).removeClass('validate-success').addClass('validate-error');
						$(editInput).focus();
						return false;
					}
					//us号未变更不能冻结原包装
					if(editField.attr('checkchange')){
						var colname = editField.attr('checkchange');
						var oldvalue = srcTr.find('td.'+colname).attr("value");
						var newvalue = srcTr.find('.'+colname+' :input').val();
						if (oldvalue == newvalue && editValue == 'Y'){
							showMsg($.sdcui.resource.i18n['C_F_CHECKUSCHANGE']);
							//showPromptMsg('red',$.sdcui.resource.i18n['C_ConnError']);
							$(editInput).removeClass('validate-success').addClass('validate-error');
							$(editInput).focus();
							return false;
						}
					}
					$(editInput).removeClass('validate-error').addClass('validate-success');
					//验证成功后失去焦点
					if (document.activeElement==$(editInput)[0]){
						for(var j=0;j<options.cols.length;j++){
							if (options.cols[j].property == options.keyFields[i]){
								if (options.cols[j].onblur){
									$(editInput).blur();
								}
								break;
							}
						}
					}
				}
			}
		}
		return true;
	}
	;
	
	/**
	 * 改变TD中的输出样式: 值或输入框
	 * @param event:当鼠标按下后的响应事件对象
	 */
	function changeTdOutputStyle(event,options,focusElememnt){
		//获取焦点元素
		//var focusElememnt = $('.'+ $.sdcui.resource.keyboardFocusClass);
		if(focusElememnt.is('tr')){
			var trRow = focusElememnt;
			var tbody = focusElememnt.parent();
			var srcTr = $(tbody).find(".ed");
			if(srcTr.length){
				if(!options.editSubmitSrc){
					//验证编辑行，当验证失败时，不让更改
					if (_validateEditRow(options)){
						//重新设置行值
						resetRowValue(options,focusElememnt);
					} 
				}
				srcTr.removeClass('ed');
				srcTr.removeClass('selected');
				tds =  $(srcTr).find('.fieldText');
				for(var i = 0 ; i < tds.length ; i++){
					if ($(tds[i]).attr("value") != "undefined"){
						//还原值
						$(tds[i]).text($(tds[i]).attr("value"));
					} else {
						$(tds[i]).text('');
					}
				}
			}
			
			if ($(trRow).hasClass('selected')){
				var tds = $(trRow).find('.fieldText');
				if(tds.length){
					trRow.addClass('ed');
					for(var i = 0 ; i < tds.length ; i++){
						var value = '';
						if ($(tds[i]).attr("value") != "undefined"){
							value = $(tds[i]).attr("value");
						}
						var content = '<input name="col'+i+'" type="text" value="'+value+'" ';
						if(options.editSubmitSrc && $(tds[i]).attr("biaos") != "notsubmit"){
							content += 'style="width:86%"/>';
							content += "<Span style='font-size:18px;font-weight:bold'>&crarr;</Span>";
						} else {
							content += 'style="width:96%"/>';
						}
						$(tds[i]).html(content);
						$(tds[i]).find(":input").addClass("field-tab");
						//row submit
						
						$(tds[i]).find(":input").bind("keyup",function(event){
							//小写转大写
							var eCode = event.keyCode ? event.keyCode : event.which;
							if (eCode>=65 && eCode<=90) {
								$(this).val($(this).val().toUpperCase());  
							}
							//回车请求
							if(event.keyCode == 13 && $(event.target).parent().attr("biaos") != "notsubmit" ){
								//清空提示信息
								msgClear();
								//为控件添加外部事件
								for(var i=0; i<options.cols.length; i++){
									if (options.cols[i].onenter){
										var currClass = $(event.target.offsetParent).attr("class");
										if (currClass.indexOf("cell "+ options.cols[i].property+" fieldText") != -1){
											var isReturn = eval(options.cols[i].onenter);
											if (isReturn == false){
												return;
											} else {
												break;
											}
										}
									}
								}
								//验证编辑行，当验证失败时，不让提交
								if (!_validateEditRow(options)){
									return;
								}
								//判断是否单行提交
								var srcTr = $(tbody).find(".ed");
								if(options.editSubmitSrc){
									//获取列表参数
									var itds = srcTr.find('.fieldText');
									var itdsName = [];
									for(var i = 0 ; i < itds.length ; i++){
										itdsName.push($(itds[i]).attr('class').split(' ')[1]);
									}
									itdsName = itdsName.join(' ');//edit input id
									var record = [];
									var idStr = srcTr.attr('id');
									var idArray = idStr.split(',');//original values of keyFields
									//numbers of keyFields is more than idArray
									for ( var i = 0; i < options.keyFields.length; i++) {
										//hidden item or not
										if(itdsName.indexOf(options.keyFields[i]) == -1){
											record.push(options.keyFields[i] +'='+ idArray[i]);
										}
										else{
											var editField = srcTr.find('td.'+options.keyFields[i]);
										    //需要传原值时当该值为undefined时 改为“”  xh  20131030
											var editFieldValue ="";
											if("undefined" == editField.attr("value")){
												
											  }else{
											  editFieldValue = editField.attr("value");
											  }
											var editInput = srcTr.find('.'+options.keyFields[i]+' :input');
											var editValue = editInput.val();
											//需要传原值
											if(editField.attr('bind')){
												record.push(editField.attr('bind') +'='+ editFieldValue);
											}
											//修改值
											record.push(options.keyFields[i] +'='+ editValue);
										}
									}
									if(options.params && options.params.length > 0){
										record = record.concat(options.params);
									}
									//单行提交数据
									ajaxRequest(record, options.editSubmitSrc, function(results){
										if (showPromptRequestMsg(results)){
											 //重新设置行值
											resetRowValue(options,focusElememnt);
									 		//提交完后调用函数
											var trId = $(focusElememnt).attr('id');
									 		for(var i=0; i<options.cols.length; i++){
												if (options.cols[i].afterenter){
													eval(options.cols[i].afterenter + "("+ JSON.stringify(results) +",'"+trId.toString()+"')");
													break;
												}
											}
									 		//获取下一行
									 		$(document).keyboardsupport("next");
									 		return true;
										 }else{
											return false;
										 }
									});
								} else {
									//获取下一行
							 		$(document).keyboardsupport("next");
								} 
							}
						});
					}
					//为控件添加外部事件
					for(var i=0;i<options.cols.length;i++){
						if (options.cols[i].onblur){
							var propertiy = options.cols[i].property;
							$(trRow).find('td.'+propertiy+' input').bind("blur",options.cols[i].onblur);
							break;
						}
					}
				}
			}
		}else{
			var srcTr = $(tbody).find(".ed");
			tds =  $(srcTr).find('.fieldText');			
			srcTr.removeClass('ed');
			for(var i = 0 ; i < tds.length ; i++){
				if ($(tds[i]).attr("value") != "undefined"){
					$(tds[i]).text($(tds[i]).attr("value"));
				} else {
					$(tds[i]).text('');
				}
				$(tds[i]).removeClass("field-tab");
			}
		}
	}
	/*
	 * 重新设置行值
	 */
	function resetRowValue(options,focusElememnt) {
		var tds = $(focusElememnt).find('.fieldText');
		for(var i = 0 ; i < tds.length ; i++){
			if ($(tds[i]).text()!=$(tds[i]).find("input").val()){
 				$(focusElememnt).find("#isValueChanged").val(true);
 			 }
			$(tds[i]).attr("value",$(tds[i]).find("input").val());
		}
		//修改tr的ID
		var trId = $(focusElememnt).attr('id').split(",");
		for(var j=0;j<options.keyFields.length;j++){
			var propertiy = options.keyFields[j];
			for(var k = 0 ; k < tds.length ; k++){
				if ($(tds[k]).attr("class").indexOf("cell "+propertiy)!=-1){
					trId[j] = $(tds[k]).attr("value");
					break;
				}
			}
		}
		$(focusElememnt).attr('id',trId.toString());
	}
	
	function bind(fun){
		this.element.bind('keydown',fun);
	}
})(jQuery);