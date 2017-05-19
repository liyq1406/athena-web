<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","122");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_122}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'jiufdh',dataType:'jiufdh',caption:'${i18n.jiufdh}',notNull:false},
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}',notNull:false}
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
				{fieldType:'fieldLabel',property:'str2'}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['ush'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/kunei/12201.do',
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
			],
			buttons:[
			 	//查询
				{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
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
			 		var url = "<%=request.getContextPath()%>/kunei/12201.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results) == true){
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
							 //加载grid
							 $('#grid_user_${pageId}').grid('parseResult',results);
							 if (results.result.parameter.list.length > 0){
								$('#grid_user_${pageId}').grid('focus');
							 }
						 } else {
							 $('#form_info_${pageId}').form('resetFields');
							 $('#grid_user_${pageId}').grid('clearRecords');
						 }
			 		});
				}}
			 	//重新加载
				,{name:'back',caption:'${i18n.back}[F11]'}
			 	//返回
				,{name:'return',caption:'${i18n.return}[F12]'}
			 ]});
			
		 	$(document).keyboardsupport({});
		});
		
		//页面加载后，查询数据为界面赋值
		$(document).ready(function(){
			//判断缓存是否存在
			if ('${result}' != ''){
				var result = JSON.parse('${result}');
				//查询条件赋值
				$('#jiufdh input').val(result.result.parameter.jiufdh);
				$('#jiufdh input').attr("defaultValue",result.result.parameter.jiufdh)
				$('#jiufdh input').attr("readonly",true);
				$('#elh input').val(result.result.parameter.elh);
				$('#elh input').attr("defaultValue",result.result.parameter.elh)
				$('#elh input').attr("readonly",true);
				$('#lingjbh input').val(result.result.parameter.lingjbh);
				$('#lingjbh input').attr("defaultValue",result.result.parameter.lingjbh)
				$('#lingjbh input').attr("readonly",true);
				$('#gongysdm input').val(result.result.parameter.gongysdm);
				$('#gongysdm input').attr("defaultValue",result.result.parameter.gongysdm)
				$('#gongysdm input').attr("readonly",true);
				//界面赋值
				$('#elh span').html(result.result.parameter.elh);
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lilkcsl span').html(result.result.parameter.lilkcsl);
				$('#gongysdm span').html(result.result.parameter.gongysdm);
				$('#uth span').html(result.result.parameter.uth);
				$('#rukrq span').html(result.result.parameter.rukrq);
				$('#jiufdh span').html(result.result.parameter.jiufdh);
				$('#shijkcsl span').html(result.result.parameter.shijkcsl);
				$('#jiufyy span').html(result.result.parameter.jiufyy);
				$('#shijljbh span').html(result.result.parameter.shijljbh);
				$('#shijljsl span').html(result.result.parameter.shijljsl);
				$('#shijgysbh span').html(result.result.parameter.shijgysbh);
				$('#str2 span').html(result.result.parameter.str2);
				
				//加载grid
				$('#grid_user_${pageId}').grid('parseResult',result.result);
				if (result.result.parameter.list.length > 0){
					$('#grid_user_${pageId}').grid('focus');
				}
				//设置分页条件
				var params = $('#form_user_${pageId}').form("getFormParam");
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				if('${foward}' =='124'){
					$('#btn_search').hide();
				}
			}
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
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
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
						</tr>
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.yansdh}:</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.yanssj}:</td>
							<td><div class="ui-field" id="rukrq"></div></td>
						</tr>
						<tr>
							<td>${i18n.jiufdh}:</td>
							<td><div class="ui-field" id="jiufdh"></div></td>
							<td>${i18n.shijkcsl}:</td>
							<td><div class="ui-field" id="shijkcsl"></div></td>
							<td>${i18n.jiufyy}:</td>
							<td><div class="ui-field" id="jiufyy"></div></td>
						</tr>
						<tr>
							<td>${i18n.shijljbh}:</td>
							<td><div class="ui-field" id="shijljbh"></div></td>
							<td>${i18n.shijljsl}:</td>
							<td><div class="ui-field" id="shijljsl"></div></td>
							<td>${i18n.shijgysbh}:</td>
							<td><div class="ui-field" id="shijgysbh"></div></td>
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