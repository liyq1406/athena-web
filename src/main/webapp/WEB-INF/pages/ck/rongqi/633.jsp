<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","633");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_633}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldSelect',property:'zhuangt',value:'N',realValue:'0',caption:'${i18n.zidbh}',notNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
				{fieldType:'fieldSelect',property:'danjlx',internation:true,caption:'${i18n.danjpdlx}',onselect:'flagChange()',notNull:true,src:'<%=request.getContextPath()%>/common/danjpdlx.do'},
				{fieldType:'fieldSelect',property:'wuld',caption:'${i18n.rongqiq}',notNull:true}
				]
 		});
	
	//F2启动盘点
	$('#btn_qidong').bind('click',function(){
		if(!$('#zhuangt').fieldSelect('validateNotNull')){
			return;
		}
		if(!$('#danjlx').fieldSelect('validateNotNull')){
			return;
		}
		if(!$('#wuld').fieldSelect('validateNotNull')){
			return;
		}		
		//提交数据
		var params = []; 		
		params.push("zhuangt="+$('#zhuangt input').attr('realValue'));
		params.push("danjlx="+$('#danjlx input').attr('realValue'));
		params.push("wuld="+$('#wuld input').attr('realValue')); 		
		var url = "<%=request.getContextPath()%>/rongqi/62402.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
			    //加载返回数据
				//$('#grid_user_${pageId}').grid('parseResult',results);
                if(results.result.response=="0000"){
            		var confirm_=window.confirm("${i18n.shifoudc}");
            		if(confirm_){
            			submitForm_2();
            		}
                }
			 }
		});
	});
	
	//F3结束盘点
	$('#btn_jiespd').bind('click',function(){
		if(!$('#zhuangt').fieldSelect('validateNotNull')){
			return;
		}
		if(!$('#danjlx').fieldSelect('validateNotNull')){
			return;
		}
		if(!$('#wuld').fieldSelect('validateNotNull')){
			return;
		}
		 //提交数据
		var params = [];
		params.push("zhuangt="+$('#zhuangt input').attr('realValue'));
		params.push("danjlx="+$('#danjlx input').attr('realValue'));
		params.push("wuld="+$('#wuld input').attr('realValue'));
		var url = "<%=request.getContextPath()%>/rongqi/62405.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				//$('#grid_user_${pageId}').grid('parseResult',results)
		        //$('#form_user_${pageId}').form('resetFields');
				if(results.result.response=="0000"){
					var confirm_=window.confirm("${i18n.shifoudc}");
					if(confirm_){
						submitForm_4();
					}
				}
			 }
		 });		
	});
	
	//F4盘点补打
	$('#btn_pandbd').bind('click',function(){
		if(!$('#zhuangt').fieldSelect('validateNotNull')){
			return;
		}
		if(!$('#danjlx').fieldSelect('validateNotNull')){
			return;
		}
		if(!$('#wuld').fieldSelect('validateNotNull')){
			return;
		}
		 //提交数据
		var params = [];
		params.push("zhuangt="+$('#zhuangt input').attr('realValue'));
		params.push("danjlx="+$('#danjlx input').attr('realValue'));
		params.push("wuld="+$('#wuld input').attr('realValue'));
		var url = "<%=request.getContextPath()%>/rongqi/62409.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
					//加载返回数据
					if(results.result.response=="0000"){
						   if(results.result.parameter.flag == "02"){
							   submitForm_2();
						   }else if(results.result.parameter.flag == "04"){
							   submitForm_4();
						   }
					 }
				}
		 });		
	});

	$(document).keyboardsupport({});
});
function flagChange(){		
	var url = '<%=request.getContextPath()%>/common/showRongqc633.do?temp='+$('#danjlx input').attr('realValue');
	$('#wuld').fieldSelect('resetUrl',url);
}

<%-- function submitForm_1(){
	//提交数据
	var params = []; 		
	params.push("zhuangt="+$('#zhuangt input').attr('realValue'));
	params.push("danjlx="+$('#danjlx input').attr('realValue'));
	params.push("wuld="+$('#wuld input').attr('realValue')); 		
	var url = "<%=request.getContextPath()%>/rongqi/62402.do";
	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 if (showPromptRequestMsg(results)==true){
			    //加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',results);
                return false;
		 }
	});
} --%>

function submitForm_2(){
	var wuld1=$('#wuld input').attr('realValue');
	$("#putform").attr("action",'<%=request.getContextPath()%>/rongqi/62406.do'+st_Params+'&wuld='+wuld1);
    document.putform.submit();	
}
<%-- var submitForm_3=function(){
	 //提交数据
	var params = [];
	params.push("zhuangt="+$('#zhuangt input').attr('realValue'));
	params.push("danjlx="+$('#danjlx input').attr('realValue'));
	params.push("wuld="+$('#wuld input').attr('realValue'));
	var url = "<%=request.getContextPath()%>/rongqi/62405.do";
	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 if (showPromptRequestMsg(results)==true){
			//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',results)
		           	//$('#form_user_${pageId}').form('resetFields');
				if(results.result.response=="0000"){
			        return false;
				}
		 }
	 });
} --%>
function submitForm_4(){
	var wuld1=$('#wuld input').attr('realValue');//st_Rongqcbh;
	$("#putform").attr("action",'<%=request.getContextPath()%>/rongqi/62407.do'+st_Params+'&wuld='+wuld1);
    document.putform.submit(); 	
}
</script>
</head>
<body>
	<div id="title"></div>
	<form id="putform" method="post" name="putform">
		<div id="form_user_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tr>
					<td>${i18n.qiangzqd}：</td>
					<td><div class="ui-field" id="zhuangt"></div></td>
					<td>${i18n.danjpdlx}：</td>
					<td><div class="ui-field" id="danjlx"></div></td>
					<td>${i18n.rongqiq}：</td>
					<td><div class="ui-field" id="wuld"></div></td>
				</tr>
			</table>
			<br />
			<div align="right">
				<span id="btn_qidong" class="ui-button" onclick=>${i18n.qidpd}[F2]</span>
				<span id="btn_jiespd" class="ui-button">${i18n.jiespd}[F3]</span> 
				<span id="btn_pandbd" class="ui-button" onclick=>${i18n.pandbd}[F4]</span>
				<span id="btn_back" class="ui-button">${i18n.back}[F11]</span> 
				<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
			</div>
		</div>
	</form>
	<br>
	<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>