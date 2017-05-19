<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="anjmlxhd">

<!-- 
	  按件目录卸货点
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 120px; } </style>
</head>

<t:page>
	<t:grid id="grid_anjmlxhd" caption="按件目录卸货点" idKeys="usercenter,anjmlxhd" remove="NOT" load="false" showNum="true" dataFormId="form_anjmlxhd" back="NOT"
		 src="/xuqjs/queryAnjmlxhd.ajax" editSrc="/xuqjs/selectAnjmlxhd.ajax" scrollHeight="295" pageSize="10">
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="anjmlxhd" caption="按件目录卸货点" maxLength="10" width="150"/>
			<t:fieldText property="cangkbh" caption="卸货站台编号" width="150"/>
			<t:fieldSelect property="biaos" caption="标识" convert="biaos" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="用户中心" convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="anjmlxhd" caption="按件目录卸货点" width="300"></t:gridCol>
		<t:gridCol property="cangkbh" caption="卸货站台编号" width="200"></t:gridCol>
		<t:gridCol property="biaos" caption="标识" convert="biaos"></t:gridCol>
		<t:gridCol property="" caption=""></t:gridCol>
	</t:grid>
	
	
	<t:form id="form_anjmlxhd" caption="按件目录卸货点" action="/xuqjs/saveAnjmlxhd.ajax" idKeys="usercenter,anjmlxhd" dialog="true" reset="NOT" width="760">
		<t:fieldLayout columns="3" prefix="lingj">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true" width="100"/>
			<t:fieldText property="anjmlxhd" caption="按件目录卸货点"	maxLength="10" dataType="text" notNull="true" width="100"/>
			<t:fieldText property="cangkbh" caption="卸货站台编号" notNull="true" dataType="text" maxLength="10"  width="100"/>
			<t:fieldSelect property="biaos" caption="标识" convert="biaos" notNull="true" width="100"/>
			</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '有效',
		'0' : '无效'
	};	
</script>

</t:html>