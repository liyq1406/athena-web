<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	function initPage(){
		//查询页面子表隐藏
		$('#grid_ckx_chanxz_paiccs').parent().parent().hide();
		$('#grid_ckx_shengcx').parent().parent().hide();
		
		
		
	}
	function gotoPage(){
		$.sdcui.pageUtils.goPage({
			url : "../paicfj/execute.ajax",
			mode:'form'			
		});
	}
	function func_button_dingsrw(){
		gotoPage();
	}
</script>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 95px; } </style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_chanxz">

		<t:grid id="grid_ckx_chanxz" caption="${i18n.chanxz}"
			idKeys="chanxzbh,usercenter" src="queryCkx_chanxz.ajax" showNum="true"
			scrollHeight="80" clickRowEvent="grid_ckx_chanxz_click"
			dataFormId="form_chanxz" remove="NOT" load="false" save="NOT">
			<t:fieldLayout id="chanxz" prefix="cz">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
					defaultValue="${loginUsercenter }" convert="queryUserCenterMap"  />
				<t:fieldText property="chanxzbh" caption="${i18n.chanxzbh }" dataType="text" maxLength="3" />
				<t:fieldSelect property="jihyzbh" caption="${i18n.jihyzbh }" src="/paicfj/queryPCJHY.ajax" show="value" code="key"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter }"
				convert="queryUserCenterMap"></t:gridCol>
			<t:gridCol property="chanxzbh" caption="${i18n.chanxzbh }" ></t:gridCol>
			<t:gridCol property="chanxzmc" width="100"
				caption="${i18n.chanxzmc }"></t:gridCol>
				<t:gridCol property="jihyzbh" width="100"
				caption="${i18n.jihyzbh }"></t:gridCol>
			<t:gridCol property="tessjxq1" width="100" caption="${i18n.tessjxq1}" convert="queryXQ"/>
			<t:gridCol property="tessjxs1"  width="100" caption="${i18n.tessjxs1}"/>
			<t:gridCol property="tessjxq2"  width="100" caption="${i18n.tessjxq2}" convert="queryXQ"/>
			<t:gridCol property="tessjxs2" width="100" caption="${i18n.tessjxs2}"/>
			<t:gridCol property="tessjxq3"  width="100" caption="${i18n.tessjxq3}" convert="queryXQ"/>
			<t:gridCol property="tessjxs3" width="100" caption="${i18n.tessjxs3}"/>
			<t:gridCol property="beiz" caption="${i18n.beiz }"></t:gridCol>
