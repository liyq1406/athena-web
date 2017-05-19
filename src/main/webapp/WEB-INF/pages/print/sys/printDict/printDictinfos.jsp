<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.danjcsh}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 120px; } </style>
</head>
<t:page i18n="i18n.print.i18n_print">
	<t:grid id="grid_ckx_printDictinfos" caption="${i18n.danjlb}" 
		idKeys="usercenter,zidbm,zidmc" src="/sys/queryPrintDictinfos.ajax"
		remove="NOT" edit="NOT" add="NOT" save="NOT" back="NOT"
		saveRowsSrcs="/sys/savesPrintDictinfos.ajax" removeSrc="/sys/removePrintDjlx.ajax"
		editable="true" editModel="false" load="false" showNum="true" scrollHeight="450" pageSize="20" showEditorAddName="button_add" showEditorRemoveName="button_delete">
		<t:fieldLayout id="setinfos" prefix="sf">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
			<t:fieldText property="zidbm" caption="${i18n.zidbm}" dataType="text" upperCase="false" maxLength="10"></t:fieldText>
			<t:fieldText property="zidmc" caption="${i18n.zidmc}" maxLength="40"></t:fieldText>	
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="active" defaultValue="1"></t:fieldSelect>
		</t:fieldLayout>
		<t:button caption="${i18n.save}" name="saves"></t:button>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"
			editor="fieldSelect" convert="usercenter" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="zidbm" caption="${i18n.zidbm}"
			editor="fieldText" editorOptions="{'maxLength':'10','dataType':'text','notNull':true,'upperCase':false}"></t:gridCol>
		<t:gridCol property="zidmc" caption="${i18n.zidmc}" width="150"
			editor="fieldText" editorOptions="{'maxLength':'40','notNull':true}"></t:gridCol>
		<t:gridCol property="danjzbh" caption="${i18n.danjzbh}" 
			editor="fieldText" editorOptions="{'maxLength':'20','dataType':'text'}"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="active"
			editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>	
		<t:gridCol property="" caption=" " />
	</t:grid>
</t:page>
</t:html>

<script>
	$.sdcui.serverConfig.convertArray['usercenter'] = {'UW':'${i18n.yic},${i18n.erc}','UL':'${i18n.sanc}','UX':'${i18n.xiangy}'};
 	$.sdcui.serverConfig.convertArray['biaos'] = {'0':'${i18n.buqy}','1':'${i18n.qiy}'};
 	$.sdcui.serverConfig.convertArray['active'] = {'1':'${i18n.validate}','0':'${i18n.nodisable}'};
 	
 	//查询前触发的函数
 	function grid_ckx_printDictinfos_beforeSubmit(){
 		var zidbmStr = $('#sf_zidbm').fieldValue();
		$('#sf_zidbm').fieldValue(trim(zidbmStr));
		var zidmcStr = $('#sf_zidmc').fieldValue();
		$('#sf_zidmc').fieldValue(trim(zidmcStr));
 	}
 	
	//保存按钮触发的函数
	function func_button_saves(){
		if($("#grid_ckx_printDictinfos").grid("isEditedCell")){
			$("#grid_ckx_printDictinfos").grid("saveRows");
		}else{
			 $.sdcui.ajaxUtil.ajax({
					url:'savesPrintDictinfos.ajax?usercenter=${loginUsercenter }',
					success:function(){
						$('#grid_ckx_printDictinfos').grid('reload');
					}
			});
		}	
	}
	
	function func_button_danjrl(){
				$('#form_printStrogdict').form('fillRecord',$.extend(
						{ckx_strogdict:'--',usercenter:'${usercenter}',cangkbh:'${cangk}'}
					));
				$("#form_printStrogdict").form("open");
		
	}
	//启用按钮触发函数
	function func_button_qiyong(){
		 var role = $('#form_ckx_printStrogdict').grid('getSelectedRecords')[0];
		 $.sdcui.ajaxUtil.ajax({
				url:'disablePrintStrogdict.ajax?biaos='+role.biaos
						+'&usercenter='+role.usercenter+'&cangkbh='+role.cangkbh+'&zidbm='+role.zidbm+'&zidmc='+role.zidmc,
				success:function(){
					$('#form_ckx_printStrogdict').grid('reload');
				}
		});
	}
	//停用按钮触发函数
	function func_button_tingyong(){
		 var role = $('#form_ckx_printStrogdict').grid('getSelectedRecords')[0];
		 $.sdcui.ajaxUtil.ajax({
				url:'nodisablePrintStrogdict.ajax?biaos='+role.biaos
						+'&usercenter='+role.usercenter+'&cangkbh='+role.cangkbh+'&zidbm='+role.zidbm+'&zidmc='+role.zidmc,
				success:function(){
					$('#form_ckx_printStrogdict').grid('reload');
				}
		});
	}
</script>