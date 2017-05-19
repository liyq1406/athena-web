<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","172");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_172}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp"/>
<script type="text/javascript">
var currentPage = 1;
//V4_039 卡车号限长输入8位 如 HBA12345  
$(function(){
			$('#form_user_${pageId}').form({
					onemoredemand:true,
					onreload:true,
					fields:[
						{fieldType:'fieldText',property:'huoch',dataType:'text',includeNull:true,notNull:true,maxLength:'8',caption:'${i18n.huoch}'},
						{fieldType:'fieldText',property:'ccsy',dataType:'laiy',includeNull:false,notNull:true,minLength:'6',maxLength:'25',caption:'${i18n.ccsy}'}						
				    ]
			});
	
	//F6   确认并打印
 	$('#btn_print').bind('click',function(){
 	 	var str = $('#ccsy input').val();
		var arr = new Array();
		arr = str.split(" ");

		if(arr.length != 1){		
		　　alert("出厂事由不能含有空格！");							
 			//$("#btn_print").attr("disabled",true);
		　　return false;
		}
 		var reg=/^[\u4E00-\u9FA5]+$/;  //wangliang 20150318  汉字
 		var j=0;
 		for (var i=0 ; i<str.length ; i++){
 			arr[i]=str.charAt(i);
 			if(reg.test(arr[i])){
 				j++;
 			}
 		}
		if(j <6){ 
			alert("出厂事由至少包含6个汉字！"); 
			return false; 
		} 
 		currentPage=1;
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
		}
				
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		
		$('#grid_user1_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/clrc/17201.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 var huoch = $('#huoch input').val();
		 var laiy = $('#ccsy input').val();
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					if (results.result.response == "0000"){								 
						window.location.href="<%=request.getContextPath()%>/clrc/P17201.do"+st_Params+"&huoch="+huoch+"&laiy="+laiy;	

					}					
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
							<td>${i18n.kch}</td>
							<td><div class="ui-field" id="huoch"></div></td>
							
							<td>${i18n.ccsy}</td>
							<td><div class="ui-field" id="ccsy"></div></td>
						</tr>
						
					</tbody>
				</table>
			</div>
			
			<div>
			<table class="ui-grid" cellspacing="1" width="100%" id="fomuser2">
				<tr>
				    <td align="right">
				        <span id="btn_print" class="ui-button">${i18n.okprint}[F6]</span>
						<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
		            </td>
				</tr>		
			</table>
			</div>	
			
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>