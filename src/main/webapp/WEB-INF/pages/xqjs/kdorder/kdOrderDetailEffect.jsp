<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.queryTitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
</head>

<t:page i18n="i18n.xqjs.kdorder">

<input id="removeId" value="${removeId}" type="hidden"/>  
	<t:grid id="grid_kdorder" idKeys="dingdh,dingdnr,id,gongysdmid"
		caption="${i18n.queryTitle}" showNum="true" selectRowEvent="xqjsRowSelect" multiple="true"
		editAlias="DingdUpdate" src="/kdorder/queryKDorderForKd.ajax"
		usePager="true" add="NOT" remove="NOT" edit="NOT" load="true"
		dataFormId="form_kdorder" scrollHeight="444" pageSize="20">
	
		<t:fieldLayout id="sq_select" prefix="kd" columns="3">
			<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"
				convert="queryUserCenterMap" defaultValue=""></t:fieldSelect>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}"
				maxLength="10" minLength="9" width="150"></t:fieldText>
			<t:fieldSelect property="jihyz" caption="${i18n.jihyz}"
				convert="getJihz" width="150"></t:fieldSelect>
			<t:fieldHidden property="dingdh"></t:fieldHidden>
			<t:fieldHidden property="gongysdm"></t:fieldHidden>
			<t:fieldHidden property="jihyz1"></t:fieldHidden>
			<t:fieldHidden property="ziyhqrq"></t:fieldHidden>
			<t:fieldHidden property="dingdnr"></t:fieldHidden>
			<t:fieldHidden property="dingdzt"></t:fieldHidden>
			<t:fieldHidden property="dingdzzsj"></t:fieldHidden>
			<t:fieldHidden property="dingdlx"></t:fieldHidden>
			<t:fieldHidden property="id"></t:fieldHidden>
		</t:fieldLayout>
		<div style="font-size: 15px;">
			<div align="left">${i18n.lefttitle}:${p0fyzqxh}</div>
		</div>
		
		<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
		<t:gridCol property="dingdh" type="text" caption="${i18n.dingdh}"></t:gridCol>
		<t:gridCol property="usercenter" type="text"
			caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol property="gongysdm"  type="text" caption="${i18n.gongysdm}"></t:gridCol>
		<t:gridCol property="lingjbh" type="link" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol property="dinghcj" type="text" caption="${i18n.dinghcj}"></t:gridCol>
		<t:gridCol property="fahd" type="text" caption="${i18n.fahd}"
			editorOptions="{'notNull':'true','expression':'^[A-Z]{3}$','expressionMessage':'3位大写的字母'}"></t:gridCol>
		<t:gridCol property="baozsl" type="text" caption="${i18n.baozsl}"  renderer="showBaozsl"></t:gridCol>
		<t:gridCol property="uabzucrl" type="text" caption="${i18n.uabzucrl}"></t:gridCol>
		<t:gridCol property="uabzucsl" type="text" caption="${i18n.uabzucsl}"></t:gridCol>
		<t:gridCol property="heth" type="text" caption="${i18n.heth}"></t:gridCol>
		<t:gridCol editor="fieldText" property="p0sl" type="text" caption="p0"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol editor="fieldText" property="p1sl" type="text" caption="p1"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol editor="fieldText" property="p2sl" type="text" caption="p2"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol editor="fieldText" property="p3sl" type="text" caption="p3"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol editor="fieldText" property="p4sl" type="text" caption="p4"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol property="jihyz" type="text" caption="${i18n.jihyz}"></t:gridCol>
	</t:grid>


	<!-- 
				<t:fieldSelect property="usercenter" width="150" caption="用户中心"
				notNull="true" src="/kdorder/getUserCenter.ajax" show="usercenter"
				code="usercenter"></t:fieldSelect>
				 -->
	<t:form dialog="true" id="form_kdorder" caption="${i18n.insert_1}"
		submit="NOT">
		<t:fieldLayout prefix="kdorder" id="add_kdorder">
			<t:fieldText property="dingdh" caption="${i18n.dingdh}"
				readonly="true"></t:fieldText>
			<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"
				convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true"></t:fieldSelect>
			<t:fieldSelect property="gongysdm" caption="${i18n.gongysdm}"
				 notNull="true"  ></t:fieldSelect>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}"
				maxLength="10" notNull="true"></t:fieldText>
			<t:fieldText property="dinghcj" caption="${i18n.dinghcj}"
				readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="fahd" caption="${i18n.fahd}" readonly="true"></t:fieldText>
			<t:fieldText property="p0sl" caption="${i18n.p0}" notNull="true"
				expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'
				expressionMessage="${i18n.numbermessage}"></t:fieldText>
			<t:fieldText property="p1sl" caption="${i18n.p1}" notNull="true"
				expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'
				expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="p2sl" caption="${i18n.p2}" notNull="true"
				expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'
				expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="p3sl" caption="${i18n.p3}" notNull="true"
				expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'
				expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="p4sl" caption="${i18n.p4}" notNull="true"
				expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'
				expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="uabzucrl" caption="${i18n.uabzucrl}" readonly="true"></t:fieldText>
			<t:fieldText property="uabzucsl" caption="${i18n.uabzucsl}" readonly="true"></t:fieldText>
			<t:fieldText property="uabzrl" caption="${i18n.uabzrl}" readonly="true"></t:fieldText>
			<t:fieldText property="jihyz" caption="${i18n.jihyz}" readonly="true"></t:fieldText>
			<t:fieldHidden property="beihzq"></t:fieldHidden>
			<t:fieldHidden property="fayzq"></t:fieldHidden>
			<t:button caption="${i18n.insert_1}" name="btnSubmit"></t:button>
		</t:fieldLayout>
	</t:form>



	<t:fieldLayout>
		<t:buttons id="insert_1">
			<t:button name="insert_1" caption="${i18n.insert}"></t:button>
			<t:button name="update" caption="${i18n.update}"></t:button>
		</t:buttons>
	</t:fieldLayout>