<%-- 			<t:button caption="点击跳转定时任务" name="dingsrw"></t:button> --%>
		</t:grid>

	<t:grid id="grid_ckx_chanxz_paiccs" caption="${i18n.pccssz }" showNum="true"
		src="queryCkx_chanxz_paiccs.ajax" submit="NOT" reset="NOT" save="NOT"
		scrollHeight="80" 
		add="NOT" edit="NOT" remove="NOT" load="false" idKeys="banb">
		<t:fieldLayout prefix="cxzpc" id="cxzpc">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter }"></t:fieldHidden>
			<t:fieldHidden property="chanxzbh" caption="${i18n.chanxzbh }"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="banb" caption="${i18n.banb }"></t:gridCol>
		<t:gridCol property="gundzq" caption="${i18n.gundzq }"></t:gridCol>
		<t:gridCol property="tiqq" caption="${i18n.tiqq }"></t:gridCol>
		<t:gridCol property="fengbq" caption="${i18n.fengbq }"></t:gridCol>
		<t:gridCol property="zengcts" width="150" caption="${i18n.zengcts }"></t:gridCol>
		<t:gridCol property="dagdw" width="180" caption="${i18n.dagdw }"
			convert="queryDGDW"></t:gridCol>
		<t:gridCol property="shifzskcsx" caption="${i18n.shifzskcsx}" convert="shifzskcsx"></t:gridCol>
	</t:grid>
	<t:grid id="grid_ckx_shengcx" idKeys="usercenter,shengcxbh"
		src="/paicfj/queryCkx_shengcx.ajax" 
		showNum="true" caption="${i18n.shengcx }"
		submit="NOT" reset="NOT" save="NOT"
		scrollHeight="80" 
		add="NOT" edit="NOT" remove="NOT" load="false" >
		<t:fieldLayout prefix="shengcx" id="shengcx">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter }"></t:fieldHidden>
			<t:fieldHidden property="chanxzbh" caption="${i18n.chanxzbh }"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"
			convert="queryUserCenterMap" width="80"></t:gridCol>
		<t:gridCol property="shengcxbh"  width="80" caption="${i18n.shengcxbh }"></t:gridCol>
		<t:gridCol property="chanxzbh"  width="80" caption="${i18n.chanxzbh}"></t:gridCol>
		<t:gridCol property="cpshengcjp"  width="100" caption="${i18n.chengpscjp}"></t:gridCol>		
		<%-- <t:gridCol property="tessjxq1" width="100" caption="${i18n.tessjxq1}"
			convert="queryXQ"></t:gridCol>
		<t:gridCol property="tessjxs1"  width="100" caption="${i18n.tessjxs1}"></t:gridCol>
		<t:gridCol property="tessjxq2"  width="100" caption="${i18n.tessjxq2}"
			convert="queryXQ"></t:gridCol>
		<t:gridCol property="tessjxs2" width="100" caption="${i18n.tessjxs2}"
			></t:gridCol> --%>
		<t:gridCol property="biaos"  width="100" caption="${i18n.biaos}" convert="biaos"></t:gridCol>
	</t:grid>
	<t:form dialog="true" caption="${i18n.chanxz }" id="form_chanxz" idKeys="usercenter,chanxzbh"
		action="/paicfj/saveCkx_chanxz.ajax" height="450" width="700" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="chanxz" columns="2" showLabel="true" >
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap" notNull="true" />
			<t:fieldText property="chanxzbh" caption="${i18n.chanxzbh }"
				maxLength="3"  notNull="true" dataType="text" />
			<t:fieldText property="chanxzmc" caption="${i18n.chanxzmc }"
				 notNull="true"/>
					<t:fieldSelect property="jihyzbh" caption="${i18n.jihyzbh }" src="/paicfj/queryPCJHY.ajax" show="value" code="key"
				/>
			<t:fieldSelect property="tessjxq1" caption="${i18n.tessjxq1}"
				 convert="queryXQ"></t:fieldSelect>
			<t:fieldText property="tessjxs1" caption="${i18n.tessjxs1}" maxLength="4"
				 expression="(^[0-3](?:\.[0-9]{0,2})?$)|^4(?:\.[0]{0,2})?$" expressionMessage="${i18n.zhinsr}0-4.00${i18n.zhijdsz}" />
			<t:fieldSelect property="tessjxq2" caption="${i18n.tessjxq2}"
				 convert="queryXQ"></t:fieldSelect>
			<t:fieldText property="tessjxs2" caption="${i18n.tessjxs2}" maxLength="4"
				 expression="(^[0-3](?:\.[0-9]{0,2})?$)|^4(?:\.[0]{0,2})?$" expressionMessage="${i18n.zhinsr}0-4.00${i18n.zhijdsz}" />
			<t:fieldSelect property="tessjxq3" caption="${i18n.tessjxq3}"
				 convert="queryXQ"></t:fieldSelect>
			<t:fieldText property="tessjxs3" caption="${i18n.tessjxs3}" maxLength="4"
				 expression="(^[0-3](?:\.[0-9]{0,2})?$)|^4(?:\.[0]{0,2})?$" expressionMessage="${i18n.zhinsr}0-4.00${i18n.zhijdsz}" />
			<t:fieldArea property="beiz" caption="${i18n.beiz }" />
			<t:fieldGrid property="f_pc" parents="chanxzbh,usercenter" 
				mode="reload" column="2" width="650" caption="${i18n.pccssz}" >
				<t:grid id="form_ckx_chanxz_paiccs" idKeys="banb" panel="false" preSaveRowsEvent="preSaveEvent"
				showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					src="/paicfj/queryCkx_chanxz_paiccs.ajax" submit="NOT" reset="NOT"
					editable="true" load="false" showNum="true" scrollHeight="150">
					<t:gridCol property="banb" caption="${i18n.banb }"
						editor="fieldCalendar" width="50"
						editorOptions="{'format':'yyyy-MM-dd','notNull':true}"></t:gridCol>
					<t:gridCol property="gundzq" caption="${i18n.gundzq }"
						editor="fieldText" width="80"
						editorOptions="{'maxLength':'3','dataType':'integer'}"></t:gridCol>
					<t:gridCol property="tiqq" caption="${i18n.tiqq }"
						editor="fieldText" width="80"					
						editorOptions="{'expression':'^([1-9][0-9]{0,2})$|0$','expressionMessage':'${i18n.zhinsr}[0-999)${i18n.zhijdsz}'}"></t:gridCol>
					<t:gridCol property="fengbq" caption="${i18n.fengbq }"
						editor="fieldText" width="80"
						editorOptions="{'maxLength':'3','dataType':'integer'}"></t:gridCol>
					<t:gridCol property="zengcts" caption="${i18n.zengcts }"
						editor="fieldText" width="120"
						editorOptions="{'maxLength':'3','dataType':'integer'}"></t:gridCol>
					<t:gridCol property="dagdw" caption="${i18n.dagdw }"
						editor="fieldSelect"  convert="queryDGDW" width="80"
						></t:gridCol>
					<t:gridCol property="shifzskcsx" caption="${i18n.shifzskcsx }"
						editor="fieldSelect"  convert="shifzskcsx" width="80"
						></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
<t:button caption="${i18n.submit }" name="submit_zdy"></t:button>
	</t:form>

