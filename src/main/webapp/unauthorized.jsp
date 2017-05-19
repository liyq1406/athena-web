<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<% 
	String sysDirName = "";
    if(request.getSession().getAttribute("sysDirName")!=null&&!"".equals(request.getSession().getAttribute("sysDirName"))){
    	sysDirName = (String)request.getSession().getAttribute("sysDirName");
    }
%>
<t:html title="权限不足">
	<head>
		<title>神龙零件流系统</title>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			$(function() {

			});
			
				   //自定义返回按钮
		function btnBack(){
			window.history.back();
		}
		</script>
	</head>
		您无权访问<%=sysDirName%>功能!&nbsp;&nbsp;&nbsp;<button name="btnBack" id="btnBack" onclick="btnBack();">返回</button>
</t:html>
