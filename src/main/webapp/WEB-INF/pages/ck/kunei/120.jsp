<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","120");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_120}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript"> 
		var paramsQuery; 
		$(function(){
			$('#form_user_${pageId}').form({
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:true}
		 		]
		 	});
			
			$('#form_info_${pageId}').form({
		 		fields:[
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lilkcsl'},
				{fieldType:'fieldLabelInput',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'uth'},
				{fieldType:'fieldLabel',property:'rukrq'},
				{fieldType:'fieldLabel',property:'jiufdh'},
				{fieldType:'fieldText',property:'shijkcsl',dataType:'dbnumber',caption:'${i18n.shijkcsl}',notNull:true},
				{fieldType:'fieldSelect',property:'jiufyySel',biaos:'enter',caption:'${i18n.jiufyy}',notNull:false,includeNull:true,src:'<%=request.getContextPath()%>/common/jiufyy.do'},
				{fieldType:'fieldLabel',property:'jiufyy'},
				
				//xss_20161121_0011694
				{fieldType:'fieldText',property:'shijljbh',biaos:'enter',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.shijljbh}',notNull:false},
				{fieldType:'fieldSelect',property:'str2',caption:'${i18n.shijljckbh}',notNull:false},
				
				{fieldType:'fieldText',property:'shijljsl',dataType:'dbnumber',caption:'${i18n.shijljsl}',notNull:false},
				{fieldType:'fieldText',property:'shijgysbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.shijgysbh}',notNull:false},
				{fieldType:'fieldSelect',property:'chuljg',caption:'${i18n.chuljg}',notNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
				{fieldType:'fieldText', property:'str1', caption:'${i18n.suopdh}',dataType:'shuzzm',maxLength:'10'} //Mantis	0010459
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['ush','usxh','lingjsl','ucrl','jiufhusxh','jiufhussl','jiufhucrl','shijljbh','str2'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/kunei/12001.do',
				cols:[
				{property:'ush',caption:'${i18n.ush}'},
		  		{property:'baozztxx',caption:'${i18n.uszt}',internation:true},
		  		{property:'usxh',caption:'${i18n.usrq}'},
		  		{property:'lingjsl',caption:'${i18n.ussl}'},
		  		{property:'ucrl',caption:'${i18n.uchl}'},
		  		{property:'jiufhusxh',caption:'${i18n.jiufhusrq}',dataType:'letter_numeric',limitedLength:'5',notNull:true,editor:'fieldText'},
		  		{property:'jiufhussl',caption:'${i18n.jiufhussl}',dataType:'dbnumber',notNull:true,editor:'fieldText'},
		  		{property:'jiufhucrl',caption:'${i18n.jiuf}${i18n.uchl}',dataType:'dbnumber',notNull:true,editor:'fieldText'}
			]});
			
			//xss_0011694_20161121
			$('#shijljbh').bind('enter',function (){
			 		if(!$('#shijljbh').fieldText('validateNotNull')){
			 			return;
			 		}
			 		var params = [];  
			 		shijljckbh_size = 0; 
			 		
			 		params.push("shijljbh="+$('#shijljbh input').val());
						 var url = "<%=request.getContextPath()%>/kunei/12005.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (results.result.parameter.list.length > 0){
								 showPromptMsg('blue',$.sdcui.resource.i18n['C_SHIJLJCKBH']);
												
								var shijljbh  = $('#shijljbh input').val(); 
					 			$('#str2').fieldSelect('clearSelect');
								$('#str2').fieldSelect('resetUrl','<%=request.getContextPath()%>/kunei/12005.do?shijljbh='+shijljbh);	
								$('#str2 input').attr("disabled",false);
							 } else { //无值
								showPromptMsg('blue',$.sdcui.resource.i18n['C_SCJ_S_01']);
								
							 }
							 });
			 	});
			 	
			function flagchange(){ 
					 	var shijljbh  = $('#shijljbh input').val(); 
					 	$('#str2').fieldSelect('clearSelect');
						$('#str2').fieldSelect('resetUrl','<%=request.getContextPath()%>/kunei/12005.do?shijljbh='+shijljbh);	
					}	
					
			
		 	//获取纠纷原因
		 	$('#jiufyySel').bind('enter',function(){
		 		//获取纠纷原因
		 		var currentJfyy = $('#jiufyySel input').attr("realValue");
		 		if (currentJfyy == ""){
		 			return ;
		 		}
		 		var listJfyy =  $('#jiufyy span').html().split(",");
		 		if (listJfyy == 0){
		 			$('#jiufyy span').html(currentJfyy);
		 			return;
		 		} else {
		 			var isExist = false;
			 		for(var i=0; i<listJfyy.length; i++){
			 			if (listJfyy[i] == currentJfyy){
			 				listJfyy.splice(i,1);
			 				isExist = true;
			 			}
			 		}
			 		if (isExist == false){
			 			$('#jiufyy span').html($('#jiufyy span').html()+ "," +currentJfyy)
			 		} else {
			 			$('#jiufyy span').html(listJfyy.toString())
			 		}
		 		}
		 	});
			
			//F1查询事件
		 	$('#btn_search').bind('click',function(){
		 		//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
					$('#form_info_${pageId}').form('resetFields');
					$('#grid_user_${pageId}').grid('clearRecords');
		 			return;
		 		}
		 		//查询数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
		 		var url = "<%=request.getContextPath()%>/kunei/12001.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
						 //赋值
						 $('#elh span').html(results.result.parameter.elh);
						 $('#lingjbh span').html(results.result.parameter.lingjbh);
						 $('#lilkcsl span').html(results.result.parameter.lilkcsl);
						 $('#gongysdm span').html(results.result.parameter.gongysdm);
						 $('#gongysdm input').val(results.result.parameter.gongysdm);
						 $('#uth span').html(results.result.parameter.uth);
						 $('#rukrq span').html(results.result.parameter.rukrq);
						 $('#jiufdh span').html(results.result.parameter.jiufdh);
						 $('#shijkcsl input').val(results.result.parameter.shijkcsl);
						 $('#jiufyy span').html(results.result.parameter.jiufyy);
						 $('#shijljbh input').val(results.result.parameter.shijljbh);
						 $('#shijljsl input').val(results.result.parameter.shijljsl);
						 $('#shijgysbh input').val(results.result.parameter.shijgysbh);
						 $('#chuljg input').attr("realValue",results.result.parameter.chuljg);
						 $('#str1 input').val(results.result.parameter.str1);  //Mantis	0010459
						 $('#chuljg input').val($.sdcui.resource.i18n['C_'+results.result.parameter.chuljg]);
						
						 $('#str2 input').val(results.result.parameter.str2);  //Mantis	0011694
						  
						 //加载grid
						 $('#grid_user_${pageId}').grid('parseResult',results);
					 } else {
						 $('#form_info_${pageId}').form('resetFields');
						 $('#grid_user_${pageId}').grid('clearRecords');
					 }
		 		});
		 		//$('#str2 input').attr("disabled",false);
		 		 //$('#elh input').focus();
		 	});
			
		 	//F2保存当前页纠纷明细
		 	$('#btn_save').bind('click',function(){
		 	//$('#elh input').focus();
		 	
		 		//如果输入了实际零件编号，那么实际零件仓库 ，必须选择一个 
				if ($('#shijljbh input').val()!=""){ 
		 			if($('#str2 input').val()==""){ 
			 			alert("实际零件仓库编号不能为空！")
			 		}
		 		} 					
		 	
		 	
		 		if($('#elh span').html()==""){
		 			return;
		 		}
		 		//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return;
		 		}
		 		//验证纠纷原因
		 		if ($('#jiufyy span').html()==""){
		 			$('#jiufyySel input').val("");
		 			$('#jiufyySel input').attr("realValue","");
		 			if(!$('#jiufyySel').fieldSelect("validateNotNull")){
			 			return;
			 		}
		 		} 
		 		
		 		
		 		
		 		
		 		//验证Grid的输入格式
		 		if (!$('#grid_user_${pageId}').grid("validate")){
		 			return;
		 		}
		 		var currPage = $('#grid_user_${pageId}').grid('getCurrentPage');
		 		var params = $('#form_info_${pageId}').form("getFormParam");
		 		var params1 =  $('#grid_user_${pageId}').grid('getCurrentPageParams',(currPage+1));
		 		
		 		var str2 = $('#str2 input').val();
		 		if(str2 !=""){
		 			params.splice(14,15);
		 			params.push("str2="+str2);
		 		}
		 		
		 		params = params.concat(params1);
		 		
		 		var records = $('#grid_user_${pageId}').grid('getValueChangedAll');
		 		params = params.concat(records);
		 		var url = "<%=request.getContextPath()%>/kunei/12002.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
						 //赋值
						 $('#elh span').html(results.result.parameter.elh);
						 $('#lingjbh span').html(results.result.parameter.lingjbh);
						 $('#lilkcsl span').html(results.result.parameter.lilkcsl);
						 $('#gongysdm span').html(results.result.parameter.gongysdm);
						 $('#gongysdm input').val(results.result.parameter.gongysdm);
						 $('#uth span').html(results.result.parameter.uth);
						 $('#rukrq span').html(results.result.parameter.rukrq);
						 $('#jiufdh span').html(results.result.parameter.jiufdh);
						 //加载grid
						 $('#grid_user_${pageId}').grid('parseResult',results);
						//请求成功后让当前页码加一
						 $('#grid_user_${pageId}').grid('setCurrentPage',(currPage+1));
					 } 
				 });
		 	}); 
			
		 	//F3提交数据
		 	$('#btn_sumbit').bind('click',function(){
				//如果输入了实际零件编号，那么实际零件仓库 ，必须选择一个 
				if ( $('#shijljbh input').val()!="" ){ 
		 			if( $('#str2 input').val()=="" ){ 
			 			alert("实际零件仓库编号不能为空！")
			 		}
		 		} 		
		 		
		 		//是否做过查询
		 		if($('#elh span').html()==""){
		 			return;
		 		}
		 		//零件数量，零件编号和供应商编码要么都为空要么都不为空
		 		if($('#shijljbh input').val() != "" || $('#shijljbh input').val() != ""
		 			|| ($('#shijljsl input').val() != "" && parseFloat($('#shijljsl input').val()) > 0)){
		 			//验证实际零件编号
			 		if(!$('#shijljbh').fieldText('validateNotNull')){
			 			return;
			 		}
			 		//验证实际零件数量
			 		if(!$('#shijljsl').fieldText('validateNotNull')){
			 			return;
			 		}
			 		//验证实际供应商代码
			 		if(!$('#shijgysbh').fieldText('validateNotNull')){
			 			return;
			 		}
		 		}
		 		//参数校验
		 		if(!$('#form_info_${pageId}').form("validateParam")){
		 			return false;
		 		}
		 		//验证纠纷原因
		 		if ($('#jiufyy span').html()==""){
		 			$('#jiufyySel input').val("");
		 			$('#jiufyySel input').attr("realValue","");
		 			if(!$('#jiufyySel').fieldSelect("validateNotNull")){
			 			return;
			 		}
		 		}
		 		//打开提示框是否提交
		 		if(confirm($.sdcui.resource.i18n['C_submit']) != true){
		 			return false;
		 		}
		 		//获取参数
		 		var params = $('#form_info_${pageId}').form("getFormParam");
		 		//验证Grid的输入格式
		 		if (!$('#grid_user_${pageId}').grid("validate")){
		 			return false;
		 		}
		 		
		 		var str2 = $('#str2 input').val();
		 		if(str2 !=""){
		 			params.splice(14,15);
		 			params.push("str2="+str2);
		 		}
		 		
		 		var records = $('#grid_user_${pageId}').grid('getValueChangedAll');
		 		params = params.concat(records);
		 		var url = "<%=request.getContextPath()%>/kunei/12003.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
						//判断是否要改包装
						 if(parseFloat(results.result.parameter.shijljsl)>0){  //需要改包装
							//存放查询条件
							var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
							$('#serachKey').val(vQuery);
							//跳转改包装页面
							var strJSON = JSON.stringify(results);
							$('#putvalue').val(strJSON);
							$("#putform").attr("action","<%=request.getContextPath()%>/kunei/P12001.do"+st_Params);
    			    		document.putform.submit();
						 } else {                                              //不需要改包装
							//提交成功后 重新刷新当前页面
							$('#form_user_${pageId}').form('resetFields');
							$('#form_info_${pageId}').form('resetFields');
							$('#grid_user_${pageId}').grid('clearRecords');
						 }
					 }
				 });
		 	});

			$(document).keyboardsupport({});
		});
		
		//加载时判断是否是回退
		$(document).ready(function(){ 
			$('#str2 input').attr("disabled",true);
			if ( $('#serachKey').val()!=""){
				//为界面查询字段赋值
				var params = $('#serachKey').val().split(",");
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("elh") != -1){                   //EL号
						$('#elh input').val(vParam[1]);
						continue;
					}
				}
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//查询数据
		 		var url = "<%=request.getContextPath()%>/kunei/12001.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 				 $('#str2 input').val(results.result.parameter.str2);  //Mantis	0011694
								
						 //赋值
						 $('#elh span').html(results.result.parameter.elh);
						 $('#lingjbh span').html(results.result.parameter.lingjbh);
						 $('#lilkcsl span').html(results.result.parameter.lilkcsl);
						 $('#gongysdm span').html(results.result.parameter.gongysdm);
						 $('#gongysdm input').val(results.result.parameter.gongysdm);
						 $('#uth span').html(results.result.parameter.uth);
						 $('#rukrq span').html(results.result.parameter.rukrq);
						 $('#jiufdh span').html(results.result.parameter.jiufdh);
						 $('#shijkcsl input').val(results.result.parameter.shijkcsl);
						 $('#jiufyy span').html(results.result.parameter.jiufyy);
						 $('#shijljbh input').val(results.result.parameter.shijljbh);
						 $('#shijljsl input').val(results.result.parameter.shijljsl);
						 $('#shijgysbh input').val(results.result.parameter.shijgysbh);
						 $('#chuljg input').attr("realValue",results.result.parameter.chuljg);
						 $('#chuljg input').val($.sdcui.resource.i18n['C_'+results.result.parameter.chuljg]);
						 //加载grid
						 $('#grid_user_${pageId}').grid('parseResult',results);
						 msgClear();
					 } else {
						 $('#form_user_${pageId}').form('resetFields');
						 $('#form_info_${pageId}').form('resetFields');
						 $('#grid_user_${pageId}').grid('clearRecords');
						 msgClear();
					 }
		 		});
			}
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
	 			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td><div align="center">
							<span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
							<span id="btn_save" class="ui-button">${i18n.save}[F2]</span>
							<span id="btn_sumbit" class="ui-button">${i18n.ok}[F3]</span>
							<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div><td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br>
			<div id="form_info_${pageId}" class="ui-fieldLayout">
	 			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lilkcsl}:</td>
							<td><div class="ui-field" id="lilkcsl"></div></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.yansdh}:</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.yanssj}:</td>
							<td><div class="ui-field" id="rukrq"></div></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>${i18n.jiufdh}:</td>
							<td><div class="ui-field" id="jiufdh"></div></td>
							<td>${i18n.shijkcsl}:</td>
							<td><div class="ui-field" id="shijkcsl"></div></td>
							<td>${i18n.jiufyy}:</td>
							<td><div class="ui-field" id="jiufyySel"></div>
							<div class="ui-field" id="jiufyy"></div></td>
							<td>${i18n.suopdh}:</td>
							<td><div class="ui-field" id="str1"></div></td>
						<tr>
							<td>${i18n.shijljbh}:</td>
							<td><div class="ui-field" id="shijljbh"></div></td>
							<td>${i18n.shijljsl}:</td>
							<td><div class="ui-field" id="shijljsl"></div></td>
							<td>${i18n.shijgysbh}:</td>
							<td><div class="ui-field" id="shijgysbh"></div></td>
							<td>${i18n.chuljg}:</td>
							<td><div class="ui-field" id="chuljg"></div></td>
						</tr>
						<tr>
							<td>${i18n.shijljckbh}:</td>
							<td><div class="ui-field" id="str2"></div></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>