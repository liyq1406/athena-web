<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","138");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_138 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
				    onreload:true,
					url:'<%=request.getContextPath()%>/shouhuo/13801.do',
					fields:[
						{fieldType:'fieldText',property:'ush',biaos:'enter',dataType:'ush' ,notNull:true,caption:'${i18n.ush}'}
					]
				});
				 $("#ush").bind('enter',function(event){
				   submit();
				 });
			    $('#btn_ruk').bind('click',function(){
			    	submit();
				});
				
			    
				$(document).keyboardsupport({});
			});
			function  submit(){
		       if(!$('#form_user_${pageId}').form("validateParam")){
					return;
				}
			    var params = $('#form_user_${pageId}').form("getFormParam");
			    $('#form_user_${pageId}').form('submit',params);
			    $('#form_user_${pageId}').form('clearValue');
			    return false;
			}
		</script>
		
	</head>
	<body> 
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr align='center'>
							<td>${i18n.ush}</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>
								<div text-align:"center">
								<span id="btn_ruk" class="ui-button">${i18n.ruk}[F1]</span>
								<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
								<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>