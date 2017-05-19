<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.export}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_chanxz_jhy">

	<t:grid id="grid_ckx_chanxz_jhy" caption="${i18n.chanxz_jhy}"
		idKeys="usercenter,chanxzbh,jihybh"
		src="/paicfj/queryCkx_chanxz_jhy.ajax" remove="NOT" edit="NOT"
		add="NOT" saveRowsSrcs="/paicfj/saveCkx_chanxz_jhy.ajax"
		editable="true" editModel="false" showNum="true" load="false">
		<t:fieldLayout id="jhy" prefix="jhy">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap" notNull="true"/>
			<t:fieldText property="chanxzbh" caption="${i18n.chanxzbh}" dataType="text" maxLength="10" minLength="10"/>
			<t:fieldText property="jihybh" caption="${i18n.jihybh}" dataType="text" maxLength="32"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" 
			editor="fieldSelect" convert="queryUserCenterMap" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="chanxzbh" caption="${i18n.chanxzbh}"
			editor="fieldText" editorOptions="{'dataType':'text','maxLength':'10','minLength':'10','notNull':true}"></t:gridCol>
		<t:gridCol property="jihybh" caption="${i18n.jihybh}"
			editor="fieldText" editorOptions="{'dataType':'text','maxLength':'32','notNull':true}"></t:gridCol>
		<t:gridCol property="jihyxm" caption="${i18n.jihyxm}"
			editor="fieldText" editorOptions="{'maxLength':'20'}"></t:gridCol>
		<t:gridCol property="beiz" caption="${i18n.beiz}" editor="fieldText" editorOptions="{'maxLength':'100'}"></t:gridCol>
	</t:grid>


</t:page>
</t:html>

<script type="text/javascript">
	
		$(document).ready(function(){
// 			$("#cz_shengcxbh").click(function (){
// 				alert("llll12351234");
// 			});
// 			$("#cz_shengcxbh").blur(function (){
// 				alert("blur");
// 			});
// 			 $("#grid_ckx_shengcx").validate({
// 				 shengcxbh:{
// 					 required: true
// 				 }
// 			 });

		});
		
		function func_button_save(){
// 			var rows = $('#grid_ckx_chanxz_jhy').grid('getBatchRecords');
// 			var str=rows.join(',');
// 			if((str.indexOf('insert')>0)||(str.indexOf('edit')>0)||(str.indexOf('delete')>0)){
				$("#grid_ckx_chanxz_jhy").grid("saveRows");
// 			}
		}
		
		
		</script>
