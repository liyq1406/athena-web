<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.chanxhb}">

<!-- 
	   产线合并
	 @author qizhongtao
	 @date 2012-4-17
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_chanxhb">
		<t:grid id="grid_chanxhb" caption="${i18n.chanxhb}" idKeys="usercenter,yuancx" load="false" remove="NOT" back="NOT"  afterSaveRowsEvent="afterSaveRows"
			src="/xuqjs/queryChanxhb.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveChanxhb.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
			scrollHeight="335" pageSize="15">
			<t:fieldLayout id="fl_chanxhb" prefix="chanxhb" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150"/>
				<t:fieldText property="yuancx" caption="${i18n.yuancx}" dataType="text" maxLength="5" minLength="5" width="150"/>
				<t:fieldText property="mubcx" caption="${i18n.mubcx}" dataType="text" maxLength="5" minLength="5" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter"   caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" 
				editorOptions="{'notNull':true}" width="100"/>
			<t:gridCol property="yuancx"   caption="${i18n.yuancx}" editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'5','minLength':'5','dataType':'text'}" width="120"/>
			<t:gridCol property="mubcx"  caption="${i18n.mubcx}" editor="fieldText" 
				editorOptions="{'maxLength':'5','minLength':'5','dataType':'text'}" width="120"/>
			<t:gridCol property="" caption="" />
		</t:grid>
		
	</t:page>
	

	<script type="text/javascript">
	
		//空格查询
		function grid_chanxhb_beforeSubmit() {
			$("#chanxhb_yuancx").fieldValue(trim($("#chanxhb_yuancx").fieldValue()));
			$("#chanxhb_mubcx").fieldValue(trim($("#chanxhb_mubcx").fieldValue()));
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











