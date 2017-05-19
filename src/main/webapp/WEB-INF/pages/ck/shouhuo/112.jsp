<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","112");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_112 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
					onreload:true,
			 		url:'<%=request.getContextPath()%>/shouhuo/11202.do',
					fields:[
						{fieldType:'fieldText',biaos:'enter',property:'jusdh',dataType:'jusdh',notNull:true,caption:'${i18n.jusdh}'}
					]
				}); 
				
			 	$('#btn_submit').bind('click',function(){
			 		if(!$('#form_user_${pageId}').form("validateParam")){
						return;
					}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		$('#form_user_${pageId}').form('submit',params);
			 	});
			 	
			 	$('#jusdh').bind('enter',function(event){
			 	  if(!$('#form_user_${pageId}').form("validateParam")){
						return;
					}
		 			var params =[];
		 			params.push("jusdh=" + $('#jusdh input').val());
		 		    var url = "<%=request.getContextPath()%>/shouhuo/11201.do";
		 		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
								 $("#chengysdm").html(results.result.parameter.chengysdm);
								 $("#chengysmc").html(results.result.parameter.chengysmc);
							}
		 	       });
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
							<td>${i18n.jusdh }:</td>
							<td><div class="ui-field" id="jusdh"></div></td>
							<td>${i18n.chengysdm }:</td>
							<td><span id="chengysdm"></span></td>
						</tr>
						<tr>
							<td>${i18n.chengysmc }:</td>
							<td><span id="chengysmc"></span></td>
							<td colspan="2">
							   <div style="padding:20px;text-align: center">
									<span id="btn_submit" class="ui-button">${i18n.print }[F8]</span>
									<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
									<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
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