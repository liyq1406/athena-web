<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
#grid_ckx_peizbz .youi-fieldLayout table td.contral.label-col { width: 70px; }
 #form_ckx_peizbz .youi-fieldLayout table td.contral.label-col { width: 90px; }
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_peizbz">

		<t:grid id="grid_ckx_peizbz" caption="${i18n.peizbzdy }"
			idKeys="baozzbh" src="/paicfj/queryCkx_peizbz.ajax" 
			scrollHeight="90" clickRowEvent="grid_ckx_peizbz_click"
			dataFormId="form_ckx_peizbz" remove="NOT" load="false" showNum="true">
			<t:fieldLayout id="peizbz" prefix="peizbz" columns="3">
				<t:fieldText property="baozzbh" caption="${i18n.baozzbh }"
					maxLength="6"  dataType="text" />
				<t:fieldText property="baozzmc" caption="${i18n.baozzmc }"
					maxLength="20" />
					<t:fieldSelect property="biaos" caption="${i18n.active }"
					convert="active" defaultValue="1"></t:fieldSelect>
				<t:fieldText property="baozlx"  column="1" caption="${i18n.baozlx }" maxLength="5"
					></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="baozzbh" caption="${i18n.baozzbh }"></t:gridCol>
			<t:gridCol property="baozzmc" caption="${i18n.baozzmc }"></t:gridCol>
			<t:gridCol property="baozbsjs" caption="${i18n.baozbsjs }" width="100"></t:gridCol>
			<t:gridCol property="biaos" caption="${i18n.active }"
				convert="active"></t:gridCol>
			<t:button caption="${i18n.shix }" name="deletes" active="1" icon="removeRecord"></t:button>
		</t:grid>

	<t:grid id="grid_ckx_peizbzbh" idKeys="baozzbh,baozlx"
		caption="${i18n.baohbz }" editModel="false" scrollHeight="90"
		src="/paicfj/queryCkx_peizbzbh.ajax" load="false" submit="NOT"
		reset="NOT" add="NOT" edit="NOT" remove="NOT" showNum="true">
		<t:fieldLayout prefix="peizbzbh" columns="1" showLabel="false">
			<t:fieldHidden property="baozzbh" caption="${i18n.baozzbh }"></t:fieldHidden>
			<t:fieldHidden property="baozlx" caption="${i18n.baozlx }"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="baozlx" caption="${i18n.baozlx }" width="80"></t:gridCol>
		<t:gridCol property="changd" caption="${i18n.changd }"></t:gridCol>
		<t:gridCol property="kuand" caption="${i18n.kuand }"></t:gridCol>
		<t:gridCol property="gaod" caption="${i18n.gaod }"></t:gridCol>
		<t:gridCol property="baozzl" caption="${i18n.baozzl }"></t:gridCol>
		<t:gridCol property="caiz" caption="${i18n.caiz }"></t:gridCol>
		<t:gridCol property="zhedgd" caption="${i18n.zhedgd }"></t:gridCol>
		<t:gridCol property="duidcs" caption="${i18n.duidcs }"></t:gridCol>
	</t:grid>

	<t:form id="form_ckx_peizbz" caption="${i18n.peizbzdy }" dialog="true" reset="NOT" submit="NOT"
		width="670" action="saveCkx_peizbz.ajax" idKeys="baozzbh">
		<t:fieldLayout columns="2" prefix="peizbzf" showLabel="true">
			<t:fieldText property="baozzbh" caption="${i18n.baozzbh }"
				maxLength="6"  dataType="text" notNull="true"></t:fieldText>
			<t:fieldText property="baozzmc" caption="${i18n.baozzmc }"
				></t:fieldText>
			<t:fieldText property="baozbsjs" caption="${i18n.baozbsjs }"
				maxLength="3" dataType="integer" notNull="true"></t:fieldText>
			<t:fieldSelect property="biaos" caption="${i18n.active }"
				convert="active" defaultValue="1" notNull="true"></t:fieldSelect>
			<t:fieldGrid property="peizbzbh" parents="baozzbh" mode="reload"
				width="580" column="2" caption="${i18n.baohbz }">
				<t:grid id="form_grid_ckx_peizbzbh" idKeys="baozzbh,baozlx" panel="false"
					editModel="false" src="/paicfj/queryCkx_peizbzbh.ajax" load="false"
					scrollHeight="150" preSaveRowsEvent="preSaveEvent"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					showNum="true" submit="NOT" reset="NOT" editable="true">
						<t:fieldLayout prefix="peizbzbhForm" columns="1" showLabel="false">
		                	<t:fieldHidden property="baozzbh" caption="${i18n.baozzbh }"></t:fieldHidden>
		                </t:fieldLayout>
					<t:gridCol property="baozlx" caption="${i18n.baozlx }" width="70"
						editor="fieldText" 
						editorOptions="{'notNull':true,'maxLength':'5',closeEvent:func_set_baozbh}"></t:gridCol>
						<t:gridCol property="changd" caption="${i18n.changd }" width="40"></t:gridCol>
						<t:gridCol property="kuand" caption="${i18n.kuand }" width="40"></t:gridCol>
						<t:gridCol property="gaod" caption="${i18n.gaod }" width="40"></t:gridCol>
						<t:gridCol property="baozzl" caption="${i18n.baozzl }" width="40"></t:gridCol>
						<t:gridCol property="caiz" caption="${i18n.caiz }" width="40"></t:gridCol>
						<t:gridCol property="zhedgd" caption="${i18n.zhedgd }" ></t:gridCol>
						<t:gridCol property="duidcs" caption="${i18n.duidcs }" ></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.tij }" name="submit_zdy"></t:button>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['active'] = {
		'0' : '${i18n.wux }',
		'1' : '${i18n.youx }'
	};
	function func_button_edit() {
		$("#form_ckx_peizbz").form('clear');
		$('#form_ckx_peizbz').removeClass('operant-add');
		var record = $("#grid_ckx_peizbz").grid("getSelectedRecords")[0];
		$("#form_ckx_peizbz").form('fillRecord', $.extend({
			peizbzbh : '--'
		}, record));		
		$("#peizbzForm_baozzbh").fieldValue(record.baozzbh);		
		$("#form_ckx_peizbz").form("open","${i18n.update }");
	}
	function peizbzf_biaos_change(){
		if('0'== $("#peizbzf_biaos").fieldValue()){
			$("#peizbzf_biaos").removeClass('disabled');
			$("#peizbzf_biaos input").attr("disabled",false);
		}else{
			$("#peizbzf_biaos").addClass('disabled');
			$("#peizbzf_biaos input").attr("disabled",true);
		}
	}
	function func_set_baozbh(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var baozlxIndex = $('td.baozlx:first').prevAll().length;
		
		var changdIndex = $('td.changd:first').prevAll().length;
		var kuandIndex = $('td.kuand:first').prevAll().length;
		var gaodIndex = $('td.gaod:first').prevAll().length;
		var baozzlIndex = $('td.baozzl:first').prevAll().length;
		var caizIndex = $('td.caiz:first').prevAll().length;
		var zhedgdIndex = $('td.zhedgd:first').prevAll().length;
		var duidcsIndex = $('td.duidcs:first').prevAll().length;

		var baozlx = rowElement.find('td:eq('+baozlxIndex+')').text();
		if(undefined == baozlx || "" == baozlx){
			alert("${i18n.qingsrbzbh}");return;
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/xuqjs/getBaoz.ajax?baozlx="+baozlx+"&biaos=1",
			success : function(result) {
				var object = result.result;
				if(null != object){					
					rowElement.find('td:eq('+changdIndex+')').text(object.changd);
					rowElement.find('td:eq('+kuandIndex+')').text(object.kuand);
					rowElement.find('td:eq('+gaodIndex+')').text(object.gaod);
					rowElement.find('td:eq('+baozzlIndex+')').text(object.baozzl);
					rowElement.find('td:eq('+caizIndex+')').text(object.caiz);
					rowElement.find('td:eq('+zhedgdIndex+')').text(object.zhedgd);
					rowElement.find('td:eq('+duidcsIndex+')').text(object.duidcs);
				} else {
					alert("${i18n.baozbzbczbh}");
				}
			}
		});
	}
	function grid_ckx_peizbz_beforeSubmit() {
		if("" != $("#peizbz_baozlx").fieldValue()){
			$("#peizbz_baozzbh").fieldValue("");
			$("#peizbz_baozzmc").fieldValue("");
			$('#grid_ckx_peizbzbh').parent().parent().show();
			$("#peizbzbh_baozlx").fieldValue($("#peizbz_baozlx").fieldValue());
			$('#grid_ckx_peizbzbh').grid('reload');
		}else{
			$("#peizbz_baozzbh")
			.fieldValue(trim($("#peizbz_baozzbh").fieldValue()));
			$("#peizbz_baozzmc")
			.fieldValue(trim($("#peizbz_baozzmc").fieldValue()));
		}
		
		
	}
	function grid_ckx_peizbz_click(record, rowIndex) {
		// 		var record=$("#grid_ckx_peizbz").grid("getSelectedRecords")[0];
// 		$("#from_ckx_peizbzbh").form('clear');
// 		$("#from_ckx_peizbzbh").form('fillRecord', $.extend({
// 			peizbzbh : '--'
// 		}, record));
		$("#peizbzbh_baozzbh").fieldValue(trim(record.baozzbh));
// 		$("#grid_ckx_peizbzbh").grid("reload");
		$('#grid_ckx_peizbzbh').grid('reload',false,[],true);
		$('#grid_ckx_peizbzbh').parent().parent().show();
	}
	function func_button_deletes() {
		var row = $("#grid_ckx_peizbz").grid("getSelectedRecords");
		if (0 < row.length) {
			if ('1' == row[0].biaos) {

				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/paicfj/list_zb.ajax?baozzbh="+row[0].baozzbh,
// 					data : {
// 						baozzbh : row[0].baozzbh
// 					},
					success : function(result) {
						if(0 ==  result.result.length  ){
							if(confirm("${i18n.niqdysx}")){
								$.sdcui.ajaxUtil.ajax({
									url : "${ctx}/paicfj/removeCkx_peizbz.ajax?baozzbh="+row[0].baozzbh,
// 									data : {
// 										baozzbh : row[0].baozzbh
// 									},
									success : function() {
										$("#grid_ckx_peizbz").grid("reload");
									}
								});
							}
						} else {
							alert("${i18n.shujbnsx}");
						}
					}
				});
			} else {
				alert("${i18n.shujysx}");
			}
		} else {
			alert("${i18n.qingxxzyhsj}");
		}
	}
	
	function func_button_submit_zdy() {		
// 		if($('#form_chanxz').form('validate')!=true){
// 			return false;
// 		}
		var peizbzf_baozzmc = $("#peizbzf_baozzmc").fieldValue();
		var params = [];			
		params.push(zobj(40,peizbzf_baozzmc,"${i18n.baozzmc }"));		
		if(!checkAllChina(params))return false;
		if($("#form_grid_ckx_peizbzbh").grid("isEditedCell")){
			$("#form_grid_ckx_peizbzbh").grid("saveRows");
		}else{			
			$('#form_ckx_peizbz').form('submit');
		}	
	}
	function preSaveEvent(){		
		$('#form_ckx_peizbz').form('submit');
		return false;
	}
	function initPage(){
		//查询页面子表隐藏
		$('#grid_ckx_peizbzbh').parent().parent().hide();
	}
</script>
