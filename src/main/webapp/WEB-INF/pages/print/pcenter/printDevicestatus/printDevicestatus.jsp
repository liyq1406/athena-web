<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.dayjk}">
<head>  
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>  
<t:page i18n="i18n.print.i18n_print">
		<t:grid id="grid_PrintDevicestatus" idKeys="spcode,usercenter"
			dataFormId="ckx_form_PrintDevicestatus" caption="${i18n.spcodestatus}"
			src="/sys/queryPrintDevicestatus.ajax" add="NOT" edit="NOT"
			showNum="true" remove="NOT" load="false" scrollHeight="430" back="NOT">
			<t:button caption="${i18n.chaksbzy}" name="chakzy" active="1"></t:button>
			<t:fieldLayout prefix="q">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
				<t:fieldText property="spcode" caption="${i18n.spcode}" maxLength="20"></t:fieldText>
				<t:fieldText property="sip" caption="${i18n.sip}" maxLength="20"></t:fieldText>
				<t:fieldText property="sname" caption="${i18n.name}" maxLength="50" ></t:fieldText>
				<t:fieldText property="spcodes" caption="${i18n.spcodes}" maxLength="20"></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="spcode" caption="${i18n.spcode}" orderBy="desc" sortProperty="spcode"></t:gridCol>
			<t:gridCol property="spcodes" caption="${i18n.spcodes}" width="130"></t:gridCol>
			<t:gridCol property="sname" caption="${i18n.name}"></t:gridCol>
			<t:gridCol property="sip" caption="${i18n.sip}" width="130"></t:gridCol>
			<t:gridCol property="nlevel" caption="${i18n.nlevel}"></t:gridCol>
			<t:gridCol property="sport" caption="${i18n.sport}"></t:gridCol>
			<t:gridCol property="status" caption="${i18n.spcodestatus}" convert="status2"></t:gridCol>
			<t:gridCol property="enable" caption="${i18n.dayjlszt}" width="150" convert="enable"></t:gridCol>
			<t:gridCol property="usercode" caption="${i18n.user}"></t:gridCol>
			<t:gridCol property="lastqid" caption="${i18n.qid}"></t:gridCol>
			<t:gridCol property="" caption=" " />
		</t:grid>
		
	<t:form dialog="true" caption="${i18n.dayzy}" idKeys="qid,usercenter" id="form_printQtaskmain" height="400" width="800" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="printQtaskmain" showLabel="false">
			<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}"></t:fieldHidden>
			<t:fieldHidden property="qid" caption="${i18n.qid}"></t:fieldHidden>
			<t:fieldGrid property="ckx_printQtask" parents="qid,usercenter" mode="reload" column="2" width="800">
				<t:grid id="grid_PrintQtaskmain" idKeys="qid"
					dataFormId="ckx_form_PrintQtaskmain" caption="${i18n.taskmain}"
					src="/pcenter/queryPrintQtaskmain.ajax" add="NOT" edit="NOT" back="NOT"
					 remove="NOT" load="true" reset="NOT" save="NOT" submit="NOT" panel="false" >
					<t:gridCol property="qid" caption="${i18n.qid}" width="200"></t:gridCol>
					<t:gridCol property="scode" caption="${i18n.danjzbh}"></t:gridCol>
					<t:gridCol property="createtime" caption="${i18n.timecreate}"
						width="130"></t:gridCol>
					<t:gridCol property="finishedtime" caption="${i18n.overtime}"
						width="130"></t:gridCol>
					<t:gridCol property="sdevicecode" caption="${i18n.spcode}"
						width="100"></t:gridCol>
					<t:gridCol property="status" caption="${i18n.status}"
						convert="status" width="100"></t:gridCol>
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:grid id="grid_PrintQtaskinfo"
					src="/pcenter/queryPrintQtaskinfo.ajax" submit="NOT" reset="NOT" 
					add="NOT" edit="NOT" remove="NOT" load="false" idKeys="qid,seq" caption="${i18n.zirwlb}" back="NOT">
				<t:fieldLayout prefix="printqtask" showLabel="false" columns="1">
						<t:fieldHidden property="usercenter" defaultValue="${loginUsercenter}"></t:fieldHidden>
						<t:fieldHidden property="qid" caption="${i18n.qid}"></t:fieldHidden>
				</t:fieldLayout>		
						<t:gridCol property="seq" caption="${i18n.seq}" align="center" width="300"></t:gridCol>
						<t:gridCol property="zidmc" caption="${i18n.danjmc}" width="150" align="center"></t:gridCol>
						<t:gridCol property="status" caption="${i18n.status}" convert="status1" align="center" width="350"></t:gridCol>
						<t:gridCol property="" caption=" " />
		</t:grid>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
		$.sdcui.serverConfig.convertArray['status'] = {'-1':'${i18n.prework}','0':'${i18n.newwork}','1':'${i18n.printinterrp}','2':'${i18n.print}','3':'${i18n.printover}','4':'${i18n.canelprint}'};
		$.sdcui.serverConfig.convertArray['status1'] = {'0':'${i18n.notprint}','1':'${i18n.yeprint}','2':'${i18n.canelprint}'};
		$.sdcui.serverConfig.convertArray['status2'] = {'0':'${i18n.ldle}','1':'${i18n.busy}','2':'${i18n.outpaper}','3':'${i18n.jampaper}','4':'${i18n.connbroken}','5':'${i18n.statusalert}'};
		$.sdcui.serverConfig.convertArray['enable'] = {'0':'${i18n.buzy}','1':'${i18n.zhany}'};
		function func_button_chakzy(){
			var record = $('#grid_PrintDevicestatus').grid('getSelectedRecords')[0];
			if(null==record.lastqid){
				alert("${i18n.notqtask}");
			}else{
				$('#form_printQtaskmain').form('fillRecord',$.extend(
						{ckx_printQtask:'--',qid:record.lastqid},record
				));
				$("#form_printQtaskmain").form("open");
			}
			
			
		}
		
		//级联触发改变事件
		function grid_PrintQtaskmain_change(record,rowIndex){
//  			$('#ckx_form_PrintQtaskmain').form('fillRecord',$.extend(
//  					{list_printqtask:'--'},record
// 			));
			$('#printqtask_qid').fieldValue(trim(record.qid));
			$('#printqtask_usercenter').fieldValue(trim(record.usercenter));
			$('#grid_PrintQtaskinfo').grid('reload');
		}
</script>