</t:page>


<script>
	function Map() {
		 var struct = function(key, value) {
		  this.key = key;
		  this.value = value;
		 }
		 
		 var put = function(key, value){
		  for (var i = 0; i < this.arr.length; i++) {
		   if ( this.arr[i].key === key ) {
		    this.arr[i].value = value;
		    return;
		   }
		  }
		   this.arr[this.arr.length] = new struct(key, value);
		 }
		 
		 var get = function(key) {
		  for (var i = 0; i < this.arr.length; i++) {
		   if ( this.arr[i].key === key ) {
		     return this.arr[i].value;
		   }
		  }
		  return null;
		 }
		 
		 var remove = function(key) {
		  var v;
		  for (var i = 0; i < this.arr.length; i++) {
		   v = this.arr.pop();
		   if ( v.key === key ) {
		    continue;
		   }
		   this.arr.unshift(v);
		  }
		 }
		 
		 var size = function() {
		  return this.arr.length;
		 }
		 
		 var isEmpty = function() {
		  return this.arr.length <= 0;
		 } 
		 this.arr = new Array();
		 this.get = get;
		 this.put = put;
		 this.remove = remove;
		 this.size = size;
		 this.isEmpty = isEmpty;
	}

</script>
<script type="text/javascript">
 

$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
function a(v) {
	return 'a  a';
}
function createCheckBox(){
	return "<input  name='choices'  type='CheckBox' value='0'/>";
}


