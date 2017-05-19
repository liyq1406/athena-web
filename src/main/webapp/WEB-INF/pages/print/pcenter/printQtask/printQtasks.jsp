<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.printcenter}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>  
<t:page i18n="i18n.print.i18n_print">
		<t:grid id="grid_PrintQtaskmain" idKeys="qid,usercenter"
			dataFormId="ckx_form_PrintQtaskmain" caption="${i18n.taskmain}"
			src="/pcenter/queryPrintQtaskmain.ajax" add="NOT" edit="NOT"
			showNum="true" remove="NOT" load="false" scrollHeight="150" back="NOT" showCheckbox="true" pageSize="120">
			<t:button caption="${i18n.zuoydd}" name="resetQtask" active="0"></t:button>
			<t:button caption="${i18n.printcanle}" name="deleteDevice" active="0"></t:button>
			<t:button caption="${i18n.spcodestatus}" name="selectDevice"
				active="0"></t:button>
			<t:fieldLayout prefix="q" columns="4">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
				<t:fieldText property="qid" caption="${i18n.qid}" maxLength="32"
					dataType="text"></t:fieldText>
				<t:fieldText property="scode" caption="单据组编号" maxLength="32"
					dataType="text"></t:fieldText>
				<t:fieldText property="seq" caption="单据编号" maxLength="32"></t:fieldText>
				<t:fieldText property="sdevicecode" caption="打印机编号" maxLength="32"
					dataType="text"></t:fieldText>
				<t:fieldText property="pgid" caption="${i18n.spcodes}" maxLength="12"
					dataType="text"></t:fieldText>
				<t:fieldText property="storagecode" caption="打印仓库" maxLength="6" minLength="3"
					dataType="text"></t:fieldText>
				<t:fieldText property="saccount" caption="打印用户" maxLength="32"
					dataType="text"></t:fieldText>
				<t:fieldText property="createtime" caption="打印开始日期" maxLength="10" defaultValue="${defaultdate}"></t:fieldText>
				<t:fieldText property="createtimes" caption="打印开始时刻" maxLength="6"></t:fieldText>
				<t:fieldText property="finishedtime" caption="打印结束日期" maxLength="10" defaultValue="${defaultdate}"></t:fieldText>
				<t:fieldText property="finishedtimes" caption="打印结束时刻" maxLength="6"></t:fieldText>
