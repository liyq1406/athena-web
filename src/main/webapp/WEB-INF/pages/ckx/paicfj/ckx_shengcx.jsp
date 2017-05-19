<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.export}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
/* 		#grid_CkxCalendarCenter  .grid-footer   .pAddRow,  */
/* 			#grid_CkxCalendarCenter  .grid-footer   .pRemoveRow{  */
/* 			display: none;  */
/* 			}  */

 .youi-fieldLayout table td.contral.label-col {     width: 95px; } </style>
<script type="text/javascript">
function initPage(){
	getGridHeight();
}
</script>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_shengcx">
	<t:grid id="grid_ckx_shengcx" caption="${i18n.shengcx}"
		idKeys="usercenter,shengcxbh" add="NOT"
		src="/paicfj/queryCkx_shengcx.ajax" remove="NOT"
		dataFormId="from_shengcx" load="false" showNum="true">
		<t:fieldLayout id="shengcx" prefix="scx">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" 
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"
				/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" maxLength="5"  dataType="text"/>
			<t:fieldSelect property="chanxzbh" caption="${i18n.chanxzbh}" src="/paicfj/listCkx_chanxz.ajax" show="chanxzbh" code="chanxzbh"></t:fieldSelect>
			<t:fieldSelect property="biaos" caption="${i18n.active}"
				convert="biaos" defaultValue="1"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"
			convert="queryUserCenterMap" width="80"></t:gridCol>
		<t:gridCol property="shengcxbh"  width="80" caption="${i18n.shengcxbh}"></t:gridCol>
		<t:gridCol property="chanxzbh"  width="80" caption="${i18n.chanxzbh}"></t:gridCol>
		<t:gridCol property="cpshengcjp"  width="100" caption="${i18n.cpshengcjp}"></t:gridCol>		
		<%-- <t:gridCol property="tessjxq1" width="100" caption="${i18n.tessjxq1}"
			convert="queryXQ"></t:gridCol>
		<t:gridCol property="tessjxs1"  width="100" caption="${i18n.tessjxs1}"></t:gridCol>
		<t:gridCol property="tessjxq2"  width="100" caption="${i18n.tessjxq2}"
			convert="queryXQ"></t:gridCol>
		<t:gridCol property="tessjxs2" width="100" caption="${i18n.tessjxs2}"
			></t:gridCol> --%>
		<t:gridCol property="biaos"  width="100" caption="${i18n.biaoz}" convert="biaos"></t:gridCol>
		<t:button caption="${i18n.invalidate}" name="removes" active="1" icon="removeRecord"></t:button>
	</t:grid>
	<t:form id="from_shengcx" caption="${i18n.shengcx}" reset="NOT"
		action="/paicfj/saveCkx_shengcx.ajax" dialog="true"
		idKeys="usercenter,shengcxbh" width="660">
		<t:fieldLayout columns="2" prefix="fscx" width="660">
		<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap" notNull="true" />
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}"
				notNull="true" maxLength="5" minLength="5" dataType="text" />	
			<t:fieldSelect property="chanxzbh" caption="${i18n.chanxzbh}"
				src="/paicfj/listCkx_chanxz.ajax" show="chanxzbh" code="chanxzbh"  ></t:fieldSelect>
			
				 <t:fieldText property="cpshengcjp" caption="${i18n.cpshengcjp}"
				 maxLength="3" dataType="integer" />		
			<t:fieldSelect property="biaos" caption="${i18n.biaoz}"
				convert="biaos" defaultValue="1" notNull="true"></t:fieldSelect>
			<%-- <t:fieldSelect property="tessjxq1" caption="${i18n.tessjxq1}"
				 convert="queryXQ"></t:fieldSelect>
			<t:fieldText property="tessjxs1" caption="${i18n.tessjxs1}"
				 expression="(^[0-3](?:\.[0-9]{0,2})?$)|^4(?:\.[0]{0,2})?$" expressionMessage="只能输入0-4.00之间的数" />
			<t:fieldSelect property="tessjxq2" caption="${i18n.tessjxq2}"
				 convert="queryXQ"></t:fieldSelect>
			<t:fieldText property="tessjxs2" caption="${i18n.tessjxs2}"
				 expression="(^[0-3](?:\.[0-9]{0,2})?$)|^4(?:\.[0]{0,2})?$" expressionMessage="只能输入0-4.00之间的数" />
			<t:fieldSelect property="tessjxq3" caption="${i18n.tessjxq3}"
				 convert="queryXQ"></t:fieldSelect>
			<t:fieldText property="tessjxs3" caption="${i18n.tessjxs3}"
				 expression="(^[0-3](?:\.[0-9]{0,2})?$)|^4(?:\.[0]{0,2})?$" expressionMessage="只能输入0-4.00之间的数" /> --%>
		</t:fieldLayout>
	</t:form>
