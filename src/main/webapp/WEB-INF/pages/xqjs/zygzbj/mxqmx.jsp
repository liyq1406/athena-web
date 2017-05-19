<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<script type="text/javascript"> 
	function initPage(){
		removeHidden();
	}
	
	$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
	</script>
	<t:page i18n="i18n.xqjs.zygzbj.zygzbjjs">
	<t:grid id="grid_mxqmx" caption="${i18n.mxqmx}" showNum="true"  idKeys="usercenter,lingjbh,xuqksrq,xuqjsrq,xuqcfsj,chanx"
	src="/zygzbj/selectMxqMx.ajax" add="NOT" edit="NOT" remove="NOT" scrollHeight="478" pageSize="20">
	<t:fieldLayout columns="3">
		<t:fieldSelect  property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}" width="150"></t:fieldSelect>
		<t:fieldText property="jhydm" caption="${i18n.jhydm}" maxLength="10" width="150"></t:fieldText>
		<t:fieldText property="lingjbh" caption="${i18n.ljh}" maxLength="10" width="150"></t:fieldText>
		<t:fieldCalendar property="xuqcfsj" format="yyyyMMdd" caption="${i18n.cfsj}" width="150"></t:fieldCalendar>
		<t:fieldText property="xuqly" caption="${i18n.xqly}" maxLength="3" width="150"></t:fieldText>
		<t:fieldHidden property="xuqbc"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh"  caption="${i18n.ljh}"></t:gridCol>
	<t:gridCol property="xuqksrq" caption="${i18n.qsrq}"></t:gridCol>
	<t:gridCol property="xuqjsrq" caption="${i18n.jsrq}"></t:gridCol>
	<t:gridCol property="xuqcfsj" caption="${i18n.cfsj}"></t:gridCol>
	<t:gridCol property="chanx" caption="${i18n.cx}"></t:gridCol>
	<t:gridCol property="shiycj" caption="${i18n.dhcj}"></t:gridCol>
	<t:gridCol property="xuqsl" caption="${i18n.sl}"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.dw}"></t:gridCol>
	<t:gridCol property="xuqly" caption="${i18n.xqly}" convert="convertXqlyForChn"></t:gridCol>
	<t:gridCol property="zhizlx" caption="${i18n.zzlx}"></t:gridCol>
	</t:grid>
	<input type="hidden" id="removeId" value="${removeId}">
	</t:page>
	<script type="text/javascript"> 
	</script>
	<style type="text/css"></style>
</t:html>