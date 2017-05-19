<%@ page language="java" pageEncoding="UTF-8" import="com.toft.ui.tags.UiConstants,java.util.Map,java.util.List,java.util.HashMap" %>
<%
String menuIdSec = request.getParameter("menu.selected");
if((menuIdSec==null||"".equals(menuIdSec))&&(request.getAttribute("menuId")!=null&&!"".equals(request.getAttribute("menuId")))){
	menuIdSec = (String)request.getAttribute("menuId");
}

Map menuBeanMap = new HashMap();
if(request.getSession().getAttribute("menuBeanMap")!=null){
	menuBeanMap = (Map)request.getSession().getAttribute("menuBeanMap");
}
String childId = "";
if(menuBeanMap.get(menuIdSec)!=null&&!"".equals(menuBeanMap.get(menuIdSec))){
	childId=(String)menuBeanMap.get(menuIdSec);
}
request.getSession().setAttribute("menuId",childId);
 %>