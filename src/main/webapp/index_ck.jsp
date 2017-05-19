<%@page import="com.athena.authority.util.AuthorityUtils"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%@ page import="java.util.List"%>
<%@ page import="com.athena.ck.entity.common.WareHouse"%>
<%@ page import="com.athena.ck.entity.common.Rongqc"%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title}${i18n.zhuy}</title>
<jsp:include page="WEB-INF/pages/common/js.jsp" />
<script type="text/javascript">
	var currentPage = 1;
		$(function(){
			$('#form_user_index').form({
				fields:[
						{fieldType:'fieldSelect',biaos:'enter',property:'cangkbh',caption:'${i18n.cangk}',notNull:false,src:'<%=request.getContextPath()%>/common/wareHouse.do',width:70},
						{fieldType:'fieldSelect',property:'rongqcbh',caption:'${i18n.rongqc}',notNull:false,src:'<%=request.getContextPath()%>/common/rongqc.do',width:70},
						{fieldType:'fieldText',biaos:'enter',property:'pageId',dataType:'integer',maxLength:'3',caption:'${i18n.tiaozd}',notNull:true,width:50},
						{fieldType:'fieldLabel',property:'usercenter',value:st_UserCenter,width:40},
						{fieldType:'fieldLabel',property:'username',value:st_UserName,width:80}
					]
			 });

			$('#pageId').bind('enter',function(){
				//参数校验
		 		if(!$('#form_user_index').form("validateParam")){
	 				return;	
		 		}
				var pageId = $("#pageId input").val();
		 		pageJump(pageId)
			});
			
			$('#cangkbh').bind('enter',function(){
				//参数校验
		 		if(!$('#form_user_index').form("validateParam")){
	 				return;	
		 		}
				var pageId = $("#pageId input").val();
		 		pageJump(pageId)
			});
			
			$('#rongqcbh').bind('enter',function(){
				//参数校验
		 		if(!$('#form_user_index').form("validateParam")){
	 				return;	
		 		}
				var pageId = $("#pageId input").val();
		 		pageJump(pageId)
			});
			
			//上一页
		 	$('#btn_pagePrev').bind('click',function(){
		 		if (currentPage == 1) return;
		 		loadMenuContent(currentPage - 1);
		 	});
			
		 	//下一页
		 	$('#btn_pageNext').bind('click',function(){
		 		loadMenuContent(currentPage + 1);
		 	});
			
			//退出
		 	$('#btn_return').bind('click',function(){
		 		window.location.href = '<c:url value="login.jsp"/>';
		 	}); 
			
			$(document).keyboardsupport({});
		});
		
		$(document).ready(function(){
		  	//设置默认数据
		    if ($('#serachKey').val()!=""){			//当是返回时
				var params = $('#serachKey').val().split(",");
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("cangkbh") != -1){                   //仓库编号
						$('#cangkbh input').attr('realValue',vParam[1]);
						$('#cangkbh input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("rongqcbh") != -1){           //容器场编号
						$('#rongqcbh input').attr('realValue',vParam[1]);
						$('#rongqcbh input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("pageId") != -1){        //pageId
						//$('#pageId input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("mainPage") != -1){        //currentPage
						currentPage = parseInt(vParam[1]);
						continue;
					} 
				}
			} else if (st_Cangkbh) {								
				$('#cangkbh input').attr('realValue',st_Cangkbh);
				$('#cangkbh input').val(st_Cangkbh);
				$('#rongqcbh input').attr('realValue',st_Rongqcbh);
				$('#rongqcbh input').val(st_Rongqcbh);
				currentPage = parseInt(st_MainPage);
			} else {							//第一次加载时
				var cangkbh ,rongqcbh;
				<%	List<WareHouse> ckList = (List<WareHouse>)AuthorityUtils.getSecurityUser().getParams().get("ckList");
					List<Rongqc> rqcList = (List<Rongqc>)AuthorityUtils.getSecurityUser().getParams().get("rqcList");
					if (ckList!=null && ckList.size()>0){ %>
						cangkbh = '<%=ckList.get(0).getCangkbh()%>';
				<%	}
					if (rqcList!=null && rqcList.size()>0){ %>
						rongqcbh = '<%=rqcList.get(0).getRongqcbh()%>';
				<%	}%>
				$('#cangkbh input').attr('realValue',cangkbh);
				$('#cangkbh input').val(cangkbh);
				$('#rongqcbh input').attr('realValue',rongqcbh);
				$('#rongqcbh input').val(rongqcbh);
			}
		  	//加载菜单内容
		    loadMenuContent(currentPage);
		});
		
		//窗体界面大小变化
		$(window).resize(function(){
			//windowSizeChange();
		});
		
		//设置滚动时的样式
		$(window).scroll(function(){
			windowSizeChange();
		});
		
		function windowSizeChange(){
			if($(".div-top").size()>0){
				//上方
				if ($(window).scrollTop()>0){
					$(".div-top").css("position","fixed")
				} else {
					$(".div-top").css("position","static")
				} 
			} else {
				//下方
				if (($(document.body).height() - $(window).scrollTop()) > $(window).height()){
					$(".div-bottom").css("position","fixed")
				} else {
					$(".div-bottom").css("position","static")
				}		
			}	
		}

		/*加载菜单内容
		/pageNum 页码
		*/
		function loadMenuContent(pageNum){
			//设置菜单内容
			var params = [];
			params.push("pageNum=" + pageNum);
	 		var url = "<%=request.getContextPath()%>/common/menuHtmlBuilder.do"
	 		$('#form_user_index').form("submitUrl", params, url, function(results){
	 			if (results.result != currentPage){
	 				currentPage = pageNum;
					$('#menuContent').html(results.result);
					showPromptMsg('blue',$.sdcui.resource.i18n['C_OperSuccess']);
					return true;
	 			} else {
	 				showPromptMsg('blue',$.sdcui.resource.i18n['C_1403']);
	 				return false;
	 			}
			});
		}
		/*
		/页面跳转
		*/
		function pageJump(number){
			//参数校验
	 		if(!$('#cangkbh').fieldSelect('validate')){
	 			return;
	 		}
	 		if(!$('#rongqcbh').fieldSelect('validate')){
	 			return;
	 		}
	 		var iPageId = parseInt(number);
	 		//当是6开头的要验证容器场，当是401 402 403 404 405 406 343 344或5开头不验证，其他验证仓库
 			if (iPageId>600 && iPageId<699){
 				if($("#rongqcbh input").attr("realValue") == ""){
 					$("#pageId").fieldText("lostFocus");
 					$("#rongqcbh").fieldSelect("focus");
 		 			return;
 		 		}
 			} else if ((iPageId>=401 && iPageId<=406)||iPageId==343||iPageId==344||(iPageId>500&&iPageId<599)){
 				
 			} else {//验证仓库
 				if($("#cangkbh input").attr("realValue") == ""){
 					$("#pageId").fieldText("lostFocus");
 					$("#cangkbh").fieldSelect("focus");
 		 			return;
 		 		}
 			}
	 		//页面跳转
	 		var params = [];
			params.push("pageId=" + number);
			params.push("mainPage=" + currentPage);
			params.push("cangkbh=" + $("#cangkbh input").attr("realValue"));
			params.push("rongqcbh=" + $("#rongqcbh input").attr("realValue"));
	 		var url = "<%=request.getContextPath()%>/common/pageJump.do"
		 	$('#form_user_index').form("submitUrl", params, url, function(results){
		 		if (showPromptRequestMsg(results)==true){
		 			//判断当前仓库是否是成品库
		 			//0011585 362 /434成品库才能进入页面 V4_030
		 			if (iPageId == 215 || iPageId == 216 || iPageId == 319 || iPageId == 320 || iPageId == 321 
		 					||iPageId == 115 || iPageId == 116 || iPageId == 138 || iPageId == 148 || iPageId == 356 
		 					|| iPageId == 218 || iPageId == 219 || iPageId == 434 || iPageId == 362 || iPageId == 223 ){
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
				     //V4_022
				      if (iPageId == 175 || iPageId == 176 || iPageId == 177 || iPageId == 178 || iPageId == 179 || iPageId == 180 )
				      {
				          if(results.result.parameter.cangklx != 5){
							showPromptMsg('red',$.sdcui.resource.i18n['C_busjlk']);
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
		 			//页面跳转
		 			var jumpUrl = results.result.parameter.dirPath;
		 			var sParams=[];
		 			var url = jumpUrl.split("/");
					sParams.push("st_fistPage=" + url[url.length-1].split(".")[0]);
		 			sParams.push("st_pageId=" + number);
		 			sParams.push("st_mainPage=" + currentPage);
		 			sParams.push("st_cangkbh=" + $("#cangkbh input").attr("realValue"));
		 			sParams.push("st_cangklx=" + results.result.parameter.cangklx);
		 			sParams.push("st_rongqcbh=" + $("#rongqcbh input").attr("realValue"));
		 			sParams.push("st_rongqclx=" + results.result.parameter.shiffk);
		 			$('#serachKey').val(sParams.toString());
					window.location.href = jumpUrl+'?' + sParams.join('&')
		 		}
		 	});
		}
	</script>
</head>
<body>
	<input id="serachKey" name="serachKey" type="Hidden"></input>
	<div id="menuContent" class="ui-fieldLayout keyboard-container"></div>
	<div id='prompt'>${i18n.prompt}</div>
	<div class="div-bottom">
		<div id="form_user_index" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.gongnh}:</td>
						<td><div class="ui-field" id="pageId"></div>
						</td>
						<td>${i18n.cangk}:</td>
						<td><div class="ui-field" id="cangkbh"></div>
						</td>
						<td>${i18n.rongqc}:</td>
						<td><div class="ui-field" id="rongqcbh"></div>
						</td>
						<td>${i18n.usercenter}:</td>
						<td><div class="ui-field" id=usercenter></div>
						</td>
						<td>${i18n.username}:</td>
						<td><div class="ui-field" id=username></div>
						</td>
						<td>
							<span id="btn_pagePrev" class="ui-button">${i18n.shangy}[F9]</span>
							<span id="btn_pageNext" class="ui-button">${i18n.xiay}[F10]</span>
							<span id="btn_return" class="ui-button">${i18n.tuic}${i18n.dengl}[F12]</span>
						</td>
						<td width="100px">
							<form name="qiehuan" action="<%=request.getContextPath()%>/qiehuan.do" method="post">
								<input type="hidden" name="qiehuan_hidden" value="cankaoxi">
								<t:changeTag name="CKX">
									<input type="submit" value="切换到参考系">
								</t:changeTag>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</t:html>