<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.kdzqdd.aixdd">
	<t:grid id="grid_dingyzxgz" caption="${i18n.dingyzxgz}" idKeys="id" removeSrc="/kdorder/removeZxgz.ajax" submit="NOT" 
	dataFormId="form_dingyzxgz" src="/kdorder/queryZxgz.ajax" editSrc="/kdorder/queryZxgzMx.ajax" reset="NOT" scrollHeight="362">
	<t:gridCol property="uags" caption="UA${i18n.ges}"></t:gridCol>
	<t:gridCol property="uads"  caption="UA${i18n.duis}"></t:gridCol>
	</t:grid>
	<t:form id="form_dingyzxgz" dialog="true" action="/kdorder/dingYzxgz.ajax" idKeys="id">
		<t:fieldLayout prefix="form_layout">
		<t:fieldHidden property="id"></t:fieldHidden>
		<t:fieldText property="uags" caption="UA${i18n.ges}" notNull="true" dataType="integer" maxLength="3"></t:fieldText>
		<t:fieldText property="uads" caption="UA${i18n.duis}" notNull="true" dataType="integer" maxLength="3"></t:fieldText>
		</t:fieldLayout>
	</t:form>
	</t:page>
	<script type="text/javascript"> 
	</script>
	<style type="text/css"></style>
</t:html>