</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['shifzskcsx'] = {
			'1' : '${i18n.shi}',
			'0' : '${i18n.fou}'
	}
	$.sdcui.serverConfig.convertArray['biaos'] = {
			'0' : '${i18n.no}',
			'1' : '${i18n.yes}'
		};
	$.sdcui.serverConfig.convertArray['dagdw'] = {
		'1' : '1${i18n.hours}',
		'0.75' : '45${i18n.minutes}',
		'0.5' : '30${i18n.minutes}',
		'0.25' : '15${i18n.minutes}'
	};
	//查询前执行方法
	function grid_ckx_chanxz_beforeSubmit() {
		//去掉查询条件产线组编号的空格
		$("#cz_chanxzbh").fieldValue(trim($("#cz_chanxzbh").fieldValue()));
	}
	$(document).ready(function() {
		// 			$("#cz_shengcxbh").click(function (){
		// 				alert("llll12351234");
		// 			});
		// 			$("#cz_shengcxbh").blur(function (){
		// 				alert("blur");
		// 			});
		// 			如果填充生产线编号的值，则清空产线组编号的值
		// 			$("#grid_ckx_chanxz").find("input[name='shengcxbh']").bind("focus",function (){
		// 				$('#cz_chanxzbh').fieldValue("");
		// 			});
	});
	// 		点击修改，则弹出页面
	function func_button_edit() {		
		$("#form_chanxz").form('clear');
		$('#form_chanxz').removeClass('operant-add');
		var record = $("#grid_ckx_chanxz").grid("getSelectedRecords")[0];
		$('#form_chanxz').form('fillRecord', $.extend({
			f_pc : '--'
		}, record));
		$("#form_chanxz").form("open","${i18n.update}");
		
	}

	function grid_ckx_chanxz_click(record, rowIndex) {
		// 			$('#form_chanxzpc').form("clear");
// 		$('#form_chanxzpc').form('fillRecord', $.extend({
// 			list_pc : '--'
// 		}, record));
		$("#cxzpc_usercenter").fieldValue(trim(record.usercenter));
		$("#cxzpc_chanxzbh").fieldValue(trim(record.chanxzbh));
		$("#shengcx_usercenter").fieldValue(trim(record.usercenter));
		$("#shengcx_chanxzbh").fieldValue(trim(record.chanxzbh));
// 		$("#grid_ckx_chanxz_paiccs").grid("reload");
		$('#grid_ckx_chanxz_paiccs').grid('reload',false,[],true);
		$('#grid_ckx_chanxz_paiccs').parent().parent().show();	
		$('#grid_ckx_shengcx').grid('reload',false,[],true);
		$('#grid_ckx_shengcx').parent().parent().show();		
	}
	function func_button_submit_zdy(){
// 		if($('#form_chanxz').form('validate')!=true){
// 			return false;
// 		}
		if(!checkTessj()){return false;}
		var chanxzmc = trim($("#chanxz_chanxzmc").fieldValue());
		var beiz = trim($("#chanxz_beiz").fieldValue());
		var params = [];		
		params.push(zobj(40,chanxzmc,'${i18n.chanxzmc }'));
		params.push(zobj(100,beiz,'${i18n.beiz }'));
		if(!checkAllChina(params))return false;
		if($("#form_ckx_chanxz_paiccs").grid("isEditedCell")){
			$("#form_ckx_chanxz_paiccs").grid("saveRows");
		}else{			
			$('#form_chanxz').form('submit');
		}		
	}	
	function preSaveEvent(){		
		$('#form_chanxz').form('submit');
		return false;
	}
	function checkTessj(){
		var tessjxq1 = $("#chanxz_tessjxq1").fieldValue();
		var tessjxq2 = $("#chanxz_tessjxq2").fieldValue();
		var tessjxq3 = $("#chanxz_tessjxq3").fieldValue();
		var tessjxs1 = $("#chanxz_tessjxs1").fieldValue();
		var tessjxs2 = $("#chanxz_tessjxs2").fieldValue();
		var tessjxs3 = $("#chanxz_tessjxs3").fieldValue();
		var flag = true;
		var mes = "";
		if(!checkTessjxq(tessjxq1,tessjxs1)){
			flag  = false;
			mes = "${i18n.tessj1xqtessj1xs}\n";
		}
		if(!checkTessjxq(tessjxq2,tessjxs2)){
			flag  = false;
			mes += "${i18n.tessj2xqtessj2xs}\n";
		}
		if(!checkTessjxq(tessjxq2,tessjxs2)){
			flag  = false;
			mes += "${i18n.tessj3xqtessj3xs}";
		}
		if(!flag){
			alert(mes);
		}
		return flag;
	}
	function checkTessjxq(arg1,arg2){
		if("" != arg1 && "" == arg2){			
			return false;
		}
		if("" != arg2 && "" == arg1 ){			
			return false;
		}
		return true;
	}
</script>
