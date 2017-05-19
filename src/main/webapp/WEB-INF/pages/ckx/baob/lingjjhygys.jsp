<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="零件-计划员-供应商">

<!-- 
	 零件-计划员-供应商
	 hj
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 85px; } </style>
</head>

<t:page i18n=" " >
	<t:grid id="grid_lingjjhygys" caption="零件-计划员-供应商" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="true"
		 src="/baob/querylingjjhygys.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="lj" prefix="lingj" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150" dataType="text" maxLength="10"  />
			<t:fieldText property="gongysbh" caption="供应商编号"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号" />
			<t:fieldText property="chengysbh" caption="承运商编号"  width="150" maxLength="10" expression='^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$' expressionMessage="请填写10位编号"/>
			<t:fieldSelect property="jihy" caption="计划员组"  src="/xuqjs/getZudmByAthority.ajax?role=JIHUAY" 
 				parents="USERCENTER"	show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件编号" width="70"  />
		<t:gridCol  property="gongysbh" caption="供应商编号" width="70"  />
		<t:gridCol  property="gongsmc" caption="供应商名称" width="70"  />
		<t:gridCol  property="gongyfe" caption="供应份额" width="70" />
		<t:gridCol  property="fahd" caption="发运地" width="85" 	/>
		<t:gridCol  property="mudd" caption="目的地" width="50" />
		<t:gridCol  property="chengysbh" caption="承运商编号" width="70" />
		<t:gridCol  property="jihy" caption="计划员组" width="60" />
		<t:gridCol  property="zhongwmc" caption="零件名称" width="95" />
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>

<script type="text/javascript">

	//空格查询
	function grid_lingjjhygys_beforeSubmit() {
		$("#lingj_lingjbh").fieldValue(trim($("#lingj_lingjbh").fieldValue()));    
		$("#lingj_gongysbh").fieldValue(trim($("#lingj_gongysbh").fieldValue()));  
		$("#lingj_chengysbh").fieldValue(trim($("#lingj_chengysbh").fieldValue()));
	}
	
	
	
</script>

</t:html>