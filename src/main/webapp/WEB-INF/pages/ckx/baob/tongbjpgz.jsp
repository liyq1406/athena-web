<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="同步-集配-跟踪">

<!-- 
	同步-集配-跟踪
	 hj
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 85px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_tongbjpgz" caption="同步-集配-跟踪" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="true"
		 src="/baob/querytongbjpgz.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="lj" prefix="tongb" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="yaohlh" caption="要货令号"  width="150" dataType="text" maxLength="12"  />
			<t:fieldText property="lingjbh" caption="零件编号"  width="150" dataType="text" maxLength="10"/>
			<t:fieldText property="gongysdm" caption="供应商编号"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"/>
			<t:fieldText property="chengysdm" caption="承运商编号" width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"/>
 			<t:fieldText property="cangkbh" caption="仓库编号"  width="150" dataType="text" maxLength="3"/>
 			<t:fieldText property="peislb" caption="配送类别"  width="150" dataType="text" maxLength="4"/>
 			<t:fieldText property="keh" caption="客户" column="2" width="150" dataType="text" maxLength="6"/>
<%-- 			<t:fieldCustom property="weiz"></t:fieldCustom> --%>
			<t:fieldCalendar property="zuiwsj_from" caption="交付时间从"   width="120" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="zuiwsj_to" caption="至" width="120"   format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="yaohlh" caption="要货令号" width="70"  />
<%-- 		<t:gridCol  property="lingjxh" caption="零件序号" width="70"  /> --%>
		<t:gridCol  property="zhengclsh" caption="整车流水号" width="70"  />
		<t:gridCol  property="weiz" caption="位置号" width="70" />
		<t:gridCol  property="lingjbh" caption="零件编号" width="85" 	/>
		<t:gridCol  property="lingjmc" caption="零件名称" width="50" />
		<t:gridCol  property="zhengcsxsj" caption="整车上线时间" width="70" />
		<t:gridCol  property="gongysdm" caption="供应商编号" width="60" />
		<t:gridCol  property="gongysmc" caption="供应商名称" width="95" />
		<t:gridCol  property="lingjsl" caption="零件数量" width="95" />
		<t:gridCol  property="danw" caption="零件单位" width="95" />
		<t:gridCol  property="xiaohd" caption="消耗点" width="95" />
		<t:gridCol  property="yaohlx" caption="要货类型" width="95" />
		<t:gridCol  property="baozxh" caption="包装型号" width="95" />
		<t:gridCol  property="yaohsl" caption="零件数量" width="95" />
		<t:gridCol  property="chengysdm" caption="承运商编号" width="95" />
		<t:gridCol  property="yaohllx" caption="要货类型" width="95" />
		<t:gridCol  property="zuiwsj" caption="交付时间" width="95" />
		<t:gridCol  property="xiehd" caption="卸货点" width="95" />
		<t:gridCol  property="mudd" caption="目的地" width="95" />
		<t:gridCol  property="cangkbh" caption="仓库编号" width="95" />
		<t:gridCol  property="zickbh" caption="子仓库" width="95" />
		<t:gridCol  property="peislb" caption="配送类别" width="95" />
		<t:gridCol  property="keh" caption="客户" width="95" />
		<t:gridCol  property="tongblshqj" caption="流水号区间" width="95" />
		<t:gridCol  property="yaohlzt" caption="状态" width="95" />
		<t:gridCol  property="yaohlscsj" caption="表达时间" width="95" />
		
	
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>

<script type="text/javascript">

	//空格查询
	function grid_tongbjpgz_beforeSubmit() {
		if($("#tongb_zuiwsj_from").fieldValue()!="" && $("#tongb_zuiwsj_to").fieldValue() != ""){
		}else if($("#tongb_zuiwsj_from").fieldValue()=="" && $("#tongb_zuiwsj_to").fieldValue() == "" ){
		}else{
			alert("若根据时间筛选，请将时间段填写完整。");
			return false;
		}
		return true;
	}
	
	
	
</script>

</t:html>