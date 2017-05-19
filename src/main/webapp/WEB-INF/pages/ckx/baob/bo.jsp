<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html >
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<%  response.setHeader("P3P","CP='IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT'"); %>
</head>
<script type="text/javascript">
//window.open ('${src}',
//		'报表',
//		'height=500,width=800,top=100,left=100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no, status=no');
</script>
<t:page >
  <iframe src="${src }" width="100%"  height="600" scrolling="auto" ></iframe>
</t:page>
</t:html>