<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","123");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_123}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'jiufdh',dataType:'jiufdh',caption:'${i18n.jiufdh}',notNull:false},
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false}
		 		]
		 	});
			
			$('#form_info_${pageId}').form({
		 		fields:[
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lilkcsl'},
				{fieldType:'fieldLabel',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'uth'},
				{fieldType:'fieldLabel',property:'rukrq'},
				{fieldType:'fieldLabel',property:'jiufdh'},
				{fieldType:'fieldLabel',property:'shijkcsl'},
				{fieldType:'fieldLabel',property:'jiufyy'},
				{fieldType:'fieldLabel',property:'shijljbh'},
				{fieldType:'fieldLabel',property:'shijljsl'},
				{fieldType:'fieldLabel',property:'shijgysbh'},
				{fieldType:'fieldLabel',property:'chuljg'},
				{fieldType:'fieldLabel',property:'str2'}
		 		]
		 	});
			
			$('#form_qxjf_${pageId}').form({
		 		fields:[
				{fieldType:'fieldText',property:'quxyy',maxLength:'50',caption:'${i18n.quxyy}',width:400, notNull:true}
		 		]
		 	});
			//隐藏取消控件
			$('#form_qxjf_${pageId}').hide();
			
			$('#grid_user_${pageId}').grid({
				keyFields:['ush'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/kunei/12301.do',
				cols:[
				{property:'ush',caption:'${i18n.ush}'},
		  		{property:'baozztxx',caption:'${i18n.uszt}',internation:true},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'usxh',caption:'${i18n.usrq}'},
		  		{property:'lingjsl',caption:'${i18n.ussl}'},
		  		{property:'ucrl',caption:'${i18n.uchl}'},
		  		{property:'jiufhusxh',caption:'${i18n.jiufhusrq}'},
		  		{property:'jiufhussl',caption:'${i18n.jiufhussl}'},
		  		{property:'jiufhucrl',caption:'${i18n.jiuf}${i18n.uchl}'}
			]});
		 	
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
				//查询数据
		 		var url = "<%=request.getContextPath()%>/kunei/12301.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 			 	$('#str2 span').html(results.result.parameter.str2);  //Mantis	0011694
						 //赋值
						 $('#elh span').html(results.result.parameter.elh);
						 $('#lingjbh span').html(results.result.parameter.lingjbh);
						 $('#lilkcsl span').html(results.result.parameter.lilkcsl);
						 $('#gongysdm span').html(results.result.parameter.gongysdm);
						 $('#uth span').html(results.result.parameter.uth);
						 $('#rukrq span').html(results.result.parameter.rukrq);
						 $('#jiufdh span').html(results.result.parameter.jiufdh);
						 $('#shijkcsl span').html(results.result.parameter.shijkcsl);
						 $('#jiufyy span').html(results.result.parameter.jiufyy);
						 $('#shijljbh span').html(results.result.parameter.shijljbh);
						 $('#shijljsl span').html(results.result.parameter.shijljsl);
						 $('#shijgysbh span').html(results.result.parameter.shijgysbh);
						 $('#chuljg span').html($.sdcui.resource.i18n['C_'+results.result.parameter.chuljg]);
						 //加载grid
						 $('#grid_user_${pageId}').grid('parseResult',results);
						 if (results.result.parameter.list.length > 0){
							$('#grid_user_${pageId}').grid('focus');
						 }
						 //显示取消控件
						 $('#form_qxjf_${pageId}').show();
						 $('#btn_cancel').show();
					 } else {
						 $('#form_info_${pageId}').form('resetFields');
						 $('#grid_user_${pageId}').grid('clearRecords');
					 }
		 		});
		 	});
			
			//取消纠纷
		 	$('#btn_cancel').bind('click',function(){
		 		if ($('#jiufdh span').html()==""){
		 			return false;
		 		}
		 		//参数校验
		 		if(!$('#form_qxjf_${pageId}').form("validateParam")){
		 			return false;
		 		}
		 		//打开提示框是否取消
		 		if(confirm($.sdcui.resource.i18n['C_cancel']) != true){
		 			return false;
		 		}
		 		//获取参数
		 		var params = $('#form_info_${pageId}').form("getFormParam");
		 		params = params.concat($('#form_qxjf_${pageId}').form("getFormParam"));
		 		var url = "<%=request.getContextPath()%>/kunei/12302.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 				if (showPromptRequestMsg(results)==true){
	 					//提交成功后 重新刷新当前页面
						$('#form_user_${pageId}').form('resetFields');
						$('#form_info_${pageId}').form('resetFields');
						$('#form_qxjf_${pageId}').form('resetFields');
						$('#grid_user_${pageId}').grid('clearRecords');
						//隐藏取消控件
						$('#form_qxjf_${pageId}').hide();
						$('#btn_cancel').hide();
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
							<td>${i18n.jiufdh}:</td>
							<td><div class="ui-field" id="jiufdh"></div></td>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td><div align="center">
							<span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
							<span id="btn_cancel" class="ui-button">${i18n.qux}[F6]</span>
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
							<td><div class="ui-field" id="jiufyy"></div></td>
							<td></td>
							<td></td>
						</tr>
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
			<div id="form_qxjf_${pageId}" class="ui-fieldLayout">
	 			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.quxyy}:</td>
							<td><div class="ui-field" id="quxyy"></div></td>
						</tr>
					</tbody>
				</table> 
			<br/>
			</div>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>