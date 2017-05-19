<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId", "119");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_119}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
			var isSumbit = false;    //是否已经提交
		    var row;           //行数据，用于动态添加行
			$(function(){
				$('#form_user_${pageId}').form({
				    onreload:true,
					url:'<%=request.getContextPath()%>/shouhuo/11901.do',
					fields:[
						{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:true},
						{fieldType:'fieldSelect',property:'xuh',caption:'${i18n.shifqzgbz}',value:'N',realValue:'0',notNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'}
					]
				});
				
				$('#form_info_${pageId}').form({
			 		fields:[
						{fieldType:'fieldLabel',property:'lingjbh'},
						{fieldType:'fieldLabel',property:'lingjmc'},
						{fieldType:'fieldLabel',property:'lingjsl'}
			 		]
		 		});
			$('#grid_user_${pageId}').grid({
				keyFields:['usxh','lingjsl','usgs','shifdj'],
				enableCutPage:false,
				id:'grid_user_${pageId}',
					cols:[
						{property:'usxh',caption:'${i18n.usxh}',notNull:true,editor:'fieldText',dataType:'letter_numeric',limitedLength:'5'},
						{property:'lingjsl',caption:'${i18n.lingjsl}',notNull:true,editor:'fieldText',isPlus:true,dataType:'dbnumber'},
						{property:'usgs',caption:'${i18n.usgs}',notNull:true,editor:'fieldText',dataType:'positive',maxLength:'5'},
						{property:'shifdj',caption:'${i18n.shifdj}',notNull:true,editor:'fieldText',dataType:'yesno'}
			     	],	
				buttons:[
		 		 	//增行
		 			{name:'addrow',caption:'${i18n.add}[F9]',keyboard:'F9',action:function(){
		 				if (row && row != null){
		 					$('#grid_user_${pageId}').grid("addRow",row);
			 	    		return false;
		 				}
		 			}}
		 			//删行
		 			,{name:'deleterow',caption:'${i18n.delete}[F10]',keyboard:'F10',action:function(){
		 				if (row && row != null){
		 					var allRow = $('#grid_user_${pageId}').grid("getRecordAll");
			 				var selectRow =$('#grid_user_${pageId}').grid("getSelected",true);
			 				if (selectRow.length > 0 && allRow.length > selectRow.length){
			 					$('#grid_user_${pageId}').grid("deleteSelectedRow");
				 	    		return false;
			 				}
		 				}
		 			}}
	 			]});
 			
			$('#btn_search').bind('click',function(){
				if(!$('#form_user_${pageId}').form("validateParam")){
					return ;
				}
				$('#form_info_${pageId}').form('clearValue');
				$('#grid_user_${pageId}').grid('clearRecords');
				//获取参数
			 	var params = $('#form_user_${pageId}').form("getFormParam");
				var url = "<%=request.getContextPath()%>/shouhuo/11901.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 		if (showPromptRequestMsg(results)==true){
 			        if(results.result.response =="0001"){
						//加载返回数据
						$('#lingjbh span').html(results.result.parameter.lingjbh);
				    	$('#lingjmc span').html(results.result.parameter.lingjmc);
				    	$('#lingjsl span').html(results.result.parameter.lingjsl);
				    	 //加载grid
						$('#grid_user_${pageId}').grid('parseResult',results);
						row = results.result.parameter.list[0];
					}
				  }
				});
				return  false;
			}); 	
				
 			//F2提交数据
		 	$('#btn_submit').bind('click',function(){
		 	//是否做过查询
		 		if(!$('#form_user_${pageId}').form("validateParam")){
					return ;
				}
		 		//打开提示框是否提交
		 		if(confirm($.sdcui.resource.i18n['C_submit']) != true){
		 			return false;
		 		}
		 		//获取参数
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		//验证Grid的输入格式
			 	if (!$('#grid_user_${pageId}').grid("validate")){
			 			return false;
			 		}
		 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
		 		if(records.length == 0){
		 		 showPromptMsg('red','${i18n.elwk}');
		 		 return ;
		 		}
			 		//验证改包装数量必须等于改包装实际零件数量
			 		//alert ($("#lingjsl").fieldLabel('getValue'));
		 			var lingjsl = parseFloat($('#lingjsl span').html());
		 			var sumLjsl = 0;
		 			//数据提交
			 	
		 			var columnUssl= $('#grid_user_${pageId}').grid("getColumnValue","lingjsl");
		 			var columnUsgs= $('#grid_user_${pageId}').grid("getColumnValue","usgs");
		 			for(i=0;i<columnUssl.length;i++){
		 				sumLjsl+= (parseFloat(columnUssl[i]) * parseFloat(columnUsgs[i]));
		 			}
		 			if (lingjsl != sumLjsl){
						showPromptMsg('red','${i18n.caogljzs}');
						return false;
		 			}
		 			
			 		params = params.concat(records);
			 		 var url = "<%=request.getContextPath()%>/shouhuo/11902.do";
				 	 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
									//提交成功后 重新刷新当前页面
								    $('#grid_user_${pageId}').grid('clearRecords');
								    $('#form_info_${pageId}').form('clearValue');
								    $('#form_user_${pageId}').form('clearValue');
									row = undefined;
									isSumbit = false;
								}
						});
                       return false;
					});
		      $(document).keyboardsupport({});
	       });
</script>

</head>
<body>
	<div style="padding: 20px;">
		<div id="title"></div>
		<div id="form_user_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.elh}</td>
						<td><div class="ui-field" id="elh"></div></td>
						<td>${i18n.shifqzgbz}</td>
						<td><div class="ui-field" id="xuh"></div></td>
						<td><div style="text-align: right">
								<span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
								<span id="btn_submit" class="ui-button">${i18n.ok}[F2]</span> 
								<span id="btn_back" class="ui-button">${i18n.back}[F11]</span> 
								<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="form_info_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.lingjbh}</td>
						<td><div class="ui-field" id="lingjbh"></div></td>
						<td>${i18n.lingjmc}</td>
						<td><div class="ui-field" id="lingjmc"></div></td>
						<td>${i18n.lingjsl}</td>
						<td><div class="ui-field" id="lingjsl"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid_user_${pageId}"></div>
	    <div id='prompt'>${i18n.prompt}</div>
     </div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>