</t:page>
</t:html>

<script type="text/javascript">
// 	$.sdcui.serverConfig.convertArray['xingqi'] = {
// 		'0' : '${i18n.qingxz}',
// 		'1' : '${i18n.monday}',  
// 		'2' : '${i18n.tuesday}',
// 		'3' : '${i18n.wednesday}',
// 		'4' : '${i18n.thursday}',
// 		'5' : '${i18n.friday}',
// 		'6' : '${i18n.saturday}',
// 		'7' : '${i18n.sunday}'
// 	};
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'0' : '${i18n.no}',
		'1' : '${i18n.yes}'
	};
	$(document).ready(function() {
		// 			$("#cz_shengcxbh").click(function (){
		// 				alert("llll12351234");
		// 			});
		// 			$("#cz_shengcxbh input").blur(function (){
		// 				alert("blur");
		// 			});
		// 			 $("#grid_ckx_shengcx").validate({
		// 				 shengcxbh:{
		// 					 required: true
		// 				 }
		// 			 });

	});

// 	function func_button_save() {
		// 			var rows = $('#grid_ckx_shengcx').grid('getBatchRecords');
// 	}
// 	function func_set_tessjxs1(){
// 		var  cell = this.col.cell;
// 		var rowElement = cell.parent('tr:first');
// 		var tessjxq1Index = $('td.tessjxq1:first').prevAll().length;
// 		var tessjxs1Index = $('td.tessjxs1:first').prevAll().length;
		
// 		var tessjxq1Str = rowElement.find('td:eq('+tessjxq1Index+')').text();
// 		if("请选择" == tessjxq1Str){
// 			rowElement.find('td:eq('+tessjxs1Index+')').text("0");
// 		}
		
// 	}
	
	function func_button_edit(){
		$("#from_shengcx").form('clear');
		$('#from_shengcx').removeClass('operant-add');
		var record = $("#grid_ckx_shengcx").grid("getSelectedRecords")[0];
		$("#from_shengcx").form('fillRecord', $.extend({}, record));
		$("#from_shengcx").form("open","${i18n.update }");
	}
	function fscx_biaos_change(){
		if('0'== $("#fscx_biaos").fieldValue()){
			$("#fscx_biaos").removeClass('disabled');
			$("#fscx_biaos input").attr("disabled",false);
		}else{
			$("#fscx_biaos").addClass('disabled');
			$("#fscx_biaos input").attr("disabled",true);
		}
	}
	
	function func_button_removes() {
		var row = $("#grid_ckx_shengcx").grid("getSelectedRecords");
		if (0 < row.length) {
			if ('1' == row[0].biaos) {
				if (confirm("${i18n.quedsx}")) {
					$.sdcui.ajaxUtil.ajax({
						url : "../paicfj/removeCkx_shengcx.ajax?usercenter="+row[0].usercenter+"&shengcxbh="+row[0].shengcxbh,
// 						data : {
// 							usercenter : row[0].usercenter,
// 							shengcxbh : row[0].shengcxbh
// 						},
						success : function() {
							$("#grid_ckx_shengcx").grid("reload");
						}
					});
				}
			} else {
				alert("${i18n.shujysx}");
			}
		} else {
			alert("${i18n.qingxxzyhsj}");
		}

	}
	
	function from_shengcx_beforeSubmit() {
		
		return true;
	}
	

	
</script>
