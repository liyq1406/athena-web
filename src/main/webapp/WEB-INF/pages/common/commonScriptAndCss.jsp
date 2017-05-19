<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/userbutton.jsp"%>
<%
String dirName = request.getParameter("dirName");
request.setAttribute("pageTitle",dirName);
 %>
<title>${pageTitle}-神龙零件流系统</title> 
<meta http-equiv="X-UA-Compatible" content="IE=100">  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.core.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.mouse.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/scripts/lib/sdc.ui-1.0.0.min.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/athena/js/util.js" type="text/javascript"></script> 

<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.core.css"/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.grid.css"/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.tree.css"/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.field.css"/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.layout.css"/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.dialog.css"/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.datepicker.css"/>"/>