/**
 * 
 */
(function($) {
	var _log = $.sdcui.log;
	/**
	 * treeGrid组件
	 * @author  zhouyi
	 * @version 1.0.0
	 * @date 2011-12-19
	 */
	$.widget("sdcui.treeGrid", {
		/**
		 * 默认参数
		 */
		ROW_UUID:0,
		
		options:{
			idAttr:'id',
			textAttr:'text',
			parentAttr:'parentId'
		},
		/**
		 * 
		 */
		_create:function(){
			this.element.addClass('youi-treeGrid');
			this._initVars();
			this._defaultHtmls();
			this._initAction();
		},
		/**
		 * 变量初始化
		 */
		_initVars:function(){
			this.deleteRowIds = [];
		},
		/**
		 * JS生成HTML的相关代码
		 */
		_defaultHtmls:function(){
			
		},
		
		trigger:function(treeRowElement){
			if(treeRowElement.hasClass('expandable')){
				if(treeRowElement.hasClass('expanded')){
					//关闭
					this._close(treeRowElement);
				}else{
					//展开
					this._open(treeRowElement);
				}
			}
		},
		/**
		 * 增加节点
		 */
		addNode:function(record,options){
			options = options||record;
			options = $.extend({level:1,type:'child'},options);
			var selected = this.getSelected();
			var insertPost = 'after';
			if(selected.length){
				var level = parseInt(selected.attr('level'));
				switch(options.type){
					case 'child':
						level = level+1;
						selected.addClass('expandable expanded');
						break;
					case 'level':
						insertPost= 'before';
						break;
				}
				selected[insertPost](this._buildRowHtml(record,level));
			}
		},
		/**
		 * 获得编辑过记录集合
		 * 1：删除 deletes[string,...]
		 * 2：修改 edits[{object},...]
		 * 3：新增 adds[{object},...]
		 */
		getEditedRecords:function(){
			//校验
			//
			var editedParams = [];
			//this.deleteRowIds
			this.element.find('tr.tree-row').each(function(index){
				//row-new 新增加的行
				//修改的行
			});
		},
		/**
		 * 单行数据保存
		 */
		saveRow:function(){
			this._closeEditor();
			
			var selected = this.getSelected();
			if(!selected.length)return;
			//提交前校验
			var needSave = selected.find('td.cell.edited').length;
			if(!needSave){
				$.sdcui.messageUtil.showMessage('数据没有变化，不需要保存！');
				return;
			}
			//
			
			var parentElement = this._getParent(selected);
			var saveParams = this._getRecordParams(selected,
					(parentElement==null?null:parentElement.attr('id')));
			$.sdcui.ajaxUtil.ajax({
				url:this.options.saveRowSrc,
				data:saveParams.join('&'),
				rowElement:selected,
				success:function(result){
					//成功保存后
					$.sdcui.messageUtil.showMessage('行保存成功！');
					this.rowElement.find('.edited').removeClass('edited');
					this.rowElement = null;
				}
			});
		},
		
		/**
		 * 全部数据保存（新增，修改，删除）
		 */
		saveAll:function(){
			this._closeEditor();//关闭编辑器
			//数据校验
			this.element.find('');
		},
		

		_getParent:function(rowElement){
			var prevElement = rowElement;
			var findParent = false;
			var level = rowElement.attr('level');
			
			while(!findParent){
				prevElement = prevElement.prev();
				if(prevElement.length==0)break;
				
				if(level>prevElement.attr('level')){
					return prevElement;
				}
			}
		},
		
		/**
		 * 
		 */
		_getRecord:function(rowElement,pid){
			var record = {};
			
			record[this.options.parentAttr] = pid;
			record[this.options.idAttr] = rowElement.attr('id');
			record[this.options.textAttr] = rowElement.find('td.treeNode').text();
			//其他列
			var cols = this.options.cols;
			
			rowElement.find('td.cell').each(function(index){
				var col = cols[index];
				var value = this.getAttribute('value')||$(this).text();
				record[col.property] = value;
			});
			return record;
		},
		/**
		 * 是否为新增加的行
		 */
		_isNewRow:function(rowElement){
			return rowElement.hasClass('row-new');
		},
		/**
		 * 
		 */
		_getRecordParams:function(rowElement,pid){
			var params = [];
			if(!this._isNewRow(rowElement)){
				params.push($.sdcui.parameterUtils.propertyParameter(this.options.idAttr , 
						rowElement.attr('id')));
			}
			
			params.push($.sdcui.parameterUtils.propertyParameter(this.options.textAttr , rowElement.find('td.treeNode').text()));
			params.push($.sdcui.parameterUtils.propertyParameter(this.options.parentAttr , pid));
			//其他列
			var cols = this.options.cols;
			
			rowElement.find('td.cell').each(function(index){
				var col = cols[index];
				var value = this.getAttribute('value')||$(this).text();
				params.push($.sdcui.parameterUtils.propertyParameter(col.property , value));
			});
			return params;
		},
		/**
		 * 删除节点
		 */
		removeNode:function(){
			if(window.confirm('确认删除?')){
				//删除节点
				var selected = this.getSelected();
				if(selected.length){
					//非插入的元素
					var deleteRowIds = [];
					if(!this._isNewRow(selected)){
						deleteRowIds.push(selected.attr('id'));
						//删除子树
						this._iteratorNodeChildren(selected, function(rowElement){
							if(!rowElement.hasClass('row-new')){
								deleteRowIds.push(rowElement.attr('id'));
							}
							rowElement.remove();
						});
					}
					selected.remove();//物理删除元素
					this.deleteRowIds = this.deleteRowIds.concat(deleteRowIds);
				}
			}
		},
		
		_buildRowHtml:function(record,level){
			var rowHtmls = [];
			rowHtmls.push('<tr level="'+level+'" id="row_add_'+(this.ROW_UUID++)+'" class="tree-row node-level-'+level+' row-new">');
			rowHtmls.push('<td class="treeNode"><span class="expand-handler"></span><span class="cell">------</span></td>');
			
			for(var i=0;i<this.options.cols.length;i++){
				rowHtmls.push('<td class="cell"></td>');
			}
			rowHtmls.push('</tr>');
			return rowHtmls.join('');
		},
		
		getSelected:function(){
			return this.element.find('.tree-row.selected');
		},
		
		_open:function(treeRowElement){
			this._iteratorNodeChildren(treeRowElement, function(rowElement){
				rowElement.removeClass('hide');
			});
			treeRowElement.addClass('expanded');
		},
		
		_close:function(treeRowElement){
			this._iteratorNodeChildren(treeRowElement, function(rowElement){
				rowElement.addClass('hide');
			});
			treeRowElement.removeClass('expanded');
		},
		
		_closeEditor:function(){
			this.element.find('>.grid-content').editor('close');
		},
		/**
		 * 遍历节点及其子树
		 */
		_iteratorNodeChildren:function(treeRowElement,action){
			var level = treeRowElement.attr('level');
			var levelClass="node-level-"+level;
			
			var nextElement = treeRowElement.next();
			var lastChild;
			var end = false;
			while(!end){
				lastChild = nextElement;
				nextElement = nextElement.next();
				if(nextElement.length==0)break;
				var nextLevel = nextElement.attr('level');
				end = (nextLevel<=level);
				if($.isFunction(action)){
					action.apply(this,[lastChild]);
				}
			}
			return lastChild;
		},
		
		/**
		 * 
		 */
		_initAction:function(){
			if($.sdcui.editor){//&&this.options.editable
				this.element.find('>.grid-content').scroll(function(){
					$(this).editor('close');
				}).editor();//初始化表格编辑
			}
			
			var cols = this.options.cols;
			this.element.bind('click',function(event){
				//expand-handler
				var className = $.sdcui.classUtils.getEventClass(event);
				var closeEditor = true;
				var rowElement;
				switch(className){
					case 'expand-handler':
						rowElement = $(event.target.parentNode.parentNode);
						$(this).treeGrid('trigger',rowElement);
						return;
					case 'cell':
						var cell = $(event.target);
						rowElement = cell.parents('tr:first');//行元素
						var col = cols[cell.prevAll().length-1];
						if(!cell.parent().parent().hasClass('root')){
							//非新行的不可修改项
							var editorOptions = $.extend({
								name:col.editor
							},col,{initHtml:true},col.editorOptions);
							
							$(this).find('>.grid-content').trigger('editor.open',[$(event.target),editorOptions]);
						}
						closeEditor = false;
						break;
					case 'treeNode':
						rowElement = $(event.target.parentNode);
						break;
					default:
				}
				closeEditor&&$(this).find('>.grid-content').editor('close');
				if(rowElement!=null){
					$(this).treeGrid('select',rowElement);
				}
			});
			
			var gridId = this.element.attr('id');
			
			this.options.buttonActions['addChild'] =function(){$('#'+gridId).treeGrid('addNode',{type:'child'});};
			this.options.buttonActions['addLevel'] =function(){$('#'+gridId).treeGrid('addNode',{type:'level'});};
			this.options.buttonActions['removeNode'] =function(){$('#'+gridId).treeGrid('removeNode');};
			this.options.buttonActions['saveRow'] =function(){$('#'+gridId).treeGrid('saveRow');};
			this.options.buttonActions['saveAll'] =function(){$('#'+gridId).treeGrid('saveAll');};
			
			$.sdcui.buttonUtils.addButtonActionListener(
					this.element.find('.grid-buttons'),this.options.buttonActions);
		},
		/**
		 * 选择节点
		 */
		select:function(rowElement){
			this.element.find('tr.tree-row.selected').removeClass('selected');
			rowElement.addClass('selected');
		}
	});
	
})(jQuery);