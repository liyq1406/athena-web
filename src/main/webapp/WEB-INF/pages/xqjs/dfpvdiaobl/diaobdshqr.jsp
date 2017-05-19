<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.diaobd_verify}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	$(function() {

		$('body div.layout-panel.panel-north').remove();

		$('body td.td-west').remove();

		$('body div.layout-panel.panel-south').remove();

	});
</script>
</head>
<t:page i18n="i18n.xqjs.diaobl.verifyzz">
	<t:panel id="panelA">
		<table align="center">
			<tr>
				<td align="center">${i18n.lbjdbsqd}${diaobsqdh}</td>
			</tr>
			<tr>
				<td align="center">${i18n.sj}:${diaobsqsj}</td>
			</tr>
			<tr>
		</table>
		<t:grid id="grid_diaobsqmx" caption="${i18n.diaobsqmx}"
			idKeys="usercenter,diaobsqdh,lingjbh,lux,edit_time,editor"
			scrollHeight="170" usePager="true"
			dataFormId="form_dbd" showNum="true" selectRowEvent="xqjsrowSelect"
			src="/dfpvdiaobl/searchDiaobSqMx.ajax" afterParse="firstLoad"  
			add="NOT" edit="NOT" remove="NOT" back="NOT">
			<t:fieldLayout >
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="20" width="150"></t:fieldText>
				<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt}" convert="queryDblShzt" width="150"></t:fieldSelect>
				<t:fieldHidden property="sh" defaultValue="40"></t:fieldHidden>
				<t:fieldHidden property="diaobsqdh"></t:fieldHidden>
				<t:fieldHidden property="usercenter"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="rad" caption="${i18n.xuanz}"
				renderer="createRadio"></t:gridCol>
			<t:gridCol property="lux" caption="${i18n.lux}"></t:gridCol>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
			<t:gridCol property="lingjmc" caption="${i18n.lingjmc}"></t:gridCol>
			<t:gridCol property="shenbsl" caption="${i18n.shenbsl}"></t:gridCol>
			<t:gridCol property="shipsl" caption="${i18n.shipsl}"></t:gridCol>
			<t:gridCol property="yaohsj" caption="${i18n.yaohsj}"></t:gridCol>
			<t:gridCol property="zhuangt" caption="${i18n.zhuangt}"
				convert="tongy"></t:gridCol>
			<t:gridCol property="jihy" caption="${i18n.jihy}"></t:gridCol>
		</t:grid>

		<t:form id="form_dbd" submit="NOT" reset="NOT">
			<t:grid idKeys="lingjbh,lux,usercenter,cangkbh" id="grid_diaobdmx"
				caption="${i18n.diaobdmx}" submit="NOT" reset="NOT" showNum="true"
				usePager="true" load="false" src="/dfpvdiaobl/searchDiaobdMx.ajax"
				back="NOT" add="NOT" edit="NOT" remove="NOT" scrollHeight="140"
				editable="true" save="NOT" insertAlias="dbmx" afterParse="shipsl_onload"
				showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
				<t:fieldLayout prefix="dbmx">
					<t:fieldHidden property="usercenter"></t:fieldHidden>
					<t:fieldHidden property="diaobsqdh"></t:fieldHidden>
					<t:fieldHidden property="lingjbh"></t:fieldHidden>
					<t:fieldHidden property="lux"></t:fieldHidden>
					<t:fieldHidden property="editor"></t:fieldHidden>
					<t:fieldHidden property="edit_time"></t:fieldHidden>
					<t:fieldHidden property="zhuangt"></t:fieldHidden>
					<t:fieldHidden property="shenbsl"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" editor="fieldText" editorOptions="{closeEvent:func_set_lingjh}"></t:gridCol>
				<t:gridCol property="zickbh" caption="${i18n.zickbh}" editor="fieldText" ></t:gridCol>
				<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" ></t:gridCol>
				<t:gridCol property="lingjmc" caption="${i18n.lingjmc}"></t:gridCol>
				<t:gridCol property="kucsl" caption="${i18n.lingjsl}"
					editor="fieldText"
					editorOptions="{'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"></t:gridCol>
				<t:gridCol property="uclx" caption="${i18n.uclx}" editor="fieldText" editorOptions="{'minLength':'1','maxLength':'5','dataType':'text','notNull':true,'dataType':'text'}"></t:gridCol>
				<t:gridCol property="ucrl" caption="${i18n.ucrl}" editor="fieldText"></t:gridCol>
				<t:gridCol editor="fieldText" property="shipsl"
					editorOptions="{closeEvent:shipsl_edit,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"
					caption="${i18n.shipsl}"></t:gridCol>
				<t:gridCol editor="fieldCalendar"
					editorOptions="{'format':'yyyy-MM-dd'}" property="shengxsj"
					caption="${i18n.shengxsj}"></t:gridCol>
				<t:gridCol editor="fieldSelect" width="100" convert="shif"
					property="shifdbz" caption="${i18n.shifdbz}"
					editorOptions="{'notNull':true}" defaultValue="0"></t:gridCol>
				<t:gridCol property="aaa" caption=""></t:gridCol>
			</t:grid>
		</t:form> 
				允许多次交付:
				<input type="radio" name="jf" value="0" checked="checked">N
				<div id="field_beiz" class="youi-field fieldText"
			style="width: 300px;">
			${i18n.beiz}: <input class="textInput value" type="text" id="beiz"
				style="width: 184px;" name="beiz">
		</div>
		<input id="sqdh" type="hidden" value="${diaobsqdh}">
		<input id="usercenter" type="hidden" value="${usercenter}">

		<div class="youi-buttons">
			<table>
				<tr>
					<td><div class="youi-button active-0" id="button_tongy" >
							<div class="right" style="width: 40px">
								<div class="center">
									<a onclick="tongy()">${i18n.agree}</a>
								</div>
							</div>
						</div>
					</td>
					<!--  		<td><div class="youi-button active-0">
									<div class="right" style="width: 40px">
										<div class="center">
											<a onclick="juj()">${i18n.refuse}</a>
										</div>
									</div>
								</div>
							</td>
					<td><div class="youi-button active-0">
							<div class="right" style="width: 75px">
								<div class="center">
									<a onclick="shengx()">${i18n.sxprint}</a>
								</div>
							</div>
						</div>
					</td>-->
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

	<input id="removeId" value="${removeId}" type="hidden" />
