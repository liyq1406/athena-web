<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","218");%>
<t:html i18n="i18n.ck">
	<head>
		<title>手持收货</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'blh',biaos:'enter',caption:'${i18n.blh}',notNull:true},
				{fieldType:'fieldHidden',property:'uth'},
				{fieldType:'fieldText',property:'uah',biaos:'enter',caption:'${i18n.uah}',notNull:true}
		 		]
		 	});
			
		 	//blh查询
		 	$('#blh').bind('enter',function(){
		 		//验证BLH
		 		if(!$('#blh').fieldText('validate')){
		 			return;
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("transcode=19001");
		 		var url = "<%=request.getContextPath()%>/zhijian/21801.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 				$('#uth input').val(results.result.parameter.uth);
		 			}
		 		});
		 	});
		 	
		 	//uah查询
		 	$('#uah').bind('enter',function(){
		 		//验证UAH
		 		if(!$('#uah').fieldText('validate')){
		 			return;
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("transcode=19101");
		 		var url = "<%=request.getContextPath()%>/zhijian/21801.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 				$('#uth input').val(results.result.parameter.uth);
		 			}
		 		});
		 	});

		 	//F2保存
		 	$('#btn_save').bind('click',function(){
		 		//验证UAH
		 		if(!$('#uah').fieldText('validate')){
		 			return;
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("transcode=19102");
		 		var url = "<%=request.getContextPath()%>/zhijian/21801.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 				$('#uth input').val(results.result.parameter.uth);
		 			}
		 		});
		 		
		 		
		 		
		 	});
			
		 	//F3提交数据
		 	$('#btn_sumbit').bind('click',function(){
		 		//验证UAH
		 		if(!$('#uah').fieldText('validate')){
		 			return;
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("transcode=19104");
		 		var url = "<%=request.getContextPath()%>/zhijian/21801.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			if (showPromptRequestMsg(results)==true){
		 				$('#uth input').val(results.result.parameter.uth);
		 			}
		 		});
		 	});

			$(document).keyboardsupport({});
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
	 			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.blh}:</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.uah}:</td>
							<td><div class="ui-field" id="uah"></div>
							<div class="ui-field" id="uth"></div></td>
							<td><div align="center">
							<span id="btn_save" class="ui-button">${i18n.save}[F2]</span>
							<span id="btn_sumbit" class="ui-button">${i18n.ok}[F3]</span>
							<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div><td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>