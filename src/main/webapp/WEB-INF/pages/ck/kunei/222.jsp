<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","202");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_222}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		
		var isSumbit = false;    //是否已经提交
		var requestType;  //请求类型(0、零件编号   1、US号   2、EL号)
		var row;          //行数据，用于动态添加行
		var sLingjbh,sBiaoqh,sElh;
		$(function(){
			$('#btn_end').hide();
			$('#form_user_${pageId}').form({
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'pingjh',dataType:'letter_numeric',limitedLength:'12',caption:'${i18n.pingjh}',notNull:true},
				{fieldType:'fieldText',property:'shengqr',maxLength:'4',caption:'${i18n.shenqr}',notNull:true},
				{fieldType:'fieldText',property:'shengqbm',maxLength:'20',caption:'${i18n.shenqbm}',notNull:true},
				{fieldType:'fieldSelect',property:'tuiklb',caption:'${i18n.tuiklb}',notNull:true,internation:true,src:'<%=request.getContextPath()%>/common/tuiklb.do'},
				{fieldType:'fieldText',property:'keh',dataType:'xkeh',caption:'${i18n.keh}',notNull:true},
				{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh}
	 			]
	 		});
			
			$('#form_info_${pageId}').form({
				onemoredemand:true,
				fields:[
				{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldLabel',property:'danw'},
				{fieldType:'fieldText',property:'lingjsl',dataType:'dbnumber',caption:'${i18n.lingjsl}',notNull:false},
				{fieldType:'fieldLabel',property:'lingjmc'},
				{fieldType:'fieldText',biaos:'enter',property:'biaoqh',dataType:'ucush',caption:'${i18n.ucush}',notNull:false},
				{fieldType:'fieldText',property:'pich',dataType:'text',maxLength:'12',caption:'${i18n.pich}',notNull:false},
				{fieldType:'fieldText',property:'shixrq',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shixq}',notNull:false},
				{fieldType:'fieldText',biaos:'enter',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false}
				]
 			});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['gongysdm','gongysmc'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				enableCutPage:false,
				cols:[
				{property:'gongysdm',caption:'${i18n.gongysdm}'},
		  		{property:'gongysmc',caption:'${i18n.gongysmc}'}
			],
			buttons:[
				//单选
				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
					$('#grid_user_${pageId}').grid('selected');
					return false;
				}}
				//全选
				,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
						$('#grid_user_${pageId}').grid('selectedAll');
					return false;
				}}
			]});
			
			$('#grid_gbz_${pageId}').grid({
				keyFields:['usxh','ussl','usgs'],
				id:'grid_gbz_${pageId}',
				showCheckbox:false,
				enableCutPage:false,
				cols:[
		  		{property:'usxh',caption:'${i18n.usxh}',dataType:'letter_numeric',limitedLength:'5',notNull:true,editor:'fieldText'},
		  		{property:'ussl',caption:'${i18n.ussl}',dataType:'dbnumber',isPlus:true,notNull:true,editor:'fieldText'},
		  		{property:'usgs',caption:'${i18n.usgs}',dataType:'plusinteger',maxLength:'5',notNull:true,editor:'fieldText'}
			],
		 	buttons:[
	 		 	//增行
	 			{name:'addrow',caption:'${i18n.add}[F9]',keyboard:'F9',action:function(){
	 				if (row && row != null){
	 					msgClear();
	 					$('#grid_gbz_${pageId}').grid("addRow",row);
		 	    		return false;
	 				}
	 			}},
	 			//删行
	 			{name:'deleterow',caption:'${i18n.delete}[F10]',keyboard:'F10',action:function(){
	 				if (row && row != null){
	 					msgClear();
	 					var allRow = $('#grid_gbz_${pageId}').grid("getRecordAll");
		 				var selectRow = $('#grid_gbz_${pageId}').grid("getSelected",true);
		 				if (selectRow.length > 0 && allRow.length > selectRow.length){
		 					$('#grid_gbz_${pageId}').grid("deleteSelectedRow");
			 	    		return false;
		 				}
	 				}
	 			}}
 			]});
			$('#grid_gbz_${pageId}').hide();
			
			//按零件编号查询
		 	$('#lingjbh').bind('enter',function(){
				//隐藏界面并清除数据
				$('#grid_user_${pageId}').grid('clearRecords');
				$('#grid_gbz_${pageId}').grid('clearRecords');
				$('#grid_gbz_${pageId}').hide();
				requestType = undefined;
				isSumbit = false;
		 		//验证零件编号
		 		if(!$('#lingjbh').fieldText('validateNotNull')){
		 			return;
		 		}
		 		//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return;
		 		}
		 		//查询数据
	 			var params = $('#form_info_${pageId}').form("getFormParam");
	 			var url = "<%=request.getContextPath()%>/kunei/20201.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
						//赋值
						$('#form_info_${pageId}').form('resetFields');
						$('#elh input').val(results.result.parameter.elh);
			    		$('#lingjbh input').val(results.result.parameter.lingjbh);
				    	$('#danw span').html(results.result.parameter.danw);
				    	$('#lingjmc span').html(results.result.parameter.lingjmc);
				    	$('#lingjsl input').val(results.result.parameter.lingjsl);
				    	$('#pich input').val(results.result.parameter.pich);
				    	$('#shixrq input').val(results.result.parameter.shixrq);
				    	//为供应商赋值
						$('#grid_user_${pageId}').grid('parseResult',results);
				    	//默认勾选第一个
						var tRows = $('#grid_user_${pageId}').find('tr#.grid-row');
				    	if(tRows.length > 0){
				    		$(tRows[0]).addClass('checked');
				    		$(tRows[0]).find(':input[type=checkbox]').attr('checked','checked');
				    	}
						//隐藏界面并清除数据
						$('#grid_gbz_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').hide();
				    	//为局部变量赋值
						sLingjbh = results.result.parameter.lingjbh;
						sBiaoqh = results.result.parameter.biaoqh;
						sElh = results.result.parameter.elh;
						requestType = "0";
						isSumbit = false;
					 } else {
						//清除界面值
						var currLingjbh = $('#lingjbh input').val();
						var currLingjsl = $('#lingjsl input').val();
						$('#form_info_${pageId}').form('resetFields');
						//隐藏界面并清除数据
						$('#grid_user_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').hide();
						$('#lingjbh input').val(currLingjbh);
						$('#lingjsl input').val(currLingjsl);
						requestType = undefined;
						isSumbit = false;
					 }
				});
		 	});
		
		 	//按UC/US号查询
		 	$('#biaoqh').bind('enter',function(){
		 		//隐藏界面并清除数据
				$('#grid_user_${pageId}').grid('clearRecords');
				$('#grid_gbz_${pageId}').grid('clearRecords');
				$('#grid_gbz_${pageId}').hide();
				requestType = undefined;
				isSumbit = false;
		 		//验证标签号
		 		if(!$('#biaoqh input').fieldText('validateNotNull')){
		 			return;
		 		}
		 		//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return;
		 		}
	 			var params = $('#form_info_${pageId}').form("getFormParam");
	 			var url = "<%=request.getContextPath()%>/kunei/20204.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
						//赋值
						$('#form_info_${pageId}').form('resetFields');
						$('#keh input').val(results.result.parameter.keh);
						$('#biaoqh input').val(results.result.parameter.biaoqh);
						$('#elh input').val(results.result.parameter.elh);
				    	$('#lingjbh input').val(results.result.parameter.lingjbh);
				    	$('#danw span').html(results.result.parameter.danw);
				    	$('#lingjmc span').html(results.result.parameter.lingjmc);
				    	$('#lingjsl input').val(results.result.parameter.lingjsl);
						$('#pich input').val(results.result.parameter.pich);
						$('#shixrq input').val(results.result.parameter.shixrq);
						//为供应商赋值
						$('#grid_user_${pageId}').grid('parseResult',results);
						//默认勾选第一个
						var tRows = $('#grid_user_${pageId}').find('tr#.grid-row');
				    	if(tRows.length > 0){
				    		$(tRows[0]).addClass('checked');
				    		$(tRows[0]).find(':input[type=checkbox]').attr('checked','checked');
				    	}
						//隐藏界面并清除数据
						$('#grid_gbz_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').hide();
						//为局部变量赋值
						sLingjbh = results.result.parameter.lingjbh;
						sBiaoqh = results.result.parameter.biaoqh;
						sElh = results.result.parameter.elh;
						requestType = "1";
						isSumbit = false;
					 } else {
						var currUsh = $('#biaoqh input').val();
						$('#form_info_${pageId}').form('resetFields');
						//隐藏界面并清除数据
						$('#grid_user_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').hide();
						$('#biaoqh input').val(currUsh);
						requestType = undefined;
						isSumbit = false;
					 }
				});
		 	});
		 	
		 	//按EL号查询
		 	$('#elh').bind('enter',function(){
		 		//隐藏界面并清除数据
				$('#grid_user_${pageId}').grid('clearRecords');
				$('#grid_gbz_${pageId}').grid('clearRecords');
				$('#grid_gbz_${pageId}').hide();
				requestType = undefined;
				isSumbit = false;
		 		//验证标签号
		 		if(!$('#elh input').fieldText('validateNotNull')){
		 			return;
		 		}
		 		//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return;
		 		}
	 			var params = $('#form_info_${pageId}').form("getFormParam");
	 			var url = "<%=request.getContextPath()%>/kunei/20201.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
						//赋值
						$('#form_info_${pageId}').form('resetFields');
						$('#biaoqh input').val(results.result.parameter.biaoqh);
						$('#elh input').val(results.result.parameter.elh);
				    	$('#lingjbh input').val(results.result.parameter.lingjbh);
				    	$('#danw span').html(results.result.parameter.danw);
				    	$('#lingjmc span').html(results.result.parameter.lingjmc);
				    	$('#lingjsl input').val(results.result.parameter.lingjsl);
						$('#pich input').val(results.result.parameter.pich);
						$('#shixrq input').val(results.result.parameter.shixrq);
						//为供应商赋值
						$('#grid_user_${pageId}').grid('parseResult',results);
						//默认勾选第一个
						var tRows = $('#grid_user_${pageId}').find('tr#.grid-row');
				    	if(tRows.length > 0){
				    		$(tRows[0]).addClass('checked');
				    		$(tRows[0]).find(':input[type=checkbox]').attr('checked','checked');
				    	}
						//隐藏界面并清除数据
						$('#grid_gbz_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').hide();
						//为局部变量赋值
						sLingjbh = results.result.parameter.lingjbh;
						sBiaoqh = results.result.parameter.biaoqh;
						sElh = results.result.parameter.elh;
						requestType = "2";
						isSumbit = false;
					 } else {
						 var currElh = $('#elh input').val();
						$('#form_info_${pageId}').form('resetFields');
						//隐藏界面并清除数据
						$('#grid_user_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').grid('clearRecords');
						$('#grid_gbz_${pageId}').hide();
						$('#elh input').val(currElh);
						requestType = undefined;
						isSumbit = false;
					 }
				});
		 	});
		 	
		 	//F3提交
			$('#btn_submit').bind('click',function(){
				if (requestType) {
					$('#lingjbh input').val(sLingjbh);
					$('#biaoqh input').val(sBiaoqh);
					$('#elh input').val(sElh);
				}else{
					return false;
				}
				//零件数量不能为空
		 		if(!$('#lingjsl').fieldText('validateNotNull')){
		 			return;
		 		}
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
				//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return;
		 		}
				//验证供应商是否选择
		 		var paramsGys = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(paramsGys.length != 2){
					showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				//去掉List[0];
				for(i=0;i<paramsGys.length;i++){
					paramsGys[i]=paramsGys[i].toString().replace("list[0].","");
				}
		 		//获取提交参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				var paramsInfo = $('#form_info_${pageId}').form("getFormParam");
		 		params = params.concat(paramsInfo);
		 		params = params.concat(paramsGys);
				if (isSumbit == false){            //还未推荐改包装数据
					if (requestType == "0" || requestType == "2"){
						var url = "<%=request.getContextPath()%>/kunei/20202.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 				$('#grid_gbz_${pageId}').show();
				 				$('#grid_gbz_${pageId}').grid('parseResult',results);
								row =  results.result.parameter.list[0];
								isSumbit = true;
								$('#btn_end').show();
							 } else {
								 $('#grid_gbz_${pageId}').grid('clearRecords');
								 $('#grid_gbz_${pageId}').hide();
								 isSumbit = false;
							 }
						});
					} else {
						var url = "<%=request.getContextPath()%>/kunei/20206.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							//提交成功后 重新刷新当前页面
							//$('#form_user_${pageId}').form('resetFields');
							$('#form_info_${pageId}').form('resetFields');
							$('#grid_user_${pageId}').grid('clearRecords');
							$('#grid_gbz_${pageId}').grid('clearRecords');
							$('#grid_gbz_${pageId}').hide();
							$('#cangkbh span').html(st_Cangkbh);
							requestType = undefined;
							row = undefined;
							isSumbit = false;
						 }
					});
					}
					
				}
			}); 
			
		 	
			//F7结束录入 2013-2-1 夏晖
		 	$('#btn_end').bind('click',function(){
				if (requestType) {
					$('#lingjbh input').val(sLingjbh);
					$('#biaoqh input').val(sBiaoqh);
					$('#elh input').val(sElh);
				}else{
					return false;
				}
				//零件数量不能为空
		 		if(!$('#lingjsl').fieldText('validateNotNull')){
		 			return;
		 		}
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
				//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return;
		 		}
				//验证供应商是否选择
		 		var paramsGys = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(paramsGys.length != 2){
					showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				//去掉List[0];
				for(i=0;i<paramsGys.length;i++){
					paramsGys[i]=paramsGys[i].toString().replace("list[0].","");
				}
		 		//获取提交参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				var paramsInfo = $('#form_info_${pageId}').form("getFormParam");
		 		params = params.concat(paramsInfo);
		 		params = params.concat(paramsGys);
					//提交改包装数据
					//验证Grid的输入格式
			 		if (!$('#grid_gbz_${pageId}').grid("validate")){
			 			return;
			 		}
					//获取交易链接 ,22203.do是通过零件正常退库 hzg 2014.9.19
			 		var url = "";
			 		if (requestType == "0" || requestType == "2"){
						url = "<%=request.getContextPath()%>/kunei/22203.do";
					} else if (requestType == "1"){
						url = "<%=request.getContextPath()%>/kunei/20206.do";
					}
			 		//验证改包装数量必须等于改包装实际零件数量
		 			var lingjsl = parseFloat($('#lingjsl input').val());
		 			var sumLjsl = 0;
		 			var columnUssl= $('#grid_gbz_${pageId}').grid("getColumnValue","ussl");
		 			var columnUsgs= $('#grid_gbz_${pageId}').grid("getColumnValue","usgs");
		 			for(i=0;i<columnUssl.length;i++){
		 				sumLjsl+= (parseFloat(columnUssl[i]) * parseFloat(columnUsgs[i]));
		 			}
		 			if (lingjsl != sumLjsl){
						showPromptMsg('red','${i18n.caogljzs}')
						return false;
		 			}
			 		var records = $('#grid_gbz_${pageId}').grid('getRecordAll');
			 		params = params.concat(records);
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							//提交成功后 重新刷新当前页面
							//$('#form_user_${pageId}').form('resetFields');
							$('#form_info_${pageId}').form('resetFields');
							$('#grid_user_${pageId}').grid('clearRecords');
							$('#grid_gbz_${pageId}').grid('clearRecords');
							$('#grid_gbz_${pageId}').hide();
							$('#cangkbh span').html(st_Cangkbh);
							requestType = undefined;
							row = undefined;
							isSumbit = false;
							$('#btn_end').hide();
						 }
					});
			}); 

		 	$(document).keyboardsupport({});
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
		<div id="title"></div>
		<div id="form_user_${pageId}" class="ui-fieldLayout">
		 	<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.pingjh}:</td>
						<td><div class="ui-field" id="pingjh"></div></td>
						<td>${i18n.shenqr}:</td>
						<td><div class="ui-field" id="shengqr"></div></td>
						<td>${i18n.shenqbm}:</td>
						<td><div class="ui-field" id="shengqbm"></div></td>
					</tr>	
					<tr>
						<td>${i18n.tuiklb}:</td>
						<td><div class="ui-field" id="tuiklb"></div></td>
						<td>${i18n.keh}:</td>
						<td><div class="ui-field" id="keh"></div></td>
						<td>${i18n.cangk}:</td>
						<td><div class="ui-field" id="cangkbh"></div></td>
					</tr>	
				</tbody>
			</table> 
		</div>
		<br/>
		<div id="form_info_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.lingjbh}:</td>
						<td><div class="ui-field" id="lingjbh"></div></td>
						<td>${i18n.lingjsl}:</td>
						<td><div class="ui-field" id="lingjsl"></div></td>
						<td>${i18n.lingjmc}:</td>
						<td><div class="ui-field" id="lingjmc"></div></td>
					</tr>	
					<tr>
						<td>${i18n.ucush}:</td>
						<td><div class="ui-field" id="biaoqh"></div></td>
						<td>${i18n.pich}:</td>
						<td><div class="ui-field" id="pich"></div></td>
						<td>${i18n.lingjdw}:</td>
						<td><div class="ui-field" id="danw"></div></td>
					</tr>	
					<tr>
						<td>${i18n.elh}:</td>
						<td><div class="ui-field" id="elh"></div></td>
						<td>${i18n.shixq}:</td>
						<td><div class="ui-field" id="shixrq"></div></td>
					</tr>	
				</tbody>
			</table> 
		</div>
		<br/>
		<div id="grid_user_${pageId}"></div>
		<br/>
		<div id="grid_gbz_${pageId}"></div>
		<div>
		<table class="ui-grid" cellspacing="1" width="100%">
			<tbody>
				<tr>
					<td><div><span id="btn_submit" class="ui-button">${i18n.ok}[F3]</span>
					<span id="btn_end" class="ui-button">${i18n.endinput}[F7]</span>
					<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
					<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div><td>
				</tr>
			</tbody>
		</table> 
		</div>
		<br/>
		<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>