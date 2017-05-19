<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.scodegroup}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.print.i18n_print">
	
		<t:grid id="grid_ckx_PrintDict" idKeys="scodes"
			dataFormId="form_ckx_printDict" caption="${i18n.scodegrouplist}"
			src="/sys/queryPrintDict.ajax" remove="NOT" add="NOT" showNum="true" load="false" scrollHeight="100">
			<t:button caption="${i18n.invalidate}" name="shixiao" active="1"></t:button>
			<t:button caption="${i18n.validate}" name="youxiao" active="1"></t:button>
			<t:button caption="${i18n.add}" name="adddict" active="0"></t:button>
			<t:fieldLayout prefix="x">
				<t:fieldText property="scodes" caption="${i18n.socdes}"
					dataType="integer" maxLength="12"></t:fieldText>
				<t:fieldSelect property="active" caption="${i18n.biaos}"
					notNull="true" convert="active" defaultValue="1"></t:fieldSelect>
				<t:fieldText property="scode" caption="${i18n.socde}"
					dataType="integer" maxLength="12"></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="scodes" caption="${i18n.socdes}"></t:gridCol>
			<t:gridCol property="sname" caption="${i18n.scname}"></t:gridCol>
			<t:gridCol property="active" caption="${i18n.ztbiaos}"
				convert="active"></t:gridCol>
		</t:grid>

	<t:grid id="grid_ckx_printdictinfo" caption="${i18n.scodelist}"
		src="/sys/queryPrintDictinfo.ajax" submit="NOT" reset="NOT" add="NOT"
		edit="NOT" remove="NOT" load="false" idKeys="scode" showNum="true">
		<t:fieldLayout prefix="dict" columns="1" showLabel="false">
			<t:fieldHidden property="scodes" caption="${i18n.socdes}"></t:fieldHidden>
			<t:fieldHidden property="sname" caption="${i18n.scname}"></t:fieldHidden>
			<t:fieldHidden property="scode" caption="${i18n.socde}"></t:fieldHidden>
		</t:fieldLayout>
			<t:gridCol property="scode" caption="${i18n.socde}" width="100"></t:gridCol>
			<t:gridCol property="codedetail" caption="${i18n.codedetail}"
				width="100"></t:gridCol>
	</t:grid>

	<t:form dialog="true" caption="${i18n.scodegroup}"
		id="form_ckx_printDict" action="/sys/savePrintDict.ajax" height="420"
		width="670" reset="NOT">
		<t:fieldLayout prefix="dicts">
			<t:fieldText property="scodes" caption="${i18n.socdes}"
				dataType="integer" maxLength="12" notNull="true" readonly="true"></t:fieldText>
			<t:fieldText property="sname" caption="${i18n.scname}"
				 maxLength="50"></t:fieldText>
			<t:fieldGrid property="ckx_dictinfo" parents="scodes" mode="reload"
				column="2" width="580">
				<t:grid id="form_ckx_printdictinfos"
					src="/sys/queryPrintDictinfo.ajax" submit="NOT" reset="NOT"
					add="NOT" remove="NOT" edit="NOT" editable="true" load="false"
					idKeys="scode" showNum="true">
					<t:gridCol property="scode" caption="${i18n.socde}"
						editor="fieldText" align="center" width="290"
						editorOptions="{'notNull':true,'maxLength':'12','dataType':'integer'}"></t:gridCol>
					<t:gridCol property="codedetail" caption="${i18n.codedetail}"
						editor="fieldText" width="290" align="center"
						editorOptions="{closeEvent:func_set_codedetail,'maxLength':'50'}"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
	<t:form dialog="true" caption="${i18n.addscodes}"
		id="form_ckx_printDicts" action="/sys/addPrintDict.ajax" height="420"
		width="580" reset="NOT">
		<t:fieldLayout prefix="dictsf">
			<t:fieldText property="scodes" caption="${i18n.socdes}"
				dataType="integer" maxLength="12" notNull="true"></t:fieldText>
			<t:fieldText property="sname" caption="${i18n.scname}"
				maxLength="50"></t:fieldText>
		</t:fieldLayout>		
		<t:fieldLayout showLabel="false">
			<t:fieldGrid property="ckx_dictinfo" parents="scodes" mode="reload"
				column="2" width="580">
				<t:grid id="form_ckx_printdictinfo" submit="NOT" reset="NOT"
					add="NOT" edit="NOT" remove="NOT" editable="true" load="false"
					idKeys="scode" showNum="true">
					<t:gridCol property="scode" caption="${i18n.socde}"
						editor="fieldText" width="290"
						editorOptions="{'notNull':true,'maxLength':'12','dataType':'integer'}"></t:gridCol>
					<t:gridCol property="codedetail" caption="${i18n.codedetail}"
						editor="fieldText" width="290"
						editorOptions="{closeEvent:func_set_codedetail,'maxLength':'50'}"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
			var flag = true;
			$.sdcui.serverConfig.convertArray['active'] = {'1':'${i18n.validate}','0':'${i18n.nodisable}'};
			
			$(document).ready(function(){
 				$("#grid_ckx_PrintDict").find("input[name='scodes']").bind("focus",function (){
 	 				$('#x_scode').fieldValue("");
 	 			});
 				
 				
 	 			$("#grid_ckx_PrintDict").find("input[name='sname']").bind("focus",function (){
 	 				$('#x_scode').fieldValue("");
 	 			});
 	 			
 	 			$("#grid_ckx_PrintDict").find("input[name='scode']").bind("focus",function (){
 	 				$('#x_scodes').fieldValue("");
 	 				$('#x_sname').fieldValue("");
 	 			});
			})
			
			//查询前执行方法
			function grid_ckx_PrintDict_beforeSubmit(){
				var scodesStr = $('#x_scodes').fieldValue();
				$('#x_scodes').fieldValue(trim(scodesStr));
				var scodeStr = $('#x_scode').fieldValue();
				$('#x_scode').fieldValue(trim(scodeStr));
				if(null==$('#x_scode').fieldValue()||""==$('#x_scode').fieldValue()){
				}
				else{
					$('#grid_ckx_PrintDict').grid('clear');
					$('#dict_scode').fieldValue(trim($('#x_scode').fieldValue()));
					$('#dict_scodes').fieldValue(trim($('#x_scodes').fieldValue()));
					$('#grid_ckx_printdictinfo').grid('reload');
				}
			}	
			
			//点击修改，弹出页面
			function func_button_edit(){
				var record=$("#grid_ckx_PrintDict").grid("getSelectedRecords")[0];
				$('#form_ckx_printDict').form('fillRecord',$.extend(
						{ckx_dictinfo:'--'},record
				));
				$("#form_ckx_printDict").form("open");
			}
			
			//修改页面提交前的校验
			function form_ckx_printDict_beforeSubmit(){
				if(!flag){
					return false;
				}
				var sname = $("#dicts_sname").fieldValue();
				var s=/^[\u4e00-\u9fa5]{1,20}[-\s\/]?[\u4e00-\u9fa5]{1,20}$/g;
	      		if(sname.match(s)==null)
				{
	      			alert("单据组名称必须为中文!");
	      			return false;
				}
				return true;
			}

			function grid_ckx_PrintDict_change(record,rowIndex){
				$('#dict_scodes').fieldValue(trim(record.scodes));
				$('#dict_sname').fieldValue(trim(record.sname));
				$('#dict_scode').fieldValue(trim(record.scode));
				$('#grid_ckx_printdictinfo').grid('reload');
			}
			
			//点击增加，弹出页面
			function func_button_adddict(){
				$('#form_ckx_printDicts').form('clear');
				$("#form_ckx_printDicts").form("open");
			}
			
			//增加页面提交前的校验
			function form_ckx_printDicts_beforeSubmit(){
				if(!flag){
					return false;
				}
				var sname = $("#dictsf_sname").fieldValue();
				var s=/^[\u4e00-\u9fa5]{1,20}[-\s\/]?[\u4e00-\u9fa5]{1,20}$/g;
	      		if(sname.match(s)==null)
				{
	      			alert("单据组名称必须为中文!");
	      			return false;
				}
				return true;
			}
			
			//增加页面提交后触发的函数
			function form_ckx_printDicts_afterSubmit(result){
				$("#form_ckx_printDicts").dialog('close');
				//$("#form_ckx_printDicts").find('input').val("");
				$("#form_ckx_printDicts").form('clear');
				$("#grid_ckx_PrintDict").grid('reload');
			} 
			
			//点击失效触发的函数
			function func_button_shixiao(){
				 var role = $('#grid_ckx_PrintDict').grid('getSelectedRecords')[0];
				 $.sdcui.ajaxUtil.ajax({
						url:'disablePrintDict.ajax?scodes='+role.scodes+'&active='+role.active,
						success:function(){
							$('#grid_ckx_PrintDict').grid('reload');
						}
				});
			}
			
			//点击有效触发的函数
			function func_button_youxiao(){
				 var role = $('#grid_ckx_PrintDict').grid('getSelectedRecords')[0];
				 $.sdcui.ajaxUtil.ajax({
						url:'nodisablePrintDict.ajax?active='+role.active+'&scodes='+role.scodes,
						success:function(){
							$('#grid_ckx_PrintDict').grid('reload');
						}
				});
			}
			
			//名称只能为中英文
			function func_set_codedetail(){
				var  cell = this.col.cell;
				var rowElement = cell.parent('tr:first');
				var codedetailIndex = $('td.codedetail:first').prevAll().length;
				var codedetailStr = rowElement.find('td:eq('+codedetailIndex+')').text();
				var codedetail = trim(codedetailStr);
	      		var s=/^[\u4e00-\u9fa5]{1,20}[-\s\/]?[\u4e00-\u9fa5]{1,20}$/g;
	      		if(codedetail.match(s)==null)
				{
					alert("单据类型名称必须为中文!");
					flag = false;
//	 				$("#form_ckx_printPostinfo1").find("input[name='sname']").bind("focus",function (){
//	 	      			rowElement.find('td:eq('+snameIndex+')').text("");
//	 	 			});
				}else{
					flag =true;
				}
	      		return flag;
			}
</script>
