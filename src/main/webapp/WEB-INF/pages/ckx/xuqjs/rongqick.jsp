<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.rongqick}">

<!-- 
	   容器区-仓库
	 @author xss
	 @date 2015-4-10
	 0010495
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_rongqick">
	<t:grid id="grid_rongqick" 
		caption="${i18n.rongqick}" 
		src="/xuqjs/queryRongqick.ajax"
		idKeys="usercenter,rongqqbh" 
		
		load="false" 
		back="NOT"
		showNum="true"
		
		editSrc="/xuqjs/selectRongqick.ajax" 
		removeSrc="/xuqjs/deleteRongqick.ajax"
		
		dataFormId="form_rongqick"
		scrollHeight="335" 
		pageSize="10"					
		>
		<t:fieldLayout id="layout" prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${loginUsercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="cangkbh" caption="仓库编号" maxLength="10"  dataType="text" width="150"/>		
			<t:fieldText property="rongqqbh" caption="容器区编号" maxLength="10"  dataType="text" width="150"/>
		</t:fieldLayout>		
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}"></t:gridCol>		
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"   ></t:gridCol>
		<t:gridCol property="rongqqbh" caption="${i18n.rongqqbh}" ></t:gridCol>	
		<t:gridCol property="" caption=""></t:gridCol>		
	</t:grid>
	
	<t:form dialog="true" caption="容器区-仓库" idKeys="usercenter,rongqqbh"  id="form_rongqick" action="/xuqjs/saveRongqick.ajax" width="720"  reset="NOT">
		<t:fieldLayout prefix="rongqick" columns="3">		  
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" width="100"  defaultValue="${loginUsercenter}" convert="queryUserCenterMap"/>							
			<t:fieldSelect property="cangkbh" caption="${i18n.cangkbh}" width="100" notNull="true" src="/xuqjs/queryCangkbh.ajax"  show="value" code="key"  ></t:fieldSelect>
		    <t:fieldSelect property="rongqqbh" caption="${i18n.rongqqbh}" width="120" notNull="true" src="/xuqjs/queryRongqqbh.ajax" show="value" code="key"  ></t:fieldSelect>		
		</t:fieldLayout>
	</t:form>
</t:page>

<script type="text/javascript">	
</script>
</t:html>