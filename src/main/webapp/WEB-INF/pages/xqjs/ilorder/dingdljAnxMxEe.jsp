<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单零件修改">
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
	<t:panel id="ddd">

		<t:grid id="ilorderEe" idKeys="id,dingdh,gongysdm,usercenter,edit_time,editor,p0fyzqxh" caption="" showCheckbox="true" editAlias="DingdUpdate" src="/ilorder/queryDdmx.ajax" usePager="true"
			edit="NOT" load="true" add="NOT" remove="NOT" scrollHeight="468" pageSize="20" >
			<t:fieldLayout id="ilselect" prefix="il" columns="3">
				<t:fieldText property="lingjbh" caption="零件号" width="120" maxLength="10" minLength="10"></t:fieldText>
				<t:fieldText property="keh" caption="客户" width="120" minLength="3"></t:fieldText>
				<t:fieldSelect property="sj" caption="时间" width="120" convert="shij"></t:fieldSelect>
				<t:fieldCalendar property="start" width="120" format="yyyy-MM-dd HH:mm"></t:fieldCalendar>
				<t:fieldCalendar property="end" width="120" caption="至" format="yyyy-MM-dd HH:mm"></t:fieldCalendar>
				<t:fieldText property="jihyz" caption="计划员组" width="120" maxLength="3" minLength="3"></t:fieldText>
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="dingdh"></t:fieldHidden>
				<t:fieldHidden property="gongysdm"></t:fieldHidden>
				<t:fieldHidden property="ljid"></t:fieldHidden>
				<t:fieldHidden property="lingjh"></t:fieldHidden>
				<t:fieldHidden property="dingdzt"></t:fieldHidden>
				<t:fieldHidden property="prqfw"></t:fieldHidden>
				<t:fieldHidden property="pn"></t:fieldHidden>
				<t:fieldHidden property="gonghms"></t:fieldHidden>
				<t:fieldHidden property="dingdnr"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="dingdh" caption="订单号"></t:gridCol>
			<t:gridCol property="usercenter" caption="用户中心"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件号"></t:gridCol>
			<t:gridCol property="gongysdm" type="text" caption="供应商代码"></t:gridCol>
			<t:gridCol property="gonghlx" type="text" caption="供货模式"></t:gridCol>
			<t:gridCol property="fahd" type="text" caption="发货地"></t:gridCol>
			<t:gridCol property="keh"  type="text" caption="客户"></t:gridCol>
			<t:gridCol property="uabzlx" type="text" caption="UA包装类型"></t:gridCol>
			<t:gridCol property="uabzrl" type="text" caption="UA包装容量"></t:gridCol>
			<t:gridCol property="uabzucsl" type="text" caption="包装个数"></t:gridCol>
			<t:gridCol property="uabzuclx" type="text" caption="UC包装类型"></t:gridCol>
			<t:gridCol property="uabzucrl" type="text" caption="UC包装容量"></t:gridCol>
			<t:gridCol property="shul" type="text" caption="零件数量" editor="fieldText"
				editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"></t:gridCol>
			<t:gridCol property="zuiwdhsj" type="text" caption="预计交付时间" editor="fieldCalendar" editorOptions="{'notNull':true,format:'yyyy-MM-dd HH24:mm'}"></t:gridCol>
			<t:gridCol property="xiaohcsxsj" type="text" caption="预计上线时间" editor="fieldCalendar" editorOptions="{'notNull':true,format:'yyyy-MM-dd HH24:mm'}"></t:gridCol>
			<t:gridCol property="jihyz" type="text" caption="计划员组"></t:gridCol>
			<t:gridCol property="zhuangt" type="text" caption="状态" convert="ddzt"></t:gridCol>
			<t:gridCol property="beiz" type="text" caption="备注" editor="fieldText"></t:gridCol>

		</t:grid>
		<t:fieldLayout columns="1">
			<t:buttons id="btn">
				<t:button caption="添加" name="addmx" />
				<t:button caption="修改" name="edit" />
				<t:button caption="删除" name="delete" />
			</t:buttons>
		</t:fieldLayout>

		<t:form id="ilAddDdmx" dialog="true" caption="新增" submit="NOT">
			<t:fieldLayout id='anxInsert' prefix="add">
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldText property="dingdh" caption="订单号" width="150" readonly="true"></t:fieldText>
				<t:fieldSelect property="gongysdm" caption="供应商代码" width="150" readonly="true"></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="零件号" width="150" maxLength="10"></t:fieldText>
				<t:fieldText property="fahd" caption="发货地" width="150" readonly="true"></t:fieldText>
				<t:fieldText property="keh" caption="客户" width="150" notNull="true"></t:fieldText>
				<t:fieldText property="uabzlx" caption="UA包装类型" width="150" readonly="true" notNull="true"></t:fieldText>
				<t:fieldText property="uabzrl" caption="UA包装容量" width="150" readonly="true" notNull="true"></t:fieldText>
				<t:fieldText property="uabzucrl" caption="UC包装容量" width="150" readonly="true" notNull="true"></t:fieldText>
				<t:fieldText property="uabzuclx" caption="UC包装类型" width="150" readonly="true"></t:fieldText>
				<t:fieldText property="uabzucsl" caption="包装个数" width="150" readonly="true" notNull="true"></t:fieldText>
				<t:fieldHidden property="danw" caption="零件单位"></t:fieldHidden>
				<t:fieldText property="shul" caption="零件数量" width="150" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位10位，小数部分最大位3位'></t:fieldText>
				<t:fieldCalendar property="xiaohsj" caption="预计消耗时间" width="150" format="yyyy-MM-dd HH:mm"></t:fieldCalendar>
				<t:fieldCalendar property="zuiwdhsj" caption="预计交付时间" width="150" format="yyyy-MM-dd HH:mm" notNull="true"></t:fieldCalendar>
				<t:fieldCalendar property="xiaohcsxsj" caption="预计上线时间" width="150" format="yyyy-MM-dd HH:mm" notNull="true"></t:fieldCalendar>
				<t:button caption="提交" name="subAdd"></t:button>
			</t:fieldLayout>
		</t:form>
	</t:panel>
