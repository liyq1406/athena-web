<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xuqly}">

<!-- 
	需求来源-作用域
	 @author qizhongtao
	 @date 2012-4-17
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_xuqly">
		<t:grid id="grid_xuqly" caption="${i18n.xuqly}" idKeys="xuqly,zuoyy" load="false" remove="NOT" back="NOT" scrollHeight="335" pageSize="15"
			src="/xuqjs/queryXuqly.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveXuqly.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows">
			<t:fieldLayout id="fl_xuqly" prefix="xuqly" columns="2">
				<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" convert="queryXuqly" width="160"/>
				<t:fieldSelect property="zuoyy" caption="${i18n.zuoyy}" convert="queryChej" width="160"/>
			</t:fieldLayout>
			<t:gridCol property="xuqly"   caption="${i18n.xuqly}" editor="fieldSelect"  convert="queryXuqly" editorOptions="{'notNull':true}" width="150"></t:gridCol>
			<t:gridCol property="zuoyy"   caption="${i18n.zuoyy}" editor="fieldSelect"  convert="queryZuoyy"  editorOptions="{'notNull':true}" width="200"></t:gridCol>
			<t:gridCol property="" caption=""/>
		</t:grid>
	</t:page>
	
	<script type="text/javascript">
		//空格查询
		function grid_xuqly_beforeSubmit() {
			$("#xuqly_zuoyy").fieldValue(trim($("#xuqly_zuoyy").fieldValue()));
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











