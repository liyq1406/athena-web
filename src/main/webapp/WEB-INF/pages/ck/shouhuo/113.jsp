<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","113");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_113 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
				    onreload:true,
			 		url:'<%=request.getContextPath()%>/shouhuo/11301.do',
					fields:[
						{fieldType:'fieldText',property:'jusdh',dataType:'jusdh',notNull:true,caption:'${i18n.chumdh}'},
						{fieldType:'fieldText',property:'mengwgh',dataType:'text',maxLength:'10',notNull:true,caption:'${i18n.mengwgh}'},
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
							<td>${i18n.chumdh }:</td>
							<td><div class="ui-field" id="jusdh"></div></td>
							<td>${i18n.mengwgh }:</td>
							<td><div class="ui-field" id="mengwgh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="padding:5px;text-align: right">
				<span id="btn_submit" class="ui-button">${i18n.ok }[F3]</span>
				<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>		
				<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
			</div>
		<div id='prompt'>${i18n.prompt}</div>
      </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>