</t:page>


<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['ddzt'] = {
		'0' : '已定义',
		'1' : '制作中',
		'2' : '待生效',
		'3' : '拒绝',
		'4' : '已生效',
		'5' : '已发送'
	};
	$.sdcui.serverConfig.convertArray['shij'] = {
		'0' : '预计交付',
		'1' : '消耗时间'
	};
	$.sdcui.serverConfig.convertArray['gonghms'] = {
		'C1' : 'C1',
		'CD' : 'CD',
		'M1' : 'M1',
		'MD' : 'MD'
	};
	function func_button_addmx() {
		var dingdzt = $('#il_dingdzt').fieldValue();
		if (dingdzt > 2) {
			alert("只能对已定义、制作中、待生效的订单进行操作！");
			return false;
		}
		$("#ilAddDdmx").form('clear');
		var usercenter = $('#il_usercenter').fieldValue();
		var dingdh = $('#il_dingdh').fieldValue();
		var gongysdm = $('#il_gongysdm').fieldValue();
		var lingjh = $('#il_lingjh').fieldValue() == '' ? $('#il_lingjbh')
				.fieldValue() : $('#il_lingjh').fieldValue();
		$('#add_gongysdm').fieldValue(gongysdm);
		$('#add_dingdh').fieldValue(dingdh);
		$('#add_lingjbh').fieldValue(lingjh);
		$('#add_usercenter').fieldValue(usercenter);
		//判断供货类型
		var gonghlx = $('#il_gonghlx').fieldValue();
		//如果供货类型为CD,MD,则只填消耗时间,推算到货时间,上线时间等
		if(gonghlx == 'CD' || gonghlx == 'MD'){
			//$('#fieldText-add_zuiwdhsj').hide();
			$('#add_zuiwdhsj').hide();
			$('#add_zuiwdhsj').parent().prev().find('label').hide();
			//$('#fieldText-add_xiaohcsxsj').hide();
			$('#add_xiaohcsxsj').hide();
			$('#add_xiaohcsxsj').parent().prev().find('label').hide();
			//如果供货类型为C1,M1,去掉上线时间、消耗时间，只填到货时间。
		}else if(gonghlx == 'C1' || gonghlx == 'M1' || gonghlx == 'MJ' || gonghlx == 'CV'|| gonghlx == 'MV'){
			//$('#fieldText-add_xiaohsj').hide();
			$('#add_xiaohsj').hide();
			$('#add_xiaohsj').parent().prev().find('label').hide();
			//$('#fieldText-add_xiaohcsxsj').hide();
			$('#add_xiaohcsxsj').hide();
			$('#add_xiaohcsxsj').parent().prev().find('label').hide();
		}
		$("#ilAddDdmx").form('open');
	}

