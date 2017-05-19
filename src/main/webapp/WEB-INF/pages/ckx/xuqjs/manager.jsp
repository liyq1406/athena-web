<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	  计划员分组
	 @author denggq
	 @date 2012-3-20
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_manager">
	<t:grid id="grid_manager" caption="${i18n.manager}" 
		idKeys="usercenter,zuh" 
		src="/xuqjs/queryManager.ajax"
		removeSrc="/xuqjs/removeManager.ajax"
		saveRowsSrcs="/xuqjs/saveManager.ajax"
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="15"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		>
		<t:fieldLayout id="layout" prefix="manager" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldText property="zuh" caption="${i18n.zuh}" maxLength="3" minLength="3" dataType="text" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" width="100" editorOptions="{'notNull':true}"  defaultValue="${usercenter}"/>
		<t:gridCol property="zuh" caption="${i18n.zuh}" editor="fieldText" width="120" editorOptions="{'notNull':true,'maxLength':'3','dataType':'text'}"/>
		<t:gridCol property="zhizlx" caption="${i18n.zhizlx}" convert="queryZZLX" editor="fieldSelect" width="120"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1"/>
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
	function grid_manager_beforeSubmit() {
		$("#manager_zuh").fieldValue(trim($("#manager_zuh").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_manager').grid('saveRows');
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