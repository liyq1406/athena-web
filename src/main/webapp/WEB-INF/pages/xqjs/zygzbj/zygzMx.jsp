<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygz">
	<t:grid id="grid_lingj" caption="${i18n.dqljlb}" showNum="true" submit="NOT" reset="NOT" scrollHeight="450" pageSize="20"
	 src="/zygzbj/queryZygzMx.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="gridLayout" >
		<t:fieldHidden property="id"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.ljh}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol property="jislx" caption="${i18n.jslx}"  convert="cacheJslx"></t:gridCol>
	<t:gridCol property="duandsj" type="link" caption="${i18n.ddsj}"></t:gridCol>
	<t:gridCol property="lingjdw" caption="${i18n.ljdw}"></t:gridCol>
	<t:gridCol property="baozrl" caption="${i18n.bzrl}"></t:gridCol>
	<t:gridCol property="yijf0" caption="${i18n.qimkc}"></t:gridCol>
	<t:gridCol property="anqkc" caption="${i18n.aqkc}"></t:gridCol>
	<t:gridCol property="cangkdm" caption="${i18n.ck}"></t:gridCol>
	<t:gridCol property="jihydm" caption="${i18n.jhyz}"></t:gridCol>
	</t:grid>
	<input type="hidden" id="removeId" value="${removeId}">
	</t:page>
	<script type="text/javascript"> 
	function initPage(){
		removeHidden();
	}
	/**
	*断点时间链接点击事件
	*/
	function link_duandsj(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_lingj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initYaohl.do?removeId=layout-north,layout-west,layout-south&lingjbh='
				+record.lingjbh+'&usercenter='+record.usercenter+'&cangkdm='+record.cangkdm+'&duandsj='+record.duandsj,'${i18n.mxqmx}'
				,'height=550,width=1024,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false;


	}
	</script>
	<style type="text/css"></style>
</t:html>