<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.users}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.print.i18n_print">
		<t:grid id="grid_ckx_printPost" idKeys="userscode,usercenter"
			dataFormId="form_ckx_printPost" caption="${i18n.userlist}"
			src="/sys/queryPrintPost.ajax" remove="NOT" showNum="true" add="NOT" load="false" scrollHeight="150" back="NOT">
			<t:button caption="${i18n.invalidate}" name="shixiao" active="1"></t:button>
			<t:button caption="${i18n.validate}" name="youxiao" active="1"></t:button>
			<t:button caption="${i18n.add}" name="addprintPost" active="0" icon="addRecord"></t:button>
			<t:button caption="${i18n.setpriv}" name="setprview" active="1"></t:button>
			<t:fieldLayout prefix="x">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
				<t:fieldText property="userscode" caption="${i18n.userscode}"
					maxLength="12" dataType="text"></t:fieldText>
				<t:fieldText property="users" caption="${i18n.username}"
					maxLength="50"></t:fieldText>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}"
					notNull="true" convert="active" defaultValue="1"></t:fieldSelect>
				<t:fieldText property="usercode" caption="${i18n.usercode}"
					column="2" maxLength="12" dataType="text"></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="userscode" caption="${i18n.userscode}"></t:gridCol>
			<t:gridCol property="users" caption="${i18n.username}"></t:gridCol>
			<t:gridCol property="biaos" caption="${i18n.ztbiaos}"
				convert="active" width="100"></t:gridCol>
			<t:gridCol property="" caption=" " />
		</t:grid>

	<t:grid id="grid_ckx_printPostinfo" caption="${i18n.userList}"
		src="/sys/queryPrintPostinfo.ajax" submit="NOT" reset="NOT" add="NOT"
		edit="NOT" remove="NOT" load="false" idKeys="usercode" showNum="true" scrollHeight="200" back="NOT">
		<t:fieldLayout prefix="postinfo" showLabel="false" columns="1">
				<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
				<t:fieldHidden property="userscode" caption="${i18n.userscode}"></t:fieldHidden>
				<t:fieldHidden property="users" caption="${i18n.username}"></t:fieldHidden>
				<t:fieldHidden property="usercode" caption="${i18n.usercode}"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="usercode" caption="${i18n.usercode}" width="180"
			align="center"></t:gridCol>
		<t:gridCol property="sname" caption="${i18n.uname}" width="180"
			align="center"></t:gridCol>
		<t:gridCol property="" caption=" " />	
	</t:grid>

	<t:form dialog="true" caption="${i18n.users}" id="form_ckx_printPost"
		action="/sys/savePrintPost.ajax" height="380" width="600" reset="NOT" idKeys="usercenter">
		<t:fieldLayout prefix="postinfos" columns="2">
			<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
			<t:fieldHidden property="biaos" caption="${i18n.ztbiaos}"></t:fieldHidden>
				<t:fieldText property="userscode" caption="${i18n.userscode}"
					maxLength="10" dataType="text" readonly="true"></t:fieldText>
				<t:fieldText property="users" caption="${i18n.username}"
					maxLength="50" notNull="true"></t:fieldText>
				</t:fieldLayout>
