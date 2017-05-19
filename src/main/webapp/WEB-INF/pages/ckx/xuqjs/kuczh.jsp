 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	 用户中心
	 @author denggq
	 @date 2012-3-19
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.i18n_common">
	<t:grid id="grid_usercenter" caption="${i18n.kuczh }" 
		src="/xuqjs/queryKuczh.ajax"	
		removeSrc="/xuqjs/removeKuczh.ajax"	
		saveRowsSrcs="/xuqjs/saveKuczh.ajax"
		idKeys="usercenter,cangk"  
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="10"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
		>
		<t:fieldLayout id="layout" prefix="kuczh" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="cangk" caption="${i18n.cangk}" maxLength="20" width="150"/>
			<t:fieldSelect property="iskaolckjs" caption="${i18n.iskaolckjs}" convert="iskaolckjs" defaultValue="1" width="100"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  editor="fieldText" width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="cangk" caption="${i18n.cangk}" editor="fieldText" width="160" editorOptions="{closeEvent:func_set_centername,'maxLength':'10'}"/>
		<t:gridCol property="iskaolckjs" caption="${i18n.iskaolckjs}" convert="iskaolckjs" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}" width="200"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">
	//标识位
	$.sdcui.serverConfig.convertArray['usercenter'] = {
		'UL' : 'UL',
		'UW' : 'UW',	
		'VD' : 'VD'
	};

	//标识
	$.sdcui.serverConfig.convertArray['iskaolckjs'] = {
		'1' : '${i18n.shi}',
		'2' : '${i18n.fou}'
	};
	
	//空格查询
	function grid_usercenter_beforeSubmit() {
		$("#kuczh_usercenter").fieldValue(trim($("#kuczh_usercenter").fieldValue()));
		$("#kuczh_cangk").fieldValue(trim($("#kuczh_cangk").fieldValue()));
	}
	
	var allRecords=null;
	
	//保存按钮
	function func_button_save() {
	    allRecords = $("#grid_usercenter").grid("getRecords");	     
		$('#grid_usercenter').grid('saveRows');		
	}
	
	//用户中心名称长度为40
	function func_set_centername() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var centernameIndex = $('td.centername:first').prevAll().length;
		var centernameTemp = rowElement.find('td:eq(' + centernameIndex + ')').text();
		
		var centername=trim(centernameTemp);
		
		if(undefined != centername && null != centername){
			if (!checkCH(40, centername)) {				
				rowElement.find('td:eq(' + centernameIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.zuidcd}");
				return false;
			}
		}
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){				
		if(false == result.success){			
			return false;
		}
		 $('#grid_usercenter').grid('parseRecords', allRecords);
		return true;
	}
</script>

</t:html>