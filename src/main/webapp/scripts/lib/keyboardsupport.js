/*!
 * SDC UI JavaScript Library v1.0.0
 * http://jquery.com/
 *
 * Copyright 2011, The isoftstone company
 * Dual licensed under the MIT or GPL Version 2 licenses.
 */
(function( $, undefined ) {
	/**
	 * keyboardsupport组件
	 * @author  
	 * @version 1.0.0
	 * @date 2011-07-20
	 * Depends: 
	 * 	jquery.js,  //使用1.4，jquery 1.6以上的还存在问题，event 的处理模式不一样，导致多次执行回调函数
	 *  jquery.hotkeys-0.7.9.js,
	 *  jquery.ui.core.js
	 *  sdc.ui.core.js
	 */
//	var _keyboardClass = 'keyboard-event';//元素样式
//	var _keyboardSelector = 'keyboard-event';//元素选择器
//	var _keyboardFocusClass = 'keyboard-event-focus';//聚焦的样式
//	var _keyboardFocusSelector = 'keyboard-event-focus';//聚焦元素选择器
	
	var _keyboardClass = $.sdcui.resource.keyboardClass;//'field-tab';//元素样式
	var _keyboardSelector = '.'+$.sdcui.resource.keyboardClass;//元素选择器
	var _keyboardFocusClass = $.sdcui.resource.keyboardFocusClass;//'field-tabed'//聚焦的样式
	var _keyboardFocusSelector = '.'+$.sdcui.resource.keyboardFocusClass;//聚焦元素选择器
	
	
	$.widget("sdcui.keyboardsupport", {
		tabIndexIds:[],//根据tabIndex排序的dom元素的ID集合
		/**
		 * 默认参数
		 */
		options: {
			
		},
		/**
		 * 初始化
		 */
		_create: function() {
			this._defaultHtmls();
			this._initAction();
			this.buildTabIndexs();
			_focus(this.element.find(_keyboardSelector+':first'));
			window.onhelp = function(){return false;};
		},
		/**
		 * 组织js生成的html
		 */
		_defaultHtmls:function(){
			//if(this.options.initHtml!==false){
				//
			//}
		},
		/**
		 * 组件事件
		 */
		_initAction:function(){
			//prev
			this.element
			.bind('keydown','left',function(event){//左键动作
				//skip input text
				if(!isFirstCursortPosition(event.target)){
					return;
				}
				_hasKeyboardClass(event.target)&&$(this).keyboardsupport('prev');
				return false;
			}).bind('keydown','right',function(event){//右键动作
				//skip input text
				if(!isLastCursortPosition(event.target)){
					return;
				}
				_hasKeyboardClass(event.target)&&$(this).keyboardsupport('next');
				return false;
			}).bind('keydown','down',function(event){//down动作
				_hasKeyboardClass(event.target)&&
				//	event.target.tagName.toUpperCase()!=='SELECT'&&
					$(this).keyboardsupport('down');
				return false;
			}).bind('keydown','up',function(event){//up动作
				_hasKeyboardClass(event.target)&&
				//	event.target.tagName.toUpperCase()!=='SELECT'&&
					$(this).keyboardsupport('up');
				return false;
			}).bind('keydown','tab',function(event){//tab键动作
				//$(this).keyboardsupport('tabIndex');
				/*if(!isLastCursortPosition(event.target)){
					return;
				}*/
				_hasKeyboardClass(event.target)&&$(this).keyboardsupport('next');
				return false;
			}).bind('keydown','return',function(event){//enter键动作
			//	$(this).keyboardsupport('tabIndex');
				if (st_BiaoQH != ""){
					return;
				}
				if ($(event.target).parent().hasClass("tabFocus")){
					$(event.target).parents('.tabFocus:first').trigger('enter');
				} else {
					if ($(event.target).is('input')){
						$(event.target).trigger('enter');
					} else {
						var ctr ;
						$(event.target).find(_keyboardSelector).each(function(i,n){
							if ($(n).is('input') && $(n).hasClass("field-tabed")){
								ctr = $(n);
								return;
							}
						});
						$(ctr).trigger('enter');
					}
				}
				return false;
			}).bind('keydown','shift+tab',function(event){//shift + tab 动作
				//$(this).keyboardsupport('tabIndex',true);
				/*if(!isFirstCursortPosition(event.target)){
					return;
				}*/
				_hasKeyboardClass(event.target)&&$(this).keyboardsupport('prev');
				return false;
			}).bind('keydown','shift+return',function(event){//shift + return 动作
				$(this).keyboardsupport('tabIndex',true);
				return false;
			}).bind('keydown','home',function(event){//home键动作		
				$(this).keyboardsupport('keyButtonClick','Home')
				return false;
			}).bind('keydown','end',function(event){//end键动作
				$(this).keyboardsupport('keyButtonClick','End')
				return false;
			}).bind('keydown','F1',function(event){//绑定F1事件
				$(this).keyboardsupport('keyButtonClick','F1')
				return false;
			}).bind('keydown','F2',function(event){//绑定F2事件
				$(this).keyboardsupport('keyButtonClick','F2')
				return false;	
			}).bind('keydown','F3',function(event){//绑定F3事件
				$(this).keyboardsupport('keyButtonClick','F3')
				return false;		
			}).bind('keydown','F4',function(event){//绑定F4事件
				$(this).keyboardsupport('keyButtonClick','F4')
				return false;	
			}).bind('keydown','F5',function(event){//绑定F5事件
				$(this).keyboardsupport('keyButtonClick','F5')
				return false;	
			}).bind('keydown','F6',function(event){//绑定F6事件
				$(this).keyboardsupport('keyButtonClick','F6')				
				return false;	
			}).bind('keydown','F7',function(event){//绑定F7事件
				$(this).keyboardsupport('keyButtonClick','F7')			
				return false;	
			}).bind('keydown','F8',function(event){//绑定F8事件
				$(this).keyboardsupport('keyButtonClick','F8')				
				return false;	
			}).bind('keydown','F9',function(event){//绑定F9事件
				$(this).keyboardsupport('keyButtonClick','F9')	
				return false;	
			}).bind('keydown','F10',function(event){//绑定F10事件
				$(this).keyboardsupport('keyButtonClick','F10')				
				return false;	
			}).bind('keydown','F11',function(event){//绑定F11事件
				$(this).keyboardsupport('keyButtonClick','F11')				
				return false;	
			}).bind('keydown','F12',function(event){//绑定F12事件
				$(this).keyboardsupport('keyButtonClick','F12')
				return false;
			
			}).bind('mousedown',function(event){//绑定鼠标按下动作
				//2012-5-16 注释 yu
				/*var className = event.target.className+" ";//var eventClass = className?className.split(' ')[0]:'';
				if(className.indexOf(_keyboardClass+" ")!=-1){
					$(_keyboardFocusSelector,this).removeClass(_keyboardFocusClass);
					$(event.target).addClass(_keyboardFocusClass);
				}*/
				
				//2012-5-16 新增grid的鼠标操作 yu
				var className = event.target.className+" ";
				var prvElem = $(_keyboardFocusSelector,this);
				var curElem = $(event.target);
				
				if(prvElem.is('tr') ||
						( !(curElem.is('input') && curElem.parents('tr') && curElem.parents('tr').hasClass('grid-row'))
						&& prvElem.parents('tr') && prvElem.parents('tr').hasClass('grid-row'))){
					prvElem.removeClass(_keyboardFocusClass).blur();
					//触发tab.blurs事件,将焦点元素传入该方法
					_getFocusContainer(prvElem).trigger('tab.blurs',{elem:prvElem,type:'mousedown'});
				}else{
					var prvField = prvElem;
					var curField = curElem;
					if (prvElem.is('input')){
						prvField = prvElem.parent()
					}
					if (curElem.is('input')){
						curField = curElem.parent()
					}
					var prvFieldtype = prvField.attr("fieldtype")
					var curFieldtype = curField.attr("fieldtype")
					if ($(curField).attr("id").indexOf("pop_")==0){
						return false;
					}
					if (prvFieldtype=="fieldSelect" && prvFieldtype != curFieldtype){
						if (prvField.attr("id") != curField.attr("id")){
							_getFocusContainer(prvField).trigger('tab.blurs',{elem:prvField});
							if (!curElem.is('input')){
								$(curField).find('input.textInput').addClass(_keyboardFocusClass);
								_getFocusContainer(curField).trigger('tab.focus',{elem:curField});
								prvElem.removeClass(_keyboardFocusClass);
								$(curField).find('input.textInput').focus();
								//$(curField).find('input.textInput').select();
								return false;
							}
						}
					} else if (curFieldtype=="fieldSelect"){
						if (!curElem.is('input')){
							if (prvField.attr("id") != curField.attr("id")){
								$(curField).find('input.textInput').addClass(_keyboardFocusClass);
								_getFocusContainer(curField).trigger('tab.focus',{elem:curField});
								prvElem.removeClass(_keyboardFocusClass);
							}
							$(curField).find('input.textInput').focus();
							//$(curField).find('input.textInput').select();
							return false;
						}
					}
					//移除样式
					prvElem.removeClass(_keyboardFocusClass);
				}
								
				if(className.indexOf(_keyboardClass+" ")!=-1){
					curElem.addClass(_keyboardFocusClass);
				}				
				if(className.indexOf("cell ")!=-1 && curElem.is('td') && curElem.parent().is('tr')){
					//添加元素焦点样式 field-tabed
					curElem.parent().addClass(_keyboardFocusClass).focus();
					_getFocusContainer(curElem.parent()).trigger('tab.focus',{elem:curElem.parent()});
					//_focus(curElem.parent());
					return false;
				}
			});
			
			//屏蔽IE按键键
			$(document).bind("keydown", function (domEven) {
                var eCode = domEven.keyCode ? domEven.keyCode : domEven.which;               
                if (eCode == 112 || eCode == 113 || eCode == 114 || eCode == 115 ||  
                	eCode == 116 || eCode == 117 || eCode == 118 || eCode == 119 || 
                	eCode == 120 || eCode == 121 || eCode == 122 || eCode == 123 ) { 
                	//屏蔽F1，F2，F3，F4，F5，F6，F7，F8，F9，F10，F11，F12键
                	if (eCode == 112 && domEven.ctrlKey==true){
                		$("#pageId").fieldText("focus");
                	}
                    if (window.event) {
                        event.keyCode = 0;
                        event.returnValue = false;
                    } else {
                    	domEven.preventDefault();
                    }
                } else if (eCode == 8){         //屏蔽退格删除键 
					var ctr = domEven.target;
					if(!$(ctr).is('input') || $(ctr).attr("readonly") || $(ctr).attr("disabled")){
						var isFocus = false;
						$(ctr).find(_keyboardSelector).each(function(i,n){
							if (!isFocus && $(n).is('input') && $(n).hasClass("field-tabed")){
								isFocus = true;
								return;
							}
						}); 
						//判断是否获取焦点
						if (isFocus == false){
							if (window.event) {
		                        event.keyCode = 0;
		                        event.returnValue = false;
		                    } else {
		                    	domEven.preventDefault();
		                    }
						}
					}
			 	}
              if("115" == st_PageId || "218" == st_PageId || "219" == st_PageId){ 
              }else{
                //键盘扫描控制
                if (eCode == 16){
			 		st_timeStamp = domEven.timeStamp;
                } else if (eCode != 13){
                	if (domEven.timeStamp - st_timeStamp < 50){
            			if (st_BiaoQH != "" || eCode != 51){
                			st_BiaoQH = st_BiaoQH + String.fromCharCode(eCode)
                		}
                    	st_timeStamp = domEven.timeStamp;
	                	if (window.event) {
	                        event.keyCode = 0;
	                        event.returnValue = false;
	                    } else {
	                    	domEven.preventDefault();
	                    }
                    } else {
                    	if (st_BiaoQH.indexOf("å")==-1){
                    		st_BiaoQH = "";
                    	}
                    }
                }
			 	if (eCode == 13){
			 		if (st_BiaoQH != ""){		 			
			 			if (st_BiaoQH.indexOf("å")>-1){
			 				st_BiaoQH = "";
			 				$(domEven.target).val(st_BiaoQH);	
			 				showMsg($.sdcui.resource.i18n['C_ScanError']);
			 				return;
			 			}
			 			//如果扫描的是快捷键盘，自动触发相关事件
			 			if (st_BiaoQH.substr(0,1)=='F' && st_BiaoQH.length<=3){
			 				$(this).keyboardsupport('keyButtonClick',st_BiaoQH)
			 				return;
			 			}
		 				//移除样式
			 			$(domEven.target).removeClass(_keyboardFocusClass);
			 			//覆值
			 			var ctr
			 			var sTitm = st_BiaoQH.substr(0,1);
						var sGzm = st_BiaoQH.substr(1,2);
						if(sTitm=='A'){
							//UA号
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='uah1']");
							}
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='B'){//备货单号
							ctr = $("[fieldType='fieldText']").find("[datatype='beihdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-3)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(3));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='Y'){
							if (sGzm=='LT' || sGzm=='BT' || sGzm=='CD' || sGzm=='C0' || sGzm=='RI'
									|| sGzm=='RP' || sGzm=='KI' || sGzm=='KP'
									|| sGzm=='DB' || sGzm=='YC' || sGzm=='UC'){
								if (sGzm=='LT' || sGzm=='BT'){ //包装单元卡号
									if(!ctr || ctr.length < 1){
										ctr = $("[fieldType='fieldText']").find("[datatype='baozdykh']");
									}
									if (!ctr || ctr.length < 1){
										ctr = $("[fieldType='fieldText']").find("[datatype='baozdyk']");
									}
								}
								//UCH号		
								if (!ctr || ctr.length < 1){
									ctr = $("[fieldType='fieldText']").find("[datatype='uch']");
								}
								//UCH1号		
								if (!ctr || ctr.length < 1){
									ctr = $("[fieldType='fieldText']").find("[datatype='uch1']");
								}
								//UCH2号		
								if (!ctr || ctr.length < 1){
									ctr = $("[fieldType='fieldText']").find("[datatype='uch2']");
								}
								//UCUS号
								if (!ctr || ctr.length < 1){
									ctr = $("[fieldType='fieldText']").find("[datatype='ucush']");
								}
							} 
							//非同步要货令
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='yaohlhnt']");
							}
							//要货令号
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='yaohlh']");
							}
							//UA号
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='uah']");
							}
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-3)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(3));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='Z' && sGzm=='LT'){//指导包装单元卡装箱单号
							ctr = $("[fieldType='fieldText']").find("[datatype='zhidbzdykzxdh']");
							if(!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='baozdykh']");
							}
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='baozdyk']");
							}
							//UCH号		
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='uch']");
							}
							//UCH1号		
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='uch1']");
							}
							//UCH2号		
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='uch2']");
							}
							//UCUS号
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='ucush']");
							}
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-3)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(3));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='J'){//质检技术报告单号
							ctr = $("[fieldType='fieldText']").find("[datatype='zhijjsbgdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='Q'){//质检清单号
							ctr = $("[fieldType='fieldText']").find("[datatype='zhijqdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='F'){//返修单号
							ctr = $("[fieldType='fieldText']").find("[datatype='fanxdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='T'){//到货单号
							ctr = $("[fieldType='fieldText']").find("[datatype='daohdh']");
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='uth']");
							}
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));	
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='R'){//拒收跟踪单号
							ctr = $("[fieldType='fieldText']").find("[datatype='jusgzdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='X'){//拒收单
							ctr = $("[fieldType='fieldText']").find("[datatype='jusdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='S'){//US号
							ctr = $("[fieldType='fieldText']").find("[datatype='ush']");
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='ucush']");
							}
							/**
							 * 2013-6-3修改
							 * MantisBT  7094
							 * 或者是343看板要货令号
							 */
							if (!ctr || ctr.length < 1){
								ctr = $("[fieldType='fieldText']").find("[datatype='yaohlhnt']");
							}
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='G'){//质检跟踪单号
							ctr = $("[fieldType='fieldText']").find("[datatype='zhijgzdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='E'){//改包装跟踪单号
							ctr = $("[fieldType='fieldText']").find("[datatype='gaibzgzdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}else if(sTitm=='D'){//调拨单号		
							ctr = $("[fieldType='fieldText']").find("[datatype='diaobdh']");
							if (ctr && ctr.length>0){
								var maxLen = ctr.attr("maxlength");
								if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length-1)){
									$(ctr).parent().fieldText("focus");
									$(ctr).val(st_BiaoQH.substr(1));
									$(ctr).trigger('enter');
								}
							}
						}
						if (!ctr || ctr.length < 1){
							var maxLen = $(domEven.target).attr("maxlength");
							if (!maxLen || (maxLen&&maxLen>=st_BiaoQH.length)){
								$(domEven.target).val(st_BiaoQH);	
								$(domEven.target).trigger('enter');
							}
						}
						//清空值
						st_BiaoQH = "";
			 		}
			 	}
			 }
            });
			
			$(document).bind("keyup", function (domEven) {
				var eCode = domEven.keyCode ? domEven.keyCode : domEven.which;
				var curElem = $(domEven.target);
				if ( (eCode>=48 && eCode<=57) || (eCode>=65 && eCode<=90)
						 || (eCode>=96 && eCode<=122)){
					if(curElem.is('input') && curElem.attr("maxlength")==curElem.attr("value").length){
						if (curElem.attr("biaos") != "enter"){
							if (curElem.attr("dataType")=="date" || curElem.attr("dataType")=="datetime"){
								var currValue = curElem.val();
								if (currValue.indexOf("_") == -1){
									_hasKeyboardClass(domEven.target)&&$(this).keyboardsupport('next');
								}
							} else {
								_hasKeyboardClass(domEven.target)&&$(this).keyboardsupport('next');
							}
						}
					}
			 	}
				//if (eCode !=16 && eCode != 13 && st_BiaoQH.indexOf("å")>-1){
				//	st_BiaoQH =  st_BiaoQH.substr(0,st_BiaoQH.length-1)+String.fromCharCode(eCode);
				//}
			});
			
			//添加按钮事件
			this._bindClickToButtons();
			//屏蔽鼠标右键以及属性键 
			/*$(document).bind("contextmenu", function (domEven) {
				return false;
			});*/
		},

		_bindClickToButtons : function() {
			//为界面添加title
			if ($(document).find("#title").length > 0){
				var title = $(document).attr("title");
			    var titleAll = $('#title').html();
			    if (titleAll == ""){
				    titleAll = title;
			    }  
			    $('#title').html("<span style='text-align:center; width:15%;'>" + st_UserName + "&nbsp;&nbsp;&nbsp;"+ st_Cangkbh + "&nbsp;&nbsp;&nbsp;"+ st_Rongqcbh + "</span>" +
			    				"<span style='text-align:center; width:85%; font-size:18px; display:inline-block;'>"+ titleAll +"</span>") 
			}
			//添加消息显示
			if ($(document).find("#prompt").length > 0){
				var promptValue = $('#prompt').html();
				$('#prompt').attr("style","border: 1pt solid silver; padding: 5px; text-align: left;");
				$('#prompt').html(promptValue+":&nbsp;&nbsp;&nbsp;<span style='font-weight: bolder;'></span>")
			}
			//绑定按钮事件
			var buttons = $(document).find(".ui-button");
			for(var i=0; i<buttons.length; i++){
				//绑定F11按钮的事件（返回上一页或刷新当前页）
				if($(buttons[i]).text().indexOf('[F11]')>0){		
					if (!$(buttons[i]).data("events") || !$(buttons[i]).data("events")["click"]){
						$(buttons[i]).click( 
							function(){
								//为文本绑定失去焦点事件
								var uiForm = $(document).find(".ui-fieldLayout");
								for(var i=0;i<uiForm.length;i++){
									//判断form是否有刷新标示
									if($(uiForm[i]).attr("onreload")){
										//查找所有的input，判断值是否有改变
										var fieldElement = $(uiForm[i]).find('.ui-field');
										for(var j=0;j<fieldElement.length;j++){
											if ($(fieldElement[j]).find('input').length>0 && !$(fieldElement[j]).find('input').is(":hidden")){
												var defaultValue = $(fieldElement[j]).find('input').attr('defaultValue');
												var currentValue = $(fieldElement[j]).fieldValue();
												if (!defaultValue){
													if (currentValue.length > 0){
														st_BackCount = 0;
													}
												} else {
													if (defaultValue != currentValue){
														st_BackCount = 0;
													}
												}
											}
										}
									}
								}
								//判断界面是刷新还是回退
								if (st_BackCount == 0){
									//重新加载当前页面
									var serachKey = $(document).find('input#serachKey');
									if(serachKey.length > 0){
										$(serachKey).val('');
									}
									//获取url,重新拼装参数
									window.location.replace(window.location.href.split("?")[0]+ st_Params);
								} else if (st_BackCount == 1){
									//当父页面是主页面刷新，否则回退
									var url = window.location.href.split("?")[0].split("/");
									if (url[url.length-1].split(".")[0] == st_FistPage){
										//获取url,重新拼装参数
										window.location.replace(window.location.href.split("?")[0]+ st_Params);
									} else {
										//返回上一页面
										history.go("-"+st_BackCount);
									}
								} else {
									history.go("-"+st_BackCount);
								}
							}
						);
					}
				}
				//绑定F12返回主菜单按钮
				if($(buttons[i]).text().indexOf('[F12]')>0){		
					if (!$(buttons[i]).data("events") || !$(buttons[i]).data("events")["click"]){
						$(buttons[i]).click( 
							function(){
								window.location.href = "../index_ck.jsp" + st_Params;
							}
						);
					}
				}
			}
		},
		
		_getTabedIndexClass:function(prefix){
			var tabedElement = this._getTabedElement();
			
			var classSplits = tabedElement[0].className.split(' ');
			var colClass;
			for(var i=0;i<classSplits.length;i++){
				if(classSplits[i].indexOf(prefix)===0){
					colClass = classSplits[i];
					break;
				}
			}
			return colClass;
		},
		
		_getTabedElement:function(){
			var tabedElement = this.element.find(_keyboardFocusSelector);
			if(tabedElement.length==0){
				tabedElement = this.element.find(_keyboardSelector+':first');
			}
			return tabedElement;
		},
		
		getTabedColClass:function(){
			return this._getTabedIndexClass('tab-col-');
		},
		/**
		 * 定位到下一个field
		 */
		next:function(){
			var nextElement = null;
			var ctrList = this.element.find(_keyboardSelector);
			if (ctrList.length <= 1){
				if (ctrList.length == 1){
					nextElement = $(ctrList[0]);
				} else {
					return;
				}
			} else {
				//查找下一个定位的元素  // _keyboardSelector : .field-tab
				for(var i=0; i<ctrList.length ;i++){
					if ($(ctrList[i]).hasClass(_keyboardFocusClass)){
						if(i == ctrList.length-1){
							//找到第一个可用的控件
							for(var j=0; j<ctrList.length ;j++){
								if (_domEnable(ctrList[j])){
									nextElement = $(ctrList[j]);
									break;
								}							
							}
						} else {
							for(var j=i+1; j<ctrList.length ;j++){
								if (_domEnable($(ctrList[j]))){
									nextElement = $(ctrList[j]);
									break;
								}
							}
						}
						//去除焦点元素的焦点样式，并使其失去焦点
						$(ctrList[i]).removeClass(_keyboardFocusClass).blur();
						_getFocusContainer($(ctrList[i])).trigger('tab.blurs',{elem:$(ctrList[i]),type:'next'});
						break;
					}
				}
			}
			nextElement=nextElement?nextElement:this.element.find(_keyboardSelector+':first');
			if(nextElement){
				_focus(nextElement);
				nextElement.select();
			}
		},
		/**
		 * 定位到上一个field
		 */
		prev:function(){
			var prevElement = null; //上一个元素
			var ctrList = this.element.find(_keyboardSelector);
			if (ctrList.length <= 1){
				if (ctrList.length == 1){
					prevElement = $(ctrList[0]);
				} else {
					return;
				}
			} else {
				//查找上一个元数
				for(var i=0; i<ctrList.length ;i++){
					if ($(ctrList[i]).hasClass(_keyboardFocusClass)){
						if(i == 0){
							//找到最后一个可用的控件
							for(var j=ctrList.length-1; j>=0 ;j--){
								if (_domEnable(ctrList[j])){
									prevElement = $(ctrList[j]);
									break;
								}
							}
						} else {
							var isFind = false;
							for(var j=i-1; j>=0 ;j--){
								if($(ctrList[i-1]).find("."+_keyboardFocusClass).length>0){
									prevElement = $(ctrList[j-1]);
								} else {
									prevElement = $(ctrList[j]);
								}
								if (_domEnable(prevElement)){
									isFind = true;
									break;
								}
							}
							//往下搜索
							if (isFind == false){
								for(var j=ctrList.length-1; j>i ;j--){
									if (_domEnable($(ctrList[j]))){
										prevElement = $(ctrList[j]);
										break;
									}
								}
							}
						}
						//去除焦点元素的焦点样式，并使其失去焦点
						$(ctrList[i]).removeClass(_keyboardFocusClass).blur();
						_getFocusContainer($(ctrList[i])).trigger('tab.blurs',{elem:$(ctrList[i]),type:'prev'});
						break;
					}
				}
			}
			prevElement=prevElement?prevElement:this.element.find(_keyboardSelector+':first');
			if(prevElement){
				_focus(prevElement);
				prevElement.select();
			}
		},
		
		/**
		 * 同列下定位
		 */
		down:function(){
			this.next();
		},
		/**
		 * 同列上定位
		 */
		up:function(){
			this.prev();
		},
		
		/**
		 * tab键定位
		 */
		tabIndex:function(shiftKey){
			if(shiftKey==true){
				//reverse()
				var reverseTabIndex = [];
				for(var i=this.tabIndexIds.length;i>0;i--){
					reverseTabIndex.push(this.tabIndexIds[i-1]);
				}
				this._tabIndex(reverseTabIndex,true);
			}else{
				this._tabIndex(this.tabIndexIds);
			}
			
		},
		
		first:function(){
			this.element.find(_keyboardFocusSelector).removeClass(_keyboardFocusClass);
			_focus(this.element.find(_keyboardSelector+':first'));
		},
		
		last:function(){
			this.element.find(_keyboardFocusSelector).removeClass(_keyboardFocusClass);
			_focus(this.element.find(_keyboardSelector+':last'));
		},
		
		_tabIndex:function(tabIndexIds,shiftKey){
			var tabElement = this._getTabedElement();
			var tabId = tabElement.attr('id');
			//TODO shiftKey为true时 支持shift+tab
			//最后一个元素
			if(shiftKey!=true&&tabId===_getSortTabId(this.tabIndexIds[tabIndexIds.length-1])){
				_focus(this.element.find('#'+_getSortTabId(tabIndexIds[0])));
			}else{
				for(var i=0;i<this.tabIndexIds.length-1;i++){
					var sortedTabId = _getSortTabId(tabIndexIds[i]);
					if(sortedTabId===tabId){
						_focus(this.element.find('#'+_getSortTabId(tabIndexIds[i+1])));
						break;
					}
				}
			}
			tabElement.removeClass(_keyboardFocusClass);
		},
		/**
		 * 创建tabIndex序列元素
		 */
		buildTabIndexs:function(){
			var tabIndexs = [];
			var containerSelector = '.'+$.sdcui.resource.keyboardContainerClass; //keyboard-container
			this.element.find(containerSelector).each(function(){
				var containerTabIndexs = [];
				$(_keyboardSelector,this).each(function(index){
					var tabIndex = this.getAttribute('tabindex')||0;
					var tabId = this.getAttribute('id');
					if(tabId){
						containerTabIndexs.push(_getSortStr(tabIndex)+_getSortStr(index)+'_'+tabId);
					}
				});
				containerTabIndexs.sort();
				tabIndexs = tabIndexs.concat(containerTabIndexs);
			});
			this.tabIndexIds = tabIndexs;
		},
		
		/*
		 * 按键触发按钮点击事件
		 */
		keyButtonClick : function(keyName) {
			var buttons = $(document).find(".ui-button");
			for(var i=0; i<buttons.length; i++){
				if($(buttons[i]).text().indexOf('['+ keyName +']')>0){
					if ($(buttons[i]).is(":hidden") == false && buttons[i].style.display != "none"){
						$(buttons[i]).click();
						break;
					}
				}
			}
		},
		
		/**
		 * 注销
		 */
		destroy: function() {
			$.Widget.prototype.destroy.apply(this,arguments);
		}
	});
	
	/**
	 * next(nextElement)
	 * prev(prevElement)
	 * 
	 * @param tabElement 下一个元素或上一个元素
	 */
	function _focus(tabElement){
		//添加元素焦点样式 field-tabed
		tabElement.addClass(_keyboardFocusClass).focus();
		_getFocusContainer(tabElement).trigger('tab.focus',{elem:tabElement});
		//lastTabed.length&&lastTabed.removeClass(_keyboardFocusClass);
	}
	
	/*
	 * 判断对象是否可以使用
	 */
	function _domEnable(dom){
		//当前控件
		if (!$(dom).is(":visible")||$(dom).is(":disabled")
				||$(dom).attr("readonly")){
			return false;
		}
		//父控件
		var parentCtr = _getFocusContainer($(dom))
		if (!$(parentCtr).is(":visible")||$(parentCtr).is(":disabled")
				||$(parentCtr).attr("readonly")){
			return false;
		}
		return true;
	}

	/**
	 * 聚焦元素绑定事件的容器
	 */
	function _getFocusContainer(tabElement){
		if(tabElement.hasClass('tabFocus')){
			return tabElement;
		}
		return tabElement.parents('.tabFocus:first');
	}

	function _hasKeyboardClass(target){
		if(target.tagName.toUpperCase()){
			return true;
		}
		
		var className = target.className;
		if(className&&className.indexOf(_keyboardClass)!==-1){
			return true;
		}
		return false;
	}
	
	function _getSortStr(index){
		return index>10?index:'0'+index;
	}
	//
	function _getSortTabId(tabIndexId){
		if(!tabIndexId)return;
		var splitIndex = tabIndexId.indexOf('_');
		return tabIndexId.substring(splitIndex+1);
	}
	
	/**
	 * 光标位置在最后
	 */
    function isLastCursortPosition (inputDoc) {
    	var tagName = inputDoc.tagName.toUpperCase();
//    	if(tagName!=='INPUT'||tagName!=='TEXTAREA'){//input 和 textarea
//    		return true;
//    	}
    	//if(tagName!=='TEXTAREA')return true;
    	if($(inputDoc).attr('type')!=='text')return true;
    	var caretPos = 0;	// IE Support
    	if (document.selection) {
    		inputDoc.focus ();
    		var selCtr = document.selection.createRange();
    		if (selCtr.text.length>0 && selCtr.text.length == inputDoc.value.length){
    			var caretPos = inputDoc.value.length - 1;
    			selCtr.moveStart ('character', -caretPos);
    		} else {
    			selCtr.moveStart ('character', -inputDoc.value.length);
    			caretPos = selCtr.text.length;
    		}
    	}
    	// Firefox support
    	else if (inputDoc.selectionStart || inputDoc.selectionStart == '0'){
    		if (inputDoc.selectionEnd && inputDoc.selectionEnd > inputDoc.selectionStart){
    			caretPos = inputDoc.selectionStart;
    			inputDoc.selectionEnd = inputDoc.selectionEnd - 1;
    		} else {
    			caretPos = inputDoc.selectionStart;
    		}
    	}
    	return (caretPos===$(inputDoc).val().length);
    }
    
    /**
	 * 光标位置在最前
	 */
    function isFirstCursortPosition (inputDoc) {
    	var tagName = inputDoc.tagName.toUpperCase();
//    	if(tagName==='INPUT'||tagName==='TEXTAREA'){//input 和 textarea
//    		return true;
//    	}
    	if($(inputDoc).attr('type')!=='text')return true;
    	var caretPos = 0;	// IE Support
    	if (document.selection) {
    		inputDoc.focus ();
    		var selCtr = document.selection.createRange();
    		if (selCtr.text.length>0 && selCtr.text.length == inputDoc.value.length){
    			selCtr.moveStart ('character', -inputDoc.value.length);
    			var caretPos = inputDoc.value.length;
    		} else {
    			selCtr.moveStart ('character', -inputDoc.value.length);
    			caretPos = selCtr.text.length;
    		}
    	}
    	// Firefox support
    	else if (inputDoc.selectionStart || inputDoc.selectionStart == '0'){
    		if (inputDoc.selectionEnd && inputDoc.selectionEnd > inputDoc.selectionStart){
    			caretPos = inputDoc.selectionEnd;
    			inputDoc.selectionEnd = inputDoc.selectionStart + 1 ;
    		} else {
    			caretPos = inputDoc.selectionStart;
    		}
    	}
    	return (caretPos===0);
    }
})(jQuery);