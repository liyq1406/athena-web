<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="Il件订单分析结果" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.ilOrder">
<script type="text/javascript">
function renderer0(col,value,rowindex,colindex) {
	var htmlValue = "";
	if(value.bijiaop0!=0){
		htmlValue = "<span  style=\"color: red;\">"+value.bijiaop0 + "%"+"</span>";
	}else{
		htmlValue = "0";
	}
	return htmlValue;
}
function renderer1(col,value,rowindex,colindex) {
	var htmlValue = "";
	if(value.bijiaop1!=0){
		htmlValue = "<span  style=\"color: red;\">"+value.bijiaop1 + "%"+"</span>";
	}else{
		htmlValue = "0";
	}
	return htmlValue;
}
function renderer2(col,value,rowindex,colindex) {
	var htmlValue = "";
	if(value.bijiaop2!=0){
		htmlValue = "<span  style=\"color: red;\">"+value.bijiaop2 + "%"+"</span>";
	}else{
		htmlValue = "0";
	}
	return htmlValue;
}
function renderer3(col,value,rowindex,colindex) {
	var htmlValue = "";
	if(value.bijiaop3!=0){
		htmlValue = "<span  style=\"color: red;\">"+value.bijiaop3 + "%"+"</span>";
	}else{
		htmlValue = "0";
	}
	return htmlValue;
}
function func_grid_exp(){
	var xuqbc = $("#layout_xuqbc").fieldValue();
	var flag = $("#layout_flag").fieldValue();
	var jizhunValue = $("#layout_jizhunValue").fieldValue();
	var dingdjssj = $("#layout_dingdjssj").fieldValue();
	var dingdjssj1 = $("#layout_dingdjssj1").fieldValue();
	var dingdjssj2 = $("#layout_dingdjssj2").fieldValue();
	var lingjbh = $("#layout_lingjbh").fieldValue();
	var gongysdm = $("#layout_gongysdm").fieldValue();
	$.sdcui.pageUtils.goPage({
		url:'/ilorder/dingdFenxiDownLoadFile.do?xuqbc='+xuqbc+'&flag='+flag+'&jizhunValue='+jizhunValue+'&dingdjssj='+dingdjssj+'&dingdjssj1='+dingdjssj1+'&dingdjssj2='+dingdjssj2+'&lingjbh='+lingjbh+'&gongysdm='+gongysdm,//url
		mode:'form',
		beforeSubmit:function(){
			//
			return true;
		}
	});
	event.stopPropagation();//阻止事件冒泡
	return false;
}
</script>
<!--主体内容开始-->
<t:form id="bijiaoForm" submit="NOT" reset="NOT">
<!-- 毛需求列表 -->
<t:grid id="bijiaoGrid" caption="订单分析" 
	src="/ilorder/bijiao.ajax" add="NOT" remove="NOT"  edit="NOT" load="true"  showNum="true" scrollHeight="164" >
	<t:fieldLayout prefix="layout">
		<t:fieldText property="lingjbh" caption="零件号"></t:fieldText>
		<t:fieldText property="gongysdm" caption="供应商" maxLength="10"></t:fieldText>
		<t:fieldHidden property="xuqbc"></t:fieldHidden>
		<t:fieldHidden property="flag"></t:fieldHidden>
		<t:fieldHidden property="jizhunValue"></t:fieldHidden>
		<t:fieldHidden property="dingdjssj"></t:fieldHidden>
		<t:fieldHidden property="dingdjssj1"></t:fieldHidden>
		<t:fieldHidden property="dingdjssj2"></t:fieldHidden>
		<t:button caption="导出Xls" name="exp"></t:button>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="用户中心" width="100"></t:gridCol>
	<t:gridCol property="lingjbh" caption="零件号" width="100"></t:gridCol>
	<t:gridCol property="zhongwmc"  caption="零件名称" width="150"></t:gridCol>
	<t:gridCol property="gongysdm"  caption="供应商" width="100"></t:gridCol>
	<t:gridCol property="zhizlx"  caption="制造路线" width="100"></t:gridCol>
	<t:gridCol property="danw" caption="零件单位" width="100"></t:gridCol>
	<t:gridCol property="p0fyzqxh" caption="p0日期" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp0" caption="P0基准" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp0" caption="P0比较数" width="100"></t:gridCol>
	<t:gridCol property="bijiaop0" renderer="renderer0" caption="p0比例" width="100"  ></t:gridCol>
	<t:gridCol property="jizhunSlp1" caption="P1基准" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp1" caption="P1比较数" width="100"></t:gridCol>
	<t:gridCol property="bijiaop1" renderer="renderer1" caption="p1比例" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp2" caption="P2基准" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp2" caption="P2比较数 " width="100"></t:gridCol>
	<t:gridCol property="bijiaop2" renderer="renderer2" caption="p2比例" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp3" caption="P3基准" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp3" caption="P3比较数 " width="100"></t:gridCol>
	<t:gridCol property="bijiaop3" renderer="renderer3" caption="p3比例" width="100"></t:gridCol>
	
</t:grid>
</t:form>
<div>
	备注: 
	<p>
	*比较结果第一列代表基准版次数据 
	</p>
	*比较结果第二列代表选择比较版次数据
	<p>
	*比较结果第三列代表两个结果比较的差异百分比 有差异的结果用红色标明 
	</p>
</div>
</t:page>
</t:html>