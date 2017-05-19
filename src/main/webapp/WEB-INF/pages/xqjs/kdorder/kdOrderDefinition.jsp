<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.queryTitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.kdorder">
     <t:form id="kdForm" submit="NOT" reset="NOT">
		<t:grid id="grid_kdorder" idKeys="dingdh,usercenter"
			caption="${i18n.queryTitle}" showNum="true" selectRowEvent="xqjsRowSelect" back="NOT" 
			editAlias="DingdUpdate" src="/kdorder/queryKDorder.ajax" 
			 add="NOT" remove="NOT" edit="NOT" load="false" multiple="true"
			 scrollHeight="230" >
			<t:fieldLayout id="sq_select" prefix="kd" columns="3">
				<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"
					convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" ></t:fieldSelect>
				<t:fieldText property="fahzq" caption="${i18n.fahzq}" width="150" dataType="integer" maxLength="6"></t:fieldText>
				<t:fieldText property="dingdh" caption="${i18n.dingdh}" width="150" maxLength="8"></t:fieldText>
				<t:fieldText property="editor" caption="${i18n.dingdwhr}" width="150" maxLength="16"></t:fieldText>
				<t:fieldHidden property="whr"></t:fieldHidden>
				<t:fieldHidden property="zt" defaultValue="${i18n.yidy}"></t:fieldHidden>
				<t:fieldHidden property="tszt" defaultValue="${i18n.zhizz}"></t:fieldHidden>
				<t:fieldSelect property="dingdlx" caption="${i18n.dingdlx}"
					convert="dingdlx" width="150" notNull="true" defaultValue="1"></t:fieldSelect>
				<t:fieldSelect property="dingdzt" caption="${i18n.dingdzt}"
					convert="queryDingdzt" width="150"></t:fieldSelect>
				<t:fieldCalendar property="heth" caption="${i18n.dingysj}"
					format="yyyy-MM-dd HH:mm:ss" width="150"></t:fieldCalendar>
				<t:fieldCalendar property="jislx" caption="${i18n.zhi}"
					format="yyyy-MM-dd HH:mm:ss" width="150" ></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
			<t:gridCol property="dingdh"  caption="${i18n.dingdh}"></t:gridCol>
			<t:gridCol  property="dingdlx"
				caption="${i18n.dingdlx}" convert="dingdlx" ></t:gridCol>
			<t:gridCol editor="fieldText" property="gongysdm"
				caption="${i18n.gongysdm}" editorOptions="{closeEvent:func_set_gysdm}"></t:gridCol>
			<t:gridCol editor="fieldText" property="dingdnr"  editorOptions="{'notNull':'true','expression':'(^[9]+[8]*){1,5}$', 'expressionMessage':'${i18n.lenghtmessage}'}"
				caption="${i18n.dingdnr}"></t:gridCol>
			<t:gridCol editor="fieldText" property="jiszq" editorOptions="{'format':'yyyyMM','notNull':'true','expression':'^([0-9]*){6}$', 'expressionMessage':'${i18n.riqimessage}'}"
				caption="${i18n.jiszq}"></t:gridCol>
			<t:gridCol editor="fieldText" property="fahzq"
				caption="${i18n.fahzq}"   editorOptions="{'expression':'^([0-9]){6}$', 'expressionMessage':'${i18n.zhouqimessage}'}"></t:gridCol><!-- editorOptions="{'notNull':true,'expression':'^\d{6}$', 'expressionMessage':'6位日期'}" -->
			<t:gridCol property="editor"
				caption="${i18n.dingdwhr}"></t:gridCol>
			<t:gridCol 
				editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}"
				property="dingdjssj" caption="${i18n.dingysj}"></t:gridCol>
			<t:gridCol  property="dingdzt"
				caption="${i18n.dingdzt}" convert="queryDingdzt"></t:gridCol>
		</t:grid>
     </t:form>
     
	<t:form dialog="true" id="form_kdorder" caption="${i18n.insert_1}" 
		submit="NOT">
		<input type="hidden" name="deffent" value="1" id="deffent" />
		<t:fieldLayout prefix="kdorder" id="add_kdorder">
				<t:fieldText property="dingdh" caption="${i18n.dingdh}"
					maxLength="8" notNull="true" width="150"></t:fieldText>
			<t:fieldSelect property="dingdlx" caption="${i18n.dingdlx}" convert="dingdlx" notNull="true" width="150" defaultValue="1">
			     
			</t:fieldSelect>
			<t:fieldSelect property="gongysdm" caption="${i18n.gongysdm}"  notNull="true" width="150" src="/kdorder/getGysGroup.ajax" parents="usercenter,dingdlx"  show="gcbh" code="gcbh"></t:fieldSelect>
			<t:fieldText property="dingdnr" caption="${i18n.dingdnr}"  maxLength="5"  expression="(^[9]+[8]*){1,5}$" expressionMessage="${i18n.lenghtmessage}"
				notNull="true" width="150" ></t:fieldText>
			<t:fieldText property="jiszq" caption="${i18n.jiszq}" notNull="true" expression="^[0-9]{6}$" expressionMessage="${i18n.riqimessage}" width="150" maxLength="6"></t:fieldText>	
			<t:fieldText property="fahzq" caption="${i18n.fayzq}" notNull="true" expression="^[0-9]{6}$" expressionMessage="${i18n.riqimessage}" width="150" maxLength="6"></t:fieldText>
			<t:fieldText property="editor" caption="${i18n.dingdwhr}"
				maxLength="16" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="dingdzt" caption="${i18n.dingdzt}"
				notNull="true" width="150" readonly="true"></t:fieldText>
			
			<t:button caption="${i18n.insert_1}" name="btnSubmit"></t:button>
		</t:fieldLayout>
		</t:form>
		
		
	<t:form dialog="true" id="form_kdorder2" caption="${i18n.teshudingd}" 
		submit="NOT">
		<input type="hidden" name="deffent" value="2" id="deffent" />
		<t:fieldLayout prefix="kdorder2" id="add_kdorder2">
			<t:fieldText property="dingdlx" caption="${i18n.dingdlx}" maxLength="8" notNull="true" width="150" readonly="true"></t:fieldText>
			<t:fieldSelect property="gongysdm" caption="${i18n.gongysdm}" notNull="true" width="150" src="/kdorder/getGysGroup.ajax" parents="usercenter,dingdlx"  show="gcbh" code="gcbh"></t:fieldSelect>
			<t:fieldText property="dingdnr" caption="${i18n.dingdnr}" maxLength="2"  expression="([9]){1,2}$" expressionMessage="${i18n.teshulenghtmessage}"
				notNull="true" width="150" ></t:fieldText>
			<t:fieldText property="jiszq" caption="${i18n.jiszq}" notNull="true" expression="^[0-9]{6}$" expressionMessage="${i18n.riqimessage}" width="150" maxLength="6"></t:fieldText>	
			<t:fieldText property="fahzq" caption="${i18n.fayzq}" notNull="true" expression="^[0-9]{6}$" expressionMessage="${i18n.riqimessage}" width="150" maxLength="6"></t:fieldText>	
			
			<t:fieldText property="editor" caption="${i18n.dingdwhr}"
				maxLength="16" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="dingdzt" caption="${i18n.dingdzt}"
				notNull="true" width="150" readonly="true"></t:fieldText>

			<t:button caption="${i18n.insert_1}" name="btnSubmit2"></t:button>
		</t:fieldLayout>
	</t:form>
			<t:buttons id="insert_1">
				<t:button name="insert_1" caption="${i18n.insert_1}"></t:button>
				<t:button name="insert_2" caption="${i18n.insert_2}"></t:button>
				<t:button name="delete" caption="${i18n.delete}"></t:button>
				<t:button name="update" caption="${i18n.update}"></t:button>
				<t:button name="change" caption="${i18n.change}"></t:button>
			</t:buttons>
