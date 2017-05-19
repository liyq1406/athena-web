<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","343");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_343}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			 	$('#form_user_${pageId}').form({
			 		url:'<%=request.getContextPath()%>/beihuo/34301.do',
			 		fields:[
						{fieldType:'fieldText',property:'yaohlh',notNull:true,caption:'${i18n.yaohlh}',biaos:'enter',dataType:'yaohlhnt'},
						{fieldType:'fieldText',property:'gongysdm',notNull:false,caption:'${i18n.gongysdm}',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'yaohlsl',notNull:true,caption:'${i18n.shifjj}',dataType:'yesno',value:'N'}
			 		]
			 	});
			 	
			 	//F3确定
			 	$('#btn_submit').bind('click',function(){
			 		kanbsk();
			 	});
			 	//按客户查询
 			 	$('#yaohlh').bind('enter',function(){
 			 	   kanbsk();
 			 	});
 			 	
			 	$(document).keyboardsupport({});
			});
			function kanbsk(){
		        //验证整个表单
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		var yaohlsl = $('#yaohlsl input').val();
		 		if (yaohlsl == "Y"){
		 			rpArrProperty(params,'yaohlsl','1');
		 		}else if (yaohlsl == "N"){
		 			rpArrProperty(params,'yaohlsl','0');
		 		}
		 		$('#form_user_${pageId}').form('submit',params,function(){
		 			$('#form_user_${pageId}').form('clearValue');
		 			$('#yaohlsl input').val("N");
		 		});
			
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
							<td>${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td>${i18n.shifjj}:</td>
							<td><div class="ui-field" id="yaohlsl"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
						</tr>
						<tr height=" 20"><td></td></tr>
						<tr>
						    <td colspan="4">
							<td colspan="2" align="center"><span id="btn_submit" class="ui-button">${i18n.qued}[F3]</span>
							<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>