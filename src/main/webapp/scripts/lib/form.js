/**
 * 
 */
(function( $, undefined ) {
	$.widget("sdcui.form", {
		options:{
			onemoredemand:false,
			onreload:false
		},
		
		_create:function(){
			this._keySupport();
			this._initFields();
		},
		
		_initFields:function(){
			if($.isArray(this.options.fields)){
				var fieldOption;
				for(var i=0;i<this.options.fields.length;i++){
					fieldOption = $.extend({
						fieldType:'fieldText'
					},this.options.fields[i]);
					var fieldId = fieldOption.property.replace(/\./g,'_');
					var fieldElement = this.element.find('#'+fieldId+'.ui-field');
					if(fieldElement.length){
						fieldElement[fieldOption.fieldType](fieldOption);
					}
					fieldOption = null;
				}
			}
			//添加属性
			if (this.options.onreload == true){
				this.element.attr("onreload",this.options.onreload);				
			}
		},
		
		resetFields:function(){
			if($.isArray(this.options.fields)){
				for(var i=0;i<this.options.fields.length;i++){
					if (this.options.fields[i].fieldType == "fieldLabel"){
						$('#'+this.options.fields[i].property+' span').html('');
					}
					if (this.options.fields[i].fieldType == "fieldText"){
						$('#'+this.options.fields[i].property+' input').val('');
					}
					if (this.options.fields[i].fieldType == "fieldHidden"){
						$('#'+this.options.fields[i].property+' input').val('');
					}
					if (this.options.fields[i].fieldType == "fieldSelect"){
						$('#'+this.options.fields[i].property+' input').val('');
						$('#'+this.options.fields[i].property+' input').attr('realValue','');
					}
					if (this.options.fields[i].fieldType == "fieldLabelInput"){
						$('#'+this.options.fields[i].property+' span').html('');
						$('#'+this.options.fields[i].property+' input').val('');
					}
				}
			}
		},
		
		getFormParam : function(){
			var params = [];
			this.element.find('.youi-field').each(function(){
				var value = $(this).fieldValue();
				var property = this.getAttribute('property');
				params.push(property + "="+ value);
			});
			return params;
		},
		
		validateParam : function(){
			var flag = false;
			
			for(var i=0;i<this.options.fields.length;i++){
				var fieldId = this.options.fields[i].property;
				var fieldElement = this.element.find('#'+fieldId+'.ui-field');
				var value = $(fieldElement).fieldValue();
				if ( fieldElement.attr("fieldtype") == "fieldSelect"){
					if(!fieldElement.fieldSelect('validate')){
						return false;
					} else {
						flag =  flag || value;
					}
				} else {
					if ($(fieldElement).find('input')){
						if (!$(fieldElement).find('input').is(":disabled") && !$(fieldElement).find('input').attr("readonly")){
							if (fieldElement.attr('fieldType') == 'fieldText'){
								$(fieldElement).find('input').val(value);
								if(!fieldElement.fieldText('validate')){
									return false;
								}else {
									flag =  flag || value;
								}
							}
						}
					}
				}
			}
			
			if (this.options.onemoredemand && !flag){
				showMsg($.sdcui.resource.i18n['C_F_ONEMOREDEMAND']);
				return false;
			}
			
			return true;
		},
		
		clearValue : function(){
			var params = [];
			this.element.find('.youi-field').each(function(){
				if ($(this).attr("fieldType")=="fieldText"){
					$(this).find('input').val('');			
				} else if ($(this).attr("fieldType")=="fieldHidden"){
					$(this).find('input').val('');
				} else if ($(this).attr("fieldType")=="fieldSelect"){
					$(this).find('input').val('');
					$(this).find('input').attr('realValue','');
				} else if ($(this).attr("fieldType")=="fieldLabel"){
					$(this).find('span').html('');
					$(this).find('.textInput').attr('realValue','');
				} else if ($(this).attr("fieldType")=="fieldLabelInput"){
					$(this).find('span').html('');
					$(this).find('input').val('');
				} 
			});
		},
		
		/**
		 * 提交数据
		 */
		submit : function(params,success){
			ajaxRequest(params, this.options.url, function(results){
				if(success){
				  success(results);
				}
			});
		},
		
		/**
		 * Url提交
		 */
		submitUrl : function(params, url, success){
			ajaxRequest(params, url, function(results){
				if(success){
				  success(results);
				}
			});
		},
		
		/**
		*键盘支持
		*/
		_keySupport:function(){
			
		}
	});
})(jQuery);