<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="大屏显示错误">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<style type="text/css">
  .youi-fieldLayout table td.contral.label-col { width: 100px; }
</style>
<t:page i18n="">
当前用户无区域权限，请联系管理员！
</t:page>
</t:html>