<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%@ page import="java.util.Enumeration" %>
<t:html i18n="i18n.ck">
<script type="text/javascript">
		$(function(){
			$('#form_bottom').form({
				fields:[
						{fieldType:'fieldText',biaos:'enter',property:'pageId',dataType:'integer',maxLength:'3',caption:'${i18n.tiaozd}',notNull:true},
					/* 	{fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangk}',value:st_Cangkbh,width:'30'},
						{fieldType:'fieldLabel',property:'rongqcbh',caption:'${i18n.rongqc}',value:st_Rongqcbh,width:'30'},
						{fieldType:'fieldLabel',property:'username',caption:'${i18n.username}',value:st_UserName,width:'30'},
						{fieldType:'fieldLabel',property:'usercenter',caption:'${i18n.usercenter}',value:st_UserCenter,width:'30'} */
					]
			 });

			$('#pageId').bind('enter',function(){
				//参数校验
		 		if(!$('#form_bottom').form("validateParam")){
	 				return;	
		 		}
		 		var iPageId = parseInt($("#pageId input").val());
		 		//当是6开头的要验证容器场，当是401 402 403 404 405 406 343 344或5开头不验证，其他验证仓库
	 			if (iPageId>600 && iPageId<699){
	 				if(st_Rongqcbh == ""){
	 		 			return;
	 		 		}
	 			} else if ((iPageId>=401 && iPageId<=406)||iPageId==343||iPageId==344||(iPageId>500&&iPageId<599)){
	 				
	 			} else {//验证仓库
	 				if(st_Cangkbh == ""){
	 		 			return;
	 		 		}
	 			}
		 		//页面跳转
		 		var params = [];
				params.push("pageId=" + $("#pageId input").val());
				params.push("mainPage=" + st_MainPage);
				params.push("cangkbh=" + st_Cangkbh);
				params.push("cangklx=" + st_Cangklx);
				params.push("rongqcbh=" + st_Rongqcbh);
				params.push("rongqclx=" + st_Rongqclx);
		 		var url = "<%=request.getContextPath()%>/common/pageJump.do"
			 	$('#form_bottom').form("submitUrl", params, url, function(results){
			 		if (showPromptRequestMsg(results)==true){
			 			//页面跳转
			 			var iPageId = parseInt(results.result.parameter.dirCode);
			 			//判断当前仓库是否是成品库
			 			//判断当前仓库是否是成品库
		 			if (iPageId == 215 || iPageId == 216 || iPageId == 319 || iPageId == 320 || iPageId == 321 
		 					||iPageId == 115 || iPageId == 116 || iPageId == 138 || iPageId == 148 || iPageId == 356 
		 					|| iPageId == 218 || iPageId == 219){
			 			if (results.result.parameter.cangklx != 3){ 
				 				showPromptMsg('red',$.sdcui.resource.i18n['C_buscpk']);
				 				return;
				 			}
		 			   }
		 			//判断当前仓库是否是不合格品库或成品不合格品库
		 			//2013-6-6取消iPageId=418 mantis 7716
				    if (iPageId == 407 || iPageId == 414 || iPageId == 415 || iPageId == 416 || iPageId == 417
					     ||iPageId == 418 || iPageId == 420 || iPageId == 421 || iPageId == 422
					     ||iPageId == 423 || iPageId == 424 || iPageId == 425 || iPageId == 427 || iPageId == 428
					     ||iPageId == 429 || iPageId == 430|| iPageId == 431 ){
					    if(results.result.parameter.cangklx != 2 && results.result.parameter.cangklx != 4){
							showPromptMsg('red',$.sdcui.resource.i18n['C_busbhgpk']);
							return;
					       }
				        } 
		 			//判断返空区
		 			if (results.result.parameter.shiffk == "F"){
		 				if (iPageId==601 || iPageId==602 || iPageId==603 || iPageId==604
	 						|| iPageId==605 || iPageId==606 || iPageId==607 || iPageId==608
	 						|| iPageId==609 || iPageId==610 || iPageId==619 || iPageId==620
	 						|| iPageId==629 || iPageId==630 || iPageId==631 || iPageId==634){
		 					showPromptMsg('red',$.sdcui.resource.i18n['C_NotRongqc']);
			 				return;
		 				}
		 			}
			 			//链接地址
			 			var jumpUrl = results.result.parameter.dirPath;
			 			//获取界面参数（fieldLabel、 fieldText和fieldSelect的值）
			 			var fieldLabelParams = [];
			 			var fieldLabels = $(document).find("div.fieldLabel");
						for(var i=0; i<fieldLabels.length; i++){
							var name = $(fieldLabels[i]).attr("property")
							if (params.toString().indexOf(name+"=") == -1){
								var value = $('#'+name+' input').val();
								fieldLabelParams.push(name + "=" + value);
							}
						}
			 			var fieldTextParams = [];
						var fieldTexts = $(document).find("div.fieldText");
						for(var i=0; i<fieldTexts.length; i++){
							var name = $(fieldTexts[i]).attr("property")
							if (params.toString().indexOf(name+"=") == -1){
								var value = $('#'+name+' input').val();
								fieldTextParams.push(name + "=" + value);
							}
						}
						var fieldSelectParams = [];
						var fieldSelects = $(document).find("div.fieldSelect");
						for(var i=0; i<fieldSelects.length; i++){
							var name = $(fieldSelects[i]).attr("property")
							if (params.toString().indexOf(name+"=") == -1){
								var url = $('#'+name+' input').attr("src").split('/');
								var property = url[url.length-1].split('.')[0]
								var value = $('#'+name+' input').attr("realValue")
								var text = $('#'+name+' input').val();
								fieldSelectParams.push(name + "=" + property + "|" + text + "|" + value);
							}
						}
						//页面跳转
						var sParams=[];
						var url = jumpUrl.split("/");
						sParams.push("st_fistPage=" + url[url.length-1].split(".")[0]);
						sParams.push("st_pageId=" + $("#pageId input").val());
						sParams.push("st_mainPage=" + st_MainPage);
						sParams.push("st_cangkbh=" + st_Cangkbh);
						sParams.push("st_cangklx=" + st_Cangklx);
						sParams.push("st_rongqcbh=" + st_Rongqcbh);
						sParams.push("st_rongqclx=" + st_Rongqclx);
						window.location.href = jumpUrl+'?' + sParams.join('&') +"&"+ fieldTextParams.join('&') +"&"+ fieldSelectParams.join('&')
			 		}
			 	});
			});
		});
		
		$(document).ready(function(){
			//循环为界面赋值（fieldText和fieldSelect）
			<% 
			Enumeration pNames = request.getParameterNames();
			while(pNames.hasMoreElements()){
			String name = (String)pNames.nextElement();
			String value = request.getParameter(name);
			%>
			var name = '<%=name%>'; 
			var value = '<%=value%>'; 
			//为fieldLabel赋值
			var fieldLabels = $(document).find("div.fieldLabel").filter($("#"+name))
			if (fieldLabels.length > 0){
				var name = $(fieldLabels[0]).attr("property")
				if (value.indexOf("|") == -1){
					$('#'+name+' span').val(value);
				}
			}
			//为fieldText赋值
			var fieldTexts = $(document).find("div.fieldText").filter($("#"+name))
			if (fieldTexts.length > 0){
				var name = $(fieldTexts[0]).attr("property")
				if (value.indexOf("|") == -1){
					$('#'+name+' input').val(value);
				}
			}
			//为fieldSelect赋值
			var fieldSelects = $(document).find("div.fieldSelect").filter($("#"+name))
			if (fieldSelects.length > 0){
				var name = $(fieldSelects[0]).attr("property")
				if (value.indexOf("|") != -1){
					var url = $('#'+name+' input').attr("src").split('/');
					var property = url[url.length-1].split('.')[0]
					if (value.split('|')[0] == property){
						$('#'+name+' input').val(value.split('|')[1]);
						$('#'+name+' input').attr("realValue",value.split('|')[2]);
					}
				}
			}
			<%	
			}
			%>
			//移除样式
			$('#pageId').removeClass("tabFocus");
			$('#pageId input').removeClass("field-tab");
			
		});
	</script>
	<div class="div-bottom">
		<div id="form_bottom" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td width="15%">${i18n.gongnh}(Ctrl+F1):</td>
						<td width="35%"><div class="ui-field" id="pageId"></div></td>
						<td width="10%"></td>
						<td width="10%"></td>
						<td width="10%"></td>
						<td width="10%"></td>
						<td width="10%"></td>
						<td width="10%"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</t:html>