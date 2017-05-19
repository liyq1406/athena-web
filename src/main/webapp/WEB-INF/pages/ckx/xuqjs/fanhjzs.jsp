<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>
<t:html title="${i18n.Fanhjzs}">

<!-- 
	   返还记账商
	 @author xss
	 @date 2015-3-26
	 0010495
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_fanhjzs">
	<t:grid id="grid_Fanhjzs" 
		src="/xuqjs/queryFanhjzs.ajax"
		idKeys="usercenter,jizgys"  
		
		load="false" 
		back="NOT"
		add="NOT"
		edit="NOT"
		editable="true"
		showNum="true"
		
		removeSrc="/xuqjs/removeFanhjzs.ajax"
		saveRowsSrcs="/xuqjs/saveFanhjzs.ajax" 
		showEditorAddName="editorAdd" 
		showEditorRemoveName="editorRemove" 
	    afterSaveRowsEvent="afterSaveRows"
	    
		dataFormId="form_Fanhjzs"
		scrollHeight="285" 
		pageSize="10"					
		>
<!--  
<span style="color:red">${i18n.tips}</span>
-->
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="100"/>
			<t:fieldText property="fanhs" caption="${i18n.fanhs}" maxLength="10" minLength="10"  width="120"/>
			<t:fieldText property="jizgys" caption="${i18n.jizgys}" maxLength="10" minLength="10"  width="120"/>				
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}"></t:gridCol>
		<t:gridCol property="fanhs" caption="${i18n.fanhs}" editor="fieldText" editorOptions="{'dataType':'text','notNull':true,'maxLength':'10','minLength':'10'}"></t:gridCol>
		<t:gridCol property="jizgys" caption="${i18n.jizgys}" editor="fieldText" width="110" editorOptions="{'notNull':true,'maxLength':'10','minLength':'10'}"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
			
	</t:grid>	
</t:page>



<script type="text/javascript">
	//保存按钮
	function func_button_save() {
		$('#grid_Fanhjzs').grid('saveRows');
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