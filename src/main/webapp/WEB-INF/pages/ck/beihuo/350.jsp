<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","350");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_350}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			 	$('#form_user_${pageId}').form({
			 		fields:[
							{fieldType:'fieldText',property:'beihdh',dataType:'beihdh',notNull:true,caption:'${i18n.beihdh}'}
			 		       ]
			 	});
 			 	//按F2确定
 			  $('#btn_qued').bind('click',function(){
		 			//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		params.push("cangkbh="+st_Cangkbh);
			 		var url="<%=request.getContextPath()%>/beihuo/35001.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){});
				 	  return false;	
			    });
 			 	
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td><span id="btn_qued" class="ui-button">${i18n.ok}[F2]</span>
							    <span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							    <span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
							</td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>