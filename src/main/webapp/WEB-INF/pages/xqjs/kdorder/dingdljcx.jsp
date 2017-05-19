<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.queryTitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.kdorder">
<t:form id="kdorder"  reset="NOT" submit="NOT">
	<t:grid id="grid_kdorder" idKeys="usercenter,dingdh" 
		caption="${i18n.queryTitle}" showNum="true"
		src="/kdorder/queryListDingdlj.ajax" exportXls="true"
		add="NOT" remove="NOT" edit="NOT" load="false" >
	
		<t:fieldLayout id="sq_select" prefix="kd" columns="2">
					<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"
					convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="false" ></t:fieldSelect>
				
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}"
				maxLength="10" minLength="9" width="150"></t:fieldText>
		</t:fieldLayout>

		<t:gridCol property="usercenter" width="80" caption="${i18n.usercenter}"></t:gridCol>
			
		<t:gridCol property="lingjbh"  caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol property="lingjmc"  width="150" caption="${i18n.lingjmc}"></t:gridCol>
		
		<t:gridCol property="dingdh"  caption="${i18n.dingdh}"></t:gridCol>
		<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
		<t:gridCol property="dinghcj"  caption="${i18n.dinghcj}"></t:gridCol>
		<t:gridCol property="baozrl"  caption="${i18n.baozrl}"></t:gridCol>
		
		<t:gridCol editor="fieldText" property="p0sl"  caption="p0" ></t:gridCol>
		<t:gridCol editor="fieldText" property="p1sl"  caption="p1" ></t:gridCol>
		<t:gridCol editor="fieldText" property="p2sl"  caption="p2" ></t:gridCol>
		<t:gridCol editor="fieldText" property="p3sl"  caption="p3" ></t:gridCol>
		<t:gridCol editor="fieldText" property="p4sl"  caption="p4" ></t:gridCol>
		<t:gridCol property="jihyz" caption="${i18n.jihyz}"></t:gridCol>
	</t:grid>
</t:form>

</t:page>

<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['dingdlx'] = {
		'1' : '${i18n.kdlx}',
		'2' : '${i18n.aixlx}',
		'4' : '${i18n.teslx}'
	};
	
	/*
	function showBaozsl(col, value, rowIndex, colIndex) {
		var obj = this;
		var uabzrl = value["uabzucrl"];
		var baozsl = value["uabzucsl"];
		var showValue;
		showValue = uabzrl*baozsl;
		return "" + showValue;
	}
	*/		
</script>

</t:html>