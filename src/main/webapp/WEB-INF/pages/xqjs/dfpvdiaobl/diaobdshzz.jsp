<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.diaobdzz}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<script type="text/javascript">
		$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();0
	
	           $('body div.layout-panel.panel-south').remove(); 
	           
	       });
		</script>
</head>
<t:page i18n="i18n.xqjs.diaobl.verifyzz">
	<t:panel id="zzpanel">
		<table align="center">
			<tr>
				<td align="center">${i18n.lbjdbsqd}${diaobsqdh}</td>
			</tr>
			<tr>
				<td align="center">${i18n.sj}:${diaobsqsj}</td>
			</tr>
		</table>	
			
				<t:grid id="grid_diaobsqmx" caption="${i18n.diaobsqmx}"
						idKeys="usercenter,diaobsqdh,lingjbh,lux,edit_time,editor"
						 usePager="true" dataFormId="form_dbd"
						 src="/dfpvdiaobl/searchZzDiaobSqMx.ajax" showNum="true"
						clickRowEvent="diaobsqmx_click" add="NOT" edit="NOT" remove="NOT" back="NOT"
						multiple="true" selectRowEvent="xqjsrowSelect"
						scrollHeight="155" >
						<t:fieldLayout>
							<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="20" width="150"></t:fieldText>
							<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt}" convert="queryDblZZzt" width="150"></t:fieldSelect>
							<t:fieldHidden property="diaobsqdh"></t:fieldHidden>
							<t:fieldHidden property="usercenter"></t:fieldHidden>
							
							<t:fieldHidden property="leix"></t:fieldHidden>
							
						</t:fieldLayout>
						<t:gridCol property="chkbox"  renderer="createChkbox"  caption="选择"></t:gridCol>
						<t:gridCol property="lux" caption="${i18n.lux}"></t:gridCol>
						<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
						<t:gridCol property="lingjmc" caption="${i18n.lingjmc}"></t:gridCol>
						<t:gridCol property="zhuangt" caption="${i18n.zhuangt}"  convert="queryDblzt"></t:gridCol>
						<t:gridCol property="shenbsl" caption="${i18n.shenbsl}"></t:gridCol>
						<t:gridCol property="shipsl" caption="${i18n.shipsl}"></t:gridCol>
						<t:gridCol property="zhixsl" caption="${i18n.zhixsl}"></t:gridCol>
						<t:gridCol property="zhixbfb" caption="${i18n.zhixbfb}"></t:gridCol>
						<t:gridCol property="yaohsj" caption="${i18n.yaohsj}"></t:gridCol>
						<t:gridCol property="jihy" caption="${i18n.jihy}"></t:gridCol>
					</t:grid>
		
					<div class="youi-buttons">
						<table>
							<tr>
								<td><div class="youi-button active-0" id="button_ljzz">
										<div class="right" style="width: 75px">
											<div class="center">
												<a onclick="ljzz()">${i18n.lingj_zz}</a>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
                    <t:form id="form_dbd" submit="NOT" reset="NOT">
								<t:grid idKeys="lingjbh,usercenter,diaobdh" id="grid_diaobdmx"
									caption="${i18n.diaobdmx}" submit="NOT" reset="NOT"
									usePager="true" load="false" showNum="true" back="NOT"
									src="/dfpvdiaobl/searchZzDiaobdMx.ajax" add="NOT" edit="NOT"
									remove="NOT" scrollHeight="155">
									<t:fieldLayout id="layout" prefix="record">
										<t:fieldHidden property="usercenter"></t:fieldHidden>
										<t:fieldHidden property="diaobsqdh"></t:fieldHidden>
										<t:fieldHidden property="lingjbh"></t:fieldHidden>
										<t:fieldHidden property="lux"></t:fieldHidden>
										<t:fieldHidden property="editor"></t:fieldHidden>
										<t:fieldHidden property="edit_time"></t:fieldHidden>
										<t:fieldHidden property="zhuangt"></t:fieldHidden>
										<t:fieldHidden property="shenbsl"></t:fieldHidden>
									</t:fieldLayout>
									
									<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"></t:gridCol>
									<t:gridCol property="diaobdh" caption="${i18n.diaobdh}"></t:gridCol>
									<t:gridCol property="zickbh" caption="${i18n.zickbh}"></t:gridCol>
									<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
									<t:gridCol property="lingjmc" caption="${i18n.lingjmc}"></t:gridCol>
									<t:gridCol property="kucsl" caption="${i18n.lingjsl}"></t:gridCol>
									<t:gridCol property="uclx" caption="${i18n.uclx}"></t:gridCol>
									<t:gridCol property="ucrl" caption="${i18n.ucrl}"></t:gridCol>
									<t:gridCol property="shipsl" caption="${i18n.shipsl}"></t:gridCol>
									<t:gridCol property="zhixsl" caption="${i18n.zhixsl}"></t:gridCol>
									<t:gridCol property="zhixbfb" caption="${i18n.zhixbfb}"></t:gridCol>
									<t:gridCol property="zhuangt" caption="${i18n.zhuangt}" convert="queryDblzt" ></t:gridCol>
									<t:gridCol property="shengxsj" caption="${i18n.shengxsj}"></t:gridCol>
									<t:gridCol  width="100" convert="shif"
										property="shifdbz" caption="${i18n.shifdbz}"></t:gridCol>
								</t:grid>
					</t:form> <input id="sqdh" type="hidden" value="${diaobsqdh}"> 
					<input id="usercenter" type="hidden" value="${usercenter}">

					<div class="youi-buttons">
						<table>
							<tr>
							<!--  去掉按零件仓库终止的方式 DFPV只有一个仓库
								<td><div class="youi-button active-0" id="button_ljckzz">
										<div class="right" style="width: 105px">
											<div class="center">
												<a onclick="ljckzz()">${i18n.cangk_zz}</a>
											</div>
										</div>
									</div>
								</td>
							 -->
								<!-- <td><div class="youi-button active-0">
								<div class="right" style="width: 40px">
										<div class="center">
												<a onclick="sxprint()">打印</a>
										</div>
									</div>
								</div>
							</td> -->
							</tr>
						</table>
					</div>
	</t:panel>
	<form id="printform" name="printform" method="post"
		style="display: none;">
		<div>
			<input type="text" id="justDoPrint" name="justDoPrint" value="" />
			<!-- 立即预览打印 -->
			<input type="text" id="billcode" name="billcode" value="" />
			<!-- 单据号（唯一标识单据，用作打印历史维护） -->
			<input type="text" id="jsondataprovider" name="jsondataprovider"
				value="" />
			<!-- 自定义封装的json字符串 -->
			<input type="text" id="selectedid" name="selectedid" value="" />
			<!-- 选择数据表格时的多选id -->
			<input type="text" id="clazzparams" name="clazzparams" value="" />
			<!-- 配置为clazz时传递的json形式参数 -->
			<input type="text" id="templatecode" name="templatecode" value="" />
			<!-- 直接预览（打印）不进行模板选择时使用 -->
		</div>
	</form>
 <input id="removeId" value="${removeId}" type="hidden"/>  
