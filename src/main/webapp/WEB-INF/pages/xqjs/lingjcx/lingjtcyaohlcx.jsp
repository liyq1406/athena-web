<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<script type="text/javascript">
		function initPage(){
		    	var pageHeight = document.body.clientHeight;
				var gridHeight = pageHeight - 216;
				$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
				  return gridHeight;
				});
				$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
					  return gridHeight;
					});
		    }
		$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.lingjcx.lingjtcyaohlcx">
		<t:grid id="grid_lingjtcyaohlcx" 
			idKeys="tcNo"
			caption="${i18n.title_index}" 
			src="selectYaohlByYaohlh.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" showNum="true" exportXls="true"  back="NOT"  >
			<t:fieldLayout columns="4" prefix="select">
				<t:fieldSelect property="usercenter" width="100" caption="${i18n.usercenter}" defaultValue="${usercenter }" notNull="true" convert="queryUserCenterMap" readonly="true"></t:fieldSelect>
				<t:fieldText property="lingjbh" width="100" caption="${i18n.lingjbh}" defaultValue="${lingjbh }"  readonly="true"></t:fieldText>
				<t:fieldText property="tcNo" width="100" caption="${i18n.tcNo}"  readonly="true"></t:fieldText>
				<t:fieldHidden property="dingdh" defaultValue="${dingdh }"/>
				<t:fieldText property="yaohlh" width="100" caption="${i18n.yaohlh}" maxLength="12"></t:fieldText>
				<t:fieldCalendar property="jiaofj" width="100" caption="${i18n.jiaofj}" format="yyyy-MM-dd" ></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="tcNo" caption="${i18n.tcNo}"/>
			<t:gridCol property="dingdh"  caption="${i18n.dingdh}"/>
			<t:gridCol property="yaohlh" caption="${i18n.yaohlh}"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"/>
			<t:gridCol property="gongysdm"  caption="${i18n.gongysdm}"/>
			<t:gridCol property="gongysmc" caption="${i18n.gongysmc}"/>
			<t:gridCol property="uaxh"  caption="${i18n.uaxh}"/>
			<t:gridCol property="uarl"  caption="${i18n.uarl}"/>
			<t:gridCol property="jiaofj" caption="${i18n.jiaofj}"/>
			<t:gridCol property="lujdm" caption="${i18n.lujdm}"/>
		</t:grid>
	</t:page>
</t:html>