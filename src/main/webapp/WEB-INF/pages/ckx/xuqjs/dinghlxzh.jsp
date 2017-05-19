<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.dinghlxzh}">

<!-- 
	订货路线转换
	 @author qizhongtao
	 @date 2012-4-5
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>

</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_dinghlxzh">
		<t:grid id="grid_dinghlxzh" caption="${i18n.dinghlxzh}" idKeys="usercenter,lingjbh,zhizlx" load="false" remove="NOT" back="NOT" scrollHeight="335" pageSize="15"
			src="/xuqjs/queryDinghlxzh.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveDinghlxzh.ajax"  afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
			<t:fieldLayout id="fl_dinghlxzh" prefix="dinghlxzh" columns="4">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="110"/>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="110"/>
				<t:fieldSelect property="zhizlx" caption="${i18n.zhizlx}" convert="queryZZLX" width="110"/>
				<t:fieldSelect property="dinghlx" caption="${i18n.dinghlx}" convert="queryDinghlx" width="110"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" 
				editorOptions="{'notNull':true}"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"  editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text'}"/>
			<t:gridCol property="zhizlx" caption="${i18n.zhizlx}" editor="fieldSelect" convert="queryZZLX" 
				editorOptions="{'notNull':true}"/>
			<t:gridCol property="dinghlx" caption="${i18n.dinghlx}" editor="fieldSelect" convert="queryDinghlx" width="100"/>
			<t:gridCol property="" caption="" />
		</t:grid>
		
	</t:page>
	

	<script type="text/javascript">
	
		//空格查询
		function grid_dinghlxzh_beforeSubmit() {
			$("#dinghlxzh_lingjbh").fieldValue(trim($("#dinghlxzh_lingjbh").fieldValue()));
			
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











