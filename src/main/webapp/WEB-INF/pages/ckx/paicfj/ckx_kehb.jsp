<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.paicfj.i18n_keh">

		<t:grid id="grid_ckx_kehb" caption="${i18n.kehb }" idKeys="kehbh"
			src="/paicfj/queryCkx_kehb.ajax" dataFormId="form_kehb" remove="NOT"
			load="false" removeSrc="/paicfj/removeCkx_kehb.ajax" showNum="true">
			<t:fieldLayout id="kehbs" prefix="khbs" columns="2">
				<t:fieldText property="kehbh" caption="${i18n.kehbh }" maxLength="6" dataType="text"/>
				<t:fieldText property="kehmc" caption="${i18n.kehmc }" maxLength="20"/>
				<t:fieldSelect property="kehxz" caption="${i18n.kehxz }"
					convert="kehxz"  />
				<t:fieldSelect property="biaos" caption="${i18n.active }"
					convert="biaos" defaultValue="1" />
			</t:fieldLayout>
			<t:gridCol property="kehbh" caption="${i18n.kehbh }" width="70"></t:gridCol>
			<t:gridCol property="kehmc" caption="${i18n.kehmc }" width="70"></t:gridCol>
			<t:gridCol property="kehxz" caption="${i18n.kehxz }" width="70" convert="kehxz"></t:gridCol>
			<t:gridCol property="lianxr" caption="${i18n.lianxr }" width="70"></t:gridCol>
			<t:gridCol property="diz" caption="${i18n.diz }" width="70"></t:gridCol>
			<t:gridCol property="youzbh" caption="${i18n.youb }" width="70" ></t:gridCol>
			<t:gridCol property="dianh" caption="${i18n.dianh }" width="70"></t:gridCol>
			<t:gridCol property="chuanz" caption="${i18n.chuanz }" width="70"></t:gridCol>
			<t:gridCol property="beiz" caption="${i18n.beiz }" width="70"></t:gridCol>
			<t:gridCol property="biaos" caption="${i18n.active }" width="70" convert="biaos"></t:gridCol>
			<t:button caption="${i18n.shix }" name="deletes" active="1" icon="removeRecord"/>
		</t:grid>


	<t:form dialog="true" caption="${i18n.kehb }" id="form_kehb" idKeys="kehbh"
		action="/paicfj/saveCkx_kehb.ajax" height="200" width="600" reset="NOT">
		<t:fieldLayout prefix="kehbf" columns="2">
			<t:fieldText property="kehbh" caption="${i18n.kehbh }" notNull="true"
				maxLength="10"  dataType="text" />
			<t:fieldText property="kehmc" caption="${i18n.kehmc }" />
			<t:fieldSelect property="kehxz" caption="${i18n.kehxz }"
				convert="kehxz" notNull="true" />
			<t:fieldText property="lianxr" caption="${i18n.lianxr }"
				 />
			<t:fieldText property="diz" caption="${i18n.diz }"  />
			<t:fieldText property="youzbh" caption="ISO" maxLength="20"
				/>
			<t:fieldText property="dianh" caption="${i18n.dianh }" maxLength="20"
				 />
			<t:fieldText property="DUNS" caption="${i18n.chuanz }"
				/>
			<t:fieldArea property="beiz" caption="${i18n.beiz }" />
			<t:fieldSelect property="biaos" caption="${i18n.active }"
				convert="biaos" defaultValue="1"  notNull="true"/>
		</t:fieldLayout>
	</t:form>

</t:page>  
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['kehxz'] = {
		'0' : '${i18n.neib }',
		'1' : '${i18n.waib }'
	};
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'0' : '${i18n.wux }',
		'1' : '${i18n.youx }'
	};
	function func_button_deletes() {
		var record = $('#grid_ckx_kehb').grid('getSelectedRecords');
		if (record.length > 0) {
			if (record[0].biaos == '1') {
				if(confirm("${i18n.niqdysx }")){
					$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/paicfj/removeCkx_kehb.ajax?kehbh="+record[0].kehbh,
// 						data : {
// 							kehbh : record[0].kehbh
// 						},
						success : function() {
							$("#grid_ckx_kehb").grid("reload");
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

	function form_kehb_beforeSubmit() {
		var kehmc = trim($("#kehbf_kehmc").fieldValue());
		var lianxr = trim($("#kehbf_lianxr").fieldValue());
		var diz = trim($("#kehbf_diz").fieldValue());
		var beiz = trim($("#kehbf_beiz").fieldValue());
		var params = [];	
		params.push(zobj(40,kehmc,"${i18n.kehmc }"));
		params.push(zobj(40,lianxr,"${i18n.lianxr }"));
		params.push(zobj(106,diz,"${i18n.diz }"));
		params.push(zobj(100,beiz,"${i18n.beiz }"));
		return checkAllChina(params);
	}
	function kehbf_biaos_change(){
		if('0'== $("#kehbf_biaos").fieldValue()){
			$("#kehbf_biaos").removeClass('disabled');
			$("#kehbf_biaos input").attr("disabled",false);
		}else{
			$("#kehbf_biaos").addClass('disabled');
			$("#kehbf_biaos input").attr("disabled",true);
		}
	}
	function func_button_edit() {
		$("#form_kehb").form('clear');
		$('#form_kehb').removeClass('operant-add');
		var record = $("#grid_ckx_kehb").grid("getSelectedRecords")[0];
		$('#form_kehb').form('fillRecord', $.extend({}, record));
		$("#form_kehb").form("open","${i18n.update }");
		// 		var row=$("#kehb_active").find("input[name='active']")[0];

	}
	
</script>
