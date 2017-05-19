<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="有效期零件报警报表">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

<script type="text/javascript">
	
</script>
</head>
<t:page i18n="有效期零件报警">
	<t:grid id="grid_yxqljbj" caption="查询条件" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  pageSize="15"
		idKeys="lingjbh,usercenter" scrollHeight="280" exportXls="true"  src="/baob/queryyouxqljbj.ajax" >
		<t:fieldLayout id="fhtz" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true" width="90"  defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldText property="lingjbh" caption="零件编号" width="90" maxLength="10" minLength="10"></t:fieldText>
			<t:fieldText property="baojtqq" caption="报警提前期" notNull="true" dataType="number" expressionMessage='只能为0-9999整数' expression="^[1-9][0-9]{0,4}$|^0$" width="90"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="用户中心" width="70"  />
		<t:gridCol  property="lingjbh" caption="零件编号" width="70"  />
		<t:gridCol  property="lingjmc" caption="零件名称" width="95" />
		<t:gridCol  property="gongysdm" caption="供应商代码"  width="70"/>
		<t:gridCol  property="gongysmc" caption="供应商名称" width="90"  />
		<t:gridCol  property="lingjsl" caption="零件数量" width="70"  />
		<t:gridCol  property="shixrq" caption="失效日期" width="140"/>
		<t:gridCol  property="rukrq" caption="入库时间" width="140" />
		<t:gridCol  property="ucgs" caption="UC个数" width="85" />
		<t:gridCol  property="cangkbh" caption="仓库编号" width="120" />
		<t:gridCol  property="zickbh" caption="子仓库编号" width="95" />
		<t:gridCol  property="ush" caption="US号" width="95" />
		<t:gridCol  property="kuwbh" caption="库位" width="95" />
		<t:gridCol  property="pich" caption="批次号" width="120" />
		<t:gridCol  property="elh" caption="EL号" width="95" />
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>
<script type="text/javascript">
//空格查询
function grid_fhtz_beforeSubmit() {
	$("#layout_lingjbh").fieldValue(trim($("#layout_lingjbh").fieldValue()));    
	$("#layout_baojtqq").fieldValue(trim($("#layout_baojtqq").fieldValue()));  
	
	
}
</script>
</t:html>
