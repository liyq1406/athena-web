<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript"> 
		function initPage(){
			removeHidden();
		}
	</script>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygz">
	<t:grid id="grid_yaohl" caption="${i18n.dqljlb}" showNum="true" submit="NOT" reset="NOT" scrollHeight="450" pageSize="20"
	 src="/zygzbj/queryYaohl.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="gridLayout" >
		<t:fieldHidden property="lingjbh"></t:fieldHidden>
		<t:fieldHidden property="usercenter"></t:fieldHidden>
		<t:fieldHidden property="duandsj"></t:fieldHidden>
		<t:fieldHidden property="cangkdm"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="yaohlh" caption="${i18n.yaohlh}"></t:gridCol>
	<t:gridCol property="zuiwsj" caption="${i18n.jiaofsj}"></t:gridCol>
	<t:gridCol property="yaohsl" caption="${i18n.jiaofsl}"></t:gridCol>
	</t:grid>
	<input type="hidden" id="removeId" value="${removeId}">
	</t:page>
	<style type="text/css"></style>
</t:html>