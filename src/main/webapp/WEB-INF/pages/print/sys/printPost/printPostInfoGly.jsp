<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.privew}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.print.i18n_print">
	<t:grid id="grid_ckx_printright" caption="${i18n.privew}"
		idKeys="userscode,scodes,storagescode,usercenter" src="/sys/queryPrintrightGly.ajax"
		remove="NOT" edit="NOT" add="NOT" save="NOT"
		saveRowsSrcs="/sys/savesPrintrightGly.ajax" editable="true" 
		editModel="false" load="false" showNum="true" scrollHeight="450" back="NOT" pageSize="30" showEditorAddName="button_add" showEditorRemoveName="button_delete">
		<t:fieldLayout id="setprview" prefix="spr">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
			<t:fieldText property="userscode" caption="${i18n.userscode}"
				maxLength="12" dataType="text" />
			<t:fieldText property="scodes" caption="${i18n.socdes}"
				maxLength="12" dataType="text" />
			<t:fieldText property="storagescode" caption="管理员组编号"
				maxLength="3" dataType="text" />
		</t:fieldLayout>
		<t:gridCol property="userscode" caption="${i18n.userscode}"
			editor="fieldText"
			editorOptions="{closeEvent:func_set_userscode,'notNull':true,'maxLength':'12','dataType':'text'}"></t:gridCol>
		<t:gridCol property="scodes" caption="${i18n.socdes}"
			editor="fieldText"
			editorOptions="{closeEvent:func_set_scodes,'notNull':true,'maxLength':'12','dataType':'text'}"></t:gridCol>
		<t:gridCol property="storagescode" caption="管理员组编号"
			editor="fieldText" width="90"
			editorOptions="{closeEvent:func_set_storagescode,'notNull':true,'minLength':'3','maxLength':'3','dataType':'text'}"></t:gridCol>
		<t:gridCol property="spcodes" caption="${i18n.spcodes}" width="150"
			editor="fieldText"
			editorOptions="{'notNull':true,'maxLength':'12','dataType':'text'}"></t:gridCol>
		<t:gridCol property="" caption=" " />	
			<t:button caption="保存" name="saves" ></t:button>
	</t:grid>
</t:page>
</t:html>

<script>
	var flag = true;
	var flag1 = true;
	var flag2 = true;
	//保存按钮触发的函数
	function func_button_saves(){
		if(!flag){
			alert("${i18n.notuser}");
			return false;
		}else if(!flag1){
			alert("${i18n.notscodes}");
			return false;
		}else if(!flag2){
			alert("管理员组编号不存在或已失效");
			return false;
		}else{
			$("#grid_ckx_printright").grid("saveRows");
		}	
	}
	
	//验证是否存在的单据组编号
	function func_set_scodes(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var scodesIndex = $('td.scodes:first').prevAll().length;
		var scodesStr = rowElement.find('td:eq('+scodesIndex+')').text();
		var scodes = trim(scodesStr);
		 $.sdcui.ajaxUtil.ajax({
				url:'jiaoyscodes.ajax?scodes='+scodes,
				success:function(result){
					if(result.result){
						flag1 = true;
					}else{
						flag1 = false;
					}
				}
			});
		
	}
	
	//验证是否存在的用户组编号
	function func_set_userscode(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var userscodeIndex = $('td.userscode:first').prevAll().length;
		var userscodeStr = rowElement.find('td:eq('+userscodeIndex+')').text();
		var userscode = trim(userscodeStr);
		 $.sdcui.ajaxUtil.ajax({
				url:'jiaoyuserscode.ajax?userscode='+userscode,
				success:function(result){
					if(result.result){
						flag = true;
					}else{
						flag = false;
					}
				}
			});
		
	}
	
	//验证是否存在管理员组编号
	function func_set_storagescode(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var storagescodeIndex = $('td.storagescode:first').prevAll().length;
		var storagescodeStr = rowElement.find('td:eq('+storagescodeIndex+')').text();
		var storagescode = trim(storagescodeStr);
		 $.sdcui.ajaxUtil.ajax({
				url:'jiaoystoragescodegly.ajax?storagescode='+storagescode,
				success:function(result){
					if(result.result){
						flag2 = true;
					}else{
						flag2 = false;
					}
				}
			});
		
	}
	
	//验证是否存在的打印机组编号
// 	function func_set_spcodes(){
// 		var  cell = this.col.cell;
// 		var rowElement = cell.parent('tr:first');
// 		var spcodesIndex = $('td.spcodes:first').prevAll().length;
// 		var spcodesStr = rowElement.find('td:eq('+spcodesIndex+')').text();
// 		var spcodes = trim(spcodesStr);
// 		 $.sdcui.ajaxUtil.ajax({
// 				url:'jiaoyspcodes.ajax?spcodes='+spcodes,
// 				success:function(result){
// 					if(result.result){
// 						flag3 = true;
// 					}else{
// 						flag3 = false;
// 					}
// 				}
// 			});
		
// 	}
</script>