<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.dingdjsyl}">

<!-- 
	订单计算依赖关系
	 @author qizhongtao
	 @date 2012-4-16
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_dingdjsyl">
		<t:grid id="grid_dingdjsyl" caption="${i18n.yilgx}" load="false" remove="NOT" idKeys="gongysbh,waibghms,yilgx" back="NOT"  scrollHeight="335" pageSize="15"
			src="/xuqjs/queryDingdjsyl.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveDingdjsyl.ajax"  afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
			<t:fieldLayout id="fl_dingdjsyl" prefix="dingdjsyl" columns="2">
				<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" maxLength="10" minLength="10" width="150"/>
				<t:fieldSelect property="waibghms" caption="${i18n.waibghms}" convert="queryWaibghms"  width="150"/>
			</t:fieldLayout>
			<t:gridCol property="gongysbh"   caption="${i18n.gongysbh}" editor="fieldText" 
				editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'${i18n.gongysbh_ex_mes}','notNull':true}"/>
			<t:gridCol property="waibghms"   caption="${i18n.waibghms}" editor="fieldSelect" width="100" convert="queryWaibghms" editorOptions="{'notNull':true}"/>
			<t:gridCol property="yilgx"  caption="${i18n.yilgx}" editor="fieldSelect" convert="queryYilgx" editorOptions="{'notNull':true}" width="150"/>
			<t:gridCol property="" caption="" />
		</t:grid>
		
	</t:page>
	

	<script type="text/javascript">
	
		var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';
		//空格查询
		function grid_dingdjsyl_beforeSubmit() {
			$("#dingdjsyl_gongysbh").fieldValue(trim($("#dingdjsyl_gongysbh").fieldValue()));
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











