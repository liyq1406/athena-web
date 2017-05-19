<meta http-equiv="X-UA-Compatible" content="IE=100">
<%@ page import="java.util.Map" %>
<%@ page import="com.athena.authority.entity.MenuDirectory" %>
<script type="text/javascript">
var st_BackCount = 1;  //往后返回的次数
var st_BiaoQH = '';
var st_timeStamp = 0;
var st_UserName = '${userName}';
var st_UserCenter = '${userCenter}';
var st_FistPage,st_PageId,st_MainPage,st_Title,st_Cangkbh,st_Cangklx,st_Rongqcbh,st_Rongqclx,st_Params;
<%	if (request.getParameter("st_backCount") != null){			%>
		st_BackCount = '<%=request.getParameter("st_backCount")%>';
<%	}
	if (request.getParameter("st_fistPage") != null){			%>
		st_FistPage = '<%=request.getParameter("st_fistPage")%>';
<%	}
	if (request.getParameter("st_pageId") != null){			%>
		st_PageId = '<%=request.getParameter("st_pageId")%>';
<%	}
	if (request.getParameter("st_mainPage") != null){				%>
		st_MainPage = '<%=request.getParameter("st_mainPage")%>';
<%	}
	if (request.getParameter("st_title") != null){				%>
	st_Title = '<%=request.getParameter("st_title")%>';
<%	}
	if (request.getParameter("st_cangkbh") != null){			%>
		st_Cangkbh = '<%=request.getParameter("st_cangkbh")%>';
<%	}
	if (request.getParameter("st_cangklx") != null){			%>
		st_Cangklx = '<%=request.getParameter("st_cangklx")%>';
<%	}
	if (request.getParameter("st_rongqcbh") != null){			%>
		st_Rongqcbh = '<%=request.getParameter("st_rongqcbh")%>';
<%	}	
	if (request.getParameter("st_rongqclx") != null){			%>
		st_Rongqclx = '<%=request.getParameter("st_rongqclx")%>';
<%	}														%>
	st_Params = "?st_fistPage="+st_FistPage+"&st_pageId="+st_PageId+"&st_mainPage="+st_MainPage+"&st_cangkbh="+st_Cangkbh+"&st_cangklx="+st_Cangklx+"&st_rongqcbh="+st_Rongqcbh+"";
</script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery_ck.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.core.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.widget.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.mouse.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.position.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.hotkeys.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/sdc.ui.core.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/i18n.js?pageId=<%=request.getAttribute("pageId")%>" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/tabs.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/validate.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/ajax.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/field.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/form.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/grid.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/keyboardsupport.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/json2.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.maskedinput.js" type="text/javascript" ></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/styles/main.css"></link>