<%-- 				<t:fieldCalendar property="createtime" caption="${i18n.createtime}" --%>
<!-- 					format="yyyy-MM-dd" /> -->
<%-- 				<t:fieldCalendar property="finishedtime" --%>
<%-- 					caption="${i18n.finishtime}" format="yyyy-MM-dd" /> --%>
				<t:fieldSelect convert="status3" property="status" defaultValue="-1"
					caption="${i18n.status}"></t:fieldSelect>
			</t:fieldLayout>
			<t:gridCol property="qid" caption="${i18n.qid}" width="200"></t:gridCol>
			<t:gridCol property="scode" caption="${i18n.danjzbh}"></t:gridCol>
			<t:gridCol property="pgid" caption="${i18n.spcodes}" width="200"></t:gridCol>
			<t:gridCol property="createtime" caption="${i18n.timecreate}"
				width="130"></t:gridCol>
			<t:gridCol property="finishedtime" caption="${i18n.overtime}"
				width="130"></t:gridCol>
			<t:gridCol property="sdevicecode" caption="${i18n.spcode}"
				width="100"></t:gridCol>
			<t:gridCol property="status" caption="${i18n.status}"
				convert="status" width="100"></t:gridCol>
			<t:gridCol property="saccount" caption="${i18n.saccount}"
				width="100"></t:gridCol>
				<t:gridCol property="storagecode" caption="${i18n.storagecode}"
				width="100"></t:gridCol>	
			<t:gridCol property="" caption=" " />
		</t:grid>
		
		<t:grid id="grid_PrintQtaskinfo"
			src="/pcenter/queryPrintQtaskinfo.ajax" submit="NOT" reset="NOT"
			add="NOT" edit="NOT" remove="NOT" load="false" idKeys="qid,seq" caption="${i18n.seqtasklist}" scrollHeight="200" back="NOT">
			<t:fieldLayout prefix="printqtask" showLabel="false" columns="1">
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="seq" caption="${i18n.spcodes}"></t:fieldHidden>
				<t:fieldHidden property="qid" caption="${i18n.qid}"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="seq" caption="${i18n.seq}" width="150"
				align="center"></t:gridCol>
			<t:gridCol property="zidmc" caption="${i18n.danjmc}" width="150"
				align="center"></t:gridCol>
			<t:gridCol property="status" caption="${i18n.status}"
				convert="status1" width="300" align="center"></t:gridCol>
			<t:gridCol property="" caption=" " />
		</t:grid>

	<t:form dialog="true" caption="${i18n.spcodestatus}"
		id="form_printDevicestatus" action="" height="350" width="660"
		submit="NOT" reset="NOT">
		<t:fieldLayout prefix="sdevicecodes" id="sdevicecodes"
			showLabel="false">
			<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}"></t:fieldHidden>
			<t:fieldHidden property="sdevicecode" caption="${i18n.spcode}"></t:fieldHidden>
			<t:fieldGrid property="ckx_device" parents="sdevicecode,usercenter"
				mode="reload" column="2" width="660">
				<t:grid id="form_ckx_printstatus"
					src="/sys/queryPrintDevicestatus.ajax" submit="NOT" reset="NOT"
					add="NOT" edit="NOT" remove="NOT" editable="false" load="false"
					idKeys="spcode" save="NOT" back="NOT">
					<t:gridCol property="spcode" caption="${i18n.spcode}" width="165"
						align="center"></t:gridCol>
					<t:gridCol property="sip" caption="${i18n.sip}" width="165"
						align="center"></t:gridCol>
					<t:gridCol property="sport" caption="${i18n.sport}" width="165"
						align="center"></t:gridCol>
					<t:gridCol property="status" caption="${i18n.stats}" width="165"
						convert="status2" align="center"></t:gridCol>
					<t:gridCol property="" caption=" " />	
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>

	<t:form dialog="true" caption="${i18n.printDevice}"
		id="form_printDevicegroup" action="" height="350" width="660" reset="NOT">
		<t:fieldLayout prefix="devices" id="devices" showLabel="false"
			columns="1">
			<t:fieldHidden property="qid" caption="${i18n.qid}"></t:fieldHidden>
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter}" defaultValue="${loginUsercenter}"></t:fieldHidden>
			<t:fieldGrid property="ckx_devices" parents="qid,usercenter" mode="reload"
				column="2" width="660">
				<t:grid id="form_ckx_printdevice" src="/sys/queryPrintstatus.ajax"
					submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT"
					editable="false" load="true" idKeys="spcode" back="NOT"
					save="NOT">
					<t:gridCol property="spcodes" caption="${i18n.spcodes}" width="165"
						align="center"></t:gridCol>
						<t:gridCol property="spcode" caption="${i18n.spcode}" width="165"
						align="center"></t:gridCol>
					<t:gridCol property="sip" caption="${i18n.sip}" width="165"
						align="center"></t:gridCol>
					<t:gridCol property="status" caption="${i18n.zt}" width="165"
						convert="status2" align="center"></t:gridCol>
					<t:gridCol property="" caption=" " />	
				</t:grid>
				<t:button caption="${i18n.refersh}" name="refersh" active="0"></t:button>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
		$.sdcui.serverConfig.convertArray['status3'] = {'-1':'${i18n.prework}','0':'${i18n.newwork}','1':'${i18n.printinterrp}','2':'打印中','3':'打印完成'};
		$.sdcui.serverConfig.convertArray['status'] = {'-1':'${i18n.prework}','0':'${i18n.newwork}','1':'${i18n.printinterrp}','2':'${i18n.print}','3':'${i18n.printover}','4':'${i18n.canelprint}'};
		$.sdcui.serverConfig.convertArray['status1'] = {'0':'${i18n.notprint}','1':'${i18n.yeprint}','2':'${i18n.canelprint}'};
		$.sdcui.serverConfig.convertArray['status2'] = {'0':'${i18n.ldle}','1':'${i18n.busy}','2':'${i18n.outpaper}','3':'${i18n.jampaper}','4':'${i18n.connbroken}','5':'${i18n.statusalert}'};
		
		$(document).ready(function(){
				$("#grid_PrintQtaskmain").find("input[name='qid']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='pgid']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='storagecode']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='saccount']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='scode']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='sdevicecode']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='createtime']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='finishedtime']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='createtimes']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			$("#grid_PrintQtaskmain").find("input[name='finishedtimes']").bind("focus",function (){
	 				$('#q_seq').fieldValue("");
	 			});
	 			
	 			$("#grid_PrintQtaskmain").find("input[name='seq']").bind("focus",function (){
	 				$('#q_qid').fieldValue("");
	 				$('#q_pgid').fieldValue("");
	 				$('#q_storagecode').fieldValue("");
	 				$('#q_saccount').fieldValue("");
	 				$('#q_scode').fieldValue("");
	 				$('#q_sdevicecode').fieldValue("");
	 				$('#q_createtime').fieldValue("");
	 				$('#q_finishedtime').fieldValue("");
	 				$('#q_createtimes').fieldValue("");
	 				$('#q_finishedtimes').fieldValue("");
	 			});
			 })
		//级联触发改变事件
		function grid_PrintQtaskmain_change(record,rowIndex){
// 			$('#ckx_form_PrintQtaskmain').form('fillRecord',$.extend(
// 					{list_printqtask:'--'},record
// 			));
			//$('#printqtask_usercenter').fieldValue($('#q_usercenter').fieldValue());
			$('#printqtask_seq').fieldValue("");
			$('#printqtask_usercenter').fieldValue(trim(record.usercenter));	
			$('#printqtask_qid').fieldValue(trim(record.qid));
			$('#grid_PrintQtaskinfo').grid('reload',false,[],true);
		}
		//查询前触发的函数
		function grid_PrintQtaskmain_beforeSubmit(){
			//查询前对日期 和 时间 格式 进行校验
			var s=/^([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))$/g;
			//var s1 = /^\d{4}-\d{2}-\d{2}$/g;
			//var ss= /^([0-2][0-9]):([0-5][0-9]):([0-5][0-9])$/g;
			var ss=/^([0-1][0-9]|[2][0-3])([0-5][0-9])([0-5][0-9])$/g;
			var createStr = trim($('#q_createtime').fieldValue());
			var finishStr = trim($('#q_finishedtime').fieldValue());
			var createsStr = trim($('#q_createtimes').fieldValue());
			var finishsStr = trim($('#q_finishedtimes').fieldValue());
			if(""!=createStr && null!=createStr){
				if(createStr.match(s)==null){
					alert("打印开始日期格式必须为yyyy-mm-dd");
					return false;
				}
			}
			if(""!=finishStr && null!=finishStr){
				if(finishStr.match(s)==null){
					alert("打印结束日期格式必须为yyyy-mm-dd");
					return false;
				}
			}
			if(""!=createsStr && null!=createsStr){
				if(""==createStr || null==createStr){
					alert("打印开始日期不能为空");
					return false;
				}
				if(createsStr.match(ss)==null){
					alert("打印开始时刻输入有误");
					return false;
				}
			}
			if(""!=finishsStr && null!=finishsStr){
				if(""==finishStr || null==finishStr){
					alert("打印结束日期不能为空");
					return false;
				}
				if(finishsStr.match(ss)==null){
					alert("打印结束时刻输入有误");
					return false;
				}
			}
			$('#printqtask_qid').fieldValue("");
			var qidStr = $('#q_qid').fieldValue();
			$('#q_qid').fieldValue(trim(qidStr));
			var scodeStr = $('#q_scode').fieldValue();
			$('#q_scode').fieldValue(trim(scodeStr));
			if(null==$('#q_seq').fieldValue()||""==$('#q_seq').fieldValue()){
			}
			else{
// 				$('#ckx_form_printPostinfo').form('fillRecord',$.extend(
// 						{list_postinfo:'--',usercode:$('#x_usercode').fieldValue()},null
// 					));
				$('#printqtask_usercenter').fieldValue(trim($('#q_usercenter').fieldValue()));
				$('#printqtask_seq').fieldValue(trim($('#q_seq').fieldValue()));
				$('#grid_PrintQtaskinfo').grid('reload');
			}
		}	
		
		//查看打印机按钮触发函数
		function func_button_selectDevice(){
			var record = $('#grid_PrintQtaskmain').grid('getSelectedRecords');
			var Str="";
			if(record.length>0){
				if((record[0].sdevicecode)=="NONE"){
					alert("${i18n.IsNotAssign}");
				}else{
					for(var i=0;i<record.length;i++){
						if(i==record.length-1){
							Str = Str+"'"+record[i].sdevicecode+"'";
						}else{
							Str = Str+"'"+record[i].sdevicecode+"'"+",";
						}
					}					
				//赋值
				$('#sdevicecodes_sdevicecode').fieldValue(trim(Str));
				$('#form_printDevicestatus').form('fillRecord',$.extend(
						{ckx_device:'--',usercenter:$('#q_usercenter').fieldValue(),sdevicecode:$('#sdevicecodes_sdevicecode').fieldValue()},record
					));
				$("#form_printDevicestatus").form("open");
				}
			}else{
				alert("${i18n.chooselist}");
			}
			
		}
		
		//作业调度按钮触发函数
		function func_button_resetQtask()
		{
			var role = $('#grid_PrintQtaskmain').grid('getSelectedRecords');
			if(role.length>0){
					for(var i=0;i<role.length;i++){
						if((0==role[i].status&&"NONE"!=role[i].sdevicecode)||2==role[i].status||3==role[i].status||4==role[i].status){
							alert("${i18n.qtask} "+role[i].qid+" ${i18n.notdd}");
							return false;
						}
					}
				$('#form_printDevicegroup').form('fillRecord',$.extend(
						{ckx_devices:'--',usercenter:$('#devices_usercenter').fieldValue()}
					));
				$("#form_printDevicegroup").form("open");
			}else{
				alert("${i18n.chooselist}");
			}
		}
		
		
		
		//重打按钮触发函数