</t:page>
<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['shif'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};
	$.sdcui.serverConfig.convertArray['tongy'] = {
		'00' : '${i18n.notVerify}',
		'20' : '${i18n.yVerify}'
	};

	//返回
	function back() {
		history.back();
		//window.history.go(-1);
		//window.history.forward();

	}
	var firstLoad = function() {
		var rowtr = $('#grid_diaobsqmx .grid-content .grid-scroll .row-contral').next('tr');
		$('#grid_diaobsqmx').grid('select',rowtr, true, {target:$(rowtr).find('td')[0]});
		//$('#grid_diaobsqmx .grid-content .grid-fixed tr:first').next('tr').addClass('selected');
		
		//$('#grid_diaobsqmx .grid-content .grid-scroll .row-contral').next('tr').find('input[type="radio"]').attr("checked", "checked");
	}
	/**
	 *列渲染事件,创建radio	
	 */
	function createRadio() {
		return "<input  name='rad'   type='radio'  />";
	}

	function xqjsrowSelect(selectedIds, rowtr, selectedrecords, selectedrecord,
			cell, cols) {
		if ($(cell[0]).attr('type') != 'radio') {
			$(rowtr).find('input[type="radio"]').attr("checked", "checked");
		}
		if(selectedrecords[0] != null){
			var lingjbh = selectedrecords[0].lingjbh;
			var lux = selectedrecords[0].lux;
			
			var sqmxRow = $("#grid_diaobsqmx").find(
				'div.grid-scroll tr[id*="' + lingjbh + ',' + lux + '"]');
			//给调拨申请明细实批数量赋值
			var sqrow = sqmxRow[0];
			var zhuangt = $(sqrow).find('td:eq(7)').attr("value");
			if(zhuangt == '00'){
				$(sqrow).find('td:eq(5)').text('0');
			}
		}
	
		diaobsqmx_click(selectedrecord);
		return true;
	}

