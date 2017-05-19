<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="SAP-整车零件供应商维护">


 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_sapzcwh" 
		caption="SAP-整车零件供应商维护" 
		src="/xuqjs/querySapzcwh.ajax"
		idKeys="usercenter,lingjbh,chanx,flag"  
		load="false" 
		back="NOT"
		showNum="true"
		removeSrc="/xuqjs/deleteSapzcwh.ajax"
		dataFormId="form_sapzcwh"
		scrollHeight="300" 
		editSrc="/xuqjs/selectSapxxjs.ajax" 
		pageSize="15"				
		>
		<t:fieldLayout id="sapzcwh" prefix="layout" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldText property="chanx" caption="产线" width="150" dataType="text" maxLength="5"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150"  dataType="text"  maxLength="10"/>
			<t:fieldText property="qsliush" caption="起始流水号" width="150" dataType="text"  maxLength="9"/>
			<t:fieldText property="jzliush" caption="截止流水号" width="150" dataType="text"  maxLength="9"/>
			<t:fieldText property="gongysdm" caption="供应商" width="150" dataType="text"  maxLength="10"/>
			<t:fieldCalendar property="create_time_form" caption="创建时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		<t:fieldCalendar property="create_time_to"   caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}"/>
		<t:gridCol property="chanx" caption="产线"/>
		<t:gridCol property="lingjbh" caption="零件编号"/>
		<t:gridCol property="qsliush" caption="起始流水号"/>
		<t:gridCol property="jzliush" caption="截止流水号"/>
		<t:gridCol property="gongysdm" caption="供应商"/>
		<t:gridCol property="creator" caption="创建人"/>
		<t:gridCol property="create_time" caption="创建时间"/>
		<t:gridCol property="editor" caption="编辑人"/>
		<t:gridCol property="edit_time" caption="编辑时间"/>
	</t:grid>
		<t:form dialog="true" caption="SAP-整车零件供应商维护" idKeys="usercenter,lingjbh,chanx,,flag"  id="form_sapzcwh" action="/xuqjs/saveSapzcwh.ajax" width="720"  reset="NOT">
		<t:fieldLayout prefix="layout1" columns="2">		  
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"  width="150" notNull="true"/>
			<t:fieldText property="chanx" caption="产线" width="150" dataType="text" maxLength="5" notNull="true"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150"  dataType="text" maxLength="10" notNull="true"/>
			<t:fieldText property="gongysdm" caption="供应商" width="150" dataType="text" maxLength="10" notNull="true"/>
			<t:fieldText property="qsliush" caption="起始流水号" width="150" dataType="text" maxLength="9"/>
			<t:fieldText property="jzliush" caption="截止流水号" width="150" dataType="text" maxLength="9" notNull="true"/>
		</t:fieldLayout>
	</t:form>
</t:page>

<script type="text/javascript">
	//空格查询
	function grid_sapzcwh_beforeSubmit() {
		if($("#layout_create_time_form").fieldValue()!="" && $("#layout_create_time_to").fieldValue() != ""){
		}else if($("#layout_create_time_form").fieldValue()=="" && $("#layout_create_time_to").fieldValue() == ""){
		}
		else{
			alert("若根据时间筛选，请将时间段填写完整。");
			return false;
		}
		return true;
	}

</script>
</t:html>