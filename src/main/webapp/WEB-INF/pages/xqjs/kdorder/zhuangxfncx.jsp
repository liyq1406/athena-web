<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.kdzqdd.aixdd">
	<t:grid id="grid_zhuangxfncx" caption="${i18n.zhuangxfncx}" showNum="true" idKeys="id"  add="NOT" exportXls="true"
	edit="NOT" remove="NOT" src="/kdorder/queryAixddppgzjg.ajax" submit="NOT" reset="NOT" scrollHeight="342">
			<t:fieldLayout prefix="gridLayout">
			<t:fieldHidden property="gongysdm"></t:fieldHidden>
			<t:fieldHidden property="dingdh"></t:fieldHidden>
			</t:fieldLayout>
	<t:gridCol property="usercenter"  caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="dinghcj" caption="${i18n.dinghcj}"></t:gridCol>
	<t:gridCol property="uabzucrl" caption="${i18n.baozrl}"></t:gridCol>
	<t:gridCol property="uabzlx" caption="${i18n.baozlx}"></t:gridCol>
	<t:gridCol property="fayrq" caption="${i18n.chugrq}"></t:gridCol>
	<t:gridCol property="dinghsl" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="duouads" caption="${i18n.duo}UA${i18n.duis}"></t:gridCol>
	<t:gridCol property="shaouads" caption="${i18n.shao}UA${i18n.duis}"></t:gridCol>
	<t:gridCol property="chayl" caption="${i18n.chayl}"></t:gridCol>
	</t:grid>
	</t:page>
	<script type="text/javascript"> 
	</script>
	<style type="text/css"></style>
</t:html>