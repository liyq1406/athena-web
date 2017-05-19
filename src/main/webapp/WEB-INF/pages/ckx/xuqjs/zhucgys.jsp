<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>
<t:html title="${i18n.zhucgys}">

<!-- 
	   主从供应商
	 @author xss
	 @date 2015-2-4
	 0010495
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_zhucgys">
	<t:grid id="grid_Zhucgys" 
		src="/xuqjs/queryZhucgys.ajax"
		idKeys="usercenter,slavefanhs"  
		
		load="false" 
		back="NOT"
		add="NOT"
		edit="NOT"
		editable="true"
		showNum="true"
		
		removeSrc="/xuqjs/removeZhucgys.ajax"
		saveRowsSrcs="/xuqjs/saveZhucgys.ajax" 
		showEditorAddName="editorAdd" 
		showEditorRemoveName="editorRemove" 
	    afterSaveRowsEvent="afterSaveRows"	    
	    
		dataFormId="form_Zhucgys"
		scrollHeight="335" 
		pageSize="10"					
		>
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心"  convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="masterfanhs" caption="主返供应商" maxLength="10" minLength="10"  dataType="text" width="150"/>
			<t:fieldText property="slavefanhs" caption="从返供应商" maxLength="10"  minLength="10"  dataType="text" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"    defaultValue="${usercenter}"></t:gridCol>
		<t:gridCol property="masterfanhs" caption="${i18n.masterfanhs}" editor="fieldText" editorOptions="{'dataType':'text','notNull':true,'maxLength':'10','minLength':'10'}"></t:gridCol>
		<t:gridCol property="slavefanhs" caption="${i18n.slavefanhs}"   editor="fieldText" editorOptions="{'notNull':true,'maxLength':'10','minLength':'10'}"></t:gridCol>
		<t:gridCol property="" caption=""></t:gridCol>
		
	</t:grid>
</t:page>

<script type="text/javascript">
	//保存按钮
	function func_button_save() {
		$('#grid_Zhucgys').grid('saveRows');
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