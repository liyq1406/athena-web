<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>
<t:html title="${i18n.Anxzdyhl}">

<!-- 
	 按需最大要货量
	 @author hxy
	 @date 2015-12-09
	 0011976
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_anxzdyhl">
	<t:grid id="grid_Anxzdyhl" 
		src="/cangk/queryZuidyhl.ajax"
		idKeys="usercenter,lingjbh,ckxhd,biaodsl"  
		
		load="false" 
		back="NOT"
		add="NOT"
		edit="NOT"
		editable="true"
		showNum="true"
		
		saveRowsSrcs="/cangk/saveZuidyhl.ajax" 
		showEditorAddName="editorAdd" 
		showEditorRemoveName="editorRemove" 
	    afterSaveRowsEvent="afterSaveRows"
	    
		dataFormId="form_Zuidyhl"
		scrollHeight="285" 
		pageSize="10"					
		>
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="100"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10"  width="120"/>
			<t:fieldText property="ckxhd" caption="${i18n.ckxhd}" maxLength="10" minLength="3"  width="120"/>				
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" editor="fieldText" editorOptions="{'dataType':'text','notNull':true,'maxLength':'10','minLength':'10'}"></t:gridCol>
		<t:gridCol property="ckxhd" caption="${i18n.ckxhd}" editor="fieldText" width="110" editorOptions="{'notNull':true,'maxLength':'9','minLength':'3'}"></t:gridCol>
		<t:gridCol property="zuidyhl" caption="${i18n.zuidyhl}" editor="fieldText" width="110" 
			editorOptions="{'expression':'^[1-9]+\d*[\.]?\d+$|^0\.\d+$|^[1-9]+\d*$|$','expressionMessage':'${i18n.zuidyhl_ex_mes}'}"></t:gridCol>
		<t:gridCol property="biaodsl" caption="${i18n.biaodsl}" editor="fieldText" width="110" editable="false"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
			
	</t:grid>	
</t:page>

<script type="text/javascript">

	//保存按钮
	function func_button_save() {
		$('#grid_Anxzdyhl').grid('saveRows');
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