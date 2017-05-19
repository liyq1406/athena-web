<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.printDevicegroup}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script src="<%=request.getContextPath()%>/athena/js/util.js" type="text/javascript"></script>
<!-- 	<script type="text/javascript"> -->
<!--        $(function(){ -->
<!--            $('body div.layout-panel.panel-north').remove(); -->
<!--            $('body td.td-west').remove(); -->
<!--            $('body div.layout-panel.panel-south').remove(); -->
<!--        }); -->
<!--     </script> -->
</head>
<t:page i18n="i18n.print.i18n_print">  
  
	<t:grid id="grid_PrintDevicegroup" idKeys="spcodes,usercenter"
		dataFormId="form_printDevicegroup"
		caption="${i18n.printDevicegrouplist}"
		src="/sys/queryPrintDevicegroup.ajax" remove="NOT" showNum="true"
		add="NOT" load="false" scrollHeight="150" back="NOT">
		<t:button caption="${i18n.invalidate}" name="shixiao" active="1"></t:button>
		<t:button caption="${i18n.validate}" name="youxiao" active="1"></t:button>
		<t:button caption="${i18n.add}" name="adddevice" active="0" icon="addRecord"></t:button>
		<t:fieldLayout prefix="x">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
			<t:fieldText property="spcodes" caption="${i18n.spcodes}"
				maxLength="12" dataType="text"></t:fieldText>
			<t:fieldText property="sname" caption="${i18n.sname}" maxLength="50"></t:fieldText>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}"
				notNull="true" convert="active" defaultValue="1"></t:fieldSelect>
			<t:fieldText property="spcode" caption="${i18n.spcode}" column="2"
				maxLength="12"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol property="spcodes" caption="${i18n.spcodes}" width="100"></t:gridCol>
		<t:gridCol property="sname" caption="${i18n.sname}" width="100"></t:gridCol>
		<t:gridCol property="sdesc" caption="${i18n.sdesc}" width="300"></t:gridCol>
		<t:gridCol property="nflag" caption="${i18n.nflag}" convert="nflag"
			width="100"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.ztbiaos}"
			convert="active"></t:gridCol>
		<t:gridCol property="" caption=" " />
	</t:grid>

	<t:grid id="grid_printdevice" caption="${i18n.deviceList}"
			src="/sys/queryPrintDevice.ajax" submit="NOT" reset="NOT" add="NOT"
			edit="NOT" remove="NOT" load="false" idKeys="spcode" showNum="true" scrollHeight="200"  back="NOT">
			<t:fieldLayout prefix="group" id="group" showLabel="false" columns="1">
				<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
				<t:fieldHidden property="spcodes" caption="${i18n.spcodes}"></t:fieldHidden>
				<t:fieldHidden property="spcode" caption="${i18n.spcode}"></t:fieldHidden>
			</t:fieldLayout>
				<t:gridCol property="spcode" caption="${i18n.spcode}"
						align="center"></t:gridCol>
				<t:gridCol property="sname" caption="${i18n.name}" align="center"></t:gridCol>
				<t:gridCol property="sip" caption="${i18n.sip}" align="center"></t:gridCol>
				<t:gridCol property="sport" caption="${i18n.sport}" align="center"></t:gridCol>
				<t:gridCol property="nlevel" caption="${i18n.nlevel}"
						align="center" ></t:gridCol>
				<t:gridCol property="replacespcode" caption="${i18n.replacespcode}"
						align="center" ></t:gridCol>
				<t:gridCol property="" caption=" " />		
	</t:grid>

	<t:form dialog="true" caption="${i18n.printDevicegroup}"
		id="form_printDevicegroup" action="/sys/savePrintDevicegroup.ajax"
		height="400" width="600" reset="NOT"  submit="NOT" idKeys="usercenter">
		<t:fieldLayout prefix="groups" columns="2">
			<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
			<t:fieldHidden property="biaos" caption="${i18n.biaos}"></t:fieldHidden>
			<t:fieldText property="spcodes" caption="${i18n.spcodes}"
				maxLength="10" notNull="true" dataType="text" readonly="true"></t:fieldText>
			<t:fieldText property="sname" caption="${i18n.sname}" maxLength="50" notNull="true"></t:fieldText>
			<t:fieldText property="sdesc" caption="${i18n.sdesc}" maxLength="100"></t:fieldText>
			<t:fieldSelect convert="nflag" property="nflag"
				caption="${i18n.nflag}" width="100" defaultValue="0" notNull="true"></t:fieldSelect>