<%-- 			<t:fieldGrid property="ckx_postinfo" parents="userscode,usercenter" --%>
<!-- 				mode="reload" column="2" width="500"> -->
		<t:fieldLayout prefix="s1" showLabel="false" columns="1">
			<t:fieldGrid property="ckx_postinfo" width="800">
				<t:grid id="form_ckx_printPostinfo"
					src="/sys/queryPrintPostinfo.ajax" submit="NOT" reset="NOT"
					add="NOT" edit="NOT" remove="NOT" editable="true" load="false"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					idKeys="usercode,usercenter" panel="false" back="NOT">
				<t:fieldLayout prefix="s1">
					<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
					<t:fieldHidden property="userscode"  caption="${i18n.userscode}" ></t:fieldHidden>
				</t:fieldLayout>
					<t:gridCol property="usercode" caption="${i18n.usercode}"
						width="250" editor="fieldText"
						editorOptions="{'notNull':true,'maxLength':'10','dataType':'text'}"></t:gridCol>
					<t:gridCol property="sname" caption="${i18n.uname}" width="250"
						editor="fieldText" editorOptions="{closeEvent:func_set_sname,'maxLength':'50','notNull':true}"></t:gridCol>
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>

	<t:form dialog="true" caption="${i18n.users}" id="form_ckx_printPost1"
		action="/sys/addPrintPost.ajax" height="380" width="600" reset="NOT">
		<t:fieldLayout prefix="postinfos1" columns="2">
		<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
			<t:fieldText property="userscode" caption="${i18n.userscode}"
				 maxLength="10" dataType="text" notNull="true"></t:fieldText>
			<t:fieldText property="users" caption="${i18n.username}"
				maxLength="50" notNull="true"></t:fieldText>
		</t:fieldLayout>
		<t:fieldLayout showLabel="false">
			<t:fieldGrid property="ckx_postinfo" parents="userscode"
				mode="reload" column="2" width="600">
				<t:grid id="form_ckx_printPostinfo1"
					submit="NOT" reset="NOT" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					add="NOT" edit="NOT" remove="NOT" editable="true" load="false"
					idKeys="usercode,usercenter" panel="false" back="NOT">
					<t:gridCol property="usercode" caption="${i18n.usercode}"
						editor="fieldText" width="300" 
						editorOptions="{'notNull':true,'maxLength':'10','dataType':'text'}"></t:gridCol>
					<t:gridCol property="sname" caption="${i18n.uname}" width="300"
						editor="fieldText" editorOptions="{closeEvent:func_set_sname,'maxLength':'50','notNull':true}"></t:gridCol>
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
	<t:form dialog="true" caption="${i18n.setpriv}"
		id="form_ckx_printRight" action="/sys/savePrintright.ajax"
		height="350" width="600" reset="NOT" idKeys="usercenter" submit="NOT">
		<t:fieldLayout prefix="printright" columns="1">
			<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}"></t:fieldHidden>
			<t:fieldText property="userscode" caption="${i18n.userscode}" readonly="true"/>
			<t:fieldHidden property="flag3"></t:fieldHidden>
		</t:fieldLayout>
