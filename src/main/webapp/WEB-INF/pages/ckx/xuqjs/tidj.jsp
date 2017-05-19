<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.tidj}">

<!-- 
	 替代件
	 @author qizhongtao
	 @date 2012-3-28
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_tidj">
		<t:grid id="grid_tidj" caption="${i18n.tidj}" idKeys="usercenter,tidljh,lingjbh" load="false" editable="true" showNum="true" back="NOT" scrollHeight="335" pageSize="15"
			src="/xuqjs/queryTidj.ajax" editSrc="/xuqjs/getTidj.ajax" saveRowsSrcs="/xuqjs/saveTidj.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows">
			<t:fieldLayout id="fl_tidj" prefix="tidj" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150"/>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" dataType="text" width="150"/>
				<t:fieldText property="tidljh" caption="${i18n.tidljh}"  maxLength="10" minLength="10" dataType="text" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" 
				editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text'}" width="100"></t:gridCol>
			<t:gridCol property="tidljh" caption="${i18n.tidljh}" editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text'}" width="100"></t:gridCol>
			<t:gridCol property="" caption=""/>
		</t:grid>
	</t:page>

<script type="text/javascript">
		//空格查询
		function grid_tidj_beforeSubmit() {
			$("#tidj_lingjbh").fieldValue(trim($("#tidj_lingjbh").fieldValue()));
			$("#tidj_tidljh").fieldValue(trim($("#tidj_tidljh").fieldValue()));
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