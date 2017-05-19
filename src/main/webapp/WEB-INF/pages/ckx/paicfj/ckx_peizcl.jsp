<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
#grid_ckx_peizcl .youi-fieldLayout table td.contral.label-col { width: 70px; }
 
 #form_ckx_peizcl .youi-fieldLayout table td.contral.label-col { width: 90px; }
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_peizcl">

	<t:grid id="grid_ckx_peizcl" caption="${i18n.peizcl }"
		idKeys="usercenter,celbh" src="/paicfj/queryCkx_peizcl.ajax" 
		scrollHeight="90" clickRowEvent="grid_ckx_peizcl_click"
		removeSrc="/paicfj/removeCkx_peizcl.ajax"
		dataFormId="form_ckx_peizcl"  load="false" showNum="true">
		<t:fieldLayout id="peizcl" prefix="peizcl" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" width="174"
				convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
			<t:fieldText property="celbh" caption="${i18n.celbh }" maxLength="10"  width="174" dataType="text"/>
			<t:fieldText property="baozzbh" caption="${i18n.baozzbh }" maxLength="10" width="174" dataType="text"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }"
			convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="celbh" caption="${i18n.celbh }"></t:gridCol>
		<t:gridCol property="celmc" caption="${i18n.celmc }"></t:gridCol>
		<t:gridCol property="chexbh" caption="${i18n.chexbh }"></t:gridCol>
		<t:gridCol property="youxj" caption="${i18n.youxj }"></t:gridCol>
		<t:gridCol property="baozsl" caption="${i18n.baozsl }"></t:gridCol>
		<t:gridCol property="beiz" caption="${i18n.beiz }"></t:gridCol>
		
	</t:grid>

	<t:grid id="grid_ckx_peizclzb" idKeys="baozzbh,usercenter,celbh" caption="${i18n.peizclzb }"
		editModel="false" src="/paicfj/queryCkx_peizclzb.ajax" load="false"
		submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" 
		scrollHeight="90"
		showNum="true">
		<t:fieldLayout prefix="peizclzb_f">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter }"></t:fieldHidden>
			<t:fieldHidden property="celbh" caption="${i18n.celbh }"></t:fieldHidden>
			<t:fieldHidden property="baozzbh" caption="${i18n.baozzbh }" ></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="baozzbh" caption="${i18n.baozzbh }" width="180"></t:gridCol>
		<t:gridCol property="baozsl" caption="${i18n.baozsl }" width="180"></t:gridCol>
	</t:grid>



	<t:form id="form_ckx_peizcl" caption="${i18n.peizcl }" dialog="true" reset="NOT" submit="NOT"
		width="670" action="saveCkx_peizcl.ajax" idKeys="usercenter,celbh">
		<t:fieldLayout columns="2" prefix="peizcls" showLabel="true">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" width="174"
				convert="queryUserCenterMap" defaultValue="${loginUsercenter }" notNull="true"/>
			<t:fieldText property="celbh" caption="${i18n.celbh }" maxLength="10"
				notNull="true" dataType="text" ></t:fieldText>
			<t:fieldText property="celmc" caption="${i18n.celmc }" ></t:fieldText>
			<t:fieldText property="chexbh" caption="${i18n.chexbh }"
				notNull="true" maxLength="10" dataType="10"></t:fieldText>
			<t:fieldText property="youxj" caption="${i18n.youxj }" expression="^[0-9]$"
				expressionMessage="${i18n.zhinsr }[0-9)${i18n.zhijdsz }"></t:fieldText>
			<t:fieldText property="beiz" caption="${i18n.beiz }" ></t:fieldText>		
			<t:fieldGrid property="pzcl" parents="usercenter,celbh" mode="reload"
				width="550" column="2" caption="${i18n.peizclzb }">
				<t:grid id="form_grid_ckx_peizclzb" panel="false"  idKeys="baozzbh" showNum="true"
					editModel="true" src="/paicfj/queryCkx_peizclzb.ajax" load="false" preSaveRowsEvent="preSaveEvent"
					width="450"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					submit="NOT" reset="NOT" editable="true">
					<t:gridCol property="baozzbh" caption="${i18n.baozzbh }"
						width="100" editor="fieldText"
						editorOptions="{'notNull':true,'maxLength':'10','dataType':'text'}"></t:gridCol>
					<t:gridCol property="baozsl" caption="${i18n.baozsl }" 
						editor="fieldText"
						editorOptions="{'dataType':'integer','maxLength':'5'}"></t:gridCol>
							<t:gridCol property="a" caption="   "
				></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.tij }" name="submit_zdy"></t:button>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
	
	function func_button_edit() {
		$("#form_ckx_peizcl").form('clear');
		$('#form_ckx_peizcl').removeClass('operant-add');
		var record = $("#grid_ckx_peizcl").grid("getSelectedRecords")[0];
		$("#form_ckx_peizcl").form('fillRecord', $.extend({
			pzcl : '--'
		}, record));
		$("#form_ckx_peizcl").form("open", "${i18n.update }");
	}
	 
	function grid_ckx_peizcl_beforeSubmit() {
		if ("" != $("#peizcl_baozzbh").fieldValue()) {			
			$("#peizcl_celbh").fieldValue("");
			$("#peizclzb_f_baozzbh").fieldValue($("#peizcl_baozzbh").fieldValue());			
			$('#grid_ckx_peizclzb').grid('reload');
		} else {
			$("#peizcl_celbh")
					.fieldValue(trim($("#peizcl_celbh").fieldValue()));
		}

	}
	function grid_ckx_peizcl_click(record, rowIndex) {
		// 		var record=$("#grid_ckx_peizcl").grid("getSelectedRecords")[0];
// 		$("#form_ckx_peizclzb").form('clear');
		
// 		$("#form_ckx_peizclzb").form('fillRecord', $.extend({
// 			pzclzb : '--'
// 		}, record));
		$("#peizclzb_f_usercenter").fieldValue(trim(record.usercenter));
		$("#peizclzb_f_celbh").fieldValue(trim(record.celbh));
// 		$("#grid_ckx_peizclzb").grid("reload");
		$('#grid_ckx_peizclzb').grid('reload',false,[],true);
		$('#grid_ckx_peizclzb').parent().parent().show();
		
	}
	function initPage(){
		$('#grid_ckx_peizclzb').parent().parent().hide();
	}
	function func_button_submit_zdy() {		
// 		if($('#form_chanxz').form('validate')!=true){
// 			return false;
// 		}
		var peizcls_celmc = $("#peizcls_celmc").fieldValue();
		var peizcls_beiz = $("#peizcls_beiz").fieldValue();
		var params = [];			
		params.push(zobj(40,peizcls_celmc,"${i18n.celmc }"));	
		params.push(zobj(100,peizcls_beiz,"${i18n.beiz }"));	
		if(!checkAllChina(params))return false;
		if($("#form_grid_ckx_peizclzb").grid("isEditedCell")){
			$("#form_grid_ckx_peizclzb").grid("saveRows");
		}else{			
			$('#form_ckx_peizcl').form('submit');
		}		
	}
	function preSaveEvent(){		
		$('#form_ckx_peizcl').form('submit');
		$('#grid_ckx_peizcl').grid('reload');//刷新表格数据
		$('#grid_ckx_peizclzb').grid('reload');//刷新表格数据
		return false;
	}
	
</script>
