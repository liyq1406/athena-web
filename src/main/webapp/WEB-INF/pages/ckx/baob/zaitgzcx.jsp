<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="在途跟踪查询">


<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="">
	<t:grid id="grid_zaitgzcx" caption="在途跟踪查询" idKeys="usercenter,yunsjhh" src="/baob/queryzaitgzcx.ajax" 
	        add="NOT" edit="NOT" remove="NOT" load="false" save="NOT" showNum="true" pageSize="15" scrollHeight="290">
		<t:fieldLayout id="zaitgzcx" prefix="layout" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="150" defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldText property="yunsjhh" caption="运输计划号" width="150" maxLength="12"></t:fieldText>
			<t:fieldSelect property="yunszt" caption="运输状态" width="150" convert="zt"></t:fieldSelect>		
		</t:fieldLayout>
		
		<t:button caption="导出" name="download"></t:button>
						
		<t:gridCol property="usercenter" caption="用户中心" width="80"/>
		<t:gridCol property="yunsjhh" caption="运输计划号" type="link" width="90"/>
		<t:gridCol property="kach" caption="卡车号" width="120"/>
		<t:gridCol property="wulddm" caption="最新物理点" width="80"/>
		<t:gridCol property="daodwldsj" caption="到达物理点时间" width="130"/>
		<t:gridCol property="shangcwld" caption="上次物理点" width="80"/>
		<t:gridCol property="daodscwldsj" caption="到达上次物理点时间" width="130"/>
		<t:gridCol property="yunszt" caption="运输状态" width="80"/>
		<t:gridCol property="" caption=" "></t:gridCol>
	</t:grid>
	<div><font color="red">导出结果不能大于5000条,否则为空</font></div>		
</t:page>
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['zt'] = {
		'0' : '正常',
		'1' : '提前',
		'2' : '延误',
		'3' : '交付'
	};
	
//空格查询
function grid_zaitgzcx_beforeSubmit() {
	$("#layout_yunsjhh").fieldValue(trim($("#layout_yunsjhh").fieldValue()));     

}

//导出数据
function func_button_download(){
	
	//导出时运输状态必填且不能为已交付
	var usercenter = trim($("#layout_usercenter").fieldValue());
	var yunsjhh = trim($("#layout_yunsjhh").fieldValue());
	var yunszt = trim($("#layout_yunszt").fieldValue());
	if("" == yunszt || "3" == yunszt){
		alert("导出时运输状态必填且不能为已交付");
		return false;
	}
	
	var record = {'usercenter':usercenter,'yunsjhh':yunsjhh,'yunszt':yunszt};
	
	$.sdcui.pageUtils.goPage({
		url : '../baob/downloadZaitgz.do',
		record : record,
		mode : 'form',
		beforeSubmit : function(){
			return true;
		}
   });
}

/**
 *链接点击事件
 */
function link_yunsjhh(event){
	var event = event||window.event;//原生态的事件处理 
	var element = event.srcElement || event.target;
	var rowDoc = $(element).parents('tr:first')[0];
	var record = $('#grid_zaitgzcx').grid('getRecord',rowDoc);//获取当前行对应的记录

	var usercenter = record.usercenter; //获取所在行的用户中心
	var yunsjhh = record.yunsjhh; //获取所在行的运输计划号
	winOpen = window.open ('${ctx}/baob/quhjhcx.do?&usercenter='+usercenter+'&yunsjhh='+yunsjhh,'取货计划查询',
			'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
			winOpen.resizeTo(screen.availWidth,screen.availHeight);
}
</script>
</t:html>