//填写零件号失去焦点事件
  $(function() {
		$('#add_lingjbh').bind('focusout', function() {
			var usercenter = $('#add_usercenter').fieldValue();
			var lingjbh = $('#add_lingjbh').fieldValue();
			var gongysdm = $('#add_gongysdm').fieldValue();
			if(lingjbh==''){
			   alert("零件编号不能为空！");
			   return false;
			}
			$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/kdorder/getrl.ajax",
					data : "lingjbh="+ lingjbh+"&usercenter="+usercenter+"&gongysbh="+gongysdm,
					success : function(result) {
						if (result.flag != null&&(result.msg=='ljgongys'||result.msg=='jihy')) {
						    $('#add_lingjbh').attr("error","【零件号】输入有误");
							alert(result.flag);
						} else {
						    $('#add_lingjbh').removeAttr("error"); 
						    var uabzrl = "";
							if (result.uabzucrl != null && result.uabzucsl != null
									&& result.uabzucrl != "" && result.uabzucsl != "") {
								uabzrl = result.uabzucrl * result.uabzucsl;
							}
							$("#add_uabzuclx").fieldValue(result.uabzuclx);
							$("#add_uabzucrl").fieldValue(result.uabzucrl);
							$("#add_uabzucsl").fieldValue(result.uabzucsl);
							$("#add_uabzlx").fieldValue(result.uabzlx);
							$("#add_uabzrl").fieldValue(uabzrl);
							$("#add_jihyz").fieldValue(result.jhy);
							$("#add_danw").fieldValue(result.danw);
						}
					}
				});
		})
	})
  
  
	
	 function editJiaoy(value){
  	    var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var bzrlIndex = $('td.uabzrl:first').prevAll().length;
		var bzrlStr = rowElement.find('td:eq('+bzrlIndex+')').text();
		if(bzrlStr!=""){
		    var yu = value%bzrlStr;
			if(yu>0){
			    $(cell).attr("title","请按包装取整").addClass("validate-error");
			}
		}
		
   }

