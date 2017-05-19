<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%
String welcome = (String)request.getSession().getAttribute("zbcZxc");
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html>



<head>
<title>神龙零件流系统</title>
	<link rel="shortcut icon" href= "favicon.ico"  />
	<link rel="Bookmark"      href= "favicon.ico"  />
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page>

</t:page>

<script type="text/javascript">
	//页面初始化
	$(document).ready(function() {
	
		var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes";
    	var aaa;

	 	//打开窗口    
 		var welcomePage = '<%=welcome %>';
 		if("ZBC" == welcomePage){
 				aaa = window.open("${ctx}/denglswtx/initWelcome.do","",strWindowType);  
 		}else{
 			 	aaa = window.open("welcomezxc.jsp","",strWindowType);    
 		}
	 	if(aaa != null){
	 	
	 	    var browserName=navigator.appName; 
	 	    
	 	    if ( browserName=="Microsoft Internet Explorer" ) {
	 	        
	 	    	window.opener =null;
				window.open("", "_self");
				window.close();
	 	    }else if(  browserName=="Netscape" ){
	 	    	
	 	    	window.open('','_parent',''); 
		 		window.close(); 
	 	    }else{
	 	    	window.opener =null;
				window.open("", "_self");
				window.close();
	 	    }
			aaa.moveTo(0,0);
			aaa.resizeTo(screen.availWidth,screen.availHeight);
		}   
		
	});

</script>

</t:html>