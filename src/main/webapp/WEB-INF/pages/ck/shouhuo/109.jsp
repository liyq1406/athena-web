<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","109");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_109 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
					onreload:true,
			 		url:'<%=request.getContextPath()%>/shouhuo/10901.do',
					fields:[
						{fieldType:'fieldText',property:'jusdh',dataType:'jusdh',notNull:true,caption:'${i18n.jusdh}'},
						{fieldType:'fieldText',property:'shancyy',dataType:'laiy',maxLength:'100',notNull:true,caption:'${i18n.shancyy}'},
					]
				}); 
				$('#btn_submit').bind('click',function(){
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 				return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		$('#form_user_${pageId}').form('submit',params);
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
							<td>${i18n.jusdh }:</td>
							<td><div class="ui-field" id="jusdh"></div></td>
							<td>${i18n.shancyy }:</td>
							<td><div class="ui-field" id="shancyy"></div></td>
							<td><div style="padding:20px;text-align: right">
									<span id="btn_submit" class="ui-button">${i18n.delete }[F6]</span>
									<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
									<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>