function func_grid_expxls() {
	var gongysdm = $('#kd_gongysdm').fieldValue();
	var usercenter = $('#kd_usercenter').fieldValue();
	var dingdh = $('#kd_dingdh').fieldValue();
	var jihyz = $('#kd_jihyz').fieldValue();
	$.sdcui.pageUtils.goPage({
		url : '/kdorder/kdDingdDetailDownload.do?usercenter=' + usercenter
				+ '&dingdh=' + dingdh + '&gongysdm=' + gongysdm + '&jihyz='
				+ jihyz ,//url
		mode : 'form',
		beforeSubmit : function() {
			//
			return true;
		}
	});
	event.stopPropagation();//阻止事件冒泡
	return false;
}


	$(document).ready(
			function() {
			   $("#kdorder_gongysdm").click(function() {
			        var element = $("div#field-pop-kdorder_gongysdm");
				    element.removeClass("loaded");
				    $("#kdorder_gongysdm").find('input.value').val("");
				    $("#kdorder_gongysdm").find('input.textInput').val("");
				    element.empty();
				      var usercenter = $("#kdorder_usercenter").fieldValue();
				      var gysdm = $("#kd_gongysdm").fieldValue();
				      if(usercenter==""){
				         alert("${i18n.usercts}");
				         return ;
				      }
				      		$.sdcui.ajaxUtil.ajax({
							url : '${ctx}/kdorder/getLikeGys.ajax',
							data : "usercenter="+usercenter+"&gongysbh="+gysdm,
							
							success : function(result) {
								 var arr = result.result;
								 for(var i=0;i<arr.length;i++){
								       element.append('<div class="option-item" value="'+arr[i].gongysbh+'">'+arr[i].gongysbh+'</div>');
								 }
								 element.addClass("loaded");
							}
						});
			   });
			    
			
				$("#kdorder_lingjbh").change(
						function() {
							var usercenter = $("#kdorder_usercenter").fieldValue();
							var gongysbh = $("#kdorder_gongysdm").fieldValue();
							//0013581 输入零件编号前需要验证用户中心和供应商编号是否存在 20170426 by CSY
							if(usercenter == ''){
								alert("请选择用户中心！！");
								$("#kdorder_lingjbh").fieldValue("");
								return;
							}
							if(gongysbh == ''){
								alert("请选择供应商！！");
								$("#kdorder_lingjbh").fieldValue("");
								return;
							}
							var lingjbh = $("#kdorder_lingjbh").fieldValue();
							if (lingjbh == null || lingjbh == "") {
								alert("${i18n.lingjts}");
								return;
							}
							
							
							var records = new Map();
							var kdorder = $('#grid_kdorder').grid('getRecords');
							for ( var i = 0; i < kdorder.length; i++) {
								records.put(kdorder[i].lingjbh,kdorder[i].lingjbh);
							}
							
							if(records.get(lingjbh)==lingjbh){
								alert("零件已存在！！");
								$("#kdorder_lingjbh").fieldValue("");
								return;
							}
							
							if (lingjbh != null && usercenter != null
									&& gongysbh != null) {
								
										$.sdcui.ajaxUtil.ajax({
											url : "${ctx}/kdorder/getrl.ajax",
											data : "lingjbh=" + lingjbh
													+ "&usercenter=" + usercenter
													+ "&gongysbh=" + gongysbh,
											success : function(result) {
												if (result.flag != null) {
													alert(result.flag);
													return false;
												} else {
													$("#kdorder_uabzucrl").fieldValue(
															result.uabzucrl);
													$("#kdorder_uabzucsl").fieldValue(
															result.uabzucsl);
													$("#kdorder_uabzrl").fieldValue(
															result.uabzrl);
													$("#kdorder_fahd").fieldValue(
															result.fahd);
													$("#kdorder_dinghcj").fieldValue(
															result.dinghcj);
													$("#kdorder_jihyz").fieldValue(
															result.jhy);
													$("#kdorder_beihzq").fieldValue(
															result.beihzq);
													$("#kdorder_fayzq").fieldValue(
															result.fayzq);
												}
											}
										});
									
								
							} else {
								alert("${i18n.lingjts}");
								$("#kdorder_lingjbh").fieldValue("");
							}

						});

			});

	function func_button_insert_1() {
	    $('#form_kdorder').form('clear');
		var dingdh = $("#kd_dingdh").fieldValue();
		var dingdzt = $("#kd_dingdzt").fieldValue();
		var usercenter = $('#kd_usercenter').fieldValue();
		if (dingdzt != '1'&&dingdzt != '3') {
			alert("${i18n.dingdztts}");
			return;
		}
		var gongysdm = $("#kd_gongysdm").fieldValue();
		var dingdlx = $("#kd_dingdlx").fieldValue();
		var jihyz = $("#kd_jihyz1").fieldValue();
		var row = $("#grid_kdorder").find('div.grid-scroll tr[id*="' + dingdh + '"]');
		$("#kdorder_dingdh").fieldValue(dingdh);
		$("#kdorder_jihyz").fieldValue(jihyz);
		$("#kdorder_usercenter").fieldValue(usercenter);
		$('#form_kdorder').form('open');
	}
	/*   
	 function func_button_updates() {
	 var record = $("#grid_kdorder").grid("getSelectedRecords")[0];//选中的行的数据
	 if(record==null){
	 alert('提示信息:未选中数据,请检查');
	 }else{
	 $('#form_kdorder_update').form('fillRecord', $.extend({}, record));
	 $('#form_kdorder_update').form('open');
	 var kdorder = $('#grid_kdorder').grid('getBatchRecords');
	 }
	
	 }
	 */
	function func_button_update() {
		var gongysbh = $("#kdorder_gongysdm").fieldValue(); 
		var dingdzt = $("#kd_dingdzt").fieldValue();
		if (dingdzt != '1'&&dingdzt != '3') {
			alert("${i18n.dingdztts}");
			return;
		}
		var address = "${ctx}/kdorder/updateKd_sx.ajax";
		var values = $('#grid_kdorder').grid('getSelectedRecords');
		var param = [];
		var dingdnr = $("#kd_dingdnr").fieldValue();
		var ziyhqrq = $("#kd_ziyhqrq").fieldValue();
		if (values.length == 0) {
		    alert("${i18n.xuanzts}");
			return false;
		}
		
		var error = $('#grid_kdorder').find('td.validate-error');
				var errorMessage = [];
				if (error != null && error.length != 0) {
					errorMessage.push($(error[0]).attr('title'));
					$.sdcui.messageUtil.showError(errorMessage.join('\n'));
					return;
		}
		
		for ( var i = 0; i < values.length; i++) {
			param.push('DingdUpdate[' + i + '].usercenter='
					+ values[i].usercenter);
			param.push('DingdUpdate[' + i + '].dingdh=' + values[i].dingdh);
			//param.push('DingdUpdate[' + i + '].gongysdm=' + values[i].gongysdm);
			param.push('DingdUpdate[' + i + '].dinghcj=' + values[i].dinghcj);
			param.push('DingdUpdate[' + i + '].uabzucrl=' + values[i].uabzucrl);
			param.push('DingdUpdate[' + i + '].dinghcj=' + values[i].dinghcj);
			param.push('DingdUpdate[' + i + '].lingjbh=' + values[i].lingjbh);
			
			var p0sl = values[i].p0sl;
			var p1sl = values[i].p1sl;
			var p2sl = values[i].p2sl;
			var p3sl = values[i].p3sl;
			var p4sl = values[i].p4sl;
			/*var msg = "整数部分最大位10位，小数部分最大位3位";
			if (!validateP(p0sl)) {
				alert(msg);
				return false;
			}
			if (!validateP(p1sl)) {
				alert(msg);
				return false;
			}
			if (!validateP(p2sl)) {
				alert(msg);
				return false;
			}
			if (!validateP(p3sl)) {
				alert(msg);
				return false;
			}
			if (!validateP(p4sl)) {
				alert(msg);
				return false;
			}*/
			param.push('DingdUpdate[' + i + '].p0sl=' + p0sl);
			param.push('DingdUpdate[' + i + '].p1sl=' + p1sl);
			param.push('DingdUpdate[' + i + '].p2sl=' + p2sl);
			param.push('DingdUpdate[' + i + '].p3sl=' + p3sl);
			param.push('DingdUpdate[' + i + '].p4sl=' + p4sl);
			param.push('DingdUpdate[' + i + '].jihyz=' + values[i].jihyz);
			param.push('DingdUpdate[' + i + '].id=' + values[i].id);
			param.push('DingdUpdate[' + i + '].dingdnr=' + dingdnr);
			param.push('DingdUpdate[' + i + '].ziyhqrq=' + ziyhqrq);
		}
		param.push('dingdzt=' + dingdzt);
		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : param.join('&'),
			success : function(result) {
				if (result.flag != null || result.msg != null) {
					alert(result.flag);
					$("#grid_kdorder").grid('reload');
				}
			}
		});
	}

	//数量验证
	function validateP(value) {
		var patten = /^[0-9]{1,10}(?:\.[0-9]{1,3})?$|^0\.[0-9]{1,3}$/;
		var flag = patten.test(value);
		return flag;
	}

	function func_button_btnSubmit() {
		//定义数组
		var param = [];
		var address = "";
		var message = "";
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
		var dingdh = $("#kdorder_dingdh").fieldValue();
		var usercenter = $("#kdorder_usercenter").fieldValue();
		var gongysdm = $("#kdorder_gongysdm").fieldValue();
		var lingjbh = $("#kdorder_lingjbh").fieldValue();
		var dinghcj = $("#kdorder_dinghcj").fieldValue();
		var fahd = $("#kdorder_fahd").fieldValue();
		var p0sl = $("#kdorder_p0sl").fieldValue();
		var p1sl = $("#kdorder_p1sl").fieldValue();
		var p2sl = $("#kdorder_p2sl").fieldValue();
		var p3sl = $("#kdorder_p3sl").fieldValue();
		var p4sl = $("#kdorder_p4sl").fieldValue();
		var uabzucrl = $("#kdorder_uabzucrl").fieldValue();
		var uabzucsl = $("#kdorder_uabzucsl").fieldValue();
		var jihyz = $("#kdorder_jihyz").fieldValue();
		var dingdnr = $("#kd_dingdnr").fieldValue();
		var ziyhqrq = $("#kd_ziyhqrq").fieldValue();
		var dingdzzsj = $("#kd_dingdzzsj").fieldValue();
		var beihzq = $("#kdorder_beihzq").fieldValue();
		var fayzq = $("#kdorder_fayzq").fieldValue();
		if (uabzucrl == '') {
			alert("${i18n.lingjhck}");
		}
		
		if(p0sl%(uabzucrl*uabzucsl)!=0){
	         alert("P0数量请取整");
	         return ;
	    }
		
		if(p1sl%(uabzucrl*uabzucsl)!=0){
	         alert("P1数量请取整");
	         return ;
	    }
		
		if(p2sl%(uabzucrl*uabzucsl)!=0){
	         alert("P2数量请取整");
	         return ;
	    }
		
		if(p3sl%(uabzucrl*uabzucsl)!=0){
	         alert("P3数量请取整");
	         return ;
	    }
		
		if(p4sl%(uabzucrl*uabzucsl)!=0){
	         alert("P4数量请取整");
	         return ;
	    }
		param.push('dingdnr=' + dingdnr);
		param.push('ziyhqrq=' + ziyhqrq);
		param.push('dingdh=' + dingdh);
		param.push('usercenter=' + usercenter);
		param.push('gongysdm=' + gongysdm);
		param.push('lingjbh=' + lingjbh);
		param.push('dinghcj=' + dinghcj);
		param.push('fahd=' + fahd);
		param.push('p0sl=' + p0sl);
		param.push('p1sl=' + p1sl);
		param.push('p2sl=' + p2sl);
		param.push('p3sl=' + p3sl);
		param.push('p4sl=' + p4sl);
		param.push('uabzucrl=' + uabzucrl);
		param.push('uabzucsl=' + uabzucsl);
		param.push('jihyz=' + jihyz);
		param.push('dingdzzsj=' + dingdzzsj);
		param.push('beihzq=' + beihzq);
		param.push('fayzq=' + fayzq);
		address = "${ctx}/kdorder/insertKDorder_1.ajax";
		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : param.join('&'),
			success : function(result) {
				if (result.msg != null) {
					alert(result.msg);
					if (result.msg == "${i18n.done}") {
						$("#form_kdorder").form('close');
						$("#grid_kdorder").grid('reload');
					}
				}
			}
		});

	}
	   function editJiaoy(value){
	  	    var  cell = this.col.cell;
			var rowElement = cell.parent('tr:first');
			var bzrlIndex = $('td.uabzucrl:first').prevAll().length;
			var bzrlStr = rowElement.find('td:eq('+bzrlIndex+')').text();
			var uabzrlIndex = $('td.uabzucsl:first').prevAll().length;
			var uabzrlStr = rowElement.find('td:eq('+uabzrlIndex+')').text();
			var yu = value%(bzrlStr*uabzrlStr);
			if(yu>0){
			    $(cell).attr("title","请按包装取整").addClass("validate-error");
			}
	   }
	   function editAble(){
           var flag = false;
           var dingdnr = $("#il_dingdnr").fieldValue();
           var event = window.event||arguments.callee.caller.arguments[2];
           var td = event.srcElement || event;
           var tdIndex=0;
           var pnr="";
           if(event.srcElement){
              tdIndex = parseInt(td.cellIndex)-8;
              pnr = dingdnr.substring(tdIndex,parseInt(tdIndex)+1);
		      //alert(tdIndex);
           }else{
               tdIndex = (td.caption).substring(1,2);
               pnr = dingdnr.substring(tdIndex,parseInt(tdIndex)+1);
     		   //alert(tdIndex);
           }
           if(pnr==='8') flag=true;
           return flag;
   
   }
	function link_lingjbh(event) {
		var dingdzt = $("#kd_dingdzt").fieldValue();
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_kdorder').grid('getRecord', rowDoc);//获取当前行对应的记录
	//	var obj = {};
	//	obj.dingdh = record.dingdh;
	//	obj.usercenter = record.usercenter;
	//	obj.lingjbh = record.lingjbh;
	//	obj.gongysdm = record.gongysdm;
	//	obj.ids = record.ids;
	//	obj.dingdzt = record.dingdzt;
		/**
		 * form跳转模式提交
		 */
	//	$.sdcui.pageUtils.goPage({
	//		url : '/kdorder/kdOrderLine.do',//url
	//		record : obj,//
	//		mode : 'form',
	//		beforeSubmit : function() {
				//
	//			return true;
	
	//		}
	//	});
		winMaxOpen = window.open ('${ctx}/kdorder/kdOrderLine.do?removeId=layout-north,layout-west,layout-south&dingdh='+ record.dingdh+'&usercenter='+record.usercenter+'&lingjbh='+record.lingjbh+'&gongysdm='+record.gongysdmid+'&ids='+record.id+'&dingdzt='+dingdzt,'${i18n.maoxuqmx}','top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		winMaxOpen.resizeTo(screen.availWidth,screen.availHeight);
		return false;
	}
	function showBaozsl(col, value, rowIndex, colIndex) {
		var obj = this;
		var uabzrl = value["uabzucrl"];
		var baozsl = value["uabzucsl"];
		var showValue;
		showValue = uabzrl*baozsl;
		return "" + showValue;
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