<div style="display: none;"></div>
</t:page>

<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['dingdlx'] = {
		'1' : '${i18n.kdlx}',
		'2' : '${i18n.aixlx}',
		'4' : '${i18n.teslx}'
	};
    
	function createCheckBox(){
		return "<input  name='choices'  type='CheckBox' value='0'/>";
	}
	
	
	function func_button_insert_1() {
		$('#form_kdorder').form('clear');
		$("#kdorder_editor").fieldValue($("#kd_whr").fieldValue());
		$("#kdorder_dingdzt").fieldValue($("#kd_zt").fieldValue());
		$("#kdorder_dingdnr").fieldValue("98888");
		$('#form_kdorder').form('open');

	}

	function func_button_insert_2() {
		$('#form_kdorder2').form('clear');
		$("#kdorder2_editor").fieldValue($("#kd_whr").fieldValue());
		$("#kdorder2_dingdzt").fieldValue($("#kd_tszt").fieldValue());
		$("#kdorder2_dingdnr").fieldValue("9");
		$("#kdorder2_dingdlx").fieldValue("${i18n.teslx}");
		$('#form_kdorder2').form('open');

	}


	function func_button_delete() {
		var param1 = [];
		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');
		if (kdorder.length == 0) {
			alert('${i18n.js_selected}');
			return false;
		}
		
		if(window.confirm("${i18n.js_delete}？")){
			for ( var i = 0; i < kdorder.length; i++) {
				param1.push('delete[' + i + '].dingdh=' + kdorder[i].dingdh);
				param1.push('delete[' + i + '].dingdzt=' + kdorder[i].dingdzt);
				if (kdorder[i].dingdzt != 0) {
					alert("${i18n.shancts}");
					$("#grid_kdorder").grid('reload');
					return false;
				}
			}
			//修改ajax请求       
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/kdorder/deleteKDorder.ajax",
				data : param1.join('&'),
				success : function(result) {
					if (result.flag != null) {
						alert(result.flag);
						$("#grid_kdorder").grid('reload');
					}
				}
			});
		}
	}


    function func_set_gysdm(){
       var  cell = this.col.cell;
	   var rowElement = cell.parent('tr:first');
	   var row = rowElement.prevAll().length;
	   var idkeys = $(rowElement).attr("id");
	   var usercenter = idkeys.substring(idkeys.lastIndexOf(",")+1);
	   var gongysdmIndex = $('td.gongysdm:first').prevAll().length;
	   var gysColomn = parseInt(gongysdmIndex)+1;
	   var gongysdm = rowElement.find('td:eq('+gongysdmIndex+')').text();
       $.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/validateGys.ajax",
				data : 'usercenter=' + usercenter + '&gongysdm=' + gongysdm,
				success : function(result) {
					var msg = result.msg;
					if (typeof (msg) != 'undefined'){
						alert(msg);
					    $('td.gongysdm:first').addClass("editing edited validate-error").attr("title","${i18n.di}"+row+"${i18n.hang},"+"${i18n.di}"+gysColomn+"${i18n.lie}"+msg);
					}else{
						if($('td.gongysdm:first editing edited validate-error')){
							$('td.gongysdm:first').removeClass("editing edited validate-error");
						}
					}
				}
			});
    
    }
    
    
	function func_button_update() {
		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');
		if (kdorder.length == 0) {
			alert('${i18n.js_selected}');
			return false;
		}
		var error = $('#grid_kdorder').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		var params = [];
		for ( var i = 0; i < kdorder.length; i++) {
			var usercenter = kdorder[i].usercenter;
			var gongysdm = kdorder[i].gongysdm;
			params.push('DingdUpdate[' + i + '].usercenter='+ kdorder[i].usercenter);
			params.push('DingdUpdate[' + i + '].dingdh=' + kdorder[i].dingdh);
			params.push('DingdUpdate[' + i + '].gongysdm='+ kdorder[i].gongysdm);
			params.push('DingdUpdate[' + i + '].dingdlx=' + kdorder[i].dingdlx);
			params.push('DingdUpdate[' + i + '].fahzq=' + kdorder[i].fahzq);
			params.push('DingdUpdate[' + i + '].jiszq=' + kdorder[i].jiszq);
			if (kdorder[i].editor != null) {
				params.push('DingdUpdate[' + i + '].editor='+ kdorder[i].editor);
			}
			params.push('DingdUpdate[' + i + '].dingdnr=' + kdorder[i].dingdnr);
			if (kdorder[i].dingdjssj != null) {
				params.push('DingdUpdate[' + i + '].dingdjssj='+ kdorder[i].dingdjssj);
			}
			if (kdorder[i].dingdzt != 0) {
				alert('${i18n.xiugts}');
				$("#grid_kdorder").grid('reload');
				return false;
			}
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/updateKDorder.ajax",
			data : params.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					$("#grid_kdorder").grid('reload');
				}
			}
		});
	}

	
	
	
	
	function func_button_btnSubmit() {
		var deffent = $('#deffent').val();
		var address = "";
		var message = "";
		var param1 = [];
		//增加后点击提交
		if (!$('#form_kdorder').form('validate')) {
			var errorMessage = [];
			$('#form_kdorder').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}

		var dingdh = $("#kdorder_dingdh").fieldValue().toUpperCase();
		var dingdlx = $("#kdorder_dingdlx").fieldValue();
		if (dingdh.length < 8) {
			alert("${i18n.dingdhcdts}");
			return false;
		}
		param1.push('dingdh=' + dingdh);
		address = "${ctx}/kdorder/insertKDorderNormal.ajax";
		var gongysdm = $("#kdorder_gongysdm").fieldValue();
		var dingdnr = $("#kdorder_dingdnr").fieldValue();
		var editor = $("#kdorder_editor").fieldValue();
		var dingdzt = 0;
		var jiszq = $("#kdorder_jiszq").fieldValue();
		var fahzq = $("#kdorder_fahzq").fieldValue();
		//if(!dingdlx==1&&zhizlx.toUpperCase()='97X'){
		//	alert('订单类型和制造路线不一致');
		//	}
		//	if(!dingdlx==2&&zhizlx.toUpperCase()='97D'){
		//		alert('订单类型和制造路线不一致');
		//	}
		param1.push('dingdlx=' + dingdlx);
		param1.push('gongysdm=' + gongysdm);
		param1.push('dingdnr=' + dingdnr);
		param1.push('dingdzt=' + dingdzt);
		param1.push('editor=' + editor);
		param1.push('jiszq=' + jiszq);
		param1.push('fahzq=' + fahzq);
		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : param1.join('&'),
			success : function(result) {
				 alert(result.msg);
				 if (result.msg == "${i18n.done}") {
						$("#form_kdorder").form('close');
						$("#grid_kdorder").grid('reload');
			     }
			}
		});
	}

	function func_button_btnSubmit2() {
		var params = [];
		var deffent = $('#deffent').val();
		var address = "";
		var message = "";
		//增加后点击提交
		if (!$('#form_kdorder2').form('validate')) {
			var errorMessage = [];
			$('#form_kdorder2').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		var dingdlx = '4';
		//若单击特殊订单按钮，则将订单类型设置为对应的value值1
		address = "${ctx}/kdorder/insertKDorderSpecial.ajax";

		var gongysdm = $("#kdorder2_gongysdm").fieldValue();
		var dingdnr = $("#kdorder2_dingdnr").fieldValue();
		var editor = $("#kdorder2_editor").fieldValue();
		var dingdzt = 1;
		var fahzq = $("#kdorder2_fahzq").fieldValue();
		var jiszq = $("#kdorder2_jiszq").fieldValue();

		//if(!dingdlx==1&&zhizlx.toUpperCase()='97X'){
		//	alert('订单类型和制造路线不一致');
		//	}
		//	if(!dingdlx==2&&zhizlx.toUpperCase()='97D'){
		//		alert('订单类型和制造路线不一致');
		//	}
		params.push('dingdlx=' + dingdlx);
		params.push('gongysdm=' + gongysdm);
		params.push('dingdnr=' + dingdnr);
		params.push('dingdzt=' + dingdzt);
		params.push('editor=' + editor);
		params.push('fahzq=' + fahzq);
		params.push('jiszq=' + jiszq);
		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : params.join('&'),
			success : function(result) {
					 alert(result.msg);
					 if (result.msg == "${i18n.done}") {
							$("#form_kdorder2").form('close');
							$("#grid_kdorder").grid('reload');
				     }
			}
		});
	}
	
	function func_button_change() {
		var param = [];
		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');
		if (kdorder.length == 0) {
			alert('${i18n.js_selected}');
			return false;
		}
		
		if(window.confirm("${i18n.js_change}？")){
			for ( var i = 0; i < kdorder.length; i++) {
				param.push('change[' + i + '].dingdh=' + kdorder[i].dingdh);
				param.push('change[' + i + '].dingdzt=' + kdorder[i].dingdzt);
				if (kdorder[i].dingdzt >= 4||kdorder[i].dingdlx==4) {
					alert("${i18n.changets}");
					$("#grid_kdorder").grid('reload');
					return false;
				}
			}
			//修改ajax请求       
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/kdorder/changeStats.ajax",
				data : param.join('&'),
				success : function(result) {			
						alert(result.result);
						$("#grid_kdorder").grid('reload');
				}
			});
		}
	}
</script>
</t:html>