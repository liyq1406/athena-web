<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!--rencong 0011937 -->
<t:html title="DFPV发货通知单查询">

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 105px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_dfpvfhtzd" caption="DFPV发货通知单查询" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="NOT"
		 src="/baob/queryDfpvfhtzd.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="dfpvfhtzd" prefix="layout" columns="3">
		<t:fieldSelect property="usercenter" caption="用户中心" width="150" convert="queryUserCenterMap" defaultValue="${loginUsercenter }" notNull="true"/>
		<t:fieldText property="blh" caption="BL号"  width="150" dataType="text" maxLength="10"/>
		<t:fieldText property="tch" caption="TC号" width="150" dataType="text" maxLength="10"/>
 		<t:fieldCalendar property="psasj_from" caption="PSA发运时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		<t:fieldCalendar property="psasj_to"   caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
 		<t:fieldText property="gongysdm" caption="供应商编号"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"/>
 		<t:fieldCalendar property="blscsj_from" caption="BL生成时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		<t:fieldCalendar property="blscsj_to"   caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
 		<t:fieldText property="lingjbh" caption="零件编号" width="150"  dataType="text"  maxLength="10"/>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="blh" caption="BL号"  />
		<t:gridCol  property="tch" caption="TC号"  />
		<t:gridCol  property="yaohlh" caption="要货令号"  />
		<t:gridCol  property="gongysdm" caption="供应商编号" />
		<t:gridCol  property="cangkbh" caption="仓库编号" />
		<t:gridCol  property="lingjbh" caption="零件编号"  />
		<t:gridCol  property="lingjsl" caption="零件数量"/>
		<t:gridCol  property="dingdh" caption="订单号" />
		<t:gridCol  property="blscsj" caption="BL生成时间" />
		<t:gridCol  property="psasj" caption="PSA发运时间" />
		<t:gridCol  property="zhuangt" caption="状态" />
	</t:grid>
</t:page>

<script type="text/javascript">
	//空格查询
	function grid_dfpvfhtzd_beforeSubmit() {
		if($("#layout_blscsj_from").fieldValue()!="" && $("#layout_blscsj_to").fieldValue() != "" && $("#layout_psasj_from").fieldValue()!="" && $("#layout_psasj_to").fieldValue() != ""){
		}else if($("#layout_blscsj_from").fieldValue()=="" && $("#layout_blscsj_to").fieldValue() == "" && $("#layout_psasj_from").fieldValue()=="" && $("#layout_psasj_to").fieldValue() == ""){
		}else if($("#layout_blscsj_from").fieldValue()!=="" && $("#layout_blscsj_to").fieldValue() !== "" && $("#layout_psasj_from").fieldValue()=="" && $("#layout_psasj_to").fieldValue() == ""){
		}else if($("#layout_blscsj_from").fieldValue()=="" && $("#layout_blscsj_to").fieldValue() == "" && $("#layout_psasj_from").fieldValue()!=="" && $("#layout_psasj_to").fieldValue() !== ""){
		}
		
		else{
			alert("若根据时间筛选，请将时间段填写完整。");
			return false;
		}
		return true;
	}
	
	
	
</script>

</t:html>