<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcx}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.kanbyhl.kanbjs" >
	   <t:form id="maoxq_query"  reset="NOT" submit="NOT">
		<t:grid id="grid_maoxqMX" idKeys="id" caption="${i18n.mxqmx}"  showNum="true"    scrollHeight="458"
			src="/kanbyhl/maoxqMxQr.ajax"  usePager="true"  add="NOT"  remove="NOT"  edit="NOT"  pageSize="20" >
				<t:fieldLayout  id="kanb_query" prefix="kanb" columns="3">
			                  <t:fieldHidden property="xuqbc" ></t:fieldHidden>
				              <t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150"></t:fieldSelect>
				              <t:fieldSelect property="jihyz" caption="${i18n.jihyz}" width="150" convert="getJihz"></t:fieldSelect>
				              <t:fieldText property="lingjbh"  caption="${i18n.lingjbh}"  width="150" maxLength="10"></t:fieldText>
				              <t:fieldCalendar property="xuqcfsj"  caption="${i18n.cfsj}" width="150" format="yyyy-MM-dd"></t:fieldCalendar>
				              <t:fieldSelect property="xuqly" caption="${i18n.xuqly}" width="150" convert="convertXqlyForChn"></t:fieldSelect>
				</t:fieldLayout>
				<t:gridCol   property="usercenter"  type="text" caption="${i18n.usercenter}" ></t:gridCol>
				<t:gridCol   property="lingjbh" type="text" caption="${i18n.lingjbh}" ></t:gridCol>
				<t:gridCol   property="starttime" type="text" caption="${i18n.starttime}" ></t:gridCol>
				<t:gridCol   property="endtime" type="text" caption="${i18n.endtime}" ></t:gridCol>
				<t:gridCol   property="xuqcfsj" type="text" caption="${i18n.cfsj}"  ></t:gridCol>
				<t:gridCol   property="chanx" type="text" caption="${i18n.chanx}" ></t:gridCol>
				<t:gridCol   property="shiycj" type="text" caption="${i18n.shiycj}" ></t:gridCol>
				<t:gridCol   property="xuqsl" type="text" caption="${i18n.xuqsl}" ></t:gridCol>
				<t:gridCol   property="danw" type="text" caption="${i18n.danw}" ></t:gridCol>
				<t:gridCol   property="xuqly" type="text" caption="${i18n.xuqly}" convert="convertXqlyForChn"></t:gridCol>
				<t:gridCol   property="zhizlx" type="text" caption="${i18n.zhizlx}" ></t:gridCol>
				</t:grid>
		   </t:form>
		   <input id="removeId" value="${removeId}" type="hidden"/>  
		   
		</t:page>
	<script type="text/javascript">
	    //$.sdcui.serverConfig.convertArray['codeCenter']={'UW':'${i18n.uw }','UH':'${i18n.uh}','UX':'${i18n.ux}'};

	</script>
	<style type="text/css"></style>
</t:html>