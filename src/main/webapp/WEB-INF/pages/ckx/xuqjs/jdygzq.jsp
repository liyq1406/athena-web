<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.jdygzq}">

<!-- 
	既定-预告-周期
	 @author qizhongtao
	 @date 2012-4-16
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_jdygzq">
		<t:grid id="grid_jdygzq" caption="${i18n.jdygzq}" idKeys="dinghlx,suozgyzq" load="false" remove="NOT"  back="NOT"
			src="/xuqjs/queryJdygzq.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveJdygzq.ajax"  afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" scrollHeight="335" pageSize="15"
			>
			<t:fieldLayout id="fl_jdygzq" prefix="jdygzq" columns="2">
				<t:fieldSelect property="dinghlx" caption="${i18n.dinghlx}" convert="queryDinghlx" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="dinghlx"  caption="${i18n.dinghlx}" editor="fieldSelect" width="120" convert="queryDinghlx" editorOptions="{'notNull':true}" />
			<t:gridCol property="suozgyzq" caption="${i18n.suozgyzq}" editor="fieldText" width="180" editorOptions="{'notNull':true,'expression':'^(0[1-9])$|^(1[0-2])$','expressionMessage':'${i18n.suozgyzq_ex_mes}'}"/>
<%-- 			<t:gridCol property="jidzqs"  caption="${i18n.jidzqs}" editor="fieldText" width="120" editorOptions="{'expression':'^[1-9]$','expressionMessage':'${i18n.jidzqs_ex_mes}','notNull':true}"/> --%>
<%-- 			<t:gridCol property="yugzqs" caption="${i18n.yugzqs}" editor="fieldText" width="120" editorOptions="{'expression':'^[1-9]$','expressionMessage':'${i18n.yugzqs_ex_mes}','notNull':true}" /> --%>
			<t:gridCol property="dingdnr" caption="${i18n.dingdnr}" editor="fieldText" editorOptions="{'maxLength':'5','expression':'^(8|9){1,5}$','expressionMessage':'${i18n.dingdnr_ex_mes}'}" width="100"/>
			<t:gridCol property="" caption=""/>
		</t:grid>
	</t:page>
	<script type="text/javascript">

	//行编辑保存
	function func_button_save(){
		var rows = $('#grid_jdygzq').grid('saveRows');
		//$('#grid_jdygzq').grid('reload',rows);//刷新表格
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











