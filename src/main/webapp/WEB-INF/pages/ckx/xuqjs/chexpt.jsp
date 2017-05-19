<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.chexpt}">

<!-- 
	车型平台关系
	 @author denggq
	 @date 2012-4-18
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_chexpt" >
	<t:grid id="grid_chexpt" caption="${i18n.chexpt}" 
		idKeys="usercenter,chejbhzz,shengcxbhzz,lcdv" 
		src="/xuqjs/queryChexpt.ajax"
		saveRowsSrcs="/xuqjs/saveChexpt.ajax"
		load="false" 
		add="NOT" 
		edit="NOT" 
		remove="NOT"
		editable="true" 
		back="NOT"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="310" 
		pageSize="15"
		showNum="true"
		showEditorAddName="editorAdd" 
		showEditorRemoveName="editorRemove"
		>
		 
		<t:fieldLayout id="layout" prefix="chexpt" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="chejbhzz" caption="${i18n.chejbhzz}" dataType="text"  maxLength="3" minLength="3"  width="150"/>
			<t:fieldText property="shengcxbhzz" caption="${i18n.shengcxbhzz}" dataType="text"  maxLength="2" minLength="2" width="150"/>
			<t:fieldText property="chejbhhz" caption="${i18n.chejbhhz}" dataType="text"  maxLength="3" minLength="3" width="150"/>
			<t:fieldText property="shengcxbhhz" caption="${i18n.shengcxbhhz}" dataType="text"  maxLength="2" minLength="2" width="150"/>
			<t:fieldText property="shengcptbh" caption="${i18n.shengcptbh}" dataType="text"  maxLength="6"  width="150"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" width="80" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="chejbhzz" editor="fieldText" caption="${i18n.chejbhzz}" width="110" editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="shengcxbhzz" editor="fieldText" caption="${i18n.shengcxbhzz}" width="120" editorOptions="{'maxLength':'2','minLength':'2','dataType':'text','notNull':true}"/>
		<t:gridCol property="chejbhhz" editor="fieldText" caption="${i18n.chejbhhz}" width="110" editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="shengcxbhhz" editor="fieldText" caption="${i18n.shengcxbhhz}" width="120" editorOptions="{'maxLength':'2','minLength':'2','dataType':'text','notNull':true}"/>
		<t:gridCol property="shengcptbh" caption="${i18n.shengcptbh}" width="105" editor="fieldText" editorOptions="{'maxLength':'6','dataType':'text','notNull':true}"/>
		<t:gridCol property="lcdv" caption="${i18n.lcdv}" width="100" editor="fieldText" editorOptions="{'maxLength':'6','minLength':'6','dataType':'text','notNull':true}"/>
<%-- 		<t:gridCol property="" caption="" /> --%>
	</t:grid>
	
</t:page>

<script type="text/javascript">


	//空格查询
	function grid_chexpt_beforeSubmit() {
		$("#chexpt_chejbhzz").fieldValue(trim($("#chexpt_chejbhzz").fieldValue()));
		$("#chexpt_shengcxbhzz").fieldValue(trim($("#chexpt_shengcxbhzz").fieldValue()));
		$("#chexpt_chejbhhz").fieldValue(trim($("#chexpt_chejbhhz").fieldValue()));
		$("#chexpt_shengcxbhhz").fieldValue(trim($("#chexpt_shengcxbhhz").fieldValue()));
		$("#chexpt_shengcptbh").fieldValue(trim($("#chexpt_shengcptbh").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_chexpt').grid('saveRows');
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