/*	$(function() {
		$("#add_xiaohd").bind("focusout", function() {
			var params = [];
			var usercenter = $('#add_usercenter').fieldValue();
			var xiaohd = $('#add_xiaohd').fieldValue();
			var lingjbh = $('#add_lingjbh').fieldValue();
			params.push('usercenter=' + usercenter);
			params.push('xiaohdbh=' + xiaohd);
			params.push('lingjbh=' + lingjbh);
			if (xiaohd != '' && usercneter != '' && lingjbh != '') {
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/ilorder/validateXhd.ajax",
					data : params.join('&'),
					success : function(result) {
						var msg = result.result;
						if (typeof (msg) != 'undefined') {
							$('#add_xiaohd').attr("error", "【客户】(消耗点编号)输入有误");
							alert(msg);
						} else {
							$('#add_xiaohd').removeAttr("error");
						}

					}
				});

			}
		});
	})*/

	/**
	 *新增订单行
	
	 */
	function func_button_subAdd() {
		var params = [];
		var dingdh = $('#add_dingdh').fieldValue();
		var usercenter = $('#il_usercenter').fieldValue();
		var gongysdm = $('#add_gongysdm').fieldValue();
		var lingjbh = $('#add_lingjbh').fieldValue();
		var fahd = $('#add_fahd').fieldValue();
		var keh = $('#add_keh').fieldValue();
		var uabzucrl = $('#add_uabzucrl').fieldValue();
		var uabzuclx = $('#add_uabzuclx').fieldValue();
		var uabzucsl = $('#add_uabzucsl').fieldValue();
		var uabzlx = $('#add_uabzlx').fieldValue();
		var danw = $('#add_danw').fieldValue();
		var shul = $('#add_shul').fieldValue();
		var xiaohsj = $('#add_xiaohsj').fieldValue();
		var zuiwdhsj = $('#add_zuiwdhsj').fieldValue();
		var xiaohcsxsj = $('#add_xiaohcsxsj').fieldValue();
		var ghlx = $('#il_gonghms').fieldValue();
		var errorMessage = [];
		if (!$('#ilAddDdmx').form('validate')) {
			$('#ilAddDdmx').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			// $.sdcui.messageUtil.showError(errorMessage.join('\n'));
			// return;
		}
		if ($('#add_xiaohd[error]').length != 0) {
			var msg = $('#add_xiaohd').attr("error");
			$('#add_xiaohd').attr("class",
					"youi-field fieldText validate-error");
			errorMessage.push(msg);
		}
		if (xiaohsj == "" && zuiwdhsj == "" && xiaohcsxsj == "") {
			errorMessage.push("请选择消耗时间或选择预计交付时间和预计上线时间");
		}  else if (xiaohsj == "" && zuiwdhsj != "" && xiaohcsxsj == ""&& ghlx=='CD') {
			errorMessage.push("请选择预计上线时间");
		} else if (xiaohsj == "" && zuiwdhsj == "") {
			errorMessage.push("请选择预计交付时间");
		}else if(zuiwdhsj != ""){
		    xiaohsj = "";
		}

		if (errorMessage.length != 0) {
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
        var uabzrl = uabzucrl*uabzucsl;
	    var yu = shul%uabzrl;
		if(yu>0){
		    alert("请按包装取整");
		    return ;
		}
		params.push('usercenter=' + usercenter);
		params.push('gongysdm=' + gongysdm);
		params.push('dingdh=' + dingdh);
		params.push('lingjbh=' + lingjbh);
		params.push('fahd=' + fahd);
		if($('#il_gonghms').fieldValue()=='C1' || $('#il_gonghms').fieldValue()=='CV'){
		   params.push('cangkdm=' + keh);
		}else{
			params.push('xiaohd=' + keh);
		}
		params.push('keh=' + keh);
		params.push('uabzucrl=' + uabzucrl);
		params.push('uabzuclx=' + uabzuclx);
		params.push('uabzucsl=' + uabzucsl);
		params.push('uabzlx=' + uabzlx);
		params.push('uabzrl=' + uabzrl);
		params.push('danw=' + danw);
		params.push('shul=' + shul);
		params.push('leix=9');
		params.push('pn=p0');
		params.push('xiaohsj=' + xiaohsj);
		params.push('zuiwdhsj=' + zuiwdhsj);
		params.push('xiaohcsxsj=' + xiaohcsxsj);
		params.push('gonghlx=' + $('#il_gonghms').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/addBppMx.ajax",
			data : params.join('&'),
			success : function(result) {
				if (result.msg != null) {
					alert(result.msg);
					$("#ilAddDdmx").form('close');
					$("#ilorderEe").grid('reload');
					window.opener.gridReload();
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
		//修改选中的记录
		var param = $("#ilorderEe").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}
		var dingdzt = $('#il_dingdzt').fieldValue();
		if (dingdzt > 2) {
			alert("只能对已定义、制作中、待生效的订单进行操作！");
			return false;
		}
		var error = $('#ilorderEe').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].id=' + param[i].id);
			params.push('ddmx[' + i + '].shul=' + param[i].shul);
			params.push('ddmx[' + i + '].zuiwdhsj=' + param[i].zuiwdhsj);
			params.push('ddmx[' + i + '].xiaohcsxsj=' + param[i].xiaohcsxsj);
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('usercenter=' + $('#il_usercenter').fieldValue());
		params.push('dingdh=' + $('#il_dingdh').fieldValue());
		params.push('lingjbh=' + param[0].lingjbh);
		params.push('pn=p0');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateMxSl.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilorderEe").grid('reload');
				window.opener.gridReload();
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
		if (dingdzt > 2) {
			alert("只能对已定义、制作中、待生效的订单进行操作！");
			return false;
		}
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].dingdh=' + param[i].dingdh);
			params.push('ddmx[' + i + '].gongysdm=' + param[i].gongysdm);
			params.push('ddmx[' + i + '].lingjbh=' + param[i].lingjbh);
			params.push('ddmx[' + i + '].gonghlx=' + param[i].gonghlx);
			params.push('ddmx[' + i + '].id=' + param[i].id);
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('usercenter=' + $('#il_usercenter').fieldValue());
		params.push('ljid=' + $('#il_ljid').fieldValue());
		params.push('dingdh=' + $('#il_dingdh').fieldValue());
		params.push('lingjbh=' + param[0].lingjbh);
		params.push('pn=' + $('#il_pn').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/deleteDdMx.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilorderEe").grid('reload');
				window.opener.gridReload();
			}
		});

	}
</script>

<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
</style>
</t:html>