<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="java.io.File"%>
<%

request.setCharacterEncoding("utf-8");

String path = request.getContextPath();
System.out.println(path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(basePath);
String i18n=request.getLocale().toString();

String printtype = request.getParameter("billtype");//单据类型id
System.out.println("----"+printtype);
String templateId = request.getParameter("id");//模版id
String userid = request.getParameter("userid");//当前登录用户id
String pageCommand = request.getParameter("pageCommand");//传入的操作名称 new open

System.out.println(printtype+"    "+
templateId+"    "+
userid+"    "+
pageCommand+"    ");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--  BEGIN Browser History required section -->
<link rel="stylesheet" type="text/css" href="history/history.css" />
<!--  END Browser History required section -->
<title></title>
<script src="AC_OETags.js" language="javascript"></script>
<!--  BEGIN Browser History required section -->
<script src="history/history.js" language="javascript"></script>
<!--  END Browser History required section -->
<style>
body { margin: 0px; overflow:hidden }
</style>
<script type="text/javascript">
	var uploadButton = window.dialogArguments.uploadBtn;//用于关闭此模板编辑窗体后，对模板列表进行更新的对象
    
    var exitWarning = new String();
    function setExitWarning(ew){
    	exitWarning = ew;
    }
    function getExitWarning(){
    	return exitWarning;
    }
    
    
    var savedtemplatexml = new String();
    function setSavedtemplatexml(tmpxml){
    	savedtemplatexml = tmpxml;
    }
    
    
    
	window.onbeforeunload = onbeforeunload_handler;   
	function onbeforeunload_handler(){   
	    var tempstr="";   
	    var fxControl = document.print_designer || window.print_designer;   
	    if ( fxControl )   
	        if ( typeof fxControl.getUnsavedDataWarning=="function")    
	            tempstr = fxControl.getUnsavedDataWarning();	
	    //alert(tempstr);
	    //alert(savedtemplatexml);
	    //alert(tempstr==savedtemplatexml);     
	    if ( tempstr != savedtemplatexml ) {
	    	if(event.clientX>document.body.clientWidth && event.clientY < 0 || event.altKey){ 
				//alert("你关闭了浏览器"); 
			}else{
				event.returnValue=getExitWarning();//"打印模板没有保存，确定退出编辑器？";	
				//alert("你正在刷新页面"); 
			}
	    }else    
	        return void(0);    
	}   
	//window.onunload = 
	//function g(){   
	//    var fxControl = document.print_designer || window.print_designer;   
	//    if ( fxControl )   
	//        if ( typeof fxControl.javascriptOnUnload=="function")    
	//           fxControl.javascriptOnUnload();  // This calls a function in our Flex app   
	//}   
    
    
    
    
	// onbeforeunload="checkLeave()"
	//function checkLeave(){
	//	if(event.clientX>document.body.clientWidth && event.clientY < 0 || event.altKey){ 
	//		//alert("你关闭了浏览器"); 
	//	}else{
	//		event.returnValue="打印模板没有保存，确定退出编辑器？";	
	//		//alert("你正在刷新页面"); 
	//	}
	//}	
	
	
	// onunload="checkLeave2()"
	function checkLeave2(){
		uploadButton.click();
	}
</script>
</head>

<body onunload="checkLeave2()">
  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="print_designer" width="100%" height="100%"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="print_designer.swf" />
			<param name="wmode" value="transparent" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#869ca7" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="FlashVars" value="webApp=<%=basePath%>&printtype=<%=printtype %>&templateId=<%=templateId %>&userid=<%=userid %>&pageCommand=<%=pageCommand %>&i18n=<%=i18n %>" />
			<embed src="print_designer.swf" quality="high" bgcolor="#869ca7" wmode="transparent"
				width="100%" height="100%" name="print_designer" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				FlashVars="webApp=<%=basePath%>&printtype=<%=printtype %>&templateId=<%=templateId %>&userid=<%=userid %>&pageCommand=<%=pageCommand %>&i18n=<%=i18n %>"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
</body>
</html>
