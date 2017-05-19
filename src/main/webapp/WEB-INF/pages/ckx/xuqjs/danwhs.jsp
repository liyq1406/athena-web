<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.danwhs}">

<!-- 
              单位换算
	 @author denggq
	 @date 2012-4-17
 -->
 
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 110px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_danwhs">
		<t:grid id="grid_danwhs" caption="${i18n.danwhs}" idKeys="usercenter,beihdw,mubdw" load="false" remove="NOT" back="NOT" scrollHeight="335" pageSize="15"
			src="/xuqjs/queryDanwhs.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveDanwhs.ajax"  
			afterSaveRowsEvent="afterSaveRows" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
			<t:fieldLayout id="fl_danwhs" prefix="danwhs" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150"/>
				<t:fieldSelect property="beihdw" caption="${i18n.beihdw}" convert="queryLjdw" width="150"/>
				<t:fieldSelect property="mubdw" caption="${i18n.mubdw}" convert="queryLjdw" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter"   caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" 
				editorOptions="{'notNull':true}"/>
			<t:gridCol property="beihdw"   caption="${i18n.beihdw}" width="120" editor="fieldSelect" convert="queryLjdw" 
				editorOptions="{'notNull':true}"/>
			<t:gridCol property="mubdw"  caption="${i18n.mubdw}" width="150" editor="fieldSelect" convert="queryLjdw" 
				editorOptions="{'notNull':true}"/>
			<t:gridCol property="huansbl"  caption="${i18n.huansbl}"  editor="fieldText" 
				editorOptions="{'expression':'^[1-9][0-9]{0,3}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.huansbl_ex_mes}','notNull':true}"/>
			<t:gridCol property="" caption="" />
		</t:grid>
	</t:page>
	
	<script type="text/javascript">

	
	//行编辑保存
	function func_button_save(){
		$('#grid_danwhs').grid('saveRows');//刷新表格
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











