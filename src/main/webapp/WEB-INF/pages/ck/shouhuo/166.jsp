<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","166");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_166 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
				    onreload:true,
					url:'<%=request.getContextPath()%>/shouhuo/16601.do',
					fields:[
						{fieldType:'fieldText',property:'uth',dataType:'uth',caption:'${i18n.uth}'},
						{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}'},
						{fieldType:'fieldText',property:'shancyy',dataType:'laiy',maxLength:'100',notNull:true,caption:'${i18n.shancyy}'}
					]
				});
				
				$('#btn_delete').bind('click',function(){
					if(!$('#form_user_${pageId}').form("validateParam")){
				     		return;
				      }
				    var  uth = $("#uth input").val();
				    var  elh = $("#elh input").val();
				    if( "" != uth  && "" != elh  || "" == uth && "" == elh ){
				     	showPromptMsg('red','${i18n.UTH_ELH}');
				     	return false;
				      }
					var url;
					var params = $('#form_user_${pageId}').form("getFormParam");
				   if("" != uth){
				       url="<%=request.getContextPath()%>/shouhuo/16601.do";
					    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					     if(results.result.response == '0000'){
						         $('#form_user_${pageId}').form("clearValue");
						    
						     }
					    });
				   }else if("" != elh){
					    url="<%=request.getContextPath()%>/shouhuo/16602.do";
					    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						    if(results.result.response == '0000'){
						         $('#form_user_${pageId}').form("clearValue");
						    
						     }
					    });
				   }
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
							<td>${i18n.uth}</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.elh}</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td>${i18n.shancyy}</td>
							<td><div class="ui-field" id="shancyy"></div></td>
							<td>
								<div style="padding:20px;text-align: right">
									<span id="btn_delete" class="ui-button">${i18n.delete}[F6]</span>
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