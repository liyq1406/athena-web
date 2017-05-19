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

<t:page i18n="i18n.ckx.xuqjs.i18n_usercenter">
	<t:grid id="grid_usercenter" caption="${i18n.usercenter}" 
		src="/xuqjs/queryUsercenter.ajax"
		removeSrc="/xuqjs/removeUsercenter.ajax"
		saveRowsSrcs="/xuqjs/saveUsercenter.ajax"
		idKeys="usercenter"  
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="5"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
		>
		<t:fieldLayout id="layout" prefix="usercenter" columns="3">
			<t:fieldText property="usercenter" caption="${i18n.usercenter}" maxLength="3" dataType="text" width="150"/>
			<t:fieldText property="centername" caption="${i18n.centername}" maxLength="20" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  editor="fieldText" width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="centername" caption="${i18n.centername}" editor="fieldText" width="160" editorOptions="{closeEvent:func_set_centername,'maxLength':'40'}"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	
	//空格查询
	function grid_usercenter_beforeSubmit() {
		$("#usercenter_usercenter").fieldValue(trim($("#usercenter_usercenter").fieldValue()));
		$("#usercenter_centername").fieldValue(trim($("#usercenter_centername").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
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
		return true;
	}
</script>

</t:html>