// 		function func_button_resetDevice()
// 		{
// 			var role = $('#grid_PrintQtaskmain').grid('getSelectedRecords');
// 			if(role.length>0){
// 				var role1 = $('#grid_PrintQtaskmain').grid('getSelectedRecords')[0];
// 				$('#form_printDevice').form('fillRecord',$.extend(
// 						{ckx_devices:'--',usercenter:$('#devices_usercenter').fieldValue()},role1
// 					));
// 				if(3==role1.status || 4==role1.status){
// 					$("#form_printDevice").form("open");
// 				}else{
// 					alert("该作业状态下不能重打");
// 				}
// 			}else{
// 				alert("请选择一条数据");
// 			}
// 		}
		
		//选中 需要转移的打印机组     提交   后触发函数
		function form_printDevicegroup_afterSubmit(){
			var record = $('#grid_PrintQtaskmain').grid('getSelectedRecords');
			var role= $('#form_ckx_printdevice').grid('getSelectedRecords');
			var params = [];
			for(var i=0;i<record.length;i++){
				params.push('ckx_Qtask['+i+'].qid='+record[i].qid);
				params.push('ckx_Qtask['+i+'].status='+record[i].status);
			}
			if(role.length>0){
				$.sdcui.ajaxUtil.ajax({
					url:'printQtaskmain.ajax?spcodes='+role[0].spcodes,
					data:params.join('&'),
					success:function(){
						$("#form_printDevicegroup").dialog('close');
						$("#grid_PrintQtaskmain").grid('reload');
					}
				});
			}else{
				alert("${i18n.choosespcodes}");
			}
			
		}
		
		//选中一台打印机 提交后触发函数
