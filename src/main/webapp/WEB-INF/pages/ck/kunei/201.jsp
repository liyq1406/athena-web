<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","201");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_201}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var row;          	//行数据，用于动态添加行
		var isAdd = false;
		var currentPage;		//当前页
		$(function(){
			$('#form_user_${pageId}').form({
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.ush}',notNull:false}
			]});
			//设置显示值控件
			$('#form_info_${pageId}').form({
		 		fields:[
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'gongysmc'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'danw'},
				{fieldType:'fieldLabel',property:'lingjsl'},
				{fieldType:'fieldLabel',property:'gaibzgzdh'},
				{fieldType:'fieldLabel',property:'ush'}
			]});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['liush','ush','usxh','lingjsl','uchl','xgusxh','xgussl','xguchl'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				enableCutPage:true,
				src:'<%=request.getContextPath()%>/kunei/20101.do',
				cols:[
				{property:'ush',caption:'${i18n.ush}'},      
				{property:'baozztxx',caption:'${i18n.uszt}',internation:true},      
				{property:'usxh',caption:'${i18n.usrq}'},      
				{property:'lingjsl',caption:'${i18n.ussl}'},				
				{property:'uchl',caption:'${i18n.uchl}'},
		  		{property:'xgusxh',caption:'${i18n.update}${i18n.usrq}',dataType:'letter_numeric',limitedLength:'5',notNull:true,editor:'fieldText',onenter:'validateDate()'},
		  		{property:'xgussl',caption:'${i18n.update}${i18n.ussl}',dataType:'dbnumber',notNull:true,editor:'fieldText',onenter:'validateDate()'},
		  		{property:'xguchl',caption:'${i18n.update}${i18n.uchl}',dataType:'dbnumber',maxLength:'5',notNull:true,editor:'fieldText',onenter:'validateDate()'}
			],
		 	buttons:[
	 		 	//增行
	 			{name:'addrow',caption:'${i18n.add}[F6]',keyboard:'F6',action:function(){
	 				if (row && row != null ){
	 					msgClear();
	 					if (!isAdd){
	 						currentPage = $('#grid_user_${pageId}').grid('getCurrentPage');
	 						var queryParams = $('#grid_user_${pageId}').grid("getQueryParams");
		 					$('#grid_user_${pageId}').grid('clearRecords');
		 					//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", queryParams);
	 					}
	 					//获取总行数
	 					var allRow = $('#grid_user_${pageId}').find('tr.grid-row');
	 					//最多只能添加的行数
	 				    var pageSize = $('#grid_user_${pageId}').grid('getPageSize');
	 				    if (allRow.length < pageSize){
		 				    //添加行
		 					row.liush="";
		 					row.ush="";
		 					row.usxh="";
		 					row.baozztxx="";
		 					row.usxh="";
		 					row.lingjsl="";
		 					row.uchl="";
		 					$('#grid_user_${pageId}').grid("addRow",row);
		 					isAdd = true;
			 	    		return false;
	 				    }
	 				}
	 			}},
	 			//删行
	 			{name:'deleterow',caption:'${i18n.delete}[F7]',keyboard:'F7',action:function(){
	 				if (row && row != null){
	 					msgClear();
	 					//获取选中行
	 				    var selRow = $('#grid_user_${pageId}').grid('getSelected',false);
	 				    if (selRow.length !=1){
	 				   		showPromptMsg('red','${i18n.selecterror}')
							return false;
	 				    }
	 				    if (isAdd==true){
	 				   		$('#grid_user_${pageId}').grid('deleteSelectedRow');
	 				   		return false;
	 				    } else {
							var selRowRecord = $('#grid_user_${pageId}').grid('getSelected',true);	
							var isCanDelete = false;
							for(var i=0; i<selRowRecord.length; i++){
								var vParam = selRowRecord[i].split("=");
								if (vParam[0].indexOf(".ush") != -1){
									if(vParam[1] == ""){
										isCanDelete = true;
									}
									break;
								}
							}
							if (isCanDelete == true){   //调用交易删除
								//去掉List[0];
								for(i=0;i<selRowRecord.length;i++){
									selRowRecord[i]=selRowRecord[i].toString().replace("list[0].","");
								}
								//打开提示框是否删除
								if(confirm($.sdcui.resource.i18n['C_remove']) != true){
									return false;
								}
		 						var params = $('#form_info_${pageId}').form("getFormParam");
			 					params = params.concat(selRowRecord);
					 			var url = "<%=request.getContextPath()%>/kunei/20103.do";
				  		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				  		 			if (showPromptRequestMsg(results)==true){
										 //赋值
										 $('#elh span').html(results.result.parameter.elh);
										 $('#gongysdm span').html(results.result.parameter.gongysdm);
										 $('#gongysmc span').html(results.result.parameter.gongysmc);
										 $('#lingjbh span').html(results.result.parameter.lingjbh);
										 $('#danw span').html(results.result.parameter.danw);
										 $('#lingjsl span').html(results.result.parameter.lingjsl);
										 $('#gaibzgzdh span').html(results.result.parameter.gaibzgzdh);
										 $('#ush span').html(results.result.parameter.ush);
										 //加载grid
										 $('#grid_user_${pageId}').grid('parseResult',results);
									 } 
				  				});
							} else {
								showPromptMsg('red',$.sdcui.resource.i18n['P201_P0101'])
							}
							return false;
		 				}
	 				}
	 			}}
 			]});
			
		 	//F1查询事件
		 	$('#btn_search').bind('click',function(){
		 		//清除界面值
				$('#form_info_${pageId}').form('resetFields');
				$('#grid_user_${pageId}').grid('clearRecords');
				//验证标签号
		 		if(!$('#elh input').fieldText('validateNotNull')){
		 			msgClear();
		 			if (!$('#ush input').fieldText('validateNotNull')){
		 				return;
		 			} 
		 		}
		 		//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
		 		//请求查询服务
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
		 		//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
	 			var url = "<%=request.getContextPath()%>/kunei/20101.do";
   		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
   		 			if (showPromptRequestMsg(results)==true){
	   		 			if (results.result.parameter.gaibzgzdh && results.result.parameter.gaibzgzdh !=""){
							 $('#elh input').attr("disabled",true);
							 $('#ush input').attr("disabled",true);
						 } else {
							 $('#elh input').attr("disabled",false);
							 $('#ush input').attr("disabled",false);
						 }
						 //赋值
						 $('#elh span').html(results.result.parameter.elh);
						 $('#gongysdm span').html(results.result.parameter.gongysdm);
						 $('#gongysmc span').html(results.result.parameter.gongysmc);
						 $('#lingjbh span').html(results.result.parameter.lingjbh);
						 $('#danw span').html(results.result.parameter.danw);
						 $('#lingjsl span').html(results.result.parameter.lingjsl);
						 $('#gaibzgzdh span').html(results.result.parameter.gaibzgzdh);
						 $('#ush span').html(results.result.parameter.ush);
						 //加载grid
						 $('#grid_user_${pageId}').grid('parseResult',results);
						 if (results.result.parameter.list.length > 0){
							$('#grid_user_${pageId}').grid('focus');
						 }
			    		 //为局部变量赋值 
						 row = results.result.parameter.list[0];
					 } else {
						 $('#form_info_${pageId}').form('resetFields');
						 $('#grid_user_${pageId}').grid('clearRecords');
						 row = undefined;
					 }
					 isAdd = false;
   				});
		 	});

			//F2保存事件
		 	$('#btn_save').bind('click',function(){
		 		//判断是否已经查询
		 		if ($('#elh span').html()==""){
		 			return;
		 		}
		 		//验证Grid的输入格式
		 		if (!$('#grid_user_${pageId}').grid("validate")){
		 			return;
		 		}
		 		//获取 参数 
		 		var params = $('#form_info_${pageId}').form("getFormParam");
		 		var currPage = 1;
		 		if (isAdd == true){
		 			currPage = currentPage;
			 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
			 		params = params.concat(records);
		 		} else {
			 		var currPage = $('#grid_user_${pageId}').grid('getCurrentPage') + 1;
			 		var records = $('#grid_user_${pageId}').grid('getValueChangedAll');
			 		params = params.concat(records);
		 		}
		 		var params1 =  $('#grid_user_${pageId}').grid('getCurrentPageParams',currPage);
			 	params = params.concat(params1);
		 		//请求后台交易
		 		var url = "<%=request.getContextPath()%>/kunei/20102.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 				if (results.result.parameter.gaibzgzdh && results.result.parameter.gaibzgzdh !=""){
							 $('#elh input').attr("disabled",true);
							 $('#ush input').attr("disabled",true);
						 } else {
							 $('#elh input').attr("disabled",false);
							 $('#ush input').attr("disabled",false);
						 }
						 //赋值
						 $('#elh span').html(results.result.parameter.elh);
						 $('#gongysdm span').html(results.result.parameter.gongysdm);
						 $('#gongysmc span').html(results.result.parameter.gongysmc);
						 $('#lingjbh span').html(results.result.parameter.lingjbh);
						 $('#danw span').html(results.result.parameter.danw);
						 $('#lingjsl span').html(results.result.parameter.lingjsl);
						 $('#gaibzgzdh span').html(results.result.parameter.gaibzgzdh);
						 $('#ush span').html(results.result.parameter.ush);
						 //加载grid
						 $('#grid_user_${pageId}').grid('parseResult',results);
						 if (results.result.parameter.list.length > 0){
							$('#grid_user_${pageId}').grid('focus');
						 }
						//请求成功后让当前页码加一
						 if (isAdd == false){
						 	var currPage = $('#grid_user_${pageId}').grid('getCurrentPage');
						 	$('#grid_user_${pageId}').grid('setCurrentPage',(currPage+1));
						 }
						 isAdd = false;
					 } 
				 });
			});

			//F3提交
			$('#btn_submit').bind('click',function(){
				if (isAdd == true){
					return;
				}
				//判断是否已经查询
		 		if ($('#elh span').html()==""){
		 			return;
		 		}
		 		//验证Grid的输入格式
		 		if (!$('#grid_user_${pageId}').grid("validate")){
		 			return;
		 		}
		 		//打开提示框是否提交
		 		if(confirm($.sdcui.resource.i18n['C_submit']) != true){
		 			return false;
		 		}
				//获取界面数据用于保存
				var params = $('#form_info_${pageId}').form("getFormParam");
		 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
		 		params = params.concat(records);
		 		params.push("shifdy=0");
		 		var url = "<%=request.getContextPath()%>/kunei/20104.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
						//提交成功后 重新刷新当前页面
						$('#elh input').attr("disabled",false);
						$('#ush input').attr("disabled",false);
						$('#form_user_${pageId}').form('resetFields');
						$('#form_info_${pageId}').form('resetFields');
						$('#grid_user_${pageId}').grid('clearRecords');
						row = undefined;
						isAdd = false;
					 }
				});
			}); 
			
			//F8打印
			$('#btn_print').bind('click',function(){
				if (isAdd == true){
					return;
				}
				//判断是否已经查询
		 		if ($('#elh span').html()==""){
		 			return;
		 		}
		 		//验证Grid的输入格式
		 		if (!$('#grid_user_${pageId}').grid("validate")){
		 			return;
		 		}
		 		//打开提示框是否提交
		 		if(confirm($.sdcui.resource.i18n['C_submit']) != true){
		 			return false;
		 		}
				//获取界面数据用于保存
				var params = $('#form_info_${pageId}').form("getFormParam");
		 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
		 		params = params.concat(records);
		 		params.push("shifdy=1");
		 		var url = "<%=request.getContextPath()%>/kunei/20104.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
						//提交成功后 重新刷新当前页面
						$('#elh input').attr("disabled",false);
						$('#ush input').attr("disabled",false);
						$('#form_user_${pageId}').form('resetFields');
						$('#form_info_${pageId}').form('resetFields');
						$('#grid_user_${pageId}').grid('clearRecords');
						row = undefined;
						isAdd = false;
					 }
				});
			});
			
			//F11返回上一页
			$('#btn_back').bind('click',function(){
				if (isAdd == true){
					var queryParams = $('#grid_user_${pageId}').grid("getQueryParams");
					var url = "<%=request.getContextPath()%>/kunei/20101.do";
	   		 		$('#form_user_${pageId}').form("submitUrl", queryParams, url, function(results){
	   		 			if (showPromptRequestMsg(results)==true){
							 //赋值
							 $('#elh span').html(results.result.parameter.elh);
							 $('#gongysdm span').html(results.result.parameter.gongysdm);
							 $('#gongysmc span').html(results.result.parameter.gongysmc);
							 $('#lingjbh span').html(results.result.parameter.lingjbh);
							 $('#danw span').html(results.result.parameter.danw);
							 $('#lingjsl span').html(results.result.parameter.lingjsl);
							 $('#gaibzgzdh span').html(results.result.parameter.gaibzgzdh);
							 $('#ush span').html(results.result.parameter.ush);
							 //加载grid
							 $('#grid_user_${pageId}').grid('parseResult',results);
				    		 //为局部变量赋值 
							 row = results.result.parameter.list[0];
						 } else {
							 $('#form_info_${pageId}').form('resetFields');
							 $('#grid_user_${pageId}').grid('clearRecords');
							 row = undefined;
						 }
						 isAdd = false;
	   				});
				} else {
					//获取url,重新拼装参数
					window.location.replace(window.location.href.split("?")[0]+ st_Params);
				}
			});
			
		 	$(document).keyboardsupport({});
		});
		
		 /**
		  *进入201页面后进行查询
		  */
		 $(document).ready(function(){
			var params =[] 
			params.push("currentPage=1");
			params.push("cangkbh="+st_Cangkbh)
	        var url = "<%=request.getContextPath()%>/kunei/20101.do";
		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  if (showPromptRequestMsg(results)==true){
				 if (results.result.parameter.gaibzgzdh && results.result.parameter.gaibzgzdh !=""){
					 $('#elh input').attr("disabled",true);
					 $('#ush input').attr("disabled",true);
				 } else {
					 $('#elh input').attr("disabled",false);
					 $('#ush input').attr("disabled",false);
				 }
				 //赋值
				 $('#elh input').val(results.result.parameter.elh);
				 $('#elh input').attr("defaultValue",results.result.parameter.elh)
				 $('#ush input').val(results.result.parameter.ush);
				 $('#ush input').attr("defaultValue",results.result.parameter.ush)
				 $('#elh span').html(results.result.parameter.elh);
				 $('#gongysdm span').html(results.result.parameter.gongysdm);
				 $('#gongysmc span').html(results.result.parameter.gongysmc);
				 $('#lingjbh span').html(results.result.parameter.lingjbh);
				 $('#danw span').html(results.result.parameter.danw);
				 $('#lingjsl span').html(results.result.parameter.lingjsl);
				 $('#gaibzgzdh span').html(results.result.parameter.gaibzgzdh);
				 $('#ush span').html(results.result.parameter.ush);
				 //加载grid
				 $('#grid_user_${pageId}').grid('parseResult',results);
				 if (results.result.parameter.list.length > 0){
					$('#grid_user_${pageId}').grid('focus');
				 }
				 //设置分页条件
				 var queryParams = $('#form_user_${pageId}').form("getFormParam");
				 queryParams.push("currentPage=1");
				 $('#grid_user_${pageId}').grid("setQueryParams", queryParams);
	    		 //为局部变量赋值 
				 row = results.result.parameter.list[0];
			  } else {
				 $('#elh input').attr("disabled",true);
				 $('#ush input').attr("disabled",true);
				 $('#form_info_${pageId}').form('resetFields');
				 $('#grid_user_${pageId}').grid('clearRecords');
			 	 row = undefined;
			  }
		    });
		 })
		
		//验证US数量
		function validateDate(){
			var srcTr = $(document).find(".ed");
			var sUsh = $(srcTr).find('.ush').html();
			var sUssl = $(srcTr).find('.xgussl input').val();
			var sUchl = $(srcTr).find('.xguchl input').val(); 
			if (sUsh == "" && parseFloat(sUssl) == 0){
				$($(srcTr).find('.xgussl input')).addClass('validate-error');
				showMsg($.sdcui.resource.i18n['C_V_DBNUMBER']);
				return false;
			}
			if (parseFloat(sUssl)>0 && parseFloat(sUchl) > parseFloat(sUssl)){
				$($(srcTr).find('.xguchl input')).addClass('validate-error');
				showMsg($.sdcui.resource.i18n['C_V_UCDYUS']);
				return false;
			}
			return true;
		}
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td><div align="center">
							<span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
							<span id="btn_save" class="ui-button">${i18n.save}[F2]</span>
							<span id="btn_submit" class="ui-button">${i18n.ok}[F3]</span>
							<span id="btn_print" class="ui-button">${i18n.print}[F8]</span>
							<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div><td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id="form_info_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tr>
			        <td>${i18n.elh}:</td>
					<td><div class="ui-field" id="elh"></div></td>
					<td>${i18n.gaibzgzdh}:</td>
					<td><div class="ui-field" id="gaibzgzdh"></div></td>
					 <td>${i18n.gongysdm}:</td>
			        <td><div class="ui-field" id="gongysdm"></div></td>
					<td>${i18n.gongysmc}:</td>
					<td><div class="ui-field" id="gongysmc"></div></td>
			      </tr>
			      <tr>
			      	<td>${i18n.ush}:</td>
			        <td><div class="ui-field" id="ush"></div></td>
			      	<td>${i18n.lingjbh}:</td>
			        <td><div class="ui-field" id="lingjbh"></div></td>
			        <td>${i18n.lingjdw}:</td>
			        <td><div class="ui-field" id="danw"></div></td>
					<td>${i18n.lingjsl}:</td>
					<td><div class="ui-field" id="lingjsl"></div></td>
			      </tr>
		 	 </table>		
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>