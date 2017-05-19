/**
 * 
 */
(function($,undefined) {
	
	/**
	 * field工具
	 */
	$.sdcui.fieldUtils = {
		/**
		 * 从dom元素中读取field实例
		 * @param fieldElement field对应的dom元素
		 */
		getInstance:function(fieldElement){
			var element = $(fieldElement);
			if(element&&element.is('.youi-field')){
				var instance = $.data(element[0], element.attr('fieldType'));
				return instance;
			}
			return null;
		},
		/**
		 * 执行field的dom元素的实例方法
		 * @param fieldElement field对应的dom元素
		 * @param methodName   方法名称
		 */
		execMethod:function(fieldElement,methodName){
			if(fieldElement===null||methodName===null||typeof methodName != 'string'){
				return;
			}
			var instance = $.sdcui.fieldUtils.getInstance(fieldElement);
			if(instance!==null&&instance._init&&instance[methodName]){
				var args = Array.prototype.slice.call(arguments, 2);
				instance[methodName].apply(instance,args);//执行方法
			}
		},
		/**
		 * 根据property和prefix查找field的dom元素
		 * @param property field组件的标识
		 * @param prefix   field组件前缀
		 */
		getElementByProperty:function(property,prefix){
			var id = $.sdcui.fieldUtils.getFieldId(property,prefix);
			return $.sdcui.fieldUtils.getElementById(id);
		},
		
		getElementById:function(id){
			return $(document.getElementById(id));
		},
		/**
		 * 得到field的id
		 */
		getFieldId:function(property,prefix){
			prefix = prefix?prefix:'field';
			var id = prefix+'_'+property.replace(/\./g,'_');
			return id;
		}
	};
	
	
	$.extend(jQuery.fn, {
		fieldValue:function(value,text){
			var instance = $.sdcui.fieldUtils.getInstance(this);
			if(instance){
				if(arguments.length==0){
					return instance.getValue();
				}else{
					instance.setValue(value,text);
				}
			}
			return null;
		},
		
		fieldDefaultValue:function(value){
			var instance = $.sdcui.fieldUtils.getInstance(this);
			if(instance&&value){
				instance.options.defaultValue = value;
			}
		},
		
		fieldShow:function(){
			var instance = $.sdcui.fieldUtils.getInstance(this);
			if(instance){
				return instance.getText()||instance.getValue();
			}
			return null;
		},
		
		fieldReset:function(escapeEnable){
			this.each(function(){
				var instance = $.sdcui.fieldUtils.getInstance(this);
				if(instance){
					if(escapeEnable==true&&instance.options.escapeReset==true){
						return;
					}
					instance.reset();
				}
			});
		},
		
		fieldFocus:function(){
			var instance = $.sdcui.fieldUtils.getInstance(this);
			if(instance){
				instance.focus();
			}
		},
		
		fieldValidate:function(){
			this.each(function(){
				var instance = $.sdcui.fieldUtils.getInstance(this);
				instance&&instance.validate&&instance.validate();
			});
		},
		
		fieldClear:function(){
			this.each(function(){
				var instance = $.sdcui.fieldUtils.getInstance(this);
				instance&&instance.clear();
			});
		},
		
		fieldWidth:function(width){
			var instance = $.sdcui.fieldUtils.getInstance(this);
			if(instance){
				if(arguments.length==0){
					return instance.getWidth();
				}else{
					instance.setWidth(width);
				}
			}
			return null;
		}
	});
	
	/**
	 * @abstract class
	 * 通用field组件的抽象类
	 * 	1、公共方法：内部子类通用的方法
	 * 		[]
	 *  2、接口方法：外部调用的方法
	 * 		[getValue,setVlaue(value),getText,setText(text),focus,validate,clear,reset]
	 */
	$.sdcui.field = {
		options:{
			width:140
		},
		/**
		 * JQUERY UI组件初始化：field组件的统一初始化入口
		 */
		_create:function(){
			//id处理
			this.options.id = this.options.property;
			//this.options.id = this.options.id||$.sdcui.fieldUtils.getFieldId(this.options.property,this.options.prefix);
			//设置特殊的记录通用信息的属性
			this.element.attr('fieldType',this.widgetName)
						.attr('property',this.options.property);
			this._defaultHtmls();//
			this._initField();//
			this._initAction();//
			this.reset();
		},
		/**
		 * 生成静态的html内容
		 * 遵循YOUI组件的通用约定，使用initHtmls判断是否有由js生成dom元素html内容
		 */
		_defaultHtmls:function(){
			if(this.options.initHtml!==false){
				var htmls = this._fieldHtmls(),
					styles = ['youi-field',this.widgetName];
				if(this.options.notNull==true){
					styles.push('notNull');
				}
				this.element
						.attr('id',this.options.id)
						.addClass(styles.join(' '))
						.html(htmls);
			}
		},
		
		/**
		 * 覆盖方法：当前组件的html内容
		 */
		_fieldHtmls:function(){
			return '';
		},
		/**
		 * 覆盖方法：field组件的各自的特殊性初始化
		 */
		_initField:function(){
			
		},
		/**
		 * 覆盖方法：当前组件的动作处理
		 */
		_initAction:function(){
			
		},
		/****************************公用方法***************************/
		/**
		 * 非空校验
		 */
		_validateNotNull:function(){
			if(this.options.notNull==null)return true;
			var value = this.getValue();
			if(this.options.notNull==true){
				if($.isArray(value)&&value.length==0){//数组类型
					//this._validateError(this.options.caption+'不能为空');
					return false;
				}
				
				if(typeof(value)=='string'&&(value==''||value==null)){
					//this._validateError(this.options.caption+'不能为空');
					return false;
				}
			}
			return true;
		},
		
		/**
		 * 校验通过
		 */
		_validateSuccess:function(){
			this.element.find('input.value').removeClass('validate-error').addClass('validate-success');
			switch(this.options.dataType){
			case 'date':
				var value = this.getValue();
				if (value && value.length == 8){
					//value = value.replace(new RegExp('-','g'),'');
					//value = value.replace(/-/g,'');
					value = value.substr(0,4) + '-' + value.substr(4,2) + '-' + value.substr(6,2);
				}
				this.setValue(value);
				break;
			case 'datetime':
				var value = this.getValue();
				if (value && value.length == 14){
					value = value.substr(0,4) + '-' + value.substr(4,2) + '-' + value.substr(6,2) + ' '+ value.substr(8,2) + ':' + value.substr(10,2) + ':' + value.substr(12,2);
				}
				this.setValue(value);
				break;
			default:
				break;	
			}
		},
		/**
		 * 校验未通过
		 */
		_validateError:function(){
			this.element.find('input.value').removeClass('validate-success').addClass('validate-error');
			this.focus();
		},
		
		/**
		 * 校验中
		 */
		_validating:function(msg){
			this.element.find('input.value').removeClass('validate-success').removeClass('validate-error');
		},
		/****************************公共接口***************************/
		/**
		 * 获得组件值
		 */
		getValue:function(){
			//abstract method
		},
		/**
		 * 设置组件值
		 */
		setValue:function(value){
			//abstract method
		},
		/**
		 * 获得文本
		 */
		getText:function(){
			//abstract method
		},
		/**
		 * 设置文本
		 */
		setText:function(text){
			//abstract method
		},
		/**
		 * 清除
		 */
		clear:function(){
			//abstract method
		},
		/**
		 * 聚焦
		 */
		focus:function(){
			//abstract method
		},
		/**
		 * 校验
		 */
		validate:function(){
			//abstract method
		},
		/**
		 * 校验非空
		 */
		validateNotNull:function(){
			//abstract method
		},
		
		reset:function(){
			this.element.removeClass('validate-success').removeClass('validate-error').removeAttr('title');
			if(this.options.value!=null){
				if (this.options.realValue!=null){
					this.setValue(this.options.realValue);
					this.setText(this.options.value);
				} else {
					this.setValue(this.options.value);
					this.setText(this.options.value);
				}
			}else{
				this.clear();
			}
		},
		
		setWidth:function(width){
			this.element.width(width).find('.textInput').width(width);
		},
		/**
		 * 销毁组件
		 */
		destory:function(){
			this.element.removeClass('youi-field')
				.removeAttr('fieldType').removeAttr('property');
			$.widget.prototype.destroy.apply(this, arguments);
		}
	};
	/********************************fieldText 组件****************************/
	$.widget("sdcui.fieldText",$.extend({},$.sdcui.field,{
		options:$.extend({
			escapeSpecial:true,//特殊字符过滤
			startWidth:'',//起始字符校验
			upperCase:true//自动大写转换
		},$.sdcui.field.options),
		
		_initField:function(){
			
		}, 
		_fieldHtmls:function(){
			var htmls = [];
			var inputWidth = this.options.width;
			var s = "<input name=\""+this.options.property+"\" style=\"width:"+(inputWidth)+"px;float:left;\" class=\"textInput value field-tab\" defaultValue='"+ (this.options.value||'')+"' value='"+ (this.options.value||'')+"'";
			if (this.options.type){
				s = s+" type='"+ this.options.type +"' ";
			} else {
				s = s+" type='text' ";
			}
			if (this.options.biaos){
				s = s+" biaos='"+ this.options.biaos +"' ";
			}
			if (this.options.dataType){
				s = s+" dataType='"+ this.options.dataType +"' ";
			}
			if(this.options.onchange){
				s = s+"onChange='"+this.options.onchange+"'"; 
			}
			
			if(this.options.maxLength){
				s = s+" maxlength="+this.options.maxLength;
			}else if(this.options.maskLength){
				s = s+" maxlength="+this.options.maskLength;
			}else if(this.options.limitedLength){
				if(this.options.limitedLength2 && parseInt(this.options.limitedLength2)>parseInt(this.options.limitedLength)){
					s = s+" maxlength="+this.options.limitedLength2;
				}else{
					s = s+" maxlength="+this.options.limitedLength;
				}
			}else if(this.options.dataType){
				if(this.options.dataType=='date'){
					s = s+" maxlength=10";
				} else if(this.options.dataType=='datetime'){
					s = s+" maxlength=19";
				} else if(this.options.dataType=='yesno'){
					s = s+" maxlength=1";
				} else if(this.options.dataType=='yes'){
					s = s+" maxlength=1";
				} else if(this.options.dataType=='no'){
					s = s+" maxlength=1";
				} else if(this.options.dataType=='dbnumber'){
					s = s+" maxlength=10";
				} else if(this.options.dataType=='xis'){
					s = s+" maxlength=4";
				} else if(this.options.dataType=='ucush'){
					s = s+" maxlength=12";
				} else if(this.options.dataType=='cheph'){
					s = s+" maxlength=8";	
				} else if(this.options.dataType=='keh'){
					s = s+" maxlength=5";
				} else if(this.options.dataType=='cekeh'){
					s = s+" maxlength=9";
				} else if(this.options.dataType=='xkeh'){
					s = s+" maxlength=13";
				}else if(this.options.dataType=='beihdh'){
					s = s+" maxlength=9";	
				} else if(this.options.dataType=='baozdykh'){
					s = s+" maxlength=12";		
				} else if(this.options.dataType=='elh'){
					s = s+" maxlength=9";	
				} else if(this.options.dataType=='jiufdh'){
					s = s+" maxlength=7";		
				} else if(this.options.dataType=='zhidbzdykzxdh'){
					s = s+" maxlength=9";			
				} else if(this.options.dataType=='uch'){
					s = s+" maxlength=12";		
				} else if(this.options.dataType=='uch1'){
					s = s+" maxlength=10";
				} else if(this.options.dataType=='yikdh'){
					s = s+" maxlength=10";
				} else if(this.options.dataType=='uch2'){
					s = s+" maxlength=9";
				} else if(this.options.dataType=='uah'){
					s = s+" maxlength=12";	
				} else if(this.options.dataType=='uah1'){
					s = s+" maxlength=10";	
				} else if(this.options.dataType=='chukdh'){
					s = s+" maxlength=9";					
				} else if(this.options.dataType=='zhijjsbgdh'){
					s = s+" maxlength=7";	
				} else if(this.options.dataType=='zhijqdh'){
					s = s+" maxlength=7";		
				} else if(this.options.dataType=='fanxdh'){
					s = s+" maxlength=6";	
				} else if(this.options.dataType=='daohdh'){
					s = s+" maxlength=9";	
				} else if(this.options.dataType=='jusgzdh'){
					s = s+" maxlength=7";	
				} else if(this.options.dataType=='jusdh'){
					s = s+" maxlength=7";			
				} else if(this.options.dataType=='ush'){
					s = s+" maxlength=10";
				} else if(this.options.dataType=='ushls'){
					s = s+" maxlength=10";	
				} else if(this.options.dataType=='zhijgzdh'){
					s = s+" maxlength=7";			
				} else if(this.options.dataType=='gaibzgzdh'){
					s = s+" maxlength=7";	
				} else if(this.options.dataType=='diaobdh'){
					s = s+" maxlength=9";	
				} else if(this.options.dataType=='yaohlh'){
					s = s+" maxlength=12";	
				} else if(this.options.dataType=='yaohlhnt'){
					s = s+" maxlength=10";	
				} else if(this.options.dataType=='baozdyk'){
					s = s+" maxlength=12";	
				} else if(this.options.dataType=='uth'){
					s = s+" maxlength=9";			
				} else if(this.options.dataType=='gongys'){
					s = s+" maxlength=10";			
				} else if(this.options.dataType=='zhijqdgzd'){
					s = s+" maxlength=7";
				} else if(this.options.dataType=='rukpjh'){
					s = s+" maxlength=9";
				} else if(this.options.dataType=='warehouse'){
					s = s+" maxlength=9";
				}else if(this.options.dataType=='lsmdd'){
					s = s+" maxlength=9";
				}else if(this.options.dataType=='yicxhdh'){
					s = s+" maxlength=9";
				}else if(this.options.dataType=='yansdh'){
					s = s+" maxlength=9";
				}else if(this.options.dataType=='fanxrkdh'){
					s = s+" maxlength=6";
				}else if(this.options.dataType=='blh'){
					s = s+" maxlength=10";
				}
			}
						
			s = s+"></input>";
			if(this.options.biaos && this.options.biaos == 'enter'){
				s += "<Span style='font-size:18px;font-weight:bold'>&crarr;</Span>";
			}
			htmls.push(s);
			htmls.push("<div class=\"field-invalid\" style=\"float:left;\"></div>");
			return htmls.join('');
		},
		
		/*
		 * 设置数据类型
		 */
		setDataType:function(dataType){
			this.options.dataType = dataType;
		},
		
		setValue:function(value){
			if(this.options.upperCase){
				value = value.toString().toUpperCase();
			}
			this.element.find('input.value').val(value);
		},
		
		getValue:function(){
			var value = this.element.find('input.value').val();
			if(value&&this.options.upperCase){
				value = value.toString().toUpperCase();
			}
			//值还原
			if(this.options.dataType == "date" && value == "____-__-__"){
				value = '';
			}
			if(this.options.dataType == "datetime" && value == "____-__-__ __:__:__"){
				value = '';
			}
			return value;
		},
		
		clear:function(){
			this.element.find('input.value').val('');
		},
		
		focus:function(){
			this.element.find('input.value').addClass($.sdcui.resource.keyboardFocusClass);
			this.element.find('input.value').focus();
		},
		
		/**
		 * 失焦
		 */
		lostFocus:function(){
			this.element.find('input.value').removeClass($.sdcui.resource.keyboardFocusClass);
		},
		
		validate:function(){
			var value = this.getValue();
			var options = this.options;
			//验证
			this.element.find('input.value').removeClass('validate-error');
			if(!validateInput(value, options,this)){
				this._validateError();
				return false;
			} else {
				this._validateSuccess();
				return true;
			}
		},
		validateNotNull:function(){
			var value = this.getValue();
			var options = {notNull:true,caption:this.options.caption};
			this.element.find('input.value').removeClass('validate-error');
			if(!validateInput(value, options)){
				this._validateError();
				return false;
			} else {
				this._validateSuccess();
				return true;
			}
		},
		
		_exsitSpecial:function(value){
			return !/^[^\|"'<>]*$/.test(value);
		},
		/**
		 * 后台即时校验
		 */
		ajaxValidate:function(){
			if(this.options.validateSrc){
				var value = this.getValue();
				if(value==null||value=='')return;
				this.element.addClass('validating');//标识为正在进行校验
				_log.info('validateSrc:'+this.options.validateSrc);
				var url = this.options.validateSrc;
				url+=(url.indexOf('?')==-1?'?':'&');
				url+=$.sdcui.parameterUtil.propertyParameter(this.options.property,value);
				$.sdcui.ajaxUtil.ajax({
					url:url,
					element:this.element,
					success:function(results){
						if(results.message&&results.message.passed==false){
							this.element
								.removeClass('validate-success')
								.addClass('validate-error').attr('title',results.message.info);
						}else{
							this.element.addClass('validate-success');
						}
						this.element.removeClass('validating');
					},
					error:function(results){
						//_log.error('校验地址【'+this.url+'】错误:地址无法访问！');
						this.element.removeClass('validating');
					}
				});
			}
		},
		
		/**
		 * 值
		 */
		valueChangeCheck:function(){
			var value = this.getValue();
			if(this.options.upperCase){
				this.setValue(value);
			}
			
			//this.validate();
		},
		
		_initAction:function(){
			if (this.options.upperCase && !this.options.maskOptions){
				//自动大写转换 
				this.element.find('input.value').bind('keyup',  
				    function(domEven) {   
						var eCode = domEven.keyCode ? domEven.keyCode : domEven.which;
						if (eCode>=65 && eCode<=90) {
							$(this).val($(this).val().toUpperCase());  
						}
			        }
			    );  
			    function formatPasteDataToUpperCase(){
					if (clipboardData) {
						clipboardData.setData('text', clipboardData.getData('text').toUpperCase());  
					} 
				}
				this.element.find('input.value').each(function() {  
			        var _input = $(this)[0];  
			        if (_input.attachEvent) {  
			            _input.attachEvent('onbeforepaste', formatPasteDataToUpperCase);  
			        } else {  
			            _input.addEventListener('onbeforepaste', formatPasteDataToUpperCase, false);  
			        }  
			    }); 

			} 
			if (this.options.maskOptions) {
				this.element.find('input.value').mask(this.options.maskOptions.mask);
			}
			this.element.find('input.value').bind('change',function(){
				var field = $(this).parents('.fieldText:first');
				field.fieldText('valueChangeCheck');
				field = null;
			}).bind('keypress',function(){
				$(this).parents('.fieldText').removeClass('validate-error')
											 .removeClass('validate-success');
			});
			
			this.element.addClass('tabFocus');
			this.element.bind('tab.blurs',function(event,/*prev(上一个元素)或next(下一个元素)*/options){
				//$(this).fieldValidate();
			});
		}
	}));
	
	/******************** fieldSelect组件 *****************/
	$.widget('sdcui.fieldSelect',$.extend({},$.sdcui.field,{
			options:$.extend({
				isExistCheck:true,//是否校验数据存在性
			},$.sdcui.field.options),
			/**
			 * field组件的内部初始化
			 */
			_initField:function(){
				this.element.addClass('tabFocus');//键盘移动容器焦点样式
			},
			
			/**
			 * 生成field组件内的html
			 */
			_fieldHtmls:function(){
				var htmls = [];
				var dataSource = "";
				var inputWidth = this.options.width;
				var internation = false;
				var includenull = false;
				var isExistCheck = true;
				if (this.options.internation){
					internation = this.options.internation;
				}
				if (this.options.includeNull){
					includenull = this.options.includeNull;
				}
				if (this.options.dataSource){
					dataSource = this.options.dataSource.toString();
				}
				if (this.options.isExistCheck){
					isExistCheck = this.options.isExistCheck.toString();
				}
				var str = "<input name=\""+this.options.property+"\" style=\"width:"+(inputWidth)+"px;float:left;\" src='" + this.options.src + "' dataSource='" + dataSource + "' internation='" + internation +  "' includenull='" + includenull + "' defaultValue='"+ (this.options.realValue||'')+"' realValue='"+ (this.options.realValue||'')+"' value='"+ (this.options.value||'')+"' type=\"text\" class=\"textInput value field-tab\"";
				if(this.options.onselect){
					str = str + "onsltchg='"+this.options.onselect+"'";
				}
				if (this.options.biaos){
					str = str + " biaos='"+ this.options.biaos +"' ";
				}
				str = str + "></input>▼";
				if(this.options.biaos && this.options.biaos == 'enter'){
					str = str + "<Span style='font-size:18px;font-weight:bold'>&crarr;</Span>";
				}
				htmls.push(str);
				htmls.push("<div class=\"field-invalid\" style=\"float:left;\"></div>");
				return htmls.join('');
			},
			/**
			 * 初始化动作
			 */
			  _initAction:function(){		  								
				this.element.bind('keydown',function(event){
					if ($(this).fieldSelect('getDisabled')){
						$(this).fieldSelect('close');
						return true;
					}
					if($(document).find('.pop-fieldSelect').hasClass('expanded')){  //打开
						if (event.keyCode == 13){ //回车
							$(this).fieldSelect('close');
							$(document).find('.pop-fieldSelect >ul').html('');
							return false;
						} else if (event.keyCode==40){//按下
							var ul = $(document).find('#pop_' + $(this).attr('id') +' >ul');
							var liSelect = ul.find('li.selected');
							liSelect.css('background','#ffffff');
							liSelect.removeClass('selected');
							if(liSelect.next().get(0)){
								liSelect = liSelect.next();			
							}else{
								liSelect = ul.find('li:first');
							}
							if(liSelect.get(0)){
								liSelect.css('background','#777777');
								liSelect.addClass("selected");
								$(this).find('input').val($(liSelect).attr('text'));
								$(this).find('input').attr('realValue',$(liSelect).attr('realValue'));
								var select=$(this).find('.value').attr('onsltchg');
								if(select){
									eval(select);
								}
							}
							return false;
						} else if (event.keyCode==38){//按上
							var ul = $(document).find('#pop_' + $(this).attr('id') +' >ul');
							var liSelect = ul.find('li.selected');
							liSelect.css('background','#ffffff');
							liSelect.removeClass('selected');
							if(liSelect.prev().get(0)){
								liSelect = liSelect.prev();
							}else{
								liSelect = ul.find('li:last');
							}
							if(liSelect.get(0)){
								liSelect.css('background','#777777');
								liSelect.addClass("selected");
								$(this).find('input').val($(liSelect).attr('text'));
								$(this).find('input').attr('realValue',$(liSelect).attr('realValue'));
								var select=$(this).find('.value').attr('onsltchg');
								if(select){
									eval(select);
								}
							}
							return false;
						} 
					} else {  //关闭
						if (event.keyCode==40 || event.keyCode==38){  //向上或向下键
							$(this).fieldSelect('open', $(event.target).parent());
							return false;
						}
					}
				}).bind('keyup',function(event){
					if ($(this).fieldSelect('getDisabled')){
						return false;
					}
					if (event.keyCode>=65 && event.keyCode<=90) {
						$(event.target).val($(event.target).val().toUpperCase());  
					}					
					if (event.keyCode!=38 && event.keyCode!=40){
						if($(document).find('.pop-fieldSelect').hasClass('expanded')){  //打开
							if (event.keyCode==37 || event.keyCode==39 || event.keyCode==9){
								$(this).fieldSelect('getDataSource', $(event.target).parent());
								return false;
							} else {
								//重新绘制
								$(this).fieldSelect('drawSelect',true);	
								return false;
							}
						} else {
							if (event.keyCode==37 || event.keyCode==39){
								$(this).fieldSelect('getDataSource', $(event.target).parent());
								return false;
							}
						}
					}
				}).bind('tab.focus',function(event){
					if ($(this).fieldSelect('getDisabled')){
						return false;
					}
					$(this).fieldSelect('getDataSource',$(event.target));
				}).bind('tab.blurs',function(event){
					var id=$(this).attr('id');
					$(document).find('#'+id+' input').attr('realValue',$(document).find('#'+id+' input').val());
					$(this).fieldSelect('close');
					
				}).bind('blur',function(event){
					$(this).fieldSelect('close');
					
				}).bind('mousedown',function(event){
					//关闭下拉
					$(this).fieldSelect('close');
					if ($(this).fieldSelect('getDisabled')){
						return false;
					}
					//展开下拉
					if(!$(document).find('.pop-fieldSelect').hasClass('expanded')){
						$(this).fieldSelect('focus');
						if ($(event.target).is('input')){
							$(this).fieldSelect('open',$(event.target).parent());
						} else {					
							$(this).fieldSelect('open',$(event.target));
						}
						var ul = $(document).find('#pop_'+ $(this).attr('id')+ ' >ul');
						var th=$(this);
						var id=$(this).attr('id');
						ul.bind('mousedown',function(event){
							var curElem = $(event.target);
							if(curElem.get(0) && curElem.get(0).nodeName == "LI"){
								curElem.css('background','#777777');
								curElem.addClass("selected");
								$(document).find('#'+id+' input').val($(curElem).attr('text'));
								$(document).find('#'+id+' input').attr('realValue',$(curElem).attr('realValue'));
								var select=$('#'+id).find('.value').attr('onsltchg');
								if(select){
									eval(select);
								}
								th.fieldSelect('close');
							}
							return false;
						});
					}
				});
			},
			
			/*
			 * 获取disabled状态
			 */
			getDisabled:function(){
				if ($(this).is(":disabled")||this.element.find('input.textInput').is(":disabled")
					||(this.element.find('input.textInput').attr("readonly")&&this.element.find('input.textInput').attr("readonly")==true))
				{
					return true;
				} 
				return false;
			},
			
			drawSelect:function(isFliter,dataSource){
				if (dataSource){
					this.dataSource = dataSource;
				}
				//筛选数据
				var currentValue = this.getValue();
				var currentText = this.getText();
				//添加空行
				var htmls = [];
				if (this.options.includeNull){
		 			htmls.push("<li style='cursor:pointer;' text='' realValue=''>&nbsp;");
	 			}
				//添加数据
				for(var i = 0 ; i < this.dataSource.length ; i++ ){
					var itemName = this.dataSource[i].name;
					if (this.options.internation){  //如果需要国际化，则先转国际化
						itemName = $.sdcui.resource.i18n[itemName]
					}
					if (isFliter){
						if (itemName.indexOf(currentText)>-1){
							htmls.push("<li style='cursor:pointer;' text='"+itemName+"' realValue='"+ this.dataSource[i].value +"'>" + itemName);
						}
					} else {
						htmls.push("<li style='cursor:pointer;' text='"+itemName+"' realValue='"+ this.dataSource[i].value +"'>" + itemName);
					}
				}
		 		
				var id = this.element.attr("id");
				if (this._getPopPanel().hasClass('expanded')){
					$(document).find('#pop_' + id).addClass('expanded');
				}
				var ul = $(document).find('#pop_' + id + ' >ul');
				//将UL底下的li清空
				ul.html('');
				//将生成li添加到UL里面
				ul.html(htmls.join(''));
			},
			
			resetDatasource:function(dataSource){
				var id=this.options.property;
				this.options.src = '';
				this.dataSource = dataSource;
				this.options.dataSource = dataSource;
				$(document).find('#'+id+' input').attr("dataSource",dataSource);
				$(document).find('#'+id+' input').attr('src','');
				$(document).find('#'+id+' input').val('');
				$(document).find('#'+id+' input').attr('realValue','');
			},
			
			clearSelect:function(){
				this.dataSource = '';
				this.options.src = '';
			},
			
			resetUrl:function(url){
				this.options.src = url;
				this.dataSource = '';
				this.options.dataSource = '';
				var id=this.options.property;
				$(document).find('#'+id+' input').attr("dataSource",'');
				$(document).find('#'+id+' input').attr('src',url);
				$(document).find('#'+id+' input').val('');
				$(document).find('#'+id+' input').attr('realValue','');
			},
			
			getDataSource:function(doc){
				//显示数据
				if (!this.dataSource){
					if (this.options.dataSource){ 
						//显示数据
						this.drawSelect(false,this.options.dataSource);
					 } else {	
						//未指定数据集
						if (this.options.src){	
							var dataSource ;
							ajaxRequestNoParams(this.options.src, function(results){
								dataSource = results.result.parameter.list;
								$(doc).fieldSelect('drawSelect',false,dataSource);									
							});
						}
					}
				} else {
					//显示数据
					this.drawSelect(false);
				}
			},
			
			checkData:function(){
				if (this.dataSource && this.dataSource.length > 0){
					var currentValue = this.getValue();
					var currentText = this.getText();
					if (currentText != ""){
						var isExist = false;
						for(var i = 0 ; i < this.dataSource.length ; i++ ){
							var itemName = this.dataSource[i].name;
							if (this.options.internation){  //如果需要国际化，则先转国际化
								itemName = $.sdcui.resource.i18n[itemName]
							}
							if (itemName.toString().toUpperCase() == currentText.toString().toUpperCase()){
								if (this.dataSource[i].value == currentValue){
									this.setText(itemName);
									isExist = true;
									break;
								} 
							}
						}
						if(this.options.isExistCheck){
							//如果不存在，更新值
							if (isExist == false){
								for(var i = 0 ; i < this.dataSource.length ; i++ ){
									var itemName = this.dataSource[i].name;
									if (this.options.internation){  //如果需要国际化，则先转国际化
										itemName = $.sdcui.resource.i18n[itemName]
									}
									if (itemName.toString().toUpperCase() == currentText.toString().toUpperCase()){
										this.setText(itemName);
										this.setValue(this.dataSource[i].value);
										isExist = true;
									}
								}
								if (isExist == false){
									this._validateError();
									showMsg($.sdcui.resource.i18n['C_NotExist']);
									return false; 
								}
							}
						}
					} else {
						this.clear();
					}
				}
				return true;
			},

			/**展开下拉项
			 */
			open:function(doc){
				//指定位置
				var popPanel = this._getPopPanel();
				var offset = $(doc).offset();
				var popTop = offset.top + $(doc).outerHeight();
				if ((popTop + popPanel.height()) > $(window).height()){
					popTop = offset.top - popPanel.height() - 2;
				}
				var offerCtr = doc.firstChild == null ? doc: doc.firstChild;
				offerCtr = offerCtr.find('input.textInput');		
				popPanel.addClass('expanded');
				popPanel.css({
					width : $(offerCtr).width() + 20,
					left : offset.left,
					top : popTop
				});
				//获取数据并显示 
				this.getDataSource(doc);
			},
			
			close:function(){
				//关闭
				this._getPopPanel().removeClass('expanded');
				var popSelect = $(document).find('.pop-fieldSelect');
				for(var i=0; i<popSelect.length; i++){
					if ($(popSelect[i]).hasClass('expanded')){
						var ctrId = popSelect[i].id.replace("pop_","");
						if (this.id != ctrId){
							$('#'+ctrId).fieldSelect('close');
							$('#pop_'+ctrId+' >ul').html('');
						}
					}
				} 
				this.element.removeClass('expanded');				
				if (this.options.onclose){
					eval(this.options.onclose);
				}
				//判断当前值是否在数据集中
				if (!this.checkData()){
					return false;
				}
			},
			
			_getPopPanel:function(){
				var popPanelId = 'pop_'+this.options.property.replace(/\./g,'_');
				var popPanel = $('#'+popPanelId);
				if(popPanel.length==0){
					popPanel = $('<div class="pop-fieldSelect" id="'+popPanelId+'"><ul style=\"border-top: none; width:'+(this.options.inputWidth)+'px; padding:2px; margin:0px;\"></ul><div>').appendTo($('body',document));
				}
				return popPanel;
			},
			/**
			 * 设置field值
			 */
			setValue:function(value){
				this.element.find('input.textInput').attr("realValue",value);
			},
			/**
			 * 获取field值
			 */
			getValue:function(){
				return this.element.find('input.textInput').attr("realValue");
			},
			/**
			 * 获得文本
			 */
			getText:function(){
				return this.element.find('input.textInput').val();
			},
			/**
			 * 设置文本
			 */
			setText:function(text){
				this.element.find('input.textInput').val(text);
			},
			/**
			 * 清除field值
			 */
			clear:function(){
				this.element.find('input.textInput').val('');
				this.element.find('input.textInput').attr("realValue","");
			},
			/**
			 * 聚焦
			 */
			focus:function(){
				this.element.find('input.value').addClass($.sdcui.resource.keyboardFocusClass);
				this.element.find('input.value').focus();
				this.element.find('input.value').select();
			},
			/**
			 * 失焦
			 */
			lostFocus:function(){
				this.element.find('input.value').removeClass($.sdcui.resource.keyboardFocusClass);
			},
			/**
			 * 验证
			 */
			validate:function(){
				//先更新值
				this.element.find('input.value').removeClass('validate-error');
				if (!this.checkData()){
					return false;
				}
				if (this.dataSource && this.dataSource.length < 1){
					if (this.getText().length>0&&this.options.notNull == true){
						this._validateError();
						showMsg($.sdcui.resource.i18n['C_NotExist']);
						return false;
					}
				}
				//验证
				var value = this.getValue();
				var options = this.options;
				if(!validateInput(value, options)){
					this._validateError();
					return false;
				} else {
					this._validateSuccess();
					return true;
				}
			},
			/**
			 * 验证下拉框选择值
			 */
			validateSelect:function(){
				//更新校验
				this.element.find('input.value').removeClass('validate-error');
				//如果下拉框数据源有值,则需校验是否存在
				if (this.dataSource && this.dataSource.length > 0){
					
					var currentValue = this.getValue();//获取值
					var currentText = this.getText();//获取文本
					var isExist = false;//是否存在
					//遍历下拉框数据源
					for(var i = 0 ; i < this.dataSource.length ; i++ ){
						var itemName = this.dataSource[i].name;//数据源name
						//比对数据源里的name和文本
						if (itemName.toString().toUpperCase() == currentText.toString().toUpperCase()){
							//数据源name和文本匹配后比对数据源值和当前选择值
							if (this.dataSource[i].value == currentValue){
								isExist = true;//相等则值存在数据源内,返回
								break;
							} 
						}
					}
					
					//值不存在数据源则提示错误
					if (!isExist){
						this._validateError();
						showMsg($.sdcui.resource.i18n['C_NotExist']);//不存在提示
						return false;
					}
				}
				//验证值是否为空
				var value = this.getValue();
				var options = this.options;
				if(!validateInput(value, options)){
					this._validateError();
					return false;
				} else {
					this._validateSuccess();
					return true;
				}
			},
			/**
			 * 非空验证
			 */
			validateNotNull:function(){
				this.element.find('input.value').removeClass('validate-error');
				if (!this.checkData()){
					return false;
				}
				var value = this.getValue();
				var options = {notNull:true,caption:this.options.caption};
				if(!validateInput(value, options)){
					this._validateError();
					return false;
				} else {
					this._validateSuccess();
					return true;
				}
			},
			/**
			 * 校验通过
			 */
			_validateSuccess:function(){
				this.element.find('input.value').removeClass('validate-error').addClass('validate-success');
			},
			/**
			 * 校验未通过
			 */
			_validateError:function(){
				this.element.find('input.value').removeClass('validate-success').addClass('validate-error');
				this.focus();
			},
			/**
			 * 设置宽度
			 */
			setWidth:function(width){
				//
			}
		}));
	
	/******************** fieldHiden组件 *****************/
	$.widget('sdcui.fieldHidden',$.extend({},$.sdcui.field,{
		options:$.extend({
			//
		},$.sdcui.field.options),
		//hiden组件的内部初始化
		_initField:function(){
			this.element.addClass('tabFocus');//键盘移动容器焦点样式
			this.element.attr({style:"float:left;"}); //设置左对齐
		},
		 //生成hiden组件内的html
		_fieldHtmls:function(){
			var htmls = [];
			var inputWidth = this.options.width;
			htmls.push("<input type='hidden' name=\""+this.options.property+"\" class='textInput value' value='"+ (this.options.value||'')+"'></input>");
			return htmls.join('');
		},
		 //初始化动作
		_initAction:function(){
			
		},
		
		 //设置field值
		setValue:function(value){
			this.element.find('input.textInput').val(value);
		},
		//获取field值
		getValue:function(){
			return this.element.find('input.textInput').val();
		},
		
		 // 获得文本
		getText:function(){
			return this.element.find('input.textInput').val();
		},
		 // 设置文本
		setText:function(text){
			this.element.find('input.textInput').val(text);
		},
		 //清除field值
		clear:function(){
			this.element.find('input.textInput').val('');
		},
		 //聚焦
		focus:function(){
			this.element.find('input.textInput').focus();
		},
		//设置宽度
		setWidth:function(width){
		}
	}));
	/******************** fieldLabel组件 *****************/
	$.widget('sdcui.fieldLabel',$.extend({},$.sdcui.field,{
		options:$.extend({
			//
		},$.sdcui.field.options),
		//hiden组件的内部初始化
		_initField:function(){
			this.element.addClass('tabFocus');//键盘移动容器焦点样式
		},
		 //生成label组件内的html
		_fieldHtmls:function(){
			var htmls = [];
			var inputWidth = this.options.width;
			htmls.push("<span style=\"width:"+(inputWidth)+"px; display:inline-block;\" value='"+ (this.options.value||'')+"' class='textInput value'>"+(this.options.value||'')+"</span>");
			return htmls.join('');
		},
		 //初始化动作
		_initAction:function(){
			
		},
		
		 //设置field值
		setValue:function(value){
			this.element.find('.textInput').html(value);
		},
		//获取field值
		getValue:function(){
			return this.element.find('.textInput').html();
		},
		
		 // 获得文本
		getText:function(){
			return this.element.find('.textInput').html();
			
		},
		 // 设置文本
		setText:function(text){
			this.element.find('.textInput').html(text);
		},
		 //清除field值
		clear:function(){
			this.element.find('.textInput').html('');
		},
		 //聚焦
		focus:function(){
			this.element.find('.textInput').focus();
		},
		//设置宽度
		setWidth:function(width){
		}
	}));
	/******************** fieldLabelInput组件 *****************/
	$.widget('sdcui.fieldLabelInput',$.extend({},$.sdcui.field,{
		options:$.extend({
			//
		},$.sdcui.field.options),
		//hiden组件的内部初始化
		_initField:function(){
			this.element.addClass('tabFocus');//键盘移动容器焦点样式
			this.element.attr({style:"float:left;"}); //设置左对齐
		},
		 //生成label组件内的html
		_fieldHtmls:function(){
			var htmls = [];
			var inputWidth = this.options.width;
			htmls.push("<span style=\"width:"+(inputWidth)+"px; display:inline-block;\">"+(this.options.value||'')+"</span><input type='hidden' name=\""+this.options.property+"\" class='textInput value' value='"+ (this.options.value||'')+"'></input>");
			return htmls.join('');
		},
		 //初始化动作
		_initAction:function(){
			
		},
		
		 //设置field值
		setValue:function(value){
			this.element.find('input.textInput').val(value);
		},
		//获取field值
		getValue:function(){
			return this.element.find('input.textInput').val();
		},
		
		 // 获得文本
		getText:function(){
			return this.element.find('span').html();
		},
		 // 设置文本
		setText:function(text){
			this.element.find('span').html(text);
		},
		 //清除field值
		clear:function(){
			this.element.find('span').html('');
			this.element.find('input.textInput').val('');
		},
		 //聚焦
		focus:function(){
			this.element.find('input.textInput').focus();
		},
		//设置宽度
		setWidth:function(width){
		}
	}));
})(jQuery);


function CurrentTime()
{
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	if (month < 10){
		month = '0' + month;
	}
	if (day < 10){
		day = '0' + day;
	}
	var time = year + '-' + month + '-' + day;
	return time;
}

function getDateTime(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	var hour = now.getHours();
	var min = now.getMinutes();
	//var sec = now.getSeconds();
	if (month < 10){
		month = '0' + month;
	}
	if (day < 10){
		day = '0' + day;
	}
	if (hour < 10){
		hour = '0' + hour;
	}
	if (min < 10){
		min = '0' + min;
	}
	//if (sec < 10){
	//	sec = '0' + sec;
	//}
	var time = year + '-' + month + '-' + day + ' ' + hour + ':' + min;
	//+ ':' + sec;
	return time;
}