function func_set_lingjh() {
		var dbsqmx = $('#grid_diaobsqmx').grid('getSelectedRecords');
		if (dbsqmx.length == 0) {
			alert("${i18n.js_sqmx}");
			return false;
		}
		var usercenter = dbsqmx[0].usercenter, lingjbh = dbsqmx[0].lingjbh, lux = dbsqmx[0].lux, lingjmc = dbsqmx[0].lingjmc;
		var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		rowElement.attr("id", "" + lingjbh + "," + lux + "," + usercenter);
				lingjbhIndex = $('td.lingjbh:first').prevAll().length,
				cangkbhIndex = $('td.cangkbh:first').prevAll().length,
				lingjmcIndex = $('td.lingjmc:first').prevAll().length,
				kucslIndex = $('td.kucsl:first').prevAll().length,
				
				zickbhIndex = $('td.zickbh:first').prevAll().length,
				uclxIndex = $('td.uclx:first').prevAll().length, ucrlIndex = $(
						'td.ucrl:first').prevAll().length, rowElement.find(
						'td:eq(' + lingjbhIndex + ')').text(lingjbh);
		rowElement.find('td:eq(' + lingjmcIndex + ')').text(lingjmc);

		var cangkbh = this.col.cell.text();
		
		var row = rowElement.prevAll().length;
		var gongysdmCl = $('td.gongysdm:first').prevAll().length;
		var gysColomn = parseInt(gongysdmCl) + 1;
		if (cangkbh == "") {
			alert("${i18n.cangkNotNull}");
			return;
		}
		
			$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/getKcsl.ajax",
			data : 'usercenter=' + usercenter + '&lingjbh=' + lingjbh
					+ '&cangkbh=' + cangkbh,
			success : function(result) {
			
				var msg = result.result;
				if (msg == null) {
					alert("${i18n.cangkError}");
				} else {
					rowElement.find('td:eq(' + zickbhIndex + ')').text(msg.zickbh);
					rowElement.find('td:eq(' + kucslIndex + ')').text(msg.kucsl);

					$('td.cangkbh:first').removeClass("validate-error");

				}
			}
		});
		
		 
	}
	
	function func_set_cangkbh() {
		var dbsqmx = $('#grid_diaobsqmx').grid('getSelectedRecords');
		if (dbsqmx.length == 0) {
			alert("${i18n.js_sqmx}");
			return false;
		}
		var usercenter = dbsqmx[0].usercenter, lingjbh = dbsqmx[0].lingjbh, lux = dbsqmx[0].lux, lingjmc = dbsqmx[0].lingjmc;
		var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		rowElement.attr("id", "" + lingjbh + "," + lux + "," + usercenter);
		lingjbhIndex = $('td.lingjbh:first').prevAll().length,
				cangkbhIndex = $('td.cangkbh:first').prevAll().length,
				lingjmcIndex = $('td.lingjmc:first').prevAll().length,
				zickbhIndex = $('td.zickbh:first').prevAll().length,
				uclxIndex = $('td.uclx:first').prevAll().length, ucrlIndex = $(
						'td.ucrl:first').prevAll().length, rowElement.find(
						'td:eq(' + lingjbhIndex + ')').text(lingjbh);
		rowElement.find('td:eq(' + lingjmcIndex + ')').text(lingjmc);

		var cangkbh = this.col.cell.text();
		var row = rowElement.prevAll().length;
		var gongysdmCl = $('td.gongysdm:first').prevAll().length;
		var gysColomn = parseInt(gongysdmCl) + 1;
		if (cangkbh == "") {
			alert("${i18n.cangkNotNull}");
			return;
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/getLjck.ajax",
			data : 'usercenter=' + usercenter + '&lingjbh=' + lingjbh
					+ '&cangkbh=' + cangkbh,
			success : function(result) {
				var msg = result.result;
				if (msg == null) {
					alert("${i18n.cangkError}");
					$('td.cangkbh:first').addClass("validate-error").attr(
							"title",
							"${i18n.di}" + row + "${i18n.row}," + "${i18n.di}"
									+ gysColomn + "${i18n.col}"
									+ "${i18n.cangkError}");
				} else {
					rowElement.find('td:eq(' + zickbhIndex + ')').text(
							msg.zickbh);
					rowElement.find('td:eq(' + uclxIndex + ')').text(msg.uclx);
					rowElement.find('td:eq(' + ucrlIndex + ')').text(msg.ucrl);

					$('td.cangkbh:first').removeClass("validate-error");

				}
			}
		});

	}

	/**
	 *列渲染事件,创建checkbox
	 */
	function createCheckBox() {
		return "<input id='jf' type='checkBox' value='1'/>";
	}

	function reload_diaobsqmx() {
		var diaobsqdh = $('#sqdh').val();//申请单号
		var usercenter = $('#usercenter').val();//用户中心
		var obj = {};
		obj.diaobsqdh = diaobsqdh;
		obj.usercentter = usercenter;
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url : '/dfpvdiaobl/initDiaobSqMx.do',//url
			record : obj,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		/* event.stopPropagation();//阻止事件冒泡
		return false; */

	}
	/**
	 *调拨申请明细列表改变事件
	 */
	function diaobsqmx_click(record, rowIndex) {
		//调拨申请明细列表改变,将数据填充到调拨单明细列表 
		$('#form_dbd').form('fillRecord', $.extend({
			dbmx : '--'
		}, record));
		//刷新调拨单明细列表
		$('#grid_diaobdmx').grid('reload');
	}
	/**
	 *实批数量关闭编辑事件
	 */
	function shipsl_edit() {
		var value = this.col.cell.text();
		var lingjbh = $('#dbmx_lingjbh').fieldValue();//零件号
		var lux = $('#dbmx_lux').fieldValue();//路线
		var dbmxRow = $("#grid_diaobdmx").find(
				'tr[id*="' + lingjbh + ',' + lux + '"]');
		var shipsl = 0;
		$.each(dbmxRow, function(i, n) {
			sl = $(n).find('td:eq(7)').text();
			sl = sl === "" ? 0 : sl;
			shipsl += parseInt(sl);

		})
		//alert(shipsl);
		var sqmxRow = $("#grid_diaobsqmx").find(
				'div.grid-scroll tr[id*="' + lingjbh + ',' + lux + '"]');
		//给调拨申请明细实批数量赋值
		var sqrow = sqmxRow[0];
		shipsl = shipsl.toString();
		var sqingsl = $(sqrow).find('td:eq(4)').text();
		var zhuangt = $(sqrow).find('td:eq(7)').attr("value");
		if(zhuangt == '00'){
			$(sqrow).find('td:eq(5)').text(shipsl);
		}
	}
	/**
	 *同意按钮提交事件
	 */
	function tongy() {
		$('#grid_diaobdmx').grid('triggerCloseEdited');
		var dbsqmx = $('#grid_diaobsqmx').grid('getSelectedRecords');
		var error = $('#grid_diaobdmx').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		if (dbsqmx.length > 1) {
			alert('${i18n.js_only}!');
			return false;
		} else if (dbsqmx.length == 0) {
			alert('${i18n.js_selected}!');
			return false;
		} else if (dbsqmx[0].shipsl != ""
				&& parseInt(dbsqmx[0].shipsl) > parseInt(dbsqmx[0].shenbsl)) {
			alert("${i18n.spslNotdysbsl}");
			return false;
		}
		if (dbsqmx[0].shipsl == 0 && !confirm("${i18n.spslwlqqr}")) {
			return false;
		}

		var validate = [];
		var obj = {};
		var jf1;
		//if ($('input[name="jf"]')[1].checked) {
		//	jf1 = $('input[name="jf"]')[1].value;
		//} else {
			jf1 = $('input[name="jf"]')[0].value;
		//}
		//交付1
		var beiz = $('#beiz').val();//备注
		var diaobsqdh = $('#sqdh').val();//申请单号
		var usercenter = $('#usercenter').val();//用户中心
		var lingjbh = $('#dbmx_lingjbh').fieldValue();//零件号
		var zhuangt = $('#dbmx_zhuangt').fieldValue();//状态
		var shenbsl = $('#dbmx_shenbsl').fieldValue();//申报数量
		var lux = $('#dbmx_lux').fieldValue();//路线
		var editor = $('#dbmx_editor').fieldValue();//修改人
		var edit_time = $('#dbmx_edit_time').fieldValue();//修改时间
		var param = $('#grid_diaobdmx').grid('getRecords') == null ? [] : $(
				'#grid_diaobdmx').grid('getRecords');
		/*  for(var i=0;i<param.length;i++){
			    var  edit = param[i]; 
			    var  indexEdit = edit.indexOf(".");
			    var  editI = edit.substring(0,indexEdit);
			    
			    return false;
				var str=/^\d{1,4}\.?\d{0,6}$/;
				if(value !="" && !str.test(value)){
					alert('${i18n.js_input}!');
					return false;
				}else if(param[i].shipsl>param[i].kucsl){
		               alert("实批数量不能大于库存数量！")					 
				       return false;
			    }
		 } 
		var shipslArray = [];
		var kucslArray = [];
		//实批数量
		for ( var i = 0; i < param.length; i++) {
			var psl = param[i];
			var index = psl.indexOf("shipsl");
			if (index != -1) {
				index = psl.indexOf("=");
				var value = psl.substring(index + 1);
				var str = /^[0-9]\d{0,3}(?:\.\d{1,6})?$|0\.\d*[1-9]\d*$/;
				if (value != "" && !str.test(value)|| value.length > 11) {
					alert('${i18n.js_input}!');
					return false;
				}
				shipslArray.push(psl);
			}
		} */
		//库存数量
		/*for ( var i = 0; i < param.length; i++) {
			var ksl = param[i];
			var index = ksl.indexOf("kucsl");
			if (index != -1) {
				index = ksl.indexOf("=");
				var value = ksl.substring(index + 1);
				kucslArray.push(ksl);
			}
		}
		//实批数量与库存数量比较
		for ( var i = 0; i < shipslArray.length; i++) {
			var editS = shipslArray[i];
			var indexEditS = editS.indexOf(".");
			var editI = editS.substring(0, indexEditS);
			var spIndex = editS.indexOf("=");
			var spValue = editS.substring(spIndex + 1);
			for ( var j = 0; j < kucslArray.length; j++) {
				//库存
				var editK = kucslArray[j];
				var indexEditk = editK.indexOf(".");
				var editJ = editK.substring(0, indexEditk);
				var kcIndex = editK.indexOf("=");
				var kcValue = editK.substring(kcIndex + 1);
				if (editI == editJ) {
					if (spValue != "" && parseInt(spValue) > parseInt(kcValue)) {
						alert("实批数量不能大于库存数量！")
						return false;
					}
				}
			}
		}*/
		var params = [];
		var sp = 0;
		for ( var i = 0; i < param.length; i++) {
			var cangkbh_tmp;
			
			if(typeof cangkbh_tmp !='undefined'){
				if (cangkbh_tmp != param[i].cangkbh){
					alert("仓库编号必须一致！");
					return false;
				}
			}
			cangkbh_tmp = param[i].cangkbh;
			
			if ( "" == param[i].zickbh ){
				alert( "子仓库编号不能为空！" );
				return false;
			}
			
			var usercenter = usercenter;
			lingjbh = lingjbh, lux = lux, cangkbh = param[i].cangkbh,
					zickbh = param[i].zickbh, shengxsj = param[i].shengxsj,
					kucsl = param[i].kucsl, shipsl = param[i].shipsl,
					shifdbz = param[i].shifdbz;
			uclx = param[i].uclx;
			ucrl = param[i].ucrl;

			var rowix = i + 1;
			if (typeof cangkbh == 'undefined') {
				alert("${i18n.di}" + rowix + "${i18n.hangCangkNull}");
				return false;
			} else if (typeof shipsl != 'undefined'
					&& typeof shengxsj == 'undefined') {
				alert("${i18n.di}" + rowix + "${i18n.hangSxsjNull}");
				return false;
			} else if (typeof shipsl != 'undefined'
					&& typeof shifdbz == 'undefined') {
				alert("${i18n.di}" + rowix + "${i18n.hangBzNull}");
				return false;
			} else if (typeof shipsl != 'undefined') {
				var kcsl = typeof kucsl == 'undefined' ? "0" : parseInt(kucsl);
				if (kcsl < parseInt(shipsl)) {
					alert("${i18n.di}" + rowix + "${i18n.spslNotdykcsl}");
					return false;
				}
			} 
			if (typeof uclx == 'undefined' || typeof ucrl == 'undefined'|| ucrl == '' || uclx=='') {
				alert("${i18n.di}"
						+ rowix
						+ "UC容量或者UC类型不能为空");
				return false;
			}

			/*else if(typeof kucsl=='undefined'){
			   alert("${i18n.di}"+rowix+"${i18n.hangKucNull}");
			   return false;
			}*/
			params.push('dbmx[' + i + '].usercenter=' + usercenter);
			params.push('dbmx[' + i + '].lingjbh=' + lingjbh);
			params.push('dbmx[' + i + '].lux=' + lux);
			params.push('dbmx[' + i + '].cangkbh=' + cangkbh);
			params.push('dbmx[' + i + '].shengxsj=' + shengxsj);
			if (typeof shipsl != 'undefined') {
				params.push('dbmx[' + i + '].shipsl=' + shipsl);
			}
			if (typeof kucsl != 'undefined') {
				params.push('dbmx[' + i + '].kucsl=' + kucsl);
			}
			if (typeof zickbh != 'undefined') {
				params.push('dbmx[' + i + '].zickbh=' + zickbh);
			} else {
				params.push('dbmx[' + i + '].zickbh=' + "");
			}
			params.push('dbmx[' + i + '].shifdbz=' + shifdbz);
			
			//实批数量不为零的时候，才能取到 uclx和ucrl
			if (dbsqmx[0].shipsl != 0 ){
				params.push('dbmx[' + i + '].uclx=' + uclx);
				params.push('dbmx[' + i + '].ucrl=' + ucrl);
			 }
			
			var sl = param[i].shipsl;
			
			sl = sl === "" ? 0 : sl;
			sp += parseInt(sl);
		}

		var sqmxRow = $("#grid_diaobsqmx").find(
				'div.grid-scroll tr[id*="' + lingjbh + ',' + lux + '"]');
		//给调拨申请明细实批数量赋值
		var sqrow = sqmxRow[0];
		var sqingsl = $(sqrow).find('td:eq(4)').text();
		var zhuangt = $(sqrow).find('td:eq(7)').attr("value");
		if(zhuangt == '00'){
			sp = sp.toString();
			$(sqrow).find('td:eq(5)').text(sp);
			if(parseInt(sp)>parseInt(sqingsl)){
				alert("${i18n.spslNotdysbsl}");
				return false;
			}

		}
		//组合传递参数
		params.push("dbsqmx.zhuangt=" + zhuangt);
		params.push("dbsqmx.shenbsl=" + shenbsl);
		//param.push("dbsqmx.shipsl=" + shipsl);
		params.push("dbsqmx.beiz=" + beiz);
		params.push("shifdcjf=" + jf1);
		params.push("dbsqmx.diaobsqdh=" + diaobsqdh);
		params.push("dbsqmx.usercenter=" + usercenter);
		params.push("dbsqmx.lingjbh=" + lingjbh);
		params.push("dbsqmx.lux=" + lux);
		
		//实批数量不为零的时候，才能取到 uclx和ucrl
		if (dbsqmx[0].shipsl != 0 ){
			params.push('dbsqmx.ucrl=' + ucrl);
			params.push("dbsqmx.uclx=" + uclx);
		}
		
		params.push("dbsqmx.editor=" + editor);
		params.push("dbsqmx.edit_time=" + edit_time);

		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/diaoblQr.ajax",//请求url
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				if (result.result === '${i18n.verifySeccess}') {
					$('#grid_diaobsqmx').grid('reload');
				}
			}
		});
	}

	/**
	 *拒绝按钮提交事件
	 */
	function juj() {
		var param = $('#grid_diaobsqmx').grid('getSelectedRecords');//获取选中的调拨申请明细,可以为多条
		if (param.length == 0) {
			alert('${i18n.js_selected}!');
			return false;
		}
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('edit[' + i + '].lingjbh=' + param[i].lingjbh);
			params.push('edit[' + i + '].zhuangt=' + param[i].zhuangt);
			params.push('edit[' + i + '].lux=' + param[i].lux);
			params.push('edit[' + i + '].editor=' + param[i].editor);
			params.push('edit[' + i + '].edit_time=' + param[i].edit_time);
			params.push('edit[' + i + '].diaobsqdh=' + $('#sqdh').val());
			params.push('edit[' + i + '].usercenter=' + $('#usercenter').val());
		}
		var data = params.join('&');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/diaoblJj.ajax",//请求url
			data : data,
			success : function(result) {
				alert(result.result);
				$('#grid_diaobsqmx').grid('reload');
			}
		});
	}

	/**
	 *实批数量关闭编辑事件
	 */
	function shipsl_onload() {
		//var value = this.col.cell.text();
		var lingjbh = $('#dbmx_lingjbh').fieldValue();//零件号
		var lux = $('#dbmx_lux').fieldValue();//路线
		var dbmxRow = $("#grid_diaobdmx").find(
				'tr[id*="' + lingjbh + ',' + lux + '"]');
		var shipsl = 0;
		$.each(dbmxRow, function(i, n) {
			sl = $(n).find('td:eq(7)').text();
			sl = sl === "" ? 0 : sl;
			shipsl += parseInt(sl);

		})
		var dbsqmx = $('#grid_diaobsqmx').grid('getSelectedRecords');
		//alert(shipsl);
		var sqmxRow = $("#grid_diaobsqmx").find(
				'div.grid-scroll tr[id*="' + lingjbh + ',' + lux + '"]');
		//给调拨申请明细实批数量赋值
		var sqrow = sqmxRow[0];
		shipsl = shipsl.toString();
		var sqingsl = $(sqrow).find('td:eq(4)').text();
		var zhuangt = $(sqrow).find('td:eq(7)').attr("value");
		if (dbsqmx.length == 0 && zhuangt == '00' ) {
			$(sqrow).find('td:eq(5)').text('0');
		}else{
			if(zhuangt == '00' && parseInt(shipsl) > parseInt(sqingsl)){
				$(sqrow).find('td:eq(5)').text(sqingsl);
			}else{
				$(sqrow).find('td:eq(5)').text(shipsl);
			}
		}
	}

	/*
	 *生效并打印
	 */
	function shengx() {
		var diaobsqdh = $('#sqdh').val();//申请单号
		var usercenter = $('#usercenter').val();//用户中心
		var params = [];
		params.push("dbsq.diaobsqdh=" + diaobsqdh);
		params.push("dbsq.usercenter=" + usercenter);
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/dfpvdiaobl/diaoblSx.ajax",//请求url
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				if (result.flag != "3") {
					return false;
				} else {
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