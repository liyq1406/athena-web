<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单明细修改">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	$(function(){ 
          $('body div.layout-panel.panel-north').remove();
          $('body td.td-west').remove();
          $('body div.layout-panel.panel-south').remove(); 
          
      });
</script>
</head>

<t:page>

	<t:form id="ilquery" reset="NOT" submit="NOT">
		<t:grid id="ilorderEe" idKeys="id,dingdh,gongysdm,usercenter,uabzucsl,edit_time,editor,zhuangt" caption="" showNum="true" multiple="true" selectRowEvent="xqjsRowSelect"
			src="/ilorder/queryTempDdmx.ajax" usePager="true" edit="NOT" load="true" remove="NOT" editable="true" 
			 showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			save="NOT" scrollHeight="478" add="NOT" pageSize="20">
			<t:fieldLayout id="ilselect" prefix="il" columns="4">
				<t:fieldText property="lingjbh" caption="零件号" width="100" maxLength="10"></t:fieldText>
				<t:fieldCalendar property="jiaofrq" caption="交付日期" width="150" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="dingdh"></t:fieldHidden>
				<t:fieldHidden property="gongysdm"></t:fieldHidden>
				<t:fieldHidden property="gonghlx"></t:fieldHidden>
				<t:fieldHidden property="dingdzt"></t:fieldHidden>
				<t:fieldHidden property="editor"></t:fieldHidden>
				<t:fieldHidden property="edit_time"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="chkbox" align="center" renderer="createCheckbox" caption="选择"></t:gridCol>
			<t:gridCol property="dingdh" type="text" caption="订单号" defaultValue="${dingdh}"></t:gridCol>
			<t:gridCol property="gongysdm" type="text" caption="供应商代码" defaultValue="${gongysdm}"></t:gridCol>
			<t:gridCol property="gonghlx" type="text" caption="供货类型"  editor="fieldSelect"   defaultValue="${gonghlx}"  editorOptions="{'notNull':true, 'show':'names',openEvent:editAble, 'code':'gonghms','src':'${ctx}/ilorder/getGonghms.ajax?chullx=${gonghlx}'}" ></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件号" editorOptions="{'notNull':true,'maxLength':'10','minLength':'10',openEvent:editAble,closeEvent:lingjbhValidate}" editor="fieldText"></t:gridCol>
			<t:gridCol property="cangkdm" type="text" caption="仓库" editorOptions="{'maxLength':'3','minLength':'3',openEvent:editAble,closeEvent:cangkdmValidate}" editor="fieldText"></t:gridCol>
			<t:gridCol property="uabzrl" type="text" caption="包装容量" editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="uabzlx" type="text" caption="包装类型"></t:gridCol>
			<t:gridCol property="baozsl" type="text" caption="包装数量" editorOptions="{openEvent:editAble,'expression':'^[0-9]{1}$|^[1-9]{1}[0-9]{1,7}$','expressionMessage':'包装数量必须为整数'}" editor="fieldText" renderer="showBaozsl"></t:gridCol>
			<t:gridCol property="danw" type="text" caption="零件单位"></t:gridCol>
			<t:gridCol property="shul" type="text" caption="零件数量"
				editorOptions="{'notNull':true,'expression':'^[0-9]{1}$|^[1-9]{1}[0-9]{1,9}(?:\.[0-9]{1,3})?$|^0\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}" editor="fieldText" renderer="showBaozsl"></t:gridCol>
			<t:gridCol property="jiaofrq" type="text" caption="交付日期" editorOptions="{'notNull':true,'format':'yyyy-MM-dd HH:mm',closeEvent:getGyzq}" editor="fieldCalendar"></t:gridCol>
			<t:gridCol property="fayrq" type="text" caption="发运日期" editorOptions="{'notNull':false,'format':'yyyy-MM-dd HH:mm'}" editor="fieldCalendar"></t:gridCol>
			<t:gridCol property="gongyzq" type="text" caption="工业周期"></t:gridCol>
			<t:gridCol property="leix" type="text" caption="是否既定" convert="shif" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="uabzucrl" type="text" caption="包装容量" hidden="true"></t:gridCol>
			<t:gridCol property="uabzuclx" type="text" caption="UC包装类型" hidden="true"></t:gridCol>
			<t:gridCol property="uabzucsl" type="text" caption="UA包装UC数量" hidden="true"></t:gridCol>
			<t:gridCol property="jihyz" type="text" caption="计划员组" hidden="true"></t:gridCol>
			<t:gridCol property="gcbh" type="text" caption="承运商" hidden="true"></t:gridCol>
			<t:gridCol property="lujdm" type="text" caption="路径代码" hidden="true"></t:gridCol>
			<t:gridCol property="xiehzt" type="text" caption="卸货站台" hidden="true"></t:gridCol>
		</t:grid>
	</t:form>
	<t:buttons id="btn">
		<t:button caption="修改" name="edit" />
		<t:button caption="增加" name="addmx" />
		<t:button caption="复制" name="copy" />
		<t:button caption="删除" name="delete" />
		<t:button caption="待生效" name="uneffect" />
		<t:button caption="生效" name="effect" />
	</t:buttons>

	<t:form id="ilAddDdmx" dialog="true" caption="新增" submit="NOT">
		<t:fieldLayout prefix="add">
			<t:fieldHidden property="usercenter"></t:fieldHidden>
			<t:fieldText property="dingdh" caption="订单号" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商代码" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="lingjbh" caption="零件号" width="150" maxLength="10"></t:fieldText>
			<t:fieldText property="uabzucrl" caption="包装容量" width="150" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="uabzuclx" caption="包装类型" width="150" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="uabzucsl" caption="包装数量" width="150" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="danw" caption="零件单位" width="150" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="cangkdm" caption="仓库" width="150" notNull="true" maxLength="3"></t:fieldText>
			<t:fieldText property="shul" caption="零件数量" width="150" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位10位，小数部分最大位3位' maxLength="13"></t:fieldText>
			<t:fieldCalendar property="jiaofrq" caption="交付时间" width="150" format="yyyy-MM-dd" notNull="true"></t:fieldCalendar>
			<t:fieldSelect property="leix" caption="是否预告" width="150" convert="shif" notNull="true"></t:fieldSelect>
		</t:fieldLayout>

	</t:form>

