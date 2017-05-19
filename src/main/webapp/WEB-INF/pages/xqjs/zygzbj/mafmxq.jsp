<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.mafmxq">
	<t:grid id="grid_mafmxq" caption="maf${i18n.kumxqdblb}" idKeys="lingjbh" showNum="true"
	src="/zygzbj/queryMafmxq.ajax" add="NOT" edit="NOT" remove="NOT" exportXls="true">
	<t:fieldLayout prefix="gridLayout" columns="3">
	<t:fieldSelect property="usercenter" width="150" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:fieldSelect>
		<t:fieldText property="lingjbh" width="150" caption="${i18n.lingjbh}" maxLength="10"></t:fieldText>
		<t:fieldText property="gongysdm" width="150" caption="供应商代码" maxLength="10"></t:fieldText>
		<t:fieldText property="mafcode" width="150" caption="中转库代码" maxLength="10"></t:fieldText>
		<t:fieldSelect property="jihy" convert="getJihz" width="150" caption="计划员组"></t:fieldSelect>
	</t:fieldLayout>
	<t:button caption="毛需求对比" name="mxqduib"></t:button>
	<t:gridCol property="usercenter" width="60" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="零件名称"></t:gridCol>
	<t:gridCol property="riq"  caption="J1${i18n.riq}"></t:gridCol>
	<t:gridCol property="xuq1" caption="N+1毛需求"></t:gridCol>
	<t:gridCol property="xuq2" caption="N+2毛需求"></t:gridCol>
	<t:gridCol property="xuq3" caption="N+3毛需求"></t:gridCol>
	<t:gridCol property="xuq4" caption="N+4毛需求"></t:gridCol>
	<t:gridCol property="xuq5" caption="N+5毛需求"></t:gridCol>
	<t:gridCol property="mafkc" caption="maf${i18n.kuc}"></t:gridCol>
	<t:gridCol property="gongzr" caption="可维持到工作日"></t:gridCol>
	<t:gridCol property="gongysdm" caption="供应商代码"></t:gridCol>
	<t:gridCol property="gongysmc" caption="供应商名称"></t:gridCol>
	<t:gridCol property="fene" caption="份额"></t:gridCol>
	<t:gridCol property="mafcode" caption="中转库代码"></t:gridCol>
	<t:gridCol property="jihy" caption="计划员"></t:gridCol>
	</t:grid>
	</t:page>
	<script type="text/javascript"> 
		/*
		*毛需求对比
		*/
		function func_button_mxqduib(){
			$.sdcui.ajaxUtil.ajax({
	            url:"maoxqDuib.ajax",//请求url
	           	success:function (result){
	           		alert(result.result);
	            }
	    	});
		}
	</script>
	<style type="text/css"></style>
</t:html>