<%-- 			<t:fieldGrid property="ckx_device" parents="spcodes,usercenter" mode="reload" --%>
<!-- 				column="4" width="500"> -->
		</t:fieldLayout>
		<t:fieldLayout prefix="r2" showLabel="false" columns="1">
			<t:fieldGrid width="800" property="ckx_device">
				<t:grid id="form_ckx_printdevice" src="/sys/queryPrintDevice.ajax"
					submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					editable="true" load="false" idKeys="spcode,usercenter" panel="false"  back="NOT" preSaveRowsEvent="preSaveEvent">
					<t:fieldLayout prefix="r2">
						<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}"/>
						<t:fieldHidden property="spcodes" caption="${i18n.spcodes}" />
					</t:fieldLayout>
					<t:gridCol property="spcode" caption="${i18n.spcode}"
						editor="fieldText"
						editorOptions="{'dataType':'text','maxLength':'10','notNull':true}"></t:gridCol>
					<t:gridCol property="sname" caption="${i18n.name}"
						editor="fieldText"
						editorOptions="{closeEvent:func_set_sname,'maxLength':'50'}"></t:gridCol>
					<t:gridCol property="sip" caption="${i18n.sip}"
						editor="fieldText" editorOptions="{closeEvent:func_set_sip,'notNull':true}"></t:gridCol>
					<t:gridCol property="sport" caption="${i18n.sport}"
						editor="fieldText"
						editorOptions="{closeEvent:func_set_sport,'dataType':'text','maxLength':'4','minLength':'4','notNull':true}"></t:gridCol>
					<t:gridCol property="nlevel" caption="${i18n.nlevel}"
						editor="fieldText" align="center"
						editorOptions="{'expression':'^[0-9]$','expressionMessage':'请输入0-9之间的整数'}"></t:gridCol>
					<t:gridCol property="replacespcode" caption="${i18n.replacespcode}"
						editor="fieldText" align="center"
 						editorOptions="{'dataType':'text','maxLength':'10'}"></t:gridCol> 
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
<%-- 			</t:fieldGrid> --%>
<%-- 		</t:fieldLayout> --%>
	<t:button caption="${i18n.submit}" name="submit_printDevicegroup"></t:button>
	</t:form>

	<t:form dialog="true" caption="${i18n.printDevicegroup}"
		id="form_printDevicegroup1" action="/sys/addPrintDevicegroup.ajax"
		height="400" width="650" reset="NOT">
		<t:fieldLayout prefix="groups1" columns="2">
			<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}" ></t:fieldHidden>
			<t:fieldText property="spcodes" caption="${i18n.spcodes}"
				 maxLength="10" dataType="text"  notNull="true"></t:fieldText>
			<t:fieldText property="sname" caption="${i18n.sname}" maxLength="50" notNull="true"></t:fieldText>
			<t:fieldText property="sdesc" caption="${i18n.sdesc}" maxLength="100" ></t:fieldText>
			<t:fieldSelect convert="nflag" property="nflag"
				caption="${i18n.nflag}" defaultValue="0" notNull="true"></t:fieldSelect>
				</t:fieldLayout>
		<t:fieldLayout showLabel="false">
			<t:fieldGrid property="ckx_device" parents="spcodes" mode="reload"
				column="2" width="650">
				<t:grid id="form_ckx_printdevice1" src=""
					submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					editable="true" load="false" idKeys="spcode,usercenter" panel="false"  back="NOT">
					<t:gridCol property="spcode" caption="${i18n.spcode}" width="130"
						editor="fieldText"
						editorOptions="{'dataType':'text','maxLength':'10','notNull':true}"></t:gridCol>
					<t:gridCol property="sname" caption="${i18n.name}" width="130"
						editor="fieldText"
						editorOptions="{closeEvent:func_set_sname,'maxLength':'50','notNull':true}"></t:gridCol>
					<t:gridCol property="sip" caption="${i18n.sip}" width="130"
						editor="fieldText" editorOptions="{closeEvent:func_set_sip,'notNull':true}"></t:gridCol>
					<t:gridCol property="sport" caption="${i18n.sport}" width="130"
						editor="fieldText"
						editorOptions="{closeEvent:func_set_sport,'dataType':'text','maxLength':'4','minLength':'4','notNull':true}"></t:gridCol>
					<t:gridCol property="nlevel" caption="${i18n.nlevel}" width="100"
						editor="fieldText" editorOptions="{'expression':'^[0-9]$','expressionMessage':'请输入0-9之间的整数'}"></t:gridCol>
					<t:gridCol property="" caption=" " ></t:gridCol>	
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
			var flag =true;
			var flag1 =true;
			var flag2 =true;
			var flag3 =true;
			$.sdcui.serverConfig.convertArray['active'] = {'1':'${i18n.validate}','0':'${i18n.nodisable}'};
			$.sdcui.serverConfig.convertArray['nflag'] = {'1':'${i18n.qidong}','0':'${i18n.buqidong}'};
 			
 			 $(document).ready(function(){
 				$("#grid_PrintDevicegroup").find("input[name='spcodes']").bind("focus",function (){
 	 				$('#x_spcode').fieldValue("");
 	 			});
 	 			$("#grid_PrintDevicegroup").find("input[name='sname']").bind("focus",function (){
 	 				$('#x_spcode').fieldValue("");
 	 			});
 	 			
 	 			$("#grid_PrintDevicegroup").find("input[name='spcode']").bind("focus",function (){
 	 				$('#x_spcodes').fieldValue("");
 	 				$('#x_sname').fieldValue("");
 	 			});
 			 })
 			//点击修改，弹出页面
			function func_button_edit(){
 				$("#form_printDevicegroup").form("clear");
 				 var record=$("#grid_PrintDevicegroup").grid("getSelectedRecords")[0];
				$('#form_printDevicegroup').form('fillRecord',$.extend(
						{ckx_device:'--'},record
				));
				$('#form_ckx_printdevice').grid('clearBatchData');
				$('#form_ckx_printdevice').grid('reload');
				$("#form_printDevicegroup").form("open");
			}
			//修改页面提交后
			function func_button_submit_printDevicegroup(){
				if(!flag1){
					alert("${i18n.descriptionspcodes}");
					return false;
				}
				if(!flag){
					alert("${i18n.descriptionsip}");
					return false;
				}
				if(!flag2){
					alert("${i18n.descriptionsport}");
					return false;
				}
// 				if(!flag3){
// 					alert("${i18n.descriptionreplacespcode}");
// 					return false;
// 				}
				var snameStr = $("#groups_sname").fieldValue();
				var sname =trim(snameStr).replace(/\s+/g,"");
				//var sname = snames.replace(/\s/g,"");
				//var s=/^[\u4e00-\u9fa5]{0,50}[-\s\/]?[\u4e00-\u9fa5]{0,50}$/g;
				var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,50}$/g;
				if(""==sname){
					//return true;
				}else{
					if(sname.match(s)==null)
					{
		      			alert("${i18n.descriptionspcodes}");
		      			return false;
					}
				}
	      		var sdescStr = $("#groups_sdesc").fieldValue();
	      		var sdesc =trim(sdescStr).replace(/\s+/g,""); 
				//var s=/^[\u4e00-\u9fa5]{0,100}[-\s\/]?[\u4e00-\u9fa5]{0,100}$/g;
				var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,100}$/g;
				if(""==sdesc){
					//return true;
				}else{
					if(sdesc.match(s)==null)
					{
		      			alert("${i18n.descriptionsdesc}");
		      			return false;
					}
				}
				//return true;

				if($("#form_ckx_printdevice").grid("isEditedCell")){
					$("#form_ckx_printdevice").grid("saveRows");
				}else{			
					$('#form_printDevicegroup').form('submit');
				}	
				
			}

			//选中一行触发的函数
			function grid_PrintDevicegroup_change(record,rowIndex){
				$('#group_spcodes').fieldValue(trim(record.spcodes));
				$('#group_spcode').fieldValue(trim(record.spcode));
				$('#group_usercenter').fieldValue(trim(record.usercenter));
				$('#grid_printdevice').grid('reload');
			}
			
			//查询前执行方法
			function grid_PrintDevicegroup_beforeSubmit(){
				var spcodesStr = $('#x_spcodes').fieldValue();
				$('#x_spcodes').fieldValue(trim(spcodesStr));
				var snameStr = $('#x_sname').fieldValue();
				$('#x_sname').fieldValue(trim(snameStr));
				var spcodeStr = $('#x_spcode').fieldValue();
				$('#x_spcode').fieldValue(trim(spcodeStr));
				if(null==$('#x_spcode').fieldValue()||""==$('#x_spcode').fieldValue()){
				}
				else{
// 					$('#form_printDevicegroups').form('fillRecord',$.extend(
// 							{list_group:'--',spcode:$('#x_spcode').fieldValue()},null
// 					));

					$('#grid_PrintDevicegroup').grid('clear');
					$('#group_spcode').fieldValue(trim($('#x_spcode').fieldValue()));
					$('#group_spcodes').fieldValue(trim($('#x_spcodes').fieldValue()));
					$('#grid_printdevice').grid('reload');
				}
			}		
			
			//点击增加，弹出页面
			function func_button_adddevice(){
				$("#form_printDevicegroup1").form("clear");
				$('#groups1_nflag').fieldValue("0");
				$("#form_printDevicegroup1").form("open");
				
			}
			//增加页面提交后触发的函数
			function form_printDevicegroup1_beforeSubmit(){
				var snameStr = $("#groups1_sname").fieldValue();
				var snames =trim(snameStr).replace(/\s/g,""); 
				var sname = snames.replace(/\s+/g,"");
				//var s=/^[\u4e00-\u9fa5]{0,50}[-\s\/]?[\u4e00-\u9fa5]{0,50}$/g;
				var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,50}$/g;
				if(""==sname){
					//return true;
				}else{
					if(sname.match(s)==null)
					{
		      			alert("${i18n.descriptionspcodes}");
		      			return false;
					}
				}
	      		var sdescStr = $("#groups1_sdesc").fieldValue();
	      		var sdesc =trim(sdescStr).replace(/\s+/g,"");
				//var s=/^[\u4e00-\u9fa5]{0,100}[-\s\/]?[\u4e00-\u9fa5]{0,100}$/g;
				var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,100}$/g;
				if(""==sdesc){
					//return true;
				}else{
					if(sdesc.match(s)==null)
					{
		      			alert("${i18n.descriptionsdesc}");
		      			return false;
					}
				}
				if(!flag1){
					alert("${i18n.descriptionspcodes}");
					return false;
				}
				if(!flag){
					alert("${i18n.descriptionsip}");
					return false;
				}
				if(!flag2){
					alert("${i18n.descriptionsport}");
					return false;
				}
				return true;
			} 
			//增加页面提交后触发的函数
			function form_printDevicegroup1_afterSubmit(result){
				$("#form_printDevicegroup1").dialog('close');
				$("#form_printDevicegroup1").form('clear');
				$("#grid_PrintDevicegroup").grid('reload');
			} 
			
			
			//点击失效触发的函数
			function func_button_shixiao(){
				 var usercenter = $("#x_usercenter").fieldValue();
				 var role = $('#grid_PrintDevicegroup').grid('getSelectedRecords')[0];
					if(confirm("确定失效?")){
						 $.sdcui.ajaxUtil.ajax({
								url:'disablePrintDevicegroup.ajax?spcodes='+role.spcodes+'&active='+role.biaos+'&usercenter='+usercenter,
								success:function(){
									$('#grid_PrintDevicegroup').grid('reload');
								}
						});
						return true;
					}else{
						return false;
					}
			}
			
			//点击有效触发的函数
			function func_button_youxiao(){
				 var usercenter = $("#x_usercenter").fieldValue();
				 var role = $('#grid_PrintDevicegroup').grid('getSelectedRecords')[0];
				 if(confirm("确定有效?")){
				 	$.sdcui.ajaxUtil.ajax({
							url:'nodisablePrintDevicegroup.ajax?spcodes='+role.spcodes+'&active='+role.biaos+'&usercenter='+usercenter,
							success:function(){
								$('#grid_PrintDevicegroup').grid('reload');
							}
					});
					return true;
				}else{
					return false;
				}
			}
			
			//打印机端口验证
			function func_set_sport(){
				var  cell = this.col.cell;
				var rowElement = cell.parent('tr:first');
				var sportIndex = $('td.sport:first').prevAll().length;
				var sportStr = rowElement.find('td:eq('+sportIndex+')').text();
				var sport = trim(sportStr)
				if(""==sport){
					flag2 =false;
					return flag2;
				}else{
					flag2 =true;
					return flag2;
				}
			}
			//打印机IP验证
			function func_set_sip(){
				var  cell = this.col.cell;
				var rowElement = cell.parent('tr:first');
				var sipIndex = $('td.sip:first').prevAll().length;
				var sipStr = rowElement.find('td:eq('+sipIndex+')').text();
				var sip = trim(sipStr);
				var exp=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
				if(""==sip){
					flag =false;
					return flag;
				}else{
					var reg = sip.match(exp);
					if(reg==null)
					{
						flag =false;
						return flag;
					}else{
						flag =true;
						return flag;
					}
				}
			}
			
			//打印机名称验证
			function func_set_sname(){
				var message = "";   
				var  cell = this.col.cell;
				var rowElement = cell.parent('tr:first');
				//alert(rowElement);
				var spcodeIndex = $('td.spcode:first').prevAll().length;
				var snameIndex = $('td.sname:first').prevAll().length;
				var sipIndex = $('td.sip:first').prevAll().length;
				//alert(sipIndex);
				var sportIndex = $('td.sport:first').prevAll().length;
				var nlevelIndex = $('td.nlevel:first').prevAll().length;
				
				var spcodeStr = rowElement.find('td:eq('+spcodeIndex+')').text();
				//alert(spcodeStr);
				var snameStr = rowElement.find('td:eq('+snameIndex+')').text();
				var sipStr = rowElement.find('td:eq('+sipIndex+')').text();
				var sportStr = rowElement.find('td:eq('+sportIndex+')').text();
				var nlevelStr = rowElement.find('td:eq('+nlevelIndex+')').text();
				
				//去掉空格
			      var spcode = trim(spcodeStr);
			      var sname = trim(snameStr);
			      var sip = trim(sipStr);
			      var sport = trim(sportStr);
			      var nlevel = trim(nlevelStr);
			      //var s=/^[\u4e00-\u9fa5]{0,50}[-\s\/]?[\u4e00-\u9fa5]{0,50}$/g;
			      var s=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,50}$/g;
			      if(""==sname){
						flag1 =true;
						return flag1;
					}else{
		      			if(sname.match(s)==null)
						{
							flag1 = false;
							return flag1;
						}else{
							flag1 =true;
							return flag1;
						}
					}	
			}
			//保存前触发的函数
			function preSaveEvent(){		
				$('#form_printDevicegroup').form('submit');
				return false;
			}
			
			//验证是否存在的替代设备
			function func_set_replacespcode(){
				var  cell = this.col.cell;
				var rowElement = cell.parent('tr:first');
				var replacespcodeIndex = $('td.replacespcode:first').prevAll().length;
				var replacespcodeStr = rowElement.find('td:eq('+replacespcodeIndex+')').text();
				var replacespcode = trim(replacespcodeStr);
				if(""==replacespcode){
					flag3 = true;
				}else{
					$.sdcui.ajaxUtil.ajax({
						url:'jiaoyreplacespcode.ajax?replacespcode='+replacespcode,
						success:function(result){
							if(result.result){
								flag3 = true;
							}else{
								flag3 = false;
							}
						}
					});
				}
			}
			
</script>