</t:page>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['shif'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};

	
		//返回
		function back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		}
	
	 /**
	*列渲染事件,创建checkbox	
	*/
	function createChkbox(){
		return "<input  name='chkbox'   type='checkbox'  />";
	}
	
	function  xqjsrowSelect(selectedIds,rowtr,selectedrecords,selectedrecord,cell,cols){
	       /* if($(cell[0]).attr('type')!='radio')
	           $(rowtr).find('input[type="radio"]').attr("checked","checked");*/
	    if($(cell[0]).attr('type')=='checkbox'){
			return true;
		}   
	    return false;
	}
	
	/**
	 *调拨申请明细列表改变事件
	 */
	function diaobsqmx_click(record, rowIndex) {
		//调拨申请明细列表改变,将数据填充到调拨单明细列表 
		$('#form_dbd').form('fillRecord', record);
		//刷新调拨单明细列表
		$('#grid_diaobdmx').grid('reload');
	}

	/**
	 *按零件终止
	 */
	function ljzz() {
		 /* var param = $('#grid_diaobsqmx').grid('getSelectedRecords');*/
		 var param = $('#grid_diaobsqmx').grid('getRecords');
		//按照调拨申请单 终止全部零件
		
		var length = param.length;
		//alert(length);
		if (length == 0) {
			alert('${i18n.js_sqmx}!');
			return false;
		}
		
		if (!confirm( "该操作将终止该调拨申请单下面的所有零件，是否确认？" )) {
			return false;
		} 
		
		var params = [];
		for ( var i = 0; i < param.length; i++) {
				
			if(param[i].leix=="1" && (param[i].zhuangt=="50"||param[i].zhuangt=="70" ) ){
				alert("DFPV类型的调拨申请已执行或者已完成，无法终止!");
				return false;
			}
		
			params.push('edit[' + i + '].lingjbh=' + param[i].lingjbh);
			params.push('edit[' + i + '].lux=' + param[i].lux);
			params.push('edit[' + i + '].diaobsqdh=' + $('#sqdh').val());
			params.push('edit[' + i + '].diaobdh=' + param[i].diaobdh);
			params.push('edit[' + i + '].usercenter=' + $('#usercenter').val());
		}

		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/ljzz.ajax",//请求url
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
			}
		});
	}

	/**
	 *按零件仓库终止
	 */
	function ljckzz() {
		var lux = $('#record_lux').fieldValue();//零件号
		var lingjbh = $('#record_lingjbh').fieldValue();//零件号
		//var param = $('#grid_diaobdmx').grid('getSelectedRecords');
		//按照调拨申请单 终止全部零件
		var param = $('#grid_diaobdmx').grid('getRecords');
		
		 
		var length = param.length;
		if (length == 0) {
			alert('${i18n.js_dbmx}!');
			return false;
		}
		
		if (!confirm( "该操作将终止该调拨申请单下面的所有零件，是否确认？" )) {
			return false;
		} 
		
		var params = [];
		for ( var i = 0; i < param.length; i++) {
		
			if(param[i].leix=="1" && (param[i].zhuangt=="50"||param[i].zhuangt=="70" ) ){
				alert("此类型的调拨申请已执行或者已完成，无法终止!");
				return false;
			}
			
			params.push('edit[' + i + '].cangkbh=' + param[i].cangkbh);
			params.push('edit[' + i + '].lux=' + lux);
			params.push('edit[' + i + '].lingjbh=' + lingjbh);
			params.push('edit[' + i + '].diaobsqdh=' + $('#sqdh').val());
			params.push('edit[' + i + '].diaobdh=' + param[i].diaobdh);
			params.push('edit[' + i + '].usercenter=' + $('#usercenter').val());
			params.push('edit[' + i + '].zhuangt=' + param[i].zhuangt);
		}
		var dataStr = params.join('&');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/ljckzz.ajax",//请求url
			data : dataStr,
			success : function(result) {
				alert(result.result);
				$('#grid_diaobdmx').grid('reload');
			}
		});
	}
	
	
	/*
	 *打印
	 */
	function sxprint() {
		var diaobsqdh = $('#sqdh').val();//申请单号
		var usercenter = $('#usercenter').val();//用户中心
		var params = [];
		params.push("dbsq.diaobsqdh=" + diaobsqdh);
		params.push("dbsq.usercenter=" + usercenter);
		$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/dfpvdiaobl/sxprint.ajax",//请求url
					data : "usercenter=" + usercenter + "&diaobsqdh="
								+ diaobsqdh,
					success : function(result) {
					var jsondata = result.json;
					print(jsondata);
					window.close();
					window.opener.gridReload();
					}
		});
	}

	//打印
	function print(jsondata) {
		var templatecode = "DIAOBSXDY";
		var jsondata = jsondata;
		var selectedid = null;
		var clazzparams = null;
		var billcode = "BILLKEY";
		doprint_view(templatecode, jsondata, selectedid, clazzparams, billcode);

	}
	//打印预览，数据传递		
	function doprint_view(templatecode, jsondata, selectedid, clazzparams,
			billcode) {
		document.getElementsByName("jsondataprovider")[0].value = jsondata;
		document.getElementsByName("selectedid")[0].value = selectedid;
		document.getElementsByName("clazzparams")[0].value = clazzparams;
		document.getElementsByName("billcode")[0].value = billcode;
		document.getElementsByName("templatecode")[0].value = templatecode;
		document.getElementsByName("justDoPrint")[0].value = "false";
		var fm = document.getElementById("printform");
		fm.action = "${ctx}/webprint/print_doit.jsp";
		fm.target = "_blank";
		fm.submit();
	}
	
	
	
</script>
</t:html>