</t:page>

<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['shif'] = {
		'9' : '既定',
		'8' : '预告'
	};

	/**
	 *列渲染事件,创建checkbox	
	 */
	function createCheckbox() {
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}


	// 复制按钮
	function func_button_copy() {
		var record = $("#ilorderEe").grid("getSelectedRecords");
		if (record.length != 1) {
			alert("请选择一条要复制的记录");
			return;
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/getNextZqFirstDay.ajax",
			data : "jiaofrq=" + record[0].jiaofrq ,
			success : function(result) {
			       var gyzq = result.gongyzq;
			       record[0].jiaofrq = gyzq.kaissj;
			       record[0].gongyzq = gyzq.gongyzq;
			       
					var allRecords = $("#ilorderEe").grid("getRecords");
					var oldRecords = allRecords;
					for(var i=0;i<allRecords.length;i++){
					    if(typeof allRecords[i].id=="undefined"){
					       allRecords[i].id = "row_";
					    }
					}
			        record[0].id = "row_";
					//var newaddrow = $("div.grid-scroll table.grid-table tr[id*='row_']");
			
					$('#ilorderEe').grid('parseRecords', allRecords.concat(record));
					
					
					
					
					var params = [];
					
					var usercenter = $.trim($("#il_usercenter").fieldValue());
					var lingjbh = $.trim(record[0].lingjbh);
					var cangkdm = $.trim(record[0].cangkdm);
					var gongysdm = $.trim($("#il_gongysdm").fieldValue());
					var gonghlx = $.trim(record[0].gonghlx);
					params.push('usercenter=' + usercenter);
					params.push('lingjbh=' + lingjbh);
					params.push('gongysbh=' + gongysdm);
					params.push('mudd=' + cangkdm);
					params.push('waibms=' + gonghlx);
					if (usercenter != '' && lingjbh != '' && gongysdm != '' && gonghlx != '' && cangkdm != ''&& gonghlx.indexOf('N')==-1) 
					{
						$.sdcui.ajaxUtil.ajax({
							url : "${ctx}/ilorder/queryWulljMudd.ajax",
							data : params.join('&'),
							async:false,
							success : function(result) {
								if (result.total == 0) {
									$('#ilorderEe').grid('parseRecords', oldRecords);
									alert("所复制的数据中未查出相应的物流路径.");
								} else {
									var rs = result.result[0];
									$.each($("div.grid-scroll table.grid-table tr[id*='row_']"), function(i, n) {
	
										var e_lingjbhIndex = $('td.lingjbh:first').prevAll().length;
										var e_cangkdmIndex = $('td.cangkdm:first').prevAll().length;
										var e_gonghlxIndex = $('td.gonghlx:first').prevAll().length;
										var e_gcbhIndex = $('td.gcbh:first').prevAll().length;
										var e_lingjbh = $(n).find('td:eq(' + e_lingjbhIndex + ')').text();
										var e_cangkdm = $(n).find('td:eq(' + e_cangkdmIndex + ')').text();
										var e_gonghlx = $(n).find('td:eq(' + e_gonghlxIndex + ')').text();
			
										 if( e_lingjbh==lingjbh && e_cangkdm==cangkdm  && e_gonghlx==gonghlx ){
											 $(n).find('td:eq(' + e_gcbhIndex + ')').text(rs.gcbh);
									    }
									});
									}
								}
							});
					}
					
					
					
					
					
			}
		});	
	}

   function getGyzq(){
        var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var rqIndex = $('td.jiaofrq:first').prevAll().length;
		var gyzqIndex = $('td.gongyzq:first').prevAll().length;
		var jiaofrq = rowElement.find('td:eq(' + rqIndex + ')').text();
		if(typeof jiaofrq!='undefined'&&jiaofrq!=''){
			    $.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/getThisGyzq.ajax",
				data : "jiaofrq=" +jiaofrq ,
				success : function(result) {
				       rowElement.find('td:eq(' + gyzqIndex + ')').text(result.result);
				}
			});	
		}
   
   }


	function addrowmx() {
		$("#ilorderEe").grid("addRow");
	}
	//零件编号验证
	function lingjbhValidate() {
		var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var row = rowElement.prevAll().length;

		var usercenter = $("#il_usercenter").fieldValue();
		var gongysdm = $("#il_gongysdm").fieldValue();
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
		var lingjbh = rowElement.find('td:eq(' + lingjbhIndex + ')').text();
		var uabzrlIndex = $('td.uabzrl:first').prevAll().length;
		var baozslIndex = $('td.baozsl:first').prevAll().length;
		var shulIndex = $('td.shul:first').prevAll().length;
		var uabzlxIndex = $('td.uabzlx:first').prevAll().length;
		var uabzuclxIndex = $('td.uabzuclx:first').prevAll().length;
		var uabzucrlIndex = $('td.uabzucrl:first').prevAll().length;
		var uabzucslIndex = $('td.uabzucsl:first').prevAll().length;
		var danwIndex = $('td.danw:first').prevAll().length;
		var jihyzIndex = $('td.jihyz:first').prevAll().length;

		var baozsl = rowElement.find('td:eq(' + baozslIndex + ')').text();
		var shul = rowElement.find('td:eq(' + shulIndex + ')').text();
		if (lingjbh == '') {
			alert("零件编号不能为空！");
			return false;
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/getRonglvalidate.ajax",
			data : "lingjbh=" + lingjbh + "&usercenter=" + usercenter
					+ "&gongysbh=" + gongysdm,
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					rowElement.find('td:eq(' + lingjbhIndex + ')').addClass(
							"editing edited validate-error").attr("title",
							"第" + row + "行," + "零件编号输入有误");
					return false;
				} else {
					rowElement.find('td:eq(' + lingjbhIndex + ')').removeClass(
							"editing edited validate-error");
					var uabzrl = "";
					if (result.uabzucrl != null && result.uabzucsl != null
							&& result.uabzucrl != "" && result.uabzucsl != "") {
						uabzrl = result.uabzucrl * result.uabzucsl;
					}
					rowElement.find('td:eq(' + uabzrlIndex + ')').text(uabzrl);
					rowElement.find('td:eq(' + uabzlxIndex + ')').text(
							result.uabzlx);
					rowElement.find('td:eq(' + uabzucrlIndex + ')').text(
							result.uabzucrl);
					rowElement.find('td:eq(' + uabzucslIndex + ')').text(
							result.uabzucsl);
					rowElement.find('td:eq(' + uabzuclxIndex + ')').text(
							result.uabzuclx);
					rowElement.find('td:eq(' + danwIndex + ')').text(
							result.danw);
					rowElement.find('td:eq(' + jihyzIndex + ')').text(
							result.jihy);
					if (uabzrl != "" && baozsl != "") {
						var sl = uabzrl * baozsl;
						rowElement.find('td:eq(' + shulIndex + ')').text(sl)
								.attr("value", sl);
					} else if (uabzrl != "" && shul != "") {
						var bzsl = Math.ceil(shul / uabzrl);
						rowElement.find('td:eq(' + baozslIndex + ')').text(sl)
								.attr("value", bzsl);
					}
				}
			}
		});

	}
   
	//仓库编号验证
	function cangkdmValidate() {
		var params = [];
		var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var row = rowElement.prevAll().length;
		var usercenter = $("#il_usercenter").fieldValue();
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
		var cangkdmIndex = $('td.cangkdm:first').prevAll().length;
		var gcbhIndex = $('td.gcbh:first').prevAll().length;
		var lujdmIndex = $('td.lujdm:first').prevAll().length;
		var xiehztIndex = $('td.xiehzt:first').prevAll().length;
		var lingjbh = rowElement.find('td:eq(' + lingjbhIndex + ')').text();
		var cangkdm = rowElement.find('td:eq(' + cangkdmIndex + ')').text();
		var gonghlx = $("#il_gonghlx").fieldValue();
		var gonghlxIndex = $('td.gonghlx:first').prevAll().length;
		var nedghlx = rowElement.find('td:eq(' + gonghlxIndex + ')').text();
		var ghlx =nedghlx.indexOf('P')==-1?'N'+gonghlx.substr(1):nedghlx;
		var gongysdm = $("#il_gongysdm").fieldValue();
		
		params.push('usercenter=' + usercenter);
		params.push('lingjbh=' + lingjbh);
		params.push('gongysbh=' + gongysdm);
		params.push('mudd=' + cangkdm);
		params.push('waibms=' + ghlx);
		if (cangkdm != ''&& ghlx.indexOf('N')==-1) {
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/queryWulljMudd.ajax",
				data : params.join('&'),
				success : function(result) {
					if (result.total == 0) {
						alert("未在物流路径中找到该目的地,请输入正确的仓库编号");
						rowElement.find('td:eq(' + cangkdmIndex + ')')
								.addClass("editing edited validate-error")
								.attr("title", "【仓库编号】输入有误");
					} else {
						rowElement.find('td:eq(' + cangkdmIndex + ')')
								.removeClass("editing edited validate-error");
						var rs = result.result[0];
						if($.trim(rs.gcbh) == "" || $.trim(rs.lujbh) == "" || $.trim(rs.xiehztbh) == "" )
						{
							rowElement.find('td:eq(' + cangkdmIndex + ')')
							.addClass("editing edited validate-error")
							.attr("title", "该数据所对应的物流路径未找到正确的卸货站台编号或路径代码或承运商编号!");
						}
						else
						{
							rowElement.find('td:eq(' + gcbhIndex + ')').text(rs.gcbh);
							rowElement.find('td:eq(' + lujdmIndex + ')').text(rs.lujbh);
							rowElement.find('td:eq(' + xiehztIndex + ')').text(rs.xiehztbh);
						}
					}
				}
			});

		}

	}

	//判断是新增还是修改，如果是修改则零件号不能编辑
	function editAble() {
		var flag = true;
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
		var baozslIndex = $('td.baozsl:first').prevAll().length;
		var cangkIndex = $('td.cangkdm:first').prevAll().length;
		var gonghlxIndex = $('td.gonghlx:first').prevAll().length;
		var event = window.event || arguments.callee.caller.arguments[2];
		var td = event.srcElement || event;
		//编辑单元格所在TD的tr
		var tr;
		var editIndex;
		if (event.srcElement) {
			tr = $(td).parent('tr:first');
			editIndex = td.cellIndex;
		} else {
			tr = $(td.cell).parent('tr:first');
			editIndex = event.colIndex - 2;
		}
		var trId = $(tr).attr("id");
		if (trId.indexOf("row_") == -1
				&& (lingjbhIndex == editIndex || cangkIndex == editIndex|| gonghlxIndex == editIndex)) {
			flag = false;
		}
		return flag;
	}

	// 包装数量
	function showBaozsl(col, value, rowIndex, colIndex) {
		var obj = this;
		var uabzrl = value["uabzrl"];
		var baozsl = value["baozsl"];
		var shul = value["shul"];
		var showValue;
		var shulpattern = /^[1-9]{1}[0-9]{1,9}(?:\.[0-9]{1,3})?$|^0\.[0-9]{1,3}$/;
		var bzslpattern = /^[0-9]{1,8}$/;
		var baozslIndex = $('td.baozsl:first').prevAll().length;
		var shulIndex = $('td.shul:first').prevAll().length;
		var property = this.property;
		var tdElement, trElement;
		if (property.indexOf("e") != -1) {
			tdElement = obj.cell;
			trElement = tdElement.parent("tr:first");
			if (property == "e_shul") {
				shul = col;
			} else {
				baozsl = col;
			}
		}

		if (property == "baozsl" && typeof uabzrl != "undefined"
				&& typeof shul != "undefined" && uabzrl != "" && shul != ""
				&& (typeof baozsl == "undefined" || baozsl == "")) {
			showValue = Math.ceil(shul / uabzrl);
		} else if (property == "baozsl"&&typeof baozsl!= "undefined") {
			showValue = value["baozsl"];
		} else if (property == "shul"&&typeof shul!= "undefined") {
			showValue = value["shul"];
		} else if (property == " shul"
				&& (typeof shul == "undefined" || shul == "")
				&& typeof uabzrl != "undefined" && uabzrl != ""
				&& typeof baozsl != "undefined" && baozsl != "") {
			showValue = uabzrl * baozsl;
		} else if (property == "e_shul" && shulpattern.test(shul)
				&& typeof uabzrl != "undefined" && uabzrl != "") {
			showValue = shul;
			var bzsl = Math.ceil(shul / uabzrl);
			trElement.find('td:eq(' + baozslIndex + ')').text(bzsl).attr(
					"value", bzsl);
			;
		} else if (property == "e_baozsl" && bzslpattern.test(baozsl)
				&& typeof uabzrl != "undefined" && uabzrl != "") {
			showValue = baozsl;
			var sl = baozsl * uabzrl;
			trElement.find('td:eq(' + shulIndex + ')').text(sl).attr("value",sl).removeClass("validate-error");
		} else if (property == "e_shul") {
			showValue = shul;
		} else if (property == "e_baozsl") {
			showValue = baozsl;
		} else {
			showValue = "";
		}
		return "" + showValue;
	}

	function func_button_addmx() {
        //var param = $('#ilorderEe').grid('getBatchRecords');
        //alert(param.insert.gongysdm);
		var dingdzt = $('#il_dingdzt').fieldValue();
		if (dingdzt > 3) {
			alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
			return false;
		}
		var param = $("div.grid-scroll table.grid-table tr[id*='row_']");
		
		var dto = getAddParams(param);
		var error = $('#ilorderEe').find('tr[id*="row_"] td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}else{
				//alert(typeof false=="boolean");
				if(dto.length<=3){
				    alert("请添加订单明细");
				    return ;
				}else {
					$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/ilorder/addLsZqMx.ajax",
						data : dto.join('&'),
						success : function(result) {
							if (result.msg != null) {
								alert(result.msg);
								$("#ilorderEe").grid('reload');
							} else {
								alert(result.errorMsg);
							}
		
						}
					});
				}
		}
	}

	// 传参
	function getAddParams(param) {
		var params = [];
		var dingdzt = $("#il_dingdzt").fieldValue();
		var gonghlx = $("#il_gonghlx").fieldValue();
		var gongysdm = $("#il_gongysdm").fieldValue();
		$.each(param, function(i, n) {
			var dingdhIndex = $('td.dingdh:first').prevAll().length;
			var gongysdmIndex = $('td.gongysdm:first').prevAll().length;
			var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
			var cangkdmIndex = $('td.cangkdm:first').prevAll().length;
			var uabzlxIndex = $('td.uabzlx:first').prevAll().length;
			var danwIndex = $('td.danw:first').prevAll().length;
			var shulIndex = $('td.shul:first').prevAll().length;
			var jiaofrqIndex = $('td.jiaofrq:first').prevAll().length;
			var fayrqIndex = $('td.fayrq:first').prevAll().length;
			var leixIndex = $('td.leix:first').prevAll().length;
			var uabzucrlIndex = $('td.uabzucrl:first').prevAll().length;
			var uabzuclxIndex = $('td.uabzuclx:first').prevAll().length;
			var uabzucslIndex = $('td.uabzucsl:first').prevAll().length;
			var jihyzIndex = $('td.jihyz:first').prevAll().length;
			var gonghlxIndex = $('td.gonghlx:first').prevAll().length;
			var gcbhIndex = $('td.gcbh:first').prevAll().length;
			var lujdmIndex = $('td.lujdm:first').prevAll().length;
			var xiehztIndex = $('td.xiehzt:first').prevAll().length;

			var usercenter = $("#il_usercenter").fieldValue();
			var dingdh = $(n).find('td:eq(' + dingdhIndex + ')').text();
			//var gongysdm = $(n).find('td:eq(' + gongysdmIndex + ')').text();
			var lingjbh = $(n).find('td:eq(' + lingjbhIndex + ')').text();
			var cangkdm = $(n).find('td:eq(' + cangkdmIndex + ')').text();
			var uabzlx = $(n).find('td:eq(' + uabzlxIndex + ')').text();
			var danw = $(n).find('td:eq(' + danwIndex + ')').text();
			var shul = $(n).find('td:eq(' + shulIndex + ')').text();
			var jiaofrq = $(n).find('td:eq(' + jiaofrqIndex + ')').text();
			var fayrq = $(n).find('td:eq(' + fayrqIndex + ')').text();
			var leix = $(n).find('td:eq(' + leixIndex + ')').text();
			var lxvalue  = $(n).find('td:eq(' + leixIndex + ')').attr("value");
			var uabzucrl = $(n).find('td:eq(' + uabzucrlIndex + ')').text();
			var uabzuclx = $(n).find('td:eq(' + uabzuclxIndex + ')').text();
			var uabzucsl = $(n).find('td:eq(' + uabzucslIndex + ')').text();
			var jihyz = $(n).find('td:eq(' + jihyzIndex + ')').text();
			var nedghlx = $(n).find('td:eq(' + gonghlxIndex + ')').text();
			var ghlx =nedghlx.indexOf('P')==-1?'N'+gonghlx.substr(1):nedghlx;
			var gcbh = $(n).find('td:eq(' + gcbhIndex + ')').text();
            var lujdm = $(n).find('td:eq(' + lujdmIndex + ')').text();
            var xiehzt = $(n).find('td:eq(' + xiehztIndex + ')').text();
			var row = $(n).prevAll().length;
			var msg;
			if (ghlx.indexOf('N')!=-1) {
				$(n).find('td:eq(' + cangkdmIndex + ')').removeClass("validate-error");
			}
			if (lingjbh == "") {
				msg = "【零件编号】不能为空";
				$(n).find('td:eq(' + lingjbhIndex + ')').addClass(
						"editing edited validate-error").attr("title",
						"第" + row + "行," + msg);
				//alert(msg);
				return false;
			} else if (cangkdm == ""&&ghlx.indexOf('N')==-1) {
				msg = "【仓库编号】不能为空";
				$(n).find('td:eq(' + cangkdmIndex + ')').addClass(
						"editing edited validate-error").attr("title",
						"第" + row + "行," + msg);
				//alert(msg);
				return false;
			} else if (shul == "") {
				msg = "【零件数量】不能为空";
				$(n).find('td:eq(' + shulIndex + ')').addClass(
						"editing edited validate-error").attr("title",
						"第" + row + "行," + msg);
				//alert(msg);
				return false;
			} else if (jiaofrq == "") {
				msg = "【交付日期】不能为空";
				$(n).find('td:eq(' + jiaofrqIndex + ')').addClass(
						"editing edited validate-error").attr("title",
						"第" + row + "行," + msg);
				//alert(msg);
				return false;
			} else if (leix == "") {
				msg = "【是否既定】不能为空,非周期的只能为否（预告）";
				$(n).find('td:eq(' + leixIndex + ')').addClass(
						"editing edited validate-error").attr("title",
						"第" + row + "行," + msg);
				//alert(msg);
				return false;
			}else if (ghlx.indexOf('N')!=-1&&leix == "既定") {
				msg = "【是否既定】非周期的只能为否（预告）";
				$(n).find('td:eq(' + leixIndex + ')').addClass(
						"editing edited validate-error").attr("title",
						"第" + row + "行," + msg);
				//alert(msg);
				return false;
			}

			params.push('insert[' + i + '].usercenter=' + usercenter);
			params.push('insert[' + i + '].dingdh=' + dingdh);
			params.push('insert[' + i + '].gongysdm=' + gongysdm);
			params.push('insert[' + i + '].lingjbh=' + lingjbh);
			params.push('insert[' + i + '].cangkdm=' + cangkdm);
			params.push('insert[' + i + '].uabzucrl=' + uabzucrl);
			params.push('insert[' + i + '].uabzuclx=' + uabzuclx);
			params.push('insert[' + i + '].uabzucsl=' + uabzucsl);
			params.push('insert[' + i + '].leix=' + $(n).find('td:eq(' + leixIndex + ')').attr("value"));
			params.push('insert[' + i + '].danw=' + danw);
			params.push('insert[' + i + '].shul=' + shul);
			params.push('insert[' + i + '].jiaofrq=' + jiaofrq);
			params.push('insert[' + i + '].fayrq=' + fayrq);
			params.push('insert[' + i + '].dingdzt=' + dingdzt);
			params.push('insert[' + i + '].gonghlx=' + ghlx);
			params.push('insert[' + i + '].gcbh=' + gcbh);
			params.push('insert[' + i + '].lujdm=' + lujdm);
			params.push('insert[' + i + '].xiehzt=' + xiehzt);
		})
		params.push('dingdzt=' + dingdzt);
		params.push('gonghlx=' + gonghlx);
		params.push('lx=temp');
		return params;
	}

	//填写零件号失去焦点事件
	$(function() {
		$('#add_lingjbh')
				.bind(
						'focusout',
						function() {
							var usercenter = $('#add_usercenter').fieldValue();
							var lingjbh = $('#add_lingjbh').fieldValue();
							var gongysdm = $('#add_gongysdm').fieldValue();
							if (lingjbh == '') {
								alert("零件编号不能为空！");
								return false;
							}
							$.sdcui.ajaxUtil
									.ajax({
										url : "${ctx}/kdorder/getrl.ajax",
										data : "lingjbh=" + lingjbh
												+ "&usercenter=" + usercenter
												+ "&gongysbh=" + gongysdm,
										success : function(result) {
											if (result.flag != null
													&& (result.msg == 'ljgongys' || result.msg == 'jihy')) {
												alert(result.flag);
												return false;
											} else {
												$("#add_uabzuclx").fieldValue(
														result.uabzuclx);
												$("#add_uabzucrl").fieldValue(
														result.uabzucrl);
												$("#add_uabzucsl").fieldValue(
														result.uabzucsl);
												$("#add_jihyz").fieldValue(
														result.jhy);
												$("#add_danw").fieldValue(
														result.danw);

											}

										}
									});

						})
	})

	// 仓库编号
	$(function() {
		$("#add_cangkdm")
				.bind(
						"focusout",
						function() {
							var params = [];
							var usercenter = $('#add_usercenter').fieldValue();
							var lingjbh = $('#add_lingjbh').fieldValue();
							var cangkbh = $('#add_cangkdm').fieldValue();
							params.push('usercenter=' + usercenter);
							params.push('lingjbh=' + lingjbh);
							params.push('cangkbh=' + cangkbh);
							if (cangkbh != '') {
								$.sdcui.ajaxUtil
										.ajax({
											url : "${ctx}/ilorder/queryLingjck.ajax",
											data : params.join('&'),
											success : function(result) {
												if (result.total != 1) {
													alert("请输入正确的仓库编号");
													$('div#add_cangkdm')
															.addClass(
																	"editing edited validate-error")
															.attr("error",
																	"【仓库编号】有误");
												} else {
													if ($('div#add_cangkdm editing edited validate-error')) {
														$('div#add_cangkdm')
																.removeAttr(
																		"error");
													}
												}
											}
										});

							}

						})

	})

	/**
	 *新增订单行
	
	 */
	function subAdd(param) {

		var params = [];

		var dingdh = $('#add_dingdh').fieldValue();
		var usercenter = $('#il_usercenter').fieldValue();
		var gongysdm = $('#add_gongysdm').fieldValue();
		var lingjbh = $('#add_lingjbh').fieldValue();
		var cangkdm = $('#add_cangkdm').fieldValue();
		var uabzucrl = $('#add_uabzucrl').fieldValue();
		var uabzuclx = $('#add_uabzuclx').fieldValue();
		var uabzucsl = $('#add_uabzucsl').fieldValue();
		var danw = $('#add_danw').fieldValue();
		var shul = $('#add_shul').fieldValue();
		var jiaofrq = $('#add_jiaofrq').fieldValue();
		var fayrq = $('#add_fayrq').fieldValue();
		var dingdzt = $('#il_dingdzt').fieldValue();
		params.push('usercenter=' + usercenter);
		params.push('gongysdm=' + gongysdm);
		params.push('dingdh=' + dingdh);
		params.push('lingjbh=' + lingjbh);
		params.push('cangkdm=' + cangkdm);
		params.push('uabzucrl=' + uabzucrl);
		params.push('uabzuclx=' + uabzuclx);
		params.push('uabzucsl=' + uabzucsl);
		params.push('leix=' + $('#add_leix').fieldValue());
		params.push('danw=' + danw);
		params.push('shul=' + shul);
		params.push('jiaofrq=' + jiaofrq);
		params.push('fayrq=' + fayrq);
		params.push('dingdzt=' + dingdzt);
		params.push('lx=temp');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/addBppMx.ajax",
			data : params.join('&'),
			success : function(result) {
				if (result.msg != null) {
					alert(result.msg);
					// $("#ilAddDdmx").form('close');
					$("#ilorderEe").grid('reload');
				} else {
					alert(result.errorMsg);
				}

			}
		});

	}
	/**
	 *修改订单行
	 */
	function func_button_edit() {
	
		var param = $("#ilorderEe").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}else{
		    for(var i=0;i<param.length;i++){
		        if(param[i].id=="row_"||typeof param[i].id=="undefined"){
		           alert("不能对表格里新增的记录进行修改操作");
		           return ;   
		        }
		    }
		}
		
		var dingdzt = $('#il_dingdzt').fieldValue();
		if (dingdzt > 3) {
			alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
			return false;
		}
		//修改选中的记录
		
		var params = [];
		var error = $('#ilorderEe').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].id=' + param[i].id);
			params.push('ddmx[' + i + '].shul=' + param[i].shul);
			params.push('ddmx[' + i + '].lingjbh=' + param[i].lingjbh);
			params.push('ddmx[' + i + '].dingdh=' + param[i].dingdh);
			params.push('ddmx[' + i + '].gongysdm=' + param[i].gongysdm);
			//params.push('ddmx[' + i + '].cangkdm=' + param[i].cangkdm);
			params.push('ddmx[' + i + '].jiaofrq=' + param[i].jiaofrq);
			params.push('ddmx[' + i + '].fayrq=' + param[i].fayrq);
			params.push('ddmx[' + i + '].leix=' + param[i].leix);
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('lx=temp');
		params.push('dingdzt=' + dingdzt);
		params.push('dingdh=' + $('#il_dingdh').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateMxSl.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilorderEe").grid('reload');
			}
		});

	}
    
    /**
     *待生效订单行
     */
	function func_button_uneffect() {
		var params = [];
		//获得选中行参数
		var param = $('#ilorderEe').grid('getRecords');
		//判断是否有创建订单明细数据
		if (param.length == 0) {
			 alert("没有订单明细数据不能进行待生效操作，请添加订单明细！");
			 return false;
		  }else{
		    for ( var i = 0; i < param.length; i++) {
		    	if(param[i].id=="row_"||typeof param[i].id=="undefined"){
		      		alert("不能对表格里新增的记录进行待生效操作,请点击增加操作！");
		      		return ;   
		          }
		    }
		 }
		params.push('flag=0');
		params.push('lx=temp');
		params.push('bean.usercenter=' +$('#il_usercenter').fieldValue());
		params.push('bean.dingdh=' + $('#il_dingdh').fieldValue());
		params.push('bean.dingdzt=' + $('#il_dingdzt').fieldValue());
		params.push('bean.edit_time=' + $('#il_edit_time').fieldValue());
		params.push('bean.editor=' + $('#il_editor').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateLsStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				var map=result.result;
				alert(map.result);
				if("操作成功！"==map.result){
					$('#il_edit_time').fieldValue(map.edit_time);
					$('#il_dingdzt').fieldValue(map.zhuangt);
					$('#il_editor').fieldValue(map.editor);
				}
				$('#ilorderEe').grid('reload');
			}
		});
	}
    
     
	/**
	 *生效订单行
	 */
    function func_button_effect() {
		var params = [];
		//获列表中的第一条数据
		var param = $('#ilorderEe').grid('getRecords');
		if (param.length == 0) {
		       alert("没有订单明细数据不能进行生效操作，请添加订单明细！");
			   return false;
		  }else{
			  for ( var i = 0; i < param.length; i++) {
				   if(param[i].id=="row_"||typeof param[i].id=="undefined"){
				      alert("不能对表格里新增的记录进行生效操作,请点击增加操作！");
				      return ;   
				    }
			      }
		  }
	    params.push('flag=1');	
		params.push('lx=temp');
		params.push('bean.usercenter=' +$('#il_usercenter').fieldValue());
		params.push('bean.dingdh=' + $('#il_dingdh').fieldValue());
		params.push('bean.dingdzt=' + $('#il_dingdzt').fieldValue());
		params.push('bean.edit_time=' + $('#il_edit_time').fieldValue());
		params.push('bean.editor=' + $('#il_editor').fieldValue());

		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateLsStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				var map=result.result;
				alert(map.result);
				if("操作成功！"==map.result){
					$('#il_edit_time').fieldValue(map.edit_time);
					$('#il_dingdzt').fieldValue(map.zhuangt);
					$('#il_editor').fieldValue(map.editor);
				}
				$('#ilorderEe').grid('reload');
			}
		});

	}
    
    
    
	/**
	 *删除订单行
	 */
	function func_button_delete() {
		//修改选中的记录
		var param = $("#ilorderEe").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}
		var dingdzt = $('#il_dingdzt').fieldValue();
		if (dingdzt > 3) {
			alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
			return false;
		}
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].id=' + param[i].id);
			params.push('ddmx[' + i + '].lingjbh=' + param[i].lingjbh);
			params.push('ddmx[' + i + '].gongysdm=' + param[i].gongysdm);
			//params.push('ddmx[' + i + '].cangkdm=' + param[i].cangkdm);
			params.push('ddmx[' + i + '].jiaofrq=' + param[i].jiaofrq);
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('lx=temp');
		params.push('dingdzt=' + dingdzt);
		params.push('dingdh=' + $('#il_dingdh').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/deleteDdMx.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilorderEe").grid('reload');
			}
		});

	}
</script>

<style type="text/css">
</style>
</t:html>