<%@ page language="java" import="java.util.*,com.athena.util.cache.CacheManager,com.athena.util.cache.CacheValue" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/pages/include.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String msg = (String)request.getAttribute("msg");
 %>
 <%
    /*
      NOTE:  In a web application using 'rememberMe'
      services via Cookies, always make sure you
      call subject.login() and subject.logout()
      _before_ any output is rendered to the
      corresponding request/response.

      Detailed description:

      When a user logs out, any 'rememberMe' identity
      should always be cleared.  In a web application,
      Shiro uses a cipher-encrypted Cookie to
      remember a user's identity by default, and it will
      automatically delete the Cookie upon a logout.

      But deleting a Cookie is actually performed by
      overwriting it with a new one with the same name
      and a 'maxAge' of 0.  And because Cookies are
      sent out in the HTTP Header, the Cookie must be
      deleted (overwritten) _before_ any HTML output
      is rendered.

      This means the following logout() call must
      execute before the page is rendered, so we make
      that call here at the very beginning of the file.

      In proper MVC applications, the following logout()
      call _should_ be in a Controller, never a JSP page.
      But since this is a Quickstart app with minimal
      libraries (no MVC frameworks), we do it here in
      the page itself - but we would never do this if
      writing a 'real' application.
    */

    org.apache.shiro.SecurityUtils.getSubject().logout();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>神龙零件流系统登录</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel="shortcut icon" href="favicon.ico">
<LINK rel=Bookmark href="favicon.ico">
<LINK rel=stylesheet type=text/css href="<c:url value="/styles/default/login.css"/>">
    <script src="<%=request.getContextPath()%>/scripts/lib/jquery.js" type="text/javascript" ></script>
    <script src="<%=request.getContextPath()%>/scripts/lib/jquery.cookie.js" type="text/javascript" ></script>

<script type="text/javascript">

		var id ="athena";
		var uc = $.cookie(id);

     	function getMsg(){
     		var msg = '<%=msg %>';
     		if(msg!=null&&msg!=''&&msg!='null'){
     			alert(msg);
     		}
     	}		

     	 function doKeyenter(e){
	    	var element =document.getElementById("username");
	    	var ePassword = document.getElementById("password");
	    	var loginButton = document.getElementById("loginButton");
	    	var data = element.value;
	    	var dataEPsd = ePassword.value;
	    	var keyc ="" ;
	   		var currKey=0,ee=e||event;  
	        currKey=e.keyCode||e.which||e.charCode;  
	        var code=currKey;
      		if(code == "13"){
      			loginInfo();
      		}
	      	if(code=="27"){
	      		closeWindow();
	      	}
	      }
		
		window.onload = function(){	
			getMsg();
			//获取header高度
			var hh=document.getElementById("header").offsetHeight;
			
			//设定背景图片位置
			var bgimgY =hh+"px" ;
			var bgimgX =0 + "px" ;
			var bgimg =document.body.style.backgroundPosition=bgimgX + " " + bgimgY;

//	      	  if(document.addEventListener){
//	      	  	document.addEventListener("keypress",doKeyenter,false);
//	      	  }else{
//	      	  	document.attachEvent("onkeypress",doKeyenter);
//	      	  }
	    	  var element =document.getElementById("username");
	    	  var ePassword =document.getElementById("password");
	    	  var loginButton = document.getElementById("loginButton");
	    	  /*
	    	   	加载页面监听事件,addEventListener为监听火狐,IE9等事件,attachEvent为监听IE事件
	    	  */
	    	  if(element.addEventListener||ePassword.addEventListener||loginButton.addEventListener){
	 	          element.addEventListener("keypress",doKeyenter,false);
	 	          ePassword.addEventListener("keypress",doKeyenter,false);
	 	          loginButton.addEventListener("keypress",doKeyenter,false);
	 	     } else {
	 	          element.attachEvent("onkeypress",doKeyenter);
	 	          ePassword.attachEvent("onkeypress",doKeyenter);
	 	          loginButton.attachEvent("onkeypress",doKeyenter);
	 	     }
	 	     document.getElementById("username").focus(); 
	 	     setUc();
		}

     	function loginInfo(){
     		var element =document.getElementById("username").value;
	    	var ePassword = document.getElementById("password").value;
	    	if(element == ''){
	    		alert("用户名不能为空，请输入用户名");
	    		 document.getElementById("username").focus(); 
	    		return false;
	    	}
	    	if(ePassword == ''){
	    		alert("密码不能为空，请输入密码");
	    		document.getElementById("password").focus(); 
	    		return false;
	    	}
     		$.cookie(id, document.getElementById("agencyId").value, { expires: 365 });
     		document.forms[0].submit();
     	}
     	
     	function closeWindow(){
     	  if(confirm("您确定退出本系统吗?")){
     	    window.opener =null;
			window.open("", "_self");
     	  	window.close();
     	  }
     	}

     	function keyChange(){
			 var Txtstr=document.getElementById("username");
			 var evt=window.event;
			 var sInput=Txtstr.value;
			 Txtstr.value=sInput.toUpperCase();
		}
		
		function setUc(){
		  	var uctemp = document.getElementById("agencyId").getElementsByTagName("option");
		  	for(var i = 0;i<uctemp.length;i++){
		  		if(uc == uctemp[i].value){
		  			document.getElementById("agencyId").getElementsByTagName("option")[i].selected = true;
		  		}
		  	}
		}
</script>

<META name=GENERATOR content="MSHTML 8.00.6001.18702"></HEAD>
<BODY>
<!--header-->
<div class="header" id="header">
	<div class="header-con">
    	<span class="brand"></span>
    </div>
</div>

<!--content-->
<div class="login-cont" id="login-cont">
    <div class="mainLogin">
    	<ul>
    	<form name="loginform" action="" method="post">
            <li><div class="th-width">用户名：</div><input name="username" type="text" id="username"  maxlength="30" onkeyup="keyChange()" onchange="keyChange()"></li>
            <li><div class="th-width">密码：</div><input name="password" type="password" id="password"  maxlength="30"></li>
            <li><div class="th-width">用户中心：</div>
            <select name="agencyId" id="agencyId">
            <%
           		CacheManager cm = CacheManager.getInstance();
				List<CacheValue> list = (List<CacheValue>) cm.getCacheInfo("queryUserCenterMap").getCacheValue();
				int size = list.size();
				List resultlist = new ArrayList();
				for (int i = 0; i < size; i++) {
					CacheValue cacheValue = (CacheValue) list.get(i);
					String key = cacheValue.getKey();
			%>
			<option value="<%=key %>"><%=key %></option>
         					<%
				}
			 %>
            </select>
          </li>
            <li class="space">
            <button class="login-but"  id="loginButton" type="button" name="login" value="登  录" onclick="loginInfo()"></button>
            <button class="exit-but" id="logoutButton" type="button" name="logout" value="退 出(ESC)" onclick="closeWindow()"></button>
            </li>
           	</form> 
        </ul>
    </div>
</div>


<!--footer-->
<div class="footer" id="footer">
	<div class="footer-con">DSIM/EDD/PRD<span class="foot-data">V4.2.0</span></div>
</div>

</BODY></HTML>