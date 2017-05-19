<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.kuwdj}">

<!-- 
	  库位等级
	 @author denggq
	 @date 2012-1-17
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_kuwdj">
	<t:grid id="grid_kuwdj" caption="${i18n.kuwdj}" idKeys="usercenter,cangkbh,kuwdjbh" src="/cangk/queryKuwdj.ajax" 
		add="NOT" edit="NOT" back="NOT" scrollHeight="335" pageSize="15"
		editable="true" removeSrc="/cangk/removeKuwdj.ajax" saveRowsSrcs="/cangk/saveKuwdj.ajax" 
		load="false"  showNum="true"  afterSaveRowsEvent="afterSaveRows"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" 
		>
		<t:fieldLayout id="fl_kuwdj" prefix="kuwdj" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap"  width="110"/>
			<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" dataType="text" maxLength="3" minLength="3" width="110"/>
			<t:fieldText property="kuwdjbh" caption="${i18n.kuwdjbh}" dataType="text" maxLength="5" width="110"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="110"/>
		</t:fieldLayout>
		<t:button caption="${i18n.shezkwdj}" name="kuwdjbz" active="1"></t:button>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" editor="fieldSelect" editorOptions="{'notNull':true}" defaultValue="${usercenter}"></t:gridCol>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" editor="fieldText" editorOptions="{'dataType':'text','notNull':true,'maxLength':'3','minLength':'3'}"></t:gridCol>
		<t:gridCol property="kuwdjbh" caption="${i18n.kuwdjbh}" editor="fieldText" width="110" editorOptions="{'dataType':'text','notNull':true,'maxLength':'5'}"></t:gridCol>
		<t:gridCol property="chang" caption="${i18n.chang}" editor="fieldText" editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.chang_ex_mes}'}"></t:gridCol>
		<t:gridCol property="kuan" caption="${i18n.kuan}" editor="fieldText" editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.kuan_ex_mes}'}"></t:gridCol>
		<t:gridCol property="gao" caption="${i18n.gao}" editor="fieldText" editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.gao_ex_mes}'}"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
	
	
	<t:form dialog="true" id="form_kuwdjbz" action="/cangk/saveKuwdjBaozs.ajax" width="500" idKeys="usercenter,cangkbh,kuwdjbh,baozlx,baozgs" reset="NOT" submit="NOT" caption="${i18n.kuwdjbz}">
		<t:fieldLayout prefix="record1">
		<t:grid id="kuwdj" caption="" idKeys="usercenter,cangkbh,kuwdjbh" 
				submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" back="NOT" load="false" save="NOT">
				<t:fieldSelect width="140" property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" readonly="true"/>
				<t:fieldText width="140" property="cangkbh" caption="${i18n.cangkbh}" dataType="text" maxLength="3" minLength="3" notNull="true" readonly="true"/>
				<t:fieldText width="140" property="kuwdjbh" caption="${i18n.kuwdjbh}" dataType="text" maxLength="5" notNull="true" readonly="true"/>
		</t:grid>
		</t:fieldLayout>
		<t:fieldLayout prefix="r2" showLabel="false" columns="1" >
			<t:fieldGrid parents="usercenter,cangkbh,kuwdjbh" width="500" property="djbz" caption="${i18n.xiaohccx}">
				<t:grid id="kwdjbz" idKeys="baozlx,baozgs" src="/cangk/queryKuwdjBaoz.ajax" caption="" save="NOT"  
					preSaveRowsEvent="preSaveEvent" back="NOT" load="false" showNum="true"
					submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" editable="true" 
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
					<t:fieldLayout prefix="record2">
						<t:fieldHidden property="usercenter" caption="${i18n.usercenter}" />
						<t:fieldHidden property="cangkbh" caption="${i18n.cangkbh}" />
						<t:fieldHidden property="kuwdjbh" caption="${i18n.kuwdjbh}" />
					</t:fieldLayout>
					<t:gridCol property="baozlx" caption="${i18n.baozlx}" editor="fieldText" editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"></t:gridCol>
					<t:gridCol property="baozgs" caption="${i18n.baozgs}" editor="fieldText" editorOptions="{'expression':'^(0|[1-9][0-9]{0,4})$','expressionMessage':'${i18n.baozgs_ex_mes}','notNull':true}"></t:gridCol>
					<t:gridCol property="" caption="" width="20"/>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy}" name="submit_kwdj"></t:button>
	</t:form>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};

	//空格查询
	function grid_kuwdj_beforeSubmit() {
		$("#kuwdj_cangkbh").fieldValue(trim($("#kuwdj_cangkbh").fieldValue()));
		$("#kuwdj_kuwdjbh").fieldValue(trim($("#kuwdj_kuwdjbh").fieldValue()));
	}

	//保存按钮
	function func_button_save() {
		$('#grid_kuwdj').grid('saveRows');
	}

	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	function preSaveEvent(){		
		$('#form_kuwdjbz').form('submit');
		return false;
	}
	
	function func_button_kuwdjbz(){
		$("#form_kuwdjbz").form("clear");
		var record = $("#grid_kuwdj").grid("getSelectedRecords")[0];
		$("#record1_cangkbh").fieldValue(trim(record.cangkbh));
		$("#record1_cangkbh").fieldValue();
		$("#record1_kuwdjbh").fieldValue(trim(record.kuwdjbh));
		$("#record1_kuwdjbh").fieldValue();
		$("#record1_usercenter").fieldValue(trim(record.usercenter));
		$("#record1_usercenter").fieldValue();
		$("#record2_cangkbh").fieldValue(trim(record.cangkbh));
		$("#record2_cangkbh").fieldValue();
		$("#record2_kuwdjbh").fieldValue(trim(record.kuwdjbh));
		$("#record2_kuwdjbh").fieldValue();
		$("#record2_usercenter").fieldValue(trim(record.usercenter));
		$("#record2_usercenter").fieldValue();
		
		$('#kwdjbz').grid('clearBatchData');
		
		$('#kwdjbz').grid('reload',false,[],true);
		
		$("#form_kuwdjbz").form("open");
		
	}
	
	function func_button_submit_kwdj(){

		if($("#kwdjbz").grid("isEditedCell")){
			$("#kwdjbz").grid("saveRows");
		}else{			
			$('#form_kuwdjbz').form('submit');
		}
	}
	
</script>

</t:html>