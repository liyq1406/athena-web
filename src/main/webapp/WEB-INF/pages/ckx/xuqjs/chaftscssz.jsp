<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.chaftscssz}">

<!-- 
	  拆分天数参数设置
	 @author wangyu
	 @date 2012-10-11
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_xitcsdy">
	<t:grid id="grid_chaftscssz" caption="${i18n.chaftscssz}" 
		idKeys="usercenter"
		remove="NOT" edit="NOT" add="NOT"  back="NOT" save="NOT" 
		src="/xuqjs/queryChaftscssz.ajax"
		editable="true" editModel="false"
		load="false" 
		showNum="true"
		saveRowsSrcs="/xuqjs/saveChaftscssz.ajax"
		scrollHeight="320"  pageSize="15"
		showEditorAdd="false" showEditorRemove="false"
		>
		<t:fieldLayout id="layout" prefix="chaftscssz" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap"/>
		</t:fieldLayout>
		<t:button caption="${i18n.saves}" name="saves"></t:button>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"/>
		<t:gridCol property="zidlxmc" caption="字典类型名称" width="170"/>
		<t:gridCol property="qujzxz" caption="${i18n.chafts}" editor="fieldText" width="120"
			editorOptions="{'expression':'^[2-9]$','expressionMessage':'${i18n.chafts_ex_mes}'}"/>
	</t:grid>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['shifqj'] = {
		'1' : '${i18n.shi}',
		'0' : '${i18n.fou}'
	};
	
	
	//空格查询
	function grid_chaftscssz_beforeSubmit() {
		$("#layout_usercenter").fieldValue(trim($("#layout_usercenter").fieldValue()));
	}
	
	
	function func_button_saves(){
		if($("#grid_chaftscssz").grid("isEditedCell")){
			$("#grid_chaftscssz").grid("saveRows");
		}
	}
	
</script>

</t:html>