<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.queryTitle}">

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<% SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
 Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间
%>
</head>

<t:page i18n="i18n.xqjs.kdorder">

	<t:form id="kdorder_query" reset="NOT" submit="NOT">
		<t:grid id="grid_kdorder"
			idKeys="dingdh,dingdnr,ziyhqrq,editor,edit_time,usercenter" 
			caption="${i18n.queryTitle}" showNum="true" selectRowEvent="xqjsRowSelect_kd" multiple="true" back="NOT"
			editAlias="DingdUpdate" src="/kdorder/queryKDorderForShengx.ajax"
			usePager="true" add="NOT" remove="NOT" edit="NOT" load="false"
			showCheckbox="true" scrollHeight="233"> 
			<t:fieldLayout id="sq_select" prefix="kd" columns="4">
				<t:fieldSelect property="dingdlx" caption="${i18n.dingdlx}"
					convert="dingdlx" width="100" defaultValue=""></t:fieldSelect>
				<t:fieldText property="dingdh" caption="${i18n.dingdh}"
					maxLength="9" width="100"></t:fieldText>
				<t:fieldText property="gongysdm" caption="${i18n.gongysdm}"
					maxLength="10" minLength="1" width="100"></t:fieldText>
				<t:fieldText property="fahzq" caption="${i18n.fahzq}" maxLength="6"
					minLength="6" width="100"></t:fieldText>
				<t:fieldText property="editor" caption="${i18n.dingdwhr}"
					maxLength="7" minLength="0" width="100"></t:fieldText>
				<t:fieldSelect property="dingdzt" caption="${i18n.dingdzt}"
					convert="queryDingdzt" width="100"></t:fieldSelect>
				<t:fieldCalendar property="heth" caption="${i18n.dingdjssj}"
					format="yyyy-MM-dd HH:mm:ss" width="100" ></t:fieldCalendar>
				<t:fieldCalendar property="jislx" caption="${i18n.zhi}"
					format="yyyy-MM-dd HH:mm:ss" width="100" ></t:fieldCalendar>
					
				<t:fieldCalendar property="dingdnr" caption="${i18n.dingdsxsj}"
					format="yyyy-MM-dd HH:mm:ss" width="100" ></t:fieldCalendar>
				<t:fieldCalendar property="beiz" caption="${i18n.zhi}"
					format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				
			</t:fieldLayout>
			<input type="hidden" id="kdDingdnr" value="${dingdnr }" />
			<%-- <t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" /> --%>
			<t:gridCol property="dingdh" type="link" caption="${i18n.dingdh}"></t:gridCol>
			<t:gridCol property="dingdlx" caption="${i18n.dingdlx}"
				convert="queryDingdlx"></t:gridCol>
			<t:gridCol property="gongysdm" type="text" caption="${i18n.gongysdm}"></t:gridCol>
			<t:gridCol property="fahzq" type="text" caption="${i18n.fahzq}"></t:gridCol>
			<t:gridCol property="editor" type="text" caption="${i18n.dingdwhr}"></t:gridCol>
			<t:gridCol property="dingdzt" type="text" caption="${i18n.dingdzt}"
				convert="queryDingdzt"></t:gridCol>
			<t:gridCol property="shifyjsyhl" type="text" caption="${i18n.shifyjsyhl}"
				convert="queryShifyjsyhl"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}"
				property="dingdjssj" type="text" caption="${i18n.dingdjssj}" ></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}"
				property="dingdsxsj" type="text" caption="${i18n.dingdsxsj}"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}"
				property="dingdfssj" type="text" caption="${i18n.dingdfssj}"></t:gridCol>
		</t:grid>
	</t:form>

	<t:form dialog="true" id="form_kdorder" caption="${i18n.insert_1}"
		submit="NOT">
		<input type="hidden" name="deffent" value="1" id="deffent" />

		<div id="dingdlx_1">
			<t:fieldLayout prefix="kdorder" id="lx_kdorder">
				<t:fieldText property="dingdh" caption="${i18n.dingdh}"
					maxLength="8"></t:fieldText>
				<t:fieldSelect property="dingdlx" caption="${i18n.dingdlx}"
					convert="cacheDingdlx"></t:fieldSelect>
			</t:fieldLayout>
		</div>
		<t:fieldLayout prefix="kdorder" id="add_kdorder">
			<t:fieldText property="gongysdm" caption="${i18n.gongysdm}"
				maxLength="10" width="150"></t:fieldText>
			<t:fieldText property="heth" caption="${i18n.heth}" maxLength="20"
				width="150"></t:fieldText>
			<t:fieldText property="dingdnr" caption="${i18n.dingdnr}"
				maxLength="5" width="150"></t:fieldText>
			<t:fieldText property="fahzq" caption="${i18n.fahzq}" maxLength="6"
				width="150"></t:fieldText>
			<t:fieldText property="editor" caption="${i18n.dingdwhr}"
				maxLength="7" width="150"></t:fieldText>
			<t:fieldSelect property="dingdzt" caption="${i18n.dingdzt}"
				convert="dingdzt" width="150"></t:fieldSelect>
				
			<t:fieldCalendar property="dingdjssj" format="yyyy-MM-dd HH:mm:ss"
				caption="${i18n.dingdjssj}" width="150"></t:fieldCalendar>
			<t:button caption="${i18n.insert_1}" name="btnSubmit"></t:button>
		</t:fieldLayout>



	</t:form>


	<t:fieldLayout>
		<t:buttons id="insert_1">
			<t:button name="dsx" caption="${i18n.dsx}"></t:button>
			<t:button name="insert_1" caption="${i18n.shengx}"></t:button>
			<t:button name="insert_2" caption="${i18n.kefs}"></t:button>
		</t:buttons>
	</t:fieldLayout>

