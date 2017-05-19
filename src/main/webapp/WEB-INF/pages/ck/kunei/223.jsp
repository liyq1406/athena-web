<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","223");%>
<t:html i18n="i18n.ck">
	<head>
		<!-- V4_030 -->
		<title>${i18n.title_223}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
			onreload:true,
			fields:[
					{fieldType:'fieldText',property:'pingjh',dataType:'letter_numeric',limitedLength:'12',caption:'${i18n.pingjh}',notNull:true},
					{fieldType:'fieldText',property:'shengqr',maxLength:'4',caption:'${i18n.shenqr}',notNull:true},
					{fieldType:'fieldText',property:'shengqbm',maxLength:'20',caption:'${i18n.shenqbm}',notNull:true},
					{fieldType:'fieldText',property:'keh',dataType:'xkeh',caption:'${i18n.keh}',notNull:true},
					{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}'},
					{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',caption:'${i18n.ush}'}
				]
		 	});
			
			//创建US
		 	$('#lingjbh').bind('enter',function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
		 		//获取参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				//存放缓存数据
				$('#serachKey').val(params);
				//页面数据提交并跳转
				var url = "<%=request.getContextPath()%>/kunei/22301.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(result1){
		 			 if (showPromptRequestMsg(result1)==true){
		 			  	//加载返回数据
						var strJSON=JSON.stringify(result1);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/kunei/22307.do"+st_Params);
		    			document.putform.submit();
					 }
				});
		 	});
		 	//维护US
			$('#ush').bind('enter',function(){
				if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
				//获取参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				//存放缓存数据
				$('#serachKey').val(params);
				//页面数据提交并跳转
				var url = "<%=request.getContextPath()%>/kunei/22304.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(result1){
		 			 if (showPromptRequestMsg(result1)==true){
						var strJSON=JSON.stringify(result1);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/kunei/22308.do"+st_Params);
		    			document.putform.submit();
					 }
				});
			});
			
			$(document).keyboardsupport({});
		});
		
		//加载时判断是否是回退
		$(document).ready(function(){
			if ( $('#serachKey').val()!=""){
				//为界面查询字段赋值
				var params = $('#serachKey').val().split(",");
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("pingjh") != -1){               //凭证号
						$('#pingjh input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("shengqr") != -1){      //申请人
						$('#shengqr input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("shengqbm") != -1){     //申请部门
						$('#shengqbm input').val(vParam[1]);
						continue;
					}else if (vParam[0].indexOf("keh") != -1){          //客户
						$('#keh input').val(vParam[1]);
						continue;
					}
				}
				//ush获取焦点
				$('#lingjbh input')[0].focus();
				$('#lingjbh input').removeClass("field-tabed");
				$('#ush input').addClass("field-tabed");
			}
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.pingjh}:</td>
							<td><div class="ui-field" id="pingjh"></div></td>
							<td>${i18n.shenqr}:</td>
							<td><div class="ui-field" id="shengqr"></div></td>
							<td>${i18n.shenqbm}:</td>
							<td><div class="ui-field" id="shengqbm"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
						</tr>
						<tr>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div>(${i18n.title_21201})</td>
						</tr>	
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div>(${i18n.title_21202})</td>
						</tr>	
					</tbody>
				</table> 
			</div>
			<br>
			<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td><div>
						<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
						<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div><td>
					</tr>
					</tbody>
				</table> 
			</div>
			<br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>