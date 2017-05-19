<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.yaocjh_title }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.fj.yaocjh" >
		<t:grid id="jhgzGrid" idKeys="yaocjhh" caption="${i18n.yaocjh_title }" 
		src="/fj/queryJihgz.ajax" add="NOT" edit="NOT" remove="NOT"  usePager="true" showNum="true">
		<t:fieldLayout  id="sq_select" prefix="jhgz" columns="2">
		        <t:fieldCalendar property="yaocjhxh" format="yyyy-MM-dd" caption="${i18n.yaocjhxh }"></t:fieldCalendar>
		        <t:fieldSelect property="yunslx"  caption="${i18n.yunslx }" src="/fj/queryYunslx.ajax" show="YUNSLXBH" code="YUNSLXBH" ></t:fieldSelect>
		        <t:fieldSelect property="yunssbm" parents="yunslx" parentsAlias="yunslxbh" caption="${i18n.yunss }" src="/fj/queryYunssCpk.ajax" show="CHENGYSBH" code="CHENGYSBH" ></t:fieldSelect>
		        <t:fieldSelect property="yaoczt"  caption="${i18n.zhuangt }" convert="yaoczt" ></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol   property="YAOCJHXH" type="text" caption="${i18n.yaocjhxh }" width="100"></t:gridCol>
		<t:gridCol   property="PEIZDH" type="text" caption="${i18n.peizdh }" width="100"></t:gridCol>
		<t:gridCol   property="DAOCSJ" width="120" type="text" caption="${i18n.daocsj }"></t:gridCol>
		<t:gridCol   property="FAYSJ" width="120" type="text" caption="${i18n.fysj } "></t:gridCol>
		<t:gridCol   property="YUNSLX" type="text" caption="${i18n.yunslx }"></t:gridCol>
		<t:gridCol   property="JIHCX"  type="text" caption="${i18n.chex }"></t:gridCol>
		<t:gridCol   property="YUNSSBM"  type="text" caption="${i18n.yunssbm }"></t:gridCol>
		<t:gridCol   property="YAOCZT" type="text" renderer="isYaoczt" caption="${i18n.zhuangt }"></t:gridCol>
		</t:grid>
	</t:page >
	
	<script type="text/javascript">
	
	$.sdcui.serverConfig.convertArray['yaoczt'] ={'1':'${i18n.ylzt1 }','2':'${i18n.ylzt2 }','3':'${i18n.ylzt3 }','4':'${i18n.ylzt4 }','5':'${i18n.ylzt5 }'} ;
	
	//数据格试化
	var isYaoczt = function(v) {
		switch (v * 1) {
		case 1:
			return "${i18n.ylzt1 }";
		case 2:
			return "${i18n.ylzt2 }";
		case 3:
			return "${i18n.ylzt3 }";
		case 4:
			return "${i18n.ylzt4 }";
		case 5:
			return "${i18n.ylzt5 }";			
		default:
			return v;

		}
	}
	</script>
	
</t:html>