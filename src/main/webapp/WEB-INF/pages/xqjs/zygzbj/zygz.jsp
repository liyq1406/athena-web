<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygz">
	<t:grid id="grid_lingj" caption="${i18n.dqljlb}" showNum="true" idKeys="id"
	src="/zygzbj/queryZygz.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="gridLayout" columns="4">
		<t:fieldSelect width="120" property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:fieldSelect>
		<t:fieldSelect width="120" property="jislx" src="/zygzbj/queryZyJslx.ajax" show="value" code="key" caption="${i18n.jslx}"></t:fieldSelect>
		<t:fieldText width="120" property="lingjbh" caption="${i18n.ljh}" maxLength="10"></t:fieldText>
		<t:fieldSelect width="120" property="jihydm" convert="getJihz" caption="${i18n.jhyz}"></t:fieldSelect>
		<t:fieldText width="120" property="cangkdm" caption="${i18n.ck}" maxLength="9"></t:fieldText>
		<t:fieldCalendar format="yyyy-MM-dd" width="120" property="ddsj1" caption="${i18n.ddsj}"></t:fieldCalendar>
		<t:fieldCalendar format="yyyy-MM-dd" width="120" property="ddsj2" caption="${i18n.zhi}"></t:fieldCalendar>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" type="link" caption="${i18n.ljh}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol property="jislx" convert="cacheJslx" caption="${i18n.jslx}"></t:gridCol>
	<t:gridCol type="link" property="duandsj" caption="${i18n.ddsj}"></t:gridCol>
	<t:gridCol property="lingjdw" caption="${i18n.ljdw}"></t:gridCol>
	<t:gridCol property="baozrl" caption="${i18n.bzrl}"></t:gridCol>
	<t:gridCol property="yijf0" caption="${i18n.qimkc}"></t:gridCol>
	<t:gridCol property="anqkc" caption="${i18n.aqkc}"></t:gridCol>
	<t:gridCol property="cangkdm" caption="${i18n.ck}"></t:gridCol>
	<t:gridCol property="jihydm" caption="${i18n.jhyz}"></t:gridCol>
	</t:grid>
	</t:page>
	<script type="text/javascript"> 
	/**
	*零件号链接点击事件
	*/
	function link_lingjbh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_lingj').grid('getRecord',rowDoc);//获取当前行对应的记录
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/zygzbj/initZygzlj.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return false;

	}
	
	/**
	*断点时间链接点击事件
	*/
	function link_duandsj(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_lingj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initZygzMx.do?removeId=layout-north,layout-west,layout-south&id='+record.id,'${i18n.mxqmx}','height=550,width=1024,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false;


	}
	</script>
	<style type="text/css"></style>
</t:html>