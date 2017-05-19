<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.toft.widgets.printark.assistance.TemplateAss"%>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String i18n=request.getLocale().toString();
String jsondataprovider = request.getParameter("jsondataprovider");

//jsondataprovider = new String(jsondataprovider.getBytes("ISO-8859-1"),"UTF-8");
String selectedid = request.getParameter("selectedid");
String clazzparams = request.getParameter("clazzparams");

//---json直接发送方式
if(jsondataprovider!=null){
//jsondataprovider = new String(jsondataprovider.getBytes("iso-8859-1"), "UTF-8"); 
jsondataprovider = jsondataprovider.replaceAll("\'","\\\\'");
System.out.println("jsondata:::"+jsondataprovider);
}

//---SQL语句查询方式
if(selectedid!=null){
//selectedid = new String(selectedid.getBytes("iso-8859-1"), "UTF-8"); 
selectedid = selectedid.replaceAll("\'","");
System.out.println("selectedid:::"+selectedid);
}


//---自定义类方式
if(clazzparams!=null){
//clazzparams = new String(clazzparams.getBytes("iso-8859-1"), "UTF-8"); 
clazzparams = clazzparams.replaceAll("\'","\\\\'");
System.out.println("clazzparams:::"+clazzparams);
}




String historyid = request.getParameter("historyid");
String billcode = null;//不记录打印历史
			//request.getParameter("billcode");
String printtemplateid = request.getParameter("templateid");
//--根据TCode获取ID
String templateCode = request.getParameter("templatecode");
if(templateCode!=null && !"".equals(templateCode)){
	printtemplateid = TemplateAss.getInstance().getTemplateIdByCode(templateCode);
	System.out.println("print_templateId:"+printtemplateid+",by templateCode:"+templateCode+" find");
	System.out.println("TCode=>ID:"+printtemplateid);
}
String justDoPrint = request.getParameter("justDoPrint");
//UserInfo userinfo = (UserInfo)request.getSession().getAttribute(com.toft.core2.ToftConst.Toft_SessionKey_UserData);
String userid = "u";//userinfo.getUserId();//request.getParameter("userid");
System.out.println(billcode+"  --  "+printtemplateid+" --  "+historyid+" --  "+justDoPrint+"  -- "+userid);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="history/history.css" />
<title></title>
<script src="AC_OETags.js" language="javascript"></script>
<script src="history/history.js" language="javascript"></script>
<style>
body { margin: 0px; overflow:hidden }
</style>
<script type="text/javascript">

	var jsondataprovider = '<%=jsondataprovider%>';
	function getJsondataprovider(){
		return jsondataprovider;
	}
	var selectedid = '<%=selectedid%>';
	function getSelectedid(){
		return selectedid;
	}
	var clazzparams = '<%=clazzparams%>';
	function getClazzparams(){
		return clazzparams;
	}

	function alert_printDegree(descpc,canprint){
		if(canprint){
			var c = window.confirm(descpc);
			return c;
		}else{
			alert(descpc);			 
		}
	}
	
	function alert_error(msg){
		alert(msg);
	}
</script>
</head>
<body>
	
  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="print_doit" width="100%" height="100%"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="print_doit.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#869ca7" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="FlashVars" value="webApp=<%=basePath%>&printtemplateid=<%=printtemplateid %>&billcode=<%=billcode %>&justDoPrint=<%=justDoPrint %>&userid=<%=userid %>&historyid=<%=historyid %>&i18n=<%=i18n %>" />
			<embed src="print_doit.swf" quality="high" bgcolor="#869ca7" 
				width="100%" height="100%" name="print_doit" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				FlashVars="webApp=<%=basePath%>&printtemplateid=<%=printtemplateid %>&billcode=<%=billcode %>&justDoPrint=<%=justDoPrint %>&userid=<%=userid %>&historyid=<%=historyid %>&i18n=<%=i18n %>"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
	 
</body>
</html>
