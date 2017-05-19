<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.yundmx_title}" >
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
<t:page i18n="i18n.kac.yund.i18n_yundgz">
 <t:form id="yundgzmx_edit"  reset="NOT" submit="NOT">
				<t:grid id="grid_yundgzmx" idKeys="usercenter,yundh" caption="${i18n.yundmx_title}"  
				  showNum="true" scrollHeight="440" pageSize="20" submit="NOT" reset="NOT"
				  add="NOT"  edit="NOT"  remove="NOT"   
				  dataFormId="form_sqedit"   
				  src="/kac/queryYundgzmx.ajax"   usePager="true"  >
					<t:fieldLayout  id="layout" prefix="dbsq">
						<t:fieldLabel property="yundh" caption="${i18n.yundh}"/>
						<t:fieldLabel property="kach" caption="${i18n.kach }" />
			            <t:fieldHidden property="usercenter" ></t:fieldHidden>
			            <t:fieldHidden property="yundh" ></t:fieldHidden>
			             </t:fieldLayout>
					<t:gridCol  property="blh" type="text" caption="${i18n.blh}" width="120"></t:gridCol>
					<t:gridCol  property="zuiwsj" type="text" caption="${i18n.zuiwsj}" width="130"></t:gridCol>
					<t:gridCol  property="daztbh" type="text" caption="${i18n.daztbh}" width="100"></t:gridCol>
					<t:gridCol  property="xiehzt" type="text" caption="${i18n.xiehzt}" width="100"></t:gridCol>
					<t:gridCol property="chengysdm" type="text" caption="${i18n.chengysdm}" width="100"></t:gridCol>
					<t:gridCol  property="uasl" type="text"  caption="${i18n.uasl}" width="100"></t:gridCol>
					<t:gridCol  property="daohzt" type="text"  caption="${i18n.daohzt}" convert="daohzt" ></t:gridCol>
				</t:grid>
</t:form>

</t:page>
	<script type="text/javascript">
	
	 //用户中心
	var usercenter = $("#usercenter").val();
	
	//运单号
	 var   yundh = $("#yundh").val(); 
	
		$.sdcui.serverConfig.convertArray['daohzt'] = {
				'0' : '${i18n.C_DAOHZT_0}',
				'1' : '${i18n.C_DAOHZT_1}',
				'2' : '${i18n.C_DAOHZT_2}',
				'3' : '${i18n.C_DAOHZT_3}',
				'4' : '${i18n.C_DAOHZT_4}',
				'5' : '${i18n.C_DAOHZT_5}',
				'6' : '${i18n.C_DAOHZT_6}',
				'7' : '${i18n.C_DAOHZT_7}',
				'8' : '${i18n.C_DAOHZT_8}',
				'21' : '${i18n.C_DAOHZT_21}'
			};	
	</script>
	<style type="text/css"></style>
</t:html>