<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","221");%>
<%long currTime = new java.util.Date().getTime();%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_221}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
			   onreload:true,
			   url:'<%=request.getContextPath()%>/kunei/22101.do',
		 		fields:[
				{fieldType:'fieldText',property:'dangqck',dataType:'letter_numeric',limitedLength:'3',caption:'${i18n.danqkbh}',notNull:true},
				{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjbh}',dataType:'letter_numeric',limitedLength:'10',notNull:true}
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
							<td>${i18n.danqkbh}:</td>
							<td><div class="ui-field" id="dangqck"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
						  <td align="right" colspan="4">
								<div style="padding:10px;text-align: right">
								<span id="btn_submit" class="ui-button">${i18n.ok }[F3]</span>
								<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
								<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
					            </div>	
					      </td> 
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>