<%@ page import="com.athena.authority.entity.LoginUser,com.athena.authority.util.AuthorityUtils,java.util.List "%>
<%@ include file="/WEB-INF/pages/include.jsp" %>
<link href="<%=request.getContextPath()%>/decorators/athena/menu.css" type="text/css" rel="stylesheet"></link>
<% 
LoginUser loginUser = AuthorityUtils.getSecurityUser();
String usernameInfo = loginUser.getUsername();
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/decorators/athena/menu.js">
<!--

//-->
</script>
<%@ page language="java" pageEncoding="UTF-8"%>
<script>
	$(function(){
		$('#sys-menu').menu({
			selected:'<%=request.getSession().getAttribute(com.athena.authority.util.MenuUtils.MENU_PARAMS_SELECTED)%>'
		});
	});
</script>
<div style="height:450px;">
	<div id="sys-menu" class="sys-menu">
		<%
		String menu = "";
		List ucList = loginUser.getUcList();
		String username = loginUser.getUsername();
		String usercenter = loginUser.getUsercenter();
		if(username.equals("ROOT")||ucList.contains(usercenter)){
			if(request.getSession().getAttribute("SYS_LOGIN_MENUHTML")!=null){
				menu = (String)request.getSession().getAttribute("SYS_LOGIN_MENUHTML");
			}
		}
		%>
		<%= menu%>
	</div>
</div>