<%-- 			<t:fieldGrid property="ckx_printright" parents="userscode,usercenter" --%>
<!-- 				mode="reload" column="2" width="450"> -->
		<t:fieldLayout prefix="p2" showLabel="false" columns="1">
			<t:fieldGrid  width="800" property="ckx_printright">
				<t:grid id="grid_ckx_printright" caption="${i18n.setpriv}"
					idKeys="userscode,scodes,storagescode,usercenter"
					src="/sys/queryPrintrights.ajax" submit="NOT" reset="NOT" add="NOT"
					edit="NOT" remove="NOT" editable="true" editModel="false" back="NOT"
					load="false" save="NOT" panel="false" showEditorAddName="editorAddR" showEditorRemoveName="editorRemoveR">
					<t:fieldLayout prefix="p2">
						<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}"/>
						<t:fieldHidden property="userscode" caption="${i18n.userscode}" />
					</t:fieldLayout>
					<t:gridCol property="scodes" caption="${i18n.socdes}"
						editor="fieldText" width="150" editorOptions="{closeEvent:func_set_scodes,'notNull':true,'maxLength':'12','dataType':'text'}"></t:gridCol>
					<t:gridCol property="storagescode" caption="${i18n.storagescode}"
						editor="fieldText" width="150" editorOptions="{closeEvent:func_set_storagescode,'notNull':true,'maxLength':'6','dataType':'text'}"></t:gridCol>
					<t:gridCol property="spcodes" caption="${i18n.spcodes}"
						editor="fieldText" width="150" editorOptions="{'notNull':true,'maxLength':'12','dataType':'text'}"></t:gridCol>
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit}" name="submit_printRight"></t:button>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
		var flag = true;
		var flag1 = true;
		var flag2 = true;
		$.sdcui.serverConfig.convertArray['active'] = {'1':'${i18n.validate}','0':'${i18n.nodisable}'};
		$(document).ready(function(){
			//如果填充用户组和${i18n.uname}的值，则清空${i18n.usercode}的值
 			$("#grid_ckx_printPost").find("input[name='userscode']").bind("focus",function (){
 				$('#x_usercode').fieldValue("");
 			});
 			$("#grid_ckx_printPost").find("input[name='users']").bind("focus",function (){
 				$('#x_usercode').fieldValue("");
 			});
 			//如果填充${i18n.usercode}的值，则清空用户组和${i18n.uname}的值
 			$("#grid_ckx_printPost").find("input[name='usercode']").bind("focus",function (){
 				$('#x_userscode').fieldValue("");
 				$('#x_users').fieldValue("");
 			});
		})
		
		//查询前执行方法
		function grid_ckx_printPost_beforeSubmit(){
			var userscodeStr = $('#x_userscode').fieldValue();
			$('#x_userscode').fieldValue(trim(userscodeStr));
			var usersStr = $('#x_users').fieldValue();
			$('#x_users').fieldValue(trim(usersStr));
			var usercodeStr = $('#x_usercode').fieldValue();
			$('#x_usercode').fieldValue(trim(usercodeStr));
			if(null==$('#x_usercode').fieldValue()||""==$('#x_usercode').fieldValue()){
			}
			else{
				$('#grid_ckx_printPost').grid('clear');
				$('#postinfo_usercode').fieldValue(trim($('#x_usercode').fieldValue()));
				$('#postinfo_userscode').fieldValue(trim($('#x_userscode').fieldValue()));
				$('#grid_ckx_printPostinfo').grid('reload');
				
			}
		}	
		
		//点击修改，弹出页面
		function func_button_edit(){
			var record=$("#grid_ckx_printPost").grid("getSelectedRecords")[0];
			$('#form_ckx_printPost').form('fillRecord',$.extend(
					{ckx_postinfo:'--'},record
				));
			$('#form_ckx_printPostinfo').grid('clearBatchData');
			$('#form_ckx_printPostinfo').grid('reload');
			$("#form_ckx_printPost").form("open");
		}
		
		//修还页面提交前触发的函数
		function form_ckx_printPost_beforeSubmit(){
			if(!flag){
				alert("${i18n.notuser}");
				return false;
			}
			var users = $("#postinfos_users").fieldValue();
			var usersStr = trim(users).replace(/\s+/g,"");
			var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,20}$/g;
			if(""==usersStr){
				return true;
			}else{
				if(usersStr.match(s)==null)
				{
	      			alert("${i18n.notusers}");
	      			return false;
				}
			}
			return true;
		} 

		// 主表行改变触发事件
		function grid_ckx_printPost_change(record,rowIndex){
			$('#postinfo_userscode').fieldValue(trim(record.userscode));
			$('#postinfo_users').fieldValue(trim(record.users));
			$('#postinfo_usercenter').fieldValue(trim(record.usercenter));
			$('#postinfo_usercode').fieldValue(trim(record.usercode));
			$('#grid_ckx_printPostinfo').grid('reload');
		}
		//点击增加，弹出页面
		function func_button_addprintPost(){
			$('#form_ckx_printPost1').form('clear');
			$("#form_ckx_printPost1").form("open");
		}
		
		//点击设置权限，弹出页面
		function func_button_setprview(){
			flag1 = true;
			flag2 = true;
			var role=$("#grid_ckx_printPost").grid("getSelectedRecords")[0];
				$('#form_ckx_printRight').form('fillRecord',$.extend(
							{ckx_printright:'--'},role
				));
				$('#grid_ckx_printright').grid('clearBatchData');
				$('#grid_ckx_printright').grid('reload');
				$("#form_ckx_printRight").form("open");
		}
		
		//设置权限页面提交后
		//func_button_submit_printDevicegroup
		function func_button_submit_printRight(){
			
			if(!flag2){
				alert("${i18n.notscodes}");
				return false;
			}
			if(!flag1){
				alert("${i18n.notcangkbh}");
				return false;
			}
			
			$('#form_ckx_printRight').form('submit');
		}
		
		function form_ckx_printRight_afterSubmit(){
				$("#form_ckx_printRight").form("close");
		}

		//增加页面提交后触发的函数
		function form_ckx_printPost1_afterSubmit(result){
			$("#form_ckx_printPost1").dialog('close');
			$("#form_ckx_printPost1").form('clear');
			$("#grid_ckx_printPost").grid('reload');
		} 
		
		//增加页面提交前触发的函数
		function form_ckx_printPost1_beforeSubmit(){
			var userscode = $("#postinfos1_userscode").fieldValue();
			var userscodeStr = trim(userscode);
			if(userscodeStr.indexOf("_")>-1){
				alert("${i18n.notusercode}");
				return false;
			}
			if(!flag){
				alert("${i18n.notuser}");
				return false;
			}
			var users = $("#postinfos1_users").fieldValue();
			var usersStr = trim(users).replace(/\s+/g,"");
			var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,20}$/g;
			if(""==usersStr){
				return true;
			}else{
				if(usersStr.match(s)==null)
				{
	      			alert("${i18n.notusers}");
	      			return false;
				}
			}
			return true;
		} 
		
		//点击失效触发的函数
		function func_button_shixiao(){
			 var usercenter = $('#x_usercenter').fieldValue();
			 var role = $('#grid_ckx_printPost').grid('getSelectedRecords')[0];
			if(confirm("确定失效?")){
				 $.sdcui.ajaxUtil.ajax({
						url:'disablePrintPost.ajax?userscode='+role.userscode+'&active='+role.biaos+'&usercenter='+usercenter,
						success:function(){
							$('#grid_ckx_printPost').grid('reload');
						}
					});
				return true;
			}else{
				return false;
			}
		}
		
		//点击有效触发的函数
		function func_button_youxiao(){
			 var usercenter = $('#x_usercenter').fieldValue();
			 var role = $('#grid_ckx_printPost').grid('getSelectedRecords')[0];
			if(confirm("确定有效?")){
				 $.sdcui.ajaxUtil.ajax({
						url:'nodisablePrintPost.ajax?userscode='+role.userscode+'&active='+role.biaos+'&usercenter='+usercenter,
						success:function(){
							$('#grid_ckx_printPost').grid('reload');
						}
					});
				return true;
			}else{
				return false;
			}
		}
		
		//名称只能为中英文
		function func_set_sname(){
			var  cell = this.col.cell;
			var rowElement = cell.parent('tr:first');
			var snameIndex = $('td.sname:first').prevAll().length;
			var snameStr = rowElement.find('td:eq('+snameIndex+')').text();
			var sname = trim(snameStr).replace(/\s+/g,"");
      		//var s=/^[\u4e00-\u9fa5]{0,20}[-\s\/]?[\u4e00-\u9fa5]{0,20}$/g;
      		var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,20}$/g;
      		if(""==sname){
      			flag =false;
				return flag;
      		}else{
      			if(sname.match(s)==null)
    			{
    				flag = false;
    				return flag;
    			}else{
    				flag =true;
    				return flag;
    			}
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
							flag2 = true;
						}else{
							flag2 = false;
						}
					}
				});
			
		}
		
		//验证是否存在的仓库编号
		function func_set_storagescode(){
			var  cell = this.col.cell;
			var rowElement = cell.parent('tr:first');
			var storagescodeIndex = $('td.storagescode:first').prevAll().length;
			var storagescodeStr = rowElement.find('td:eq('+storagescodeIndex+')').text();
			var storagescode = trim(storagescodeStr);
			 $.sdcui.ajaxUtil.ajax({
					url:'jiaoystoragescode.ajax?storagescode='+storagescode,
					success:function(result){
						if(result.result){
							flag1 = true;
						}else{					
							flag1 = false;
						}
					}
				});
			
		}	
</script>