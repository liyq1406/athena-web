<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<script type="text/javascript">
			$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
			function initPage(){
		    	var pageHeight = document.body.clientHeight;
				var gridHeight = pageHeight - 186;
				$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
				  return gridHeight;
				});
				$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
					  return gridHeight;
				});
		    }
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.lingjcx.selecttc">
		<t:grid id="grid_selecttc" 
			idKeys="lingjh"
			caption="${i18n.title_index}" 
			src="selectTccx.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" exportXls="true"  back="NOT"  showNum="true">
			<t:fieldLayout columns="3" prefix="select">
				<t:fieldSelect property="usercenter" width="100" caption="${i18n.usercenter}" defaultValue="${usercenter }" notNull="true" convert="queryUserCenterMap" readonly="true"></t:fieldSelect>
				<t:fieldText property="tcNo" width="100" caption="${i18n.tcNo}" defaultValue="${tcNo }" notNull="true"  readonly="true"></t:fieldText>
				<t:fieldText property="dingdh" width="100" caption="${i18n.dingdh}"></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="lingjbh"  caption="${i18n.lingjbh}"/>
			<t:gridCol property="dingdh"  caption="${i18n.dingdh}"/>
			<t:gridCol property="lingjzl" caption="${i18n.lingjzl}" />
			<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" />
			<t:gridCol property="jihy" caption="${i18n.jihydm}" />
			<t:gridCol property="uaxh" caption="${i18n.uaxh}" />
			<t:gridCol property="uarl" caption="${i18n.uarl}" />
			<t:gridCol property="countuah" caption="${i18n.countua}" />
		</t:grid>
		<t:fieldLayout>
	</t:fieldLayout>
	</t:page>
</t:html>