<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","137");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_137 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var flag = 0;
			$(function(){
				$('#form_user_${pageId}').form({
				    onreload:true,
					url:'<%=request.getContextPath()%>/shouhuo/13701.do',
					fields:[
						{fieldType:'fieldText',property:'zhengclsh',biaos:'enter',notNull:true,dataType:'letter_numeric',limitedLength:'9',caption:'${i18n.zhengclsh}'},
						{fieldType:'fieldText',property:'classh',biaos:'enter',notNull:true,dataType:'letter_numeric',limitedLength:'4',caption:'${i18n.classh}'},
						{fieldType:'fieldHidden',property:'lingjbh'},
						{fieldType:'fieldHidden',property:'peislb'},
						{fieldType:'fieldText',property:'xinljbh',notNull:true,dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}'},
						{fieldType:'fieldText',property:'xinljxs',notNull:true,dataType:'dbnumber',caption:'${i18n.xis}'}
					]
				});
			    $('#btn_shenb').bind('click',function(){
			       if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	}
			        if(!flag){
			          showMsg("${i18n.classhhc}");
			           return false;
			        }
			    	
				    var params = $('#form_user_${pageId}').form("getFormParam");
				    $('#form_user_${pageId}').form('submit',params);
				    flag = 0;
				    return false;
				});
				 $('#classh').bind('enter',function(){
				       enter();
				});
				 $('#zhengclsh').bind('enter',function(){
				       enter();
					});
				$(document).keyboardsupport({});
			});
			
			function enter (){
				 flag = 1;
					if(!$('#zhengclsh').fieldText("validate")){
						     return;
					}  
					if(!$('#classh').fieldText("validate")){
					     return;
					  	} 
				    var params =[];
				    params.push("zhengclsh="+$('#zhengclsh input').val());
				    params.push("classh="+$('#classh input').val());
				    var url = "<%=request.getContextPath()%>/shouhuo/13701.do"
		 	    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					if (showPromptRequestMsg(results)==true){
						 if(results.result.response == '0000'){
				              $('#lingjbh input').val(results.result.parameter.lingjbh); 
				              $('#xinljbh input').val(results.result.parameter.lingjbh);
				              $('#peislb input').val(results.result.parameter.peislb); 
				              showPromptMsg('blue',$.sdcui.resource.i18n['C_Next']);
				           }
				       }
				       });
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
						<tr>
						    <td>${i18n.classh}</td>
							<td><div class="ui-field" id="classh"></div></td>
							<td>${i18n.zhengclsh}</td>
							<td><div class="ui-field" id="zhengclsh"></div></td>
							<td><div class="ui-field" id="peislb"></div></td>
						</tr>
						<tr>
						    <td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="xinljbh"></div></td>
							<td>${i18n.xis}</td>
							<td><div class="ui-field" id="xinljxs"></div></td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
						<td colspan="5"></td>
						<td>
						  <span id="btn_shenb" class="ui-button">${i18n.shenb}[F3]</span>
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