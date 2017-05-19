<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygzbjcx">
	${i18n.ljh}:${lingjbh}&nbsp;&nbsp;&nbsp;${i18n.baojsd}:${startTime}-${endTime}&nbsp;&nbsp;&nbsp;<span style="color: red">${i18n.aqkc}:${anqkc}</span>
	<t:grid id="grid_zygzbj" caption="${i18n.bjlb}" submit="NOT" reset="NOT"
	src="/zygzbj/queryZygzbjmx.ajax" add="NOT" edit="NOT" remove="NOT" showNum="true">
	<t:fieldLayout>
		<t:fieldHidden property="id"></t:fieldHidden>
		<t:fieldHidden property="cangkdm"></t:fieldHidden>
		<t:fieldHidden property="xuh"></t:fieldHidden>
		<t:fieldHidden property="baojlx"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol width="200" property="starttime" caption="${i18n.kaissj}"></t:gridCol>
	<t:gridCol width="200" property="endtime" caption="${i18n.jiessj}"></t:gridCol>
	<t:gridCol width="200" property="xuql" caption="${i18n.xq}"></t:gridCol>
	<t:gridCol width="200" property="yijfl" caption="${i18n.yjf}"></t:gridCol>
	<input type="hidden" id="removeId" value="${removeId}">
	</t:grid>
	</t:page>
	<script type="text/javascript">
	function initPage(){
		removeHidden();
	}
	</script>
	<style type="text/css"></style>
</t:html>