// 		function form_printDevice_afterSubmit(){
// 			var qid =$("#devices_qid").fieldValue();
// 			var role = $('#form_ckx_printdevice').grid('getSelectedRecords');
// 			if(role.length>0){
// 				$.sdcui.ajaxUtil.ajax({
// 					url:'printQtaskmain.ajax?spcode='+role[0].spcode+'&qid='+qid,
// 					success:function(){
// 						$("#form_printDevice").dialog('close');
// 					}
// 				});
// 			}else{
// 				$.sdcui.ajaxUtil.ajax({
// 					url:'printQtaskmain.ajax?qid='+qid,
// 					success:function(){
// 						$("#form_printDevice").dialog('close');
// 					}
// 				});
// 			}
			
// 		}
		
		//刷新按钮触发函数
		function func_button_refersh(){
			$('#form_printDevicegroup').form('fillRecord',$.extend(
					{ckx_devices:'--',usercenter:$('#devices_usercenter').fieldValue()}
				));
			$("#form_printDevicegroup").grid('reload');
		}
		
		
		//取消打印按钮触发函数
		function func_button_deleteDevice(){
			var role = $('#grid_PrintQtaskmain').grid('getSelectedRecords');
			var row = $('#grid_PrintQtaskinfo').grid('getSelectedRecords');
			var params = [];
			for(var i=0;i<role.length;i++){
				params.push('ckx_Qtask['+i+'].qid='+role[i].qid);
				params.push('ckx_Qtask['+i+'].status='+role[i].status);
				params.push('ckx_Qtask['+i+'].sdevicecode='+role[i].sdevicecode);
			}
            if(role.length < 1&&row.length<1){
            	alert("${i18n.choose}");
            }else if(role.length >0 && row.length >0){
            	alert("${i18n.onlyqtask}");
            }else if(row.length >0){
            	alert("${i18n.onlymaintask}");
            }else{
            	if(role.length>0){
    				for(var i=0;i<role.length;i++){
    					if(3==role[i].status||4==role[i].status){
    						alert("${i18n.qtask} "+role[i].qid+" 不能取消");
    						return false;
    					}
    				}
    				$.sdcui.ajaxUtil.ajax({
    					url:'removePrintQtaskmain.ajax?sdevicecode='+role[0].sdevicecode,
    					data:params.join('&'),
    					success:function(){
    						$('#grid_PrintQtaskmain').grid('reload');
    						$('#grid_PrintQtaskinfo').grid('reload');
    					}
    				});
            	}
            }
		}
</script>