</t:page>

<script type="text/javascript">
	$(function(){
		var htmls = [
			'<div class="youi-button active-3" id="button_expxls">'
			,'<div class="right">'
			,'<div class="center">'
			,'<a class="expxls" href="#">${i18n.exldaoc}</a>'
			,'</div></div></div>'
		] 
		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
		$('#button_expxls').click(func_grid_expxls);


	});
	$.sdcui.serverConfig.convertArray['dingdlx'] = {
		'1' : '${i18n.kdlx}',
		'2' : '${i18n.aixlx}',
		'4' : '${i18n.teslx}'
	};

	
	
	
	function createCheckBox(){
		return "<input  name='choices'  type='CheckBox' value='0'/>";
	}
	
	
	
	
	function func_grid_expxls(event) { 
		var records = $('#grid_kdorder').grid('getSelectedRecords');
		var dingdh = "";
		var dingdlx = "";
		var gongysdm = "";
		var fahzq = "";
		var editor = "";
		var dingdzt = "";
		var dingdnr = "";
		var jislx = "";
		var beiz = "";
		var heth = "";
		if(records.length!=0){
			for(var i=0;i<records.length;i++){
				if(i==records.length-1){
				   dingdh +=""+records[i].dingdh+"";
				   break;
				}
				dingdh +=""+records[i].dingdh+",";
			}
		}else{
		 dingdlx = $('#kd_dingdlx').fieldValue();
		 dingdh = $('#kd_dingdh').fieldValue();
		 gongysdm = $('#kd_gongysdm').fieldValue();
		 fahzq = $('#kd_fahzq').fieldValue();
		 editor = $('#kd_editor').fieldValue();
		 dingdzt = $('#kd_dingdzt').fieldValue();
		 dingdnr = $('#kd_dingdnr').fieldValue();
		 jislx = $('#kd_jislx').fieldValue();
		 beiz = $('#kd_beiz').fieldValue();
		 heth = $('#kd_heth').fieldValue();
		}
		$.sdcui.pageUtils.goPage({
			url : '/kdorder/kdDingdDownLoadFile.do?dingdlx=' + dingdlx
					+ '&dingdh=' + dingdh + '&gongysdm=' + gongysdm + '&fahzq='
					+ fahzq + '&editor=' + editor +'&dingdzt='+dingdzt+'&dingdnr='+dingdnr+'&jislx='+jislx+'&beiz='+beiz+'&heth='+heth,//url
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;


	   
	}

	function func_button_dsx() {
		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');
		if (kdorder.length == 0) {
			alert("${i18n.xuanzts}");
			return false;
		}
		var params = [];
		for ( var i = 0, len = kdorder.length; i < len; i++) {
			if (kdorder[i].dingdzt != 1) {
				alert("${i18n.zhizuoztts}");
				return false;
			}
			params.push('dd[' + i + '].usercenter=' + kdorder[i].usercenter);
			params.push('dd[' + i + '].dingdh=' + kdorder[i].dingdh);
			params.push('dd[' + i + '].dingdzt=' + kdorder[i].dingdzt);
			params.push('dd[' + i + '].edit_time=' + kdorder[i].edit_time);
			params.push('dd[' + i + '].editor=' + kdorder[i].editor);
		}
		params.push('flag=0');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateDaStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#grid_kdorder").grid('reload');
			}
		});
	}

	function func_button_insert_1() {
		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');
		if (kdorder.length == 0) {
			alert("${i18n.xuanzts}");
			return false;
		}
		var params = [];
		for ( var i = 0, len = kdorder.length; i < len; i++) {
			if (kdorder[i].dingdzt != 2) {
				alert("${i18n.shengxiaoztts}");
				return false;
			}
			params.push('dd[' + i + '].dingdh=' + kdorder[i].dingdh);
			params.push('dd[' + i + '].dingdzt=' + kdorder[i].dingdzt);
			params.push('dd[' + i + '].edit_time=' + kdorder[i].edit_time);
			params.push('dd[' + i + '].editor=' + kdorder[i].editor);
		}
		params.push("flag=1");
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/updateDaStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$('#grid_kdorder').grid('reload');
			}
		});

	}

	function func_button_insert_2() {
		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');
		if (kdorder.length == 0) {
			alert("${i18n.xuanzts}");
			return false;
		}
		var params = [];
		for ( var i = 0, len = kdorder.length; i < len; i++) {
			if (kdorder[i].dingdzt != 4 || kdorder[i].shifyjsyhl != 1) {
				alert("${i18n.fasongts}");
				return false;
			}
			params.push('dingd[' + i + '].dingdh=' + kdorder[i].dingdh);
			params.push('dingd[' + i + '].edit_time=' + kdorder[i].edit_time);
			params.push('dingd[' + i + '].editor=' + kdorder[i].editor);
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/sendOrder.ajax",
			data : params.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					$("#grid_kdorder").grid('reload');
				}
			}
		});
	}

	function func_button_delete() {
		var param = [];

		var kdorder = $('#grid_kdorder').grid('getSelectedRecords');

		if (kdorder.length == 0) {

			alert('${i18n.js_selected}');

			return false;

		}

		window.confirm("${i18n.js_delete}？");

		for ( var i = 0; i < kdorder.length; i++) {

			param.push('delete[' + i + '].dingdh=' + kdorder[i].dingdh);

			param.push('delete[' + i + '].dingdzt=' + kdorder[i].dingdzt);

		}

		//修改ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/deleteKDorder.ajax",
			data : param.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					$("#grid_kdorder").grid('reload');
				}
			}
		});
	}

	function func_button_update() {

		var kdorder = $('#grid_kdorder').grid('getBatchRecords');

		if (kdorder.length == 0) {

			alert('${i18n.js_selected}');

			return false;

		}

		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/updateKDorder.ajax",
			data : kdorder.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					$("#grid_kdorder").grid('reload');
				}
			}
		});
	}

	function func_button_btnSubmit() {
		var param = [];
		var deffent = $('#deffent').val();
		var address = "";
		var message = "";
		//增加后点击提交
		//$("#form_kdorder").form('submit');
		if (deffent == 1) {
			var dingdh = $("#kdorder_dingdh").fieldValue().toUpperCase();
			var dingdlx = $("#kdorder_dingdlx").fieldValue();
			//订单号
			var eg_1 = /^\d{2}[P]\d{5}$/;
			if (!eg_1.test(dingdh) || dingdh.length != 8) {
				message += dingdh + "${i18n.data_style}！\n";
				// return false ;
			}
			param.push('dingdh=' + dingdh);
			address = "${ctx}/kdorder/insertKDorderNormal.ajax";
		} else {
			//若单击特殊订单按钮，则将订单类型设置为对应的value值1
			var dingdlx = '1';
			address = "${ctx}/kdorder/insertKDorderSpecial.ajax";
		}
		var gongysdm = $("#kdorder_gongysdm").fieldValue();
		var dingdnr = $("#kdorder_dingdnr").fieldValue();
		var fahzq = $("#kdorder_fahzq").fieldValue();
		var editor = $("#kdorder_editor").fieldValue();
		var dingdjssj = $("#kdorder_dingdjssj").fieldValue();
		var dingdzt = $("#kdorder_dingdzt").fieldValue();
		//订单类型
		var eg_2 = /^[0-9]$/;
		if (!eg_2.test(dingdlx) || dingdlx.length != 1) {
			message += dingdlx + "${i18n.data_style}！\n";
			// return false ;
		}
		//发货周期
		var eg_4 = /^\d{6}$/;
		if (!eg_4.test(fahzq) || fahzq.length != 6) {
			message += fahzq + "${i18n.data_style}！\n";
			// return false ;
		}
		param.push('dingdlx=' + dingdlx);
		param.push('gongysdm=' + gongysdm);
		param.push('dingdnr=' + dingdnr);
		param.push('dingdzt=' + dingdzt);
		param.push('fahzq=' + fahzq);
		param.push('editor=' + editor);
		param.push('dingdjssj=' + dingdjssj);

		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : param.join('&'),
			success : function(result) {
				if (result.msg != null) {
					alert(result.msg);
					$("#grid_kdorder").grid('reload');
					$("#form_kdorder").form('close');
				}
			}
		});

	}
	/**
	 *订单号链接点击事件
	 */
	function link_dingdh(event) {
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_kdorder').grid('getRecord', rowDoc);//获取当前行对应的记录
		/**
		 * form跳转模式提交
		 */
		
		winOpen = window.open ('${ctx}/kdorder/initAixdd.do?removeId=layout-north,layout-west,layout-south&dingdlx='+record.dingdlx+'&dingdh='+record.dingdh+'&dingdnr='+record.dingdnr+
		'&dingdzt='+record.dingdzt+'&gongysdm='+record.gongysdm+
		'&usercenter='+record.usercenter+'&ziyhqrq='+record.ziyhqrq,
		'${i18n.maoxuqmx}','top=0,left=0,toolbar=no,menubar=no,scrollbars=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		return false;
		}
	
	/**
	 *选择行的事件回调 只有选中复选框时，才会选择这一行；点击这一行的其他数据时，不会选择这一行
	 */
	function xqjsRowSelect_kd(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		if($(checkbox).parent().attr('class') == 'checkbox'){
			return true;
		}else if($(checkbox).parent().attr('class') == 'radio'){
			return true;
		}
		return false;
	}
</script>
</t:html>