<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctPath" value="${pageContext.request.contextPath}" />
<t:html>
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.anx.anx">
<style>
	#maoxqGrid .youi-fieldLayout table td.contral.label-col.col-0 {
		width:120px;
	}
</style>
<!--主体内容开始-->
<t:form id="maoxqForm" submit="NOT" reset="NOT">
	
<t:fieldLayout columns="4" prefix="record">
	<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="100">		
	</t:fieldSelect>
	<t:fieldSelect property="jisLx" caption="${i18n.gonghms}" width="100" src="/anxorder/queryMosbyUserCenter.ajax" show="name" code="value" notNull="true" parents="usercenter">
		
	</t:fieldSelect>
	<t:fieldCalendar property="jissj" caption="${i18n.jissj}" format="yyyy-MM-dd HH:mm:ss" width="150"></t:fieldCalendar>
	<t:fieldCalendar property="shengxsj" caption="${i18n.shengxsj}" format="yyyy-MM-dd HH:mm:ss" width="150"></t:fieldCalendar>
</t:fieldLayout>
<t:buttons id="button_form">
  <t:button name="tjjs" caption="${i18n.tijjs}"></t:button>
</t:buttons>
</t:form>
<p>
</p>
</t:page>
<script type="text/javascript">
//标识位
	$.sdcui.serverConfig.convertArray['usercenter'] = {
		'UL' : 'UL',
		'UW' : 'UW',	
		'VD' : 'VD'
	};
//生成选择radio
function radioXuqbc(){
	return "<input name='selectXuqbcs' onclick='radioClick(this)' type='radio'/>";
}
//radio点击事件
function radioClick(obj){
	var rowElemt = $(obj).parent('td:first').parent('tr:first');
	var xuqbc = rowElemt.find('td:eq(1)').text();
	//选中的版次放到隐藏域
	$('#layout_selectXuqbc').fieldValue(xuqbc);
}

//表单验证
function vali() {
	//是否选中了版次
	var record = $('#maoxqGrid').grid('getSelectedRecords');
	if(record.length == 0) {
		//请选择版次
		alert("${i18n.message_null}");
		return false;
	}
	
	return true;
}
//提交计算按妞事件
function func_button_tjjs() {	
	var jisLx = $('#record_jisLx').fieldValue();
	var usercenter = $('#record_usercenter').fieldValue();	
	if (jisLx != ""&&usercenter!="") {	
		var params = [];
		params.push("usercenter=" + usercenter);
		params.push("jisLx=" + jisLx);
	
		$.sdcui.ajaxUtil.ajax({
			url : '${ctPath}/anxorder/calculateXinaxOrder.ajax',//url
			data : params.join("&"),
			success : function(result) {
				alert(result.result);
				return true;
			}
		});
	}
	else {
		alert("${i18n.gonghms}!");
	}
}
	
</script>
</t:html>