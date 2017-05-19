<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
#form_gongys .youi-fieldLayout table td.contral.label-col { width: 90px; }
#grid_ckx_gongys .youi-fieldLayout table td.contral.label-col {width: 70px; }
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_gongys">
	<t:grid id="grid_ckx_gongys" caption="${i18n.yunss }"
		idKeys="usercenter,gcbh,beihzq,fayzq" src="/paicfj/queryCkx_gongys.ajax?leix=3"
		dataFormId="form_gongys" load="false" add="NOT" edit="NOT" remove="NOT" showNum="true">
		<t:fieldLayout id="gongys" prefix="gongys" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
				convert="queryUserCenterMap" defaultValue="${loginUsercenter }" notNull="true"/>
			<t:fieldText property="gcbh" caption="${i18n.yunssbh }" maxLength="10" minLength="10" dataType="text"  />
			<t:fieldSelect property="biaos" caption="${i18n.active }"
				convert="biaos" defaultValue="1" />
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }"
			convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="gcbh" caption="${i18n.yunssbh }"
			></t:gridCol>
		<t:gridCol property="gongsmc" caption="${i18n.yunssmc }"></t:gridCol>
		<t:gridCol property="diz" caption="${i18n.diz }" width="60"></t:gridCol>
		<t:gridCol property="youb" caption="ISO" width="60"></t:gridCol>
		<t:gridCol property="lianxr" caption="${i18n.lianxr }" width="60"></t:gridCol>
		<t:gridCol property="dianh" caption="${i18n.dianh }" width="60"></t:gridCol>
		<t:gridCol property="chuanz" caption="${i18n.chuanz }" width="60"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.active }" width="60" convert="biaos" ></t:gridCol>
<%-- 		<t:button caption="${i18n.invalidate}" name="removes" active="1" icon="removeRecord"></t:button> --%>
	</t:grid>
	<t:form id="form_gongys" caption="${i18n.yunss }" idKeys="gcbh,usercenter"
		action="/paicfj/saveCkx_gongys.ajax?leix=3" dialog="true" reset="NOT">
		<t:fieldLayout columns="2" prefix="gys">
		<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
				convert="queryUserCenterMap" defaultValue="${loginUsercenter }" notNull="true" />
			<t:fieldText property="gcbh" caption="${i18n.yunssbh }"
				maxLength="10"  dataType="text" notNull="true"></t:fieldText>
			<t:fieldText property="gongsmc" caption="${i18n.yunssmc }" 
				></t:fieldText>
				<t:fieldText property="diz" caption="${i18n.diz }"
				 ></t:fieldText>
				<t:fieldText property="youb" caption="ISO" maxLength="6"
				expression="^[0-9]{1,10}$" expressionMessage="${i18n.youbcw }"></t:fieldText>
				<t:fieldText property="lianxr" caption="${i18n.lianxr }" ></t:fieldText>
			<t:fieldText property="dianh" caption="${i18n.dianh }" expression="^([0-9]{0,20}-{0,1})*$"  maxLength="20"
				expressionMessage="${i18n.dianhgscw }"></t:fieldText>
			<t:fieldText property="chuanz" caption="${i18n.chuanz }" expression="^([0-9]{0,20}-{0,1})*$"
				expressionMessage="${i18n.chuanzgscw }"></t:fieldText>
			<t:fieldText property="beihzq" caption="${i18n.beihzq }"
				expression="^[1-9][0-9]{0,5}(?:\.[0-9]{1,3})?$|0|0\.[0-9]{1,3}$"
				expressionMessage="${i18n.zhinsr }[0-999999.999）${i18n.zhijdsz }"></t:fieldText>
			<t:fieldText property="fayzq" caption="${i18n.fayzq }"
				expression="^[1-9][0-9]{0,5}(?:\.[0-9]{1,3})?$|0|0\.[0-9]{1,3}$"
				expressionMessage="${i18n.zhinsr }[0-999999.999）${i18n.zhijdsz }"></t:fieldText>
			<t:fieldSelect property="biaos" caption="${i18n.active }" 
			convert="biaos" defaultValue="1" notNull="true"></t:fieldSelect>
		</t:fieldLayout>
	</t:form>

</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	function grid_ckx_gongys_beforeSubmit() {
		$("#gongys_gcbh").fieldValue(trim($("#gongys_gcbh").fieldValue()));
	}
	function gys_biaos_change(){
		if('0'== $("#gys_biaos").fieldValue()){
			$("#gys_biaos").removeClass('disabled');
			$("#gys_biaos input").attr("disabled",false);
		}else{
			$("#gys_biaos").addClass('disabled');
			$("#gys_biaos input").attr("disabled",true);
		}
	}
	function form_gongys_beforeSubmit() {
		var gongsmc = $("#gys_gongsmc").fieldValue();
		var diz = $("#gys_diz").fieldValue();
		var gys_lianxr = $("#gys_lianxr").fieldValue();
		var params = [];	
		params.push(zobj(70,gongsmc,"${i18n.yunssmc }"));		
		params.push(zobj(106,diz,"${i18n.diz }"));
		params.push(zobj(40,gys_lianxr,"${i18n.lianxr }"));		
		return checkAllChina(params);
		
	}
	function func_button_save() {
		$("#grid_ckx_gongys").grid("saveRows");
		// 		$("#grid_ckx_gongys").grid("reload");
	}
	function func_button_edit(){
		$("#form_gongys").form('clear');
		$('#form_gongys').removeClass('operant-add');
		var record = $("#grid_ckx_gongys").grid("getSelectedRecords")[0];
		$("#form_gongys").form('fillRecord', $.extend({}, record));
		$("#form_gongys").form("open","${i18n.update }");
	}
	function func_button_removes() {
		var row = $("#grid_ckx_gongys").grid("getSelectedRecords");
		if (0 < row.length) {
			if ('1' == row[0].biaos) {
				if (confirm("${i18n.quedsx}")) {
					$.sdcui.ajaxUtil.ajax({
						url : "../paicfj/removeCkx_gongys.ajax?usercenter="+row[0].usercenter+"&gcbh="+row[0].gcbh,
// 						data : {
// 							usercenter : row[0].usercenter,
// 							gcbh : row[0].gcbh
// 						},
						success : function() {
							$("#grid_ckx_gongys").grid("reload");
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
	$(document).ready(function() {
		// 			 $("#grid_ckx_shengcx").validate({
		// 				 shengcxbh:{
		// 					 required: true
		// 				 }
		// 			 });

	});
</script>
