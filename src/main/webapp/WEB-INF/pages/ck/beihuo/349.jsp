<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","349");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_349}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
	 			]
 		});
		//F1查询 
	 	$('#btn_kais').bind('click',function(){
	 		
	 		 //提交数据
	 		var params = $('#form_user_${pageId}').form("getFormParam");

	 		var url = "<%=request.getContextPath()%>/beihuo/34901.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 
				 });
	 	}); 
	 	$(document).keyboardsupport({});
});
</script>
	</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
	        <tr>
		<td height="351" colspan="2" rowspan="2" align="center" ><span id="btn_kais"  class="ui-button">${i18n.kais}[F1]</span><span id="btn_return"  class="ui-button">${i18n.return}[F12]</span> </td>
      </tr>
  </table>
		</div>
		<div id='prompt'>${i18n.prompt}</div>
		</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>