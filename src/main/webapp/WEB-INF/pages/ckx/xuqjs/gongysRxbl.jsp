<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.gongysRouxbl}">

<!-- 
	供应商-柔性比例
	 @author qizhongtao
	 @date 2012-4-09
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_gongysRouxbl">
		<t:grid id="grid_gongysRouxbl" caption="${i18n.gongysRouxbl}" idKeys="usercenter,dinghzq,gongysbh,guanjljjb" load="false" remove="NOT" back="NOT"  scrollHeight="335" pageSize="15"
			src="/xuqjs/queryGongysRouxbl.ajax"  editable="true" showNum="true" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" 
			saveRowsSrcs="/xuqjs/saveGongysRouxbl.ajax" afterSaveRowsEvent="afterSaveRows">
			<t:fieldLayout id="fl_gongysRouxbl" prefix="gongysRouxbl" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150"/>
				<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" maxLength="10" minLength="10"  width="150"/>
				<t:fieldSelect property="guanjljjb" caption="${i18n.guanjljjb}" convert="queryGuanjljjb"  width="150"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter"   caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"/>
			<t:gridCol property="gongysbh"  caption="${i18n.gongysbh}" editor="fieldText" 
				editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'${i18n.gongysbh_ex_mes}','notNull':true}"/>
			<t:gridCol property="guanjljjb"   caption="${i18n.guanjljjb}" editor="fieldSelect" convert="queryGuanjljjb" width="100" editorOptions="{'notNull':true}" />
			<t:gridCol property="dinghzq" caption="${i18n.dinghzq}" editor="fieldSelect" convert="queryDinghzq" editorOptions="{'notNull':true}" />
			<t:gridCol property="rouxbl" caption="${i18n.rouxbl}" editorOptions="{'expression':'^(([0-9]{0,2})|100)$','expressionMessage':'${i18n.rouxbl_ex_mes}'}" editor="fieldText"  />
			<t:gridCol property="" caption=""/>
		</t:grid>
		
	</t:page>
	

	<script type="text/javascript">
	
		var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';
		
		//空格查询
		function grid_gongysRouxbl_beforeSubmit() {
			$("#gongysRouxbl_gongysbh").fieldValue(trim($("#gongysRouxbl_gongysbh").fieldValue()));
		}
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
	</script>
</t:html>











