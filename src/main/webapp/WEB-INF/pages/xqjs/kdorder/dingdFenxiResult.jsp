<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.KDbijiaojieguo}" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.kdorder">
<script type="text/javascript">
function renderer0(col,value,rowindex,colindex) {
	return value.bijiaop0 + "%";
}
function renderer1(col,value,rowindex,colindex) {
	return value.bijiaop1 + "%";
}
function renderer2(col,value,rowindex,colindex) {
	return value.bijiaop2 + "%";
}
function renderer3(col,value,rowindex,colindex) {
	return value.bijiaop3 + "%";
}
function renderer4(col,value,rowindex,colindex) {
	return value.bijiaop4 + "%";
}
function func_grid_expxls(){
	var pplbc = $('#layout_pplbc').fieldValue();
	var dingdh1 =  $('#layout_dingdh1').fieldValue();
	var dingdh2 = $('#layout_dingdh2').fieldValue();
	var jizhunValue = $('#layout_jizhunValue').fieldValue();
	var dingdjssj1 = $('#layout_dingdjssj1').fieldValue();
	var dingdjssj2 = $('#layout_dingdjssj2').fieldValue(); 
	$.sdcui.pageUtils.goPage({
		url:'/kdorder/dingdFxExport.do?pplbc='+pplbc+'&dingdh1='+dingdh1+'&dingdh2='+dingdh2+'&jizhunValue='+jizhunValue+'&dingdjssj1='+dingdjssj1+'&dingdjssj2='+dingdjssj2,//url
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

<t:grid id="bijiaoGrid" caption="${i18n.dingdfx}" 
	src="/kdorder/bijiao.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="true" showNum="true" scrollHeight="325">
	<t:button name="expxls" caption="${i18n.daochu }" active="3"/>
	<t:fieldLayout prefix="layout">
		<t:fieldHidden property="pplbc"></t:fieldHidden>
		<t:fieldHidden property="dingdh1"></t:fieldHidden>
		<t:fieldHidden property="dingdh2"></t:fieldHidden>
		<t:fieldHidden property="jizhunValue"></t:fieldHidden>
		<t:fieldHidden property="dingdjssj1"></t:fieldHidden>
		<t:fieldHidden property="dingdjssj2"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}" width="100"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="100"></t:gridCol>
	<t:gridCol property="zhongwmc"  caption="${i18n.lingjmc}" width="150"></t:gridCol>
	<t:gridCol property="gongysdm"  caption="${i18n.gongysdm}" width="100"></t:gridCol>
	<t:gridCol property="zhizlx"  caption="${i18n.zhizlx}" width="100"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.danw}" width="100"></t:gridCol>
	<t:gridCol property="p0fyzqxh" caption="${i18n.p0fyzqxh}" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp0" caption="${i18n.p0jiz}" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp0" caption="${i18n.p0bij}" width="100"></t:gridCol>
	<t:gridCol property="bijiaop0" renderer="renderer0" caption="${i18n.p0bil}" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp1" caption="${i18n.p1jiz}" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp1" caption="${i18n.p1bij}" width="100"></t:gridCol>
	<t:gridCol property="bijiaop1" renderer="renderer1" caption="${i18n.p1bil}" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp2" caption="${i18n.p2jiz}" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp2" caption="${i18n.p2bij}" width="100"></t:gridCol>
	<t:gridCol property="bijiaop2" renderer="renderer2" caption="${i18n.p2bil}" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp3" caption="${i18n.p3jiz}" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp3" caption="${i18n.p3bij} " width="100"></t:gridCol>
	<t:gridCol property="bijiaop3" renderer="renderer3" caption="${i18n.p3bil}" width="100"></t:gridCol>
	<t:gridCol property="jizhunSlp4" caption="${i18n.p4jiz}" width="100"></t:gridCol>
	<t:gridCol property="bijiaoSlp4" caption="${i18n.p4bij}" width="100"></t:gridCol>
	<t:gridCol property="bijiaop4" renderer="renderer4" caption="${i18n.p4bil}" width="100"></t:gridCol>
</t:grid>
</t:form>
<p>
</p>
</t:page>
</t:html>