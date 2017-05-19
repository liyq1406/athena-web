<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="发货通知查询报表">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

<script type="text/javascript">
	
</script>
</head>
<t:page i18n="发货通知查询">
	<t:grid id="grid_fhtz" caption="查询条件" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  pageSize="15"
		idKeys="lingjbh,usercenter" scrollHeight="280" exportXls="true"  src="/baob/queryfahtzcx.ajax" >
		<t:fieldLayout id="fhtz" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true" width="90"  defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldText property="blh" caption="发货通知号" width="90" maxLength="17"></t:fieldText>
			<t:fieldCalendar property="createtime" caption="开始日期" format="yyyy-MM-dd" width="120" notNull="true"/>
			<t:fieldCalendar property="finishedtime" caption="结束日期" format="yyyy-MM-dd" width="120" notNull="true"/>
			<t:fieldText property="tch" caption="集装箱号/TC" width="90" maxLength="22"></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商编码" width="90" maxLength="10" minLength="10"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="用户中心" width="70"  />
		<t:gridCol  property="blh" caption="发货通知号" width="70"  />
		<t:gridCol  property="yaohlh" caption="要货令" width="95" />
		<t:gridCol  property="lingjbh" caption="零件编号"  width="70"/>
		<t:gridCol  property="tch" caption="集装箱号" width="90"  />
		<t:gridCol  property="lingjsl" caption="零件数量" width="70"  />
		<t:gridCol  property="dingdh" caption="订单号" width="85" 	/>
		<t:gridCol  property="blscsj" caption="发运时间" width="140" />
		<t:gridCol  property="cangkbh" caption="目的地" width="120" />
		<t:gridCol  property="uarl" caption="包装数量" width="95" />
		<t:gridCol  property="gongysdm" caption="供应商代码" width="95" />
		<t:gridCol  property="jihy" caption="计划员" width="95" />
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>
<script type="text/javascript">
//空格查询
function grid_fhtz_beforeSubmit() {
	$("#layout_blh").fieldValue(trim($("#layout_blh").fieldValue()));    
	$("#layout_createtime").fieldValue(trim($("#layout_createtime").fieldValue()));  
	$("#layout_finishedtime").fieldValue(trim($("#layout_finishedtime").fieldValue()));
	$("#layout_tch").fieldValue(trim($("#layout_tch").fieldValue()));    
	$("#layout_gongysbm").fieldValue(trim($("#layout_gongysbm").fieldValue()));  
	
	
	//比较时间大小 结束时间必须大于开始时间
	var createtime = trim($("#layout_createtime").fieldValue());
	var finishedtime = trim($("#layout_finishedtime").fieldValue());
	if(!compareDate(createtime,finishedtime)){
		alert("结束日期必须大于开始日期");
		return false;
	}
	
}
</script>
</t:html>
