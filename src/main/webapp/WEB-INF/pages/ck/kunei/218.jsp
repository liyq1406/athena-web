<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","218");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_218}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
			onreload:true,
			url:'<%=request.getContextPath()%>/kunei/21101.do',
			fields:[
					{fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangk}',value:st_Cangkbh},
					{fieldType:'fieldText',property:'renwbh',dataType:'jiufdh',caption:'${i18n.renwbh}',notNull:true},
					{fieldType:'fieldText',biaos:'enter',property:'quanbpd',dataType:'yesno',limitedLength:'1',caption:'${i18n.quanbpd}',notNull:true,value:'N'},
					{fieldType:'fieldText',property:'pandr',maxLength:'16',caption:'${i18n.pandr}',value:st_UserName,notNull:false},
					{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:true},
					{fieldType:'fieldText',property:'shifcj',dataType:'yesno',limitedLength:'1',caption:'${i18n.shifcj}',notNull:true,value:'Y'},
					{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',maxLength:'11',caption:'${i18n.ush}',notNull:true}
				]
		 	});
			
			//登记盘点
		 	$('#quanbpd').bind('enter',function(){
		 		//参数校验
		 		if(!$('#renwbh').fieldText('validate')){
		 			return;
		 		}
		 		if ($("#quanbpd input").val()=="Y"){
		 			//两次提示
		 			if(confirm($.sdcui.resource.i18n['C2_P0101']) != true){
						return false;
					} 
					if(confirm($.sdcui.resource.i18n['C2_P0102']) != true){
						return false;
					}
		 			//提交数据
					var params = $('#form_user_${pageId}').form("getFormParam");
			 		$('#form_user_${pageId}').form('submit',params);
		 		}
		 	});
		 	//创建US
		 	$('#lingjbh').bind('enter',function(){
		 		//验证
		 		if(!$('#lingjbh').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#renwbh').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#quanbpd').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#pandr').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#shifcj').fieldText('validate')){
		 			return;
		 		}
		 		//获取参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				//存放缓存数据
				$('#serachKey').val(params);
				//页面数据提交并跳转
		 		if ($('#shifcj input').val()=="Y"){  //创建US并登记盘点
		 			var url = "<%=request.getContextPath()%>/kunei/21801.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
				 			if(results.result.respdesc&&results.result.respdesc.length>0){
			 			 		//打开提示框
								if(confirm($.sdcui.resource.i18n[results.result.respdesc]+$.sdcui.resource.i18n['C2_P0103']) != true){
									return false;
								}
			 			 	}
			 				//加载返回数据
							var strJSON=JSON.stringify(results);
							$('#putvalue').val(strJSON);
							$("#putform").attr("action","<%=request.getContextPath()%>/kunei/P21801.do"+st_Params);
   			    			document.putform.submit();
						 }
					});
		 		} else {  //登记盘点
		 			var url = "<%=request.getContextPath()%>/kunei/21106.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
							return true;
						 }
					});
		 		}
		 	});
		 	//维护US
			$('#ush').bind('enter',function(){
			    var ush = $('#ush input').val();
			    if(ush.length >10){
			       if("S" == ush.substr(0,1)){
			        $('#ush input').val(ush.substr(1));
			       }else{
			        $('#ush input').val(ush.substr(0,10));
			       }
			    }
				//验证
				if(!$('#ush').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#renwbh').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#quanbpd').fieldText('validate')){
		 			return;
		 		}
		 		if(!$('#pandr').fieldText('validate')){
		 			return;
		 		}
				//获取参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				//存放缓存数据
				$('#serachKey').val(params);
				//页面数据提交并跳转
				var url = "<%=request.getContextPath()%>/kunei/21803.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
		 			 	if(results.result.respdesc&&results.result.respdesc.length>0){
		 			 		//打开提示框
							if(confirm($.sdcui.resource.i18n[results.result.respdesc]+$.sdcui.resource.i18n['C2_P0103']) != true){
								return false;
							}
		 			 	}
		 				//加载返回数据
						var strJSON=JSON.stringify(results);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/kunei/P21802.do"+st_Params);
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
					if (vParam[0].indexOf("renwbh") != -1){                   //任务编号
						$('#renwbh input').val(vParam[1])
						continue;
					} else if (vParam[0].indexOf("quanbpd") != -1){           //全部盘点
						$('#quanbpd input').val(vParam[1])
						continue;
					} else if (vParam[0].indexOf("pandr") != -1){             //盘点人
						$('#pandr input').val(vParam[1])
						continue;
					} else if (vParam[0].indexOf("lingjbh") != -1){       	  //零件编号
						$('#lingjbh input').val(vParam[1])
						continue;
					} else if (vParam[0].indexOf("shifcj") != -1){            //是否创建
						$('#shifcj input').val(vParam[1])
						continue;
					} else if (vParam[0].indexOf("ush") != -1){            	  //US号
						$('#ush input').val(vParam[1])
						continue;
					} 
				}
				//盘点人获取焦点
				$('#lingjbh input')[0].focus();
				$('#renwbh input').removeClass("field-tabed");
				$('#pandr input').addClass("field-tabed");
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
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.renwbh}:</td>
							<td><div class="ui-field" id="renwbh"></div></td>
							<td>${i18n.quanbpd}:</td>
							<td><div class="ui-field" id="quanbpd"></div>(${i18n.weihpdfw})</td>
						</tr>	
						<tr>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div>(${i18n.title_21201})</td>
							<td>${i18n.shifcj}:</td>
							<td><div class="ui-field" id="shifcj"></div></td>
							<td></td>
							<td></td>
						</tr>	
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div>(${i18n.title_21202})</td>
							<td>${i18n.pandr}:</td>
							<td><div class="ui-field" id="pandr"></div>(${i18n.weihpdfw})</td>
							<td></td>
							<td></td>
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