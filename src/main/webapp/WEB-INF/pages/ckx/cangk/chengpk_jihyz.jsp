<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="${i18n.cangk}-${i18n.zick}">

<!-- 
	  仓库-子仓库
	 @author denggq
	 @date 2012-1-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_cangk">
	<t:grid id="grid_chengpk_jihyz" caption="${i18n.chengpk_jihyz}" idKeys="usercenter,cangkbh" 
		dataFormId="form_chengpk_jihyz" back="NOT" scrollHeight="335" pageSize="15"
		src="/cangk/queryChengpkJihyz.ajax" editSrc="/cangk/getChengpkJihyz.ajax" 
		removeSrc="/cangk/removeChengpkJihyz.ajax" load="false" showNum="true">
		<t:fieldLayout id="fl_cangk" prefix="cangk" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="140"/>
			<t:fieldSelect property="cangkbh" caption="${i18n.cangkbh}" src="/cangk/listCangk.ajax?cangklx=3" 
				show="cangkbh" code="cangkbh" width="140" parents="usercenter"/>
			<t:fieldSelect property="jihyzbh" caption="${i18n.jihyzbh}" src="/xuqjs/getZudmByAthority.ajax?role=PZJIHY" 
				parents="usercenter"	show="VALUE" code="KEY" defaultValue="${PZJIHY}" width="140" />
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"/>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" />
		<t:gridCol property="jihyzbh" caption="${i18n.jihyzbh}" width="100"/>		
		<t:gridCol property="" caption=" " />
	</t:grid>

	<t:form dialog="true" id="form_chengpk_jihyz" action="/cangk/saveChengpkJihyz.ajax" width="600" idKeys="usercenter,cangkbh" reset="NOT" >
		<t:fieldLayout prefix="record" columns="2">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" width="150" />
			<t:fieldSelect property="cangkbh" caption="${i18n.cangkbh}" notNull="true" src="/cangk/listCangk.ajax?cangklx=3" show="cangkbh" code="cangkbh" width="150" parents="usercenter"/>
			<t:fieldSelect property="jihyzbh" caption="${i18n.jihyzbh}" src="/xuqjs/getZudmByAthority.ajax?role=PZJIHY" parents="usercenter"
				show="VALUE" code="KEY" defaultValue="${PZJIHY}" width="150" notNull="true"/>
		</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//初始化页面
	function initPage(){
				
	}
</script>

</t:html>