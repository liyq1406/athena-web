<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<script type="text/javascript">
			function initPage(){
		    	getGridHeight();
		    }
			
			//标识位
			$.sdcui.serverConfig.convertArray['tcZhuangt'] = {
				'0' : '空箱',
				'1' : '重箱'
			};
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
			<t:fieldLayout columns="4" prefix="select">
				<t:fieldSelect property="usercenter" width="100" caption="${i18n.usercenter}"   convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldText property="tcNo" width="100" caption="${i18n.tcNo}" notNull="true" ></t:fieldText>
				<t:fieldText property="dingdh" width="100" caption="${i18n.dingdh}"></t:fieldText>
				<t:fieldSelect property="tczt" caption="${i18n.tczt}" convert="tcZhuangt" width="100"/>
			</t:fieldLayout>
			<t:gridCol property="lingjbh"  caption="${i18n.lingjbh}"/>
			<t:gridCol property="dingdh"  caption="${i18n.dingdh}"/>
			<t:gridCol property="tcno"  caption="${i18n.tcNo }"/>
			<t:gridCol property="lingjzl" caption="${i18n.lingjzl}" />
<%-- 			<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" /> --%>
			<t:gridCol property="dinghcj" caption="${i18n.cangkbh}" />
			<t:gridCol property="zuiswld" caption="${i18n.zuiswld}" />
			<t:gridCol property="tczt" convert="tcZhuangt" caption="${i18n.tczt}" />
			<t:gridCol property="muxh" caption="${i18n.muxh}" />
			<t:gridCol property="jihy" caption="${i18n.jihydm}" />
			<t:gridCol property="uaxh" caption="${i18n.uaxh}" />
			<t:gridCol property="uarl" caption="${i18n.uarl}" />
			<t:gridCol property="countuah" caption="${i18n.countua}" />
			<t:gridCol property="edit_time" caption="${i18n.edit_time}" />
		</t:grid>
		<t:fieldLayout>
	</t:fieldLayout>
	</t:page>
</t:html>