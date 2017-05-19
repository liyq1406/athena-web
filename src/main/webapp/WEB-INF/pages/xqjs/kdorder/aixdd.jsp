<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
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
	<t:grid id="grid_aixdd" caption="${i18n.dingdxljlb}" showNum="true" idKeys="dingdh,fayzq,dingdnr,id,editor,edit_time,ziyhqrq" multiple="true" selectRowEvent="xqjsRowSelect"
	src="/kdorder/queryDingdlj.ajax" add="NOT" edit="NOT" remove="NOT" scrollHeight="460" pageSize="20">
		<t:fieldLayout prefix="gridLayout">
			<t:fieldHidden property="usercenter"></t:fieldHidden>
			<t:fieldText property="lingjbh" caption="${i18n.lingjh}" maxLength="10" ></t:fieldText>
			<t:fieldHidden property="gongysdm" ></t:fieldHidden>
			<t:fieldHidden property="dingdh" ></t:fieldHidden>
			<t:fieldHidden property="dingdzt" ></t:fieldHidden>
			<t:fieldHidden property="dingdnr" ></t:fieldHidden>
		</t:fieldLayout>
		<div style=" font-size: 15px;">
				<div align="left" >${i18n.lefttitle}:${p0fyzqxh}</div>
	    </div>
	    <t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
		<t:gridCol property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol property="dinghcj" caption="${i18n.dinghcj}"></t:gridCol>
		<t:gridCol property="baozsl" type="text" caption="${i18n.baozsl}"  renderer="showBaozsl"></t:gridCol>
		<t:gridCol property="uabzlx" caption="${i18n.uabzlx}"></t:gridCol>
		<t:gridCol property="uabzucrl" caption="${i18n.uabzucrl}"></t:gridCol>
		<t:gridCol property="uabzucsl" type="text" caption="${i18n.uabzucsl}"></t:gridCol>
		<t:gridCol property="p0sl" caption="P0" editor="fieldText"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol property="p1sl" caption="P1" editor="fieldText"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol property="p2sl" caption="P2" editor="fieldText"
			editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}"></t:gridCol>
		<t:gridCol property="jihyz" caption="${i18n.jihyz}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_form">
		<t:button caption="${i18n.insert}" name="axInsert"></t:button>
		<t:button caption="${i18n.update}" name="axUpdate"></t:button>
		<t:button caption="${i18n.bupip}" name="unMatch"></t:button>
	<t:button caption="${i18n.dingyzxgz}" name="dingyzxgz"></t:button>
	<t:button caption="${i18n.pipzxgz}" name="pipzxgz"></t:button>
	<t:button caption="${i18n.zhuangxfncx}" name="zhuangxfncx"></t:button>
	</t:buttons>


	<t:form dialog="true" id="axForm" caption="${i18n.aixtianj}" submit="NOT">
		<t:fieldLayout prefix="ax" id="axOrder">
		<t:fieldHidden property="ddzt"></t:fieldHidden>
			<t:fieldText property="dingdh" caption="${i18n.dingdh}" readonly="true" maxLength="9"></t:fieldText>
			<t:fieldText property="usercenter" caption="${i18n.usercenter}" readonly="true"></t:fieldText>
			<t:fieldText property="gongysdm" caption="${i18n.gongysdm}" readonly="true"></t:fieldText>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" notNull="true"></t:fieldText>
			<t:fieldText property="dinghcj" caption="${i18n.dinghcj}" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="uabzuclx" caption="${i18n.uabzlx}" readonly="true"></t:fieldText>
			<t:fieldText property="p0sl" caption="P0" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="p1sl" caption="P1" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="p2sl" caption="P2" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='${i18n.numbermessage}'></t:fieldText>
			<t:fieldText property="uabzucrl" caption="${i18n.uabzucrl}" readonly="true"></t:fieldText>
			<t:fieldText property="uabzucsl" caption="${i18n.uabzucsl}" readonly="true"></t:fieldText>
			<t:fieldText property="jihyz" caption="${i18n.jihyz}" readonly="true"></t:fieldText>
			<t:fieldHidden property="beihzq"></t:fieldHidden>
			<t:fieldHidden property="fayzq"></t:fieldHidden>
			<t:button caption="${i18n.tijiao}" name="btnSubmit"></t:button>
		</t:fieldLayout>
	</t:form>
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
	/**
	*定义装箱规则
	*/
	function func_button_dingyzxgz(){
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/kdorder/initDyzxgz.do?',//url
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
	}
	
	function createCheckBox(){
		return "<input  name='choices' type='CheckBox' value='0'/>";
	}
	
	/*
	*装箱方案查询
	*/
	function func_button_zhuangxfncx(){
		
		var param = {gongysdm:$('#gridLayout_gongysdm').fieldValue(),dingdh:$('#gridLayout_dingdh').fieldValue()};
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/kdorder/initZxfncx.do',//url
			record:param,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
	}
	
	/*
	*匹配装箱规则按钮点击事件
	*/
	function func_button_pipzxgz(){
		var dingdzt = $('#gridLayout_dingdzt').fieldValue()
		if(dingdzt != 2){
			alert('${i18n.shengxiaopip}');
			return;
		}
		
		var usercenters = $('#grid_aixdd').grid('getRecords')[0].usercenter;
		if(usercenters==null){
			alert("${i18n.shujkong}");
			return false ;
		}
		
		var param = {gongysdm:$('#gridLayout_gongysdm').fieldValue(),dingdh:$('#gridLayout_dingdh').fieldValue(),
				usercenter:usercenters};
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/kdorder/piPzxgz.do',//url
			record:param,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		var id = 'youi_loading';
		var loading = $('#'+id);
		if(!loading.length){
			loading = $('<div class="youi-loading" id="'+id+'"/>').appendTo($('body',document));
		}
		var title = '${i18n.jisuanzhong}';
		loading.show().text(title).css({
			
		});
	}

	//根据零件号带出订货车间、计划员组等
	$(document).ready(
			function() {
				$("#ax_lingjbh").change(
						function() {
							var lingjbh = $("#ax_lingjbh").fieldValue();
							if (lingjbh == null || lingjbh == "") {
								alert("${i18n.lingjts}");
								return;
							}
							var usercenter = $("#ax_usercenter").fieldValue();
							var gongysbh = $("#ax_gongysdm").fieldValue();
							
							var records = new Map();
							var kdorder = $('#grid_aixdd').grid('getRecords');
							for ( var i = 0; i < kdorder.length; i++) {
								records.put(kdorder[i].lingjbh,kdorder[i].lingjbh);
							}
							
							if(records.get(lingjbh)==lingjbh){
								alert("零件已存在！！");
								$("#ax_lingjbh").fieldValue("");
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
											$("#ax_uabzucrl").fieldValue(
													result.uabzucrl);
											$("#ax_uabzuclx").fieldValue(
													result.uabzuclx);
											$("#ax_uabzucsl").fieldValue(
													result.uabzucsl);
											$("#ax_dinghcj").fieldValue(
													result.dinghcj);
											$("#ax_jihyz").fieldValue(
													result.jhy);
											$("#ax_beihzq").fieldValue(
													result.beihzq);
											$("#ax_fayzq").fieldValue(
													result.fayzq);
										}
									}
								});
							} else {
								alert('${i18n.dingdhyouw}');
								$("#ax_lingjbh").fieldValue("");
							}

						});

			});
	//增加弹出FORM
	function func_button_axInsert() {
		$("#axForm").form("open");
		$("#axForm").form("clear");
		var dingdh = $("#gridLayout_dingdh").fieldValue();
		var dingdzt = $("#gridLayout_dingdzt").fieldValue();
		var row = $("#grid_aixdd").find('div.grid-scroll tr[id*="' + dingdh + '"]');
		var usercenter = $("#gridLayout_usercenter").fieldValue();
		var gongysdm = $("#gridLayout_gongysdm").fieldValue();
		$("#ax_usercenter").fieldValue(usercenter);
		$("#ax_gongysdm").fieldValue(gongysdm);
		$("#ax_dingdh").fieldValue(dingdh);
		$("#ax_ddzt").fieldValue(dingdzt);
	}
	//增加提交
	function func_button_btnSubmit() {
		var address = "";
		var message = "";
		if (!$('#axForm').form('validate')) {
			var errorMessage = [];
			$('#axForm').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		var param = [];
		var id = $("#grid_aixdd").find('div.grid-scroll tr[id]').attr("id");
		var ziyhqrq = id.substring(id.lastIndexOf(",")+1);
		var dingdh = $("#ax_dingdh").fieldValue();
		var usercenter = $("#ax_usercenter").fieldValue();
		var gongysdm = $("#ax_gongysdm").fieldValue();
		var lingjbh = $("#ax_lingjbh").fieldValue();
		var dinghcj = $("#ax_dinghcj").fieldValue();
		var p0sl = $("#ax_p0sl").fieldValue();
		var p1sl = $("#ax_p1sl").fieldValue();
		var p2sl = $("#ax_p2sl").fieldValue();
		var uabzuclx = $("#ax_uabzuclx").fieldValue();
		var uabzucrl = $("#ax_uabzucrl").fieldValue();
		var uabzucsl = $("#ax_uabzucsl").fieldValue();
		var jihyz = $("#ax_jihyz").fieldValue();
		var dingdnr = $("#gridLayout_dingdnr").fieldValue();
		var dingdzt = $("#gridLayout_dingdzt").fieldValue();
		var beihzq = $("#ax_beihzq").fieldValue();
		var fayzq = $("#ax_fayzq").fieldValue();
		if (uabzucrl == '') {
			alert('${i18n.lingjhck}');
		}
		param.push('dingdnr=' + dingdnr);
		param.push('dingdh=' + dingdh);
		param.push('usercenter=' + usercenter);
		param.push('gongysdm=' + gongysdm);
		param.push('lingjbh=' + lingjbh);
		param.push('dinghcj=' + dinghcj);
		param.push('p0sl=' + p0sl);
		param.push('p1sl=' + p1sl);
		param.push('p2sl=' + p2sl);
		param.push('uabzuclx=' + uabzuclx);
		param.push('uabzucrl=' + uabzucrl);
		param.push('uabzucsl=' + uabzucsl);
		param.push('jihyz=' + jihyz);
		param.push('ziyhqrq=' + ziyhqrq);
		param.push('dingdzt=' + dingdzt);
		param.push('beihzq=' + beihzq);
		param.push('fayzq=' + fayzq);
		address = "${ctx}/kdorder/insertKDorder_1.ajax";
		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : param.join('&'),
			success : function(result) {
				if (result.msg != null) {
					alert(result.msg);
					$("#axForm").form('close');
					$("#grid_aixdd").grid('reload');
				}
			}
		});

	}

	//修改
	function func_button_axUpdate() {
		var address = "${ctx}/kdorder/updateKd_sx.ajax";
		var values = $('#grid_aixdd').grid('getSelectedRecords');
		var dingdzt = $("#gridLayout_dingdzt").fieldValue();
		
		var param = [];
		if (values.length == 0) {
			alert('${i18n.xuanzts}');
			return false;
		}
		var error = $('#grid_aixdd').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		for ( var i = 0; i < values.length; i++) {
			param.push('DingdUpdate[' + i + '].usercenter='+ values[i].usercenter);
			param.push('DingdUpdate[' + i + '].dingdh=' + values[i].dingdh);
			param.push('DingdUpdate[' + i + '].gongysdm=' + $('#gridLayout_gongysdm').fieldValue());
			param.push('DingdUpdate[' + i + '].dinghcj=' + values[i].dinghcj);
			param.push('DingdUpdate[' + i + '].uabzucrl=' + values[i].uabzucrl);
			param.push('DingdUpdate[' + i + '].lingjbh=' + values[i].lingjbh);
			param.push('DingdUpdate[' + i + '].dingdnr=' + values[i].dingdnr);
			param.push('DingdUpdate[' + i + '].id=' + values[i].id);
			var p0sl = values[i].p0sl;
			var p1sl = values[i].p1sl;
			var p2sl = values[i].p2sl;
			param.push('DingdUpdate[' + i + '].p0sl=' + p0sl);
			param.push('DingdUpdate[' + i + '].p1sl=' + p1sl);
			param.push('DingdUpdate[' + i + '].p2sl=' + p2sl);
			param.push('DingdUpdate[' + i + '].jihyz=' + values[i].jihyz);
			param.push('DingdUpdate[' + i + '].id=' + values[i].id);
			param.push('DingdUpdate[' + i + '].editor=' + values[i].editor);
			param.push('DingdUpdate[' + i + '].edit_time=' + values[i].edit_time);
		}
		param.push('dingdzt=' + dingdzt);
		$.sdcui.ajaxUtil.ajax({
			url : address,
			data : param.join('&'),
			success : function(result) {
				if (result.flag != null || result.msg != null) {
					alert(result.flag);
					$("#grid_aixdd").grid('reload');
				}
			}
		});

	}
	
	//不匹配装箱规则
	function func_button_unMatch(){
		var usercenters = $('#grid_aixdd').grid('getRecords')[0].usercenter;
		if(usercenters==null){
			alert("${i18n.shujkong}");
			return  ;
		}
		var dingdh = $("#gridLayout_dingdh").fieldValue();
		var dingdzt = $("#gridLayout_dingdzt").fieldValue();
		
        $.sdcui.ajaxUtil.ajax({
			url : '${ctx}/kdorder/axunMatch.ajax?dingdzt='+dingdzt,
			data : "dingdh="+dingdh,
			success : function(result) {
				  var record = {};
				  record.dingdh = $("#gridLayout_dingdh").fieldValue();
				  record.usercenter = usercenters;
				  record.gongysdm = $("#gridLayout_gongysdm").fieldValue();
				  record.dingdzt = $("#gridLayout_dingdzt").fieldValue();
				  $.sdcui.pageUtils.goPage({
						url:'/kdorder/initUnMatchPage.do',
						record:record,//
						mode:'form',
						beforeSubmit:function(result){
							//
							if(typeof(result)==String){
							alert(result);
							}
							return true;
						}
					});	  
			}
		});
	  
	   
	
	}
	function showBaozsl(col, value, rowIndex, colIndex) {
		var obj = this;
		var uabzrl = value["uabzucrl"];
		var baozsl = value["uabzucsl"];
		var showValue;
		showValue = uabzrl*baozsl;
		return "" + showValue;
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
	
	
</script>
<style type="text/css"></style>
</t:html>