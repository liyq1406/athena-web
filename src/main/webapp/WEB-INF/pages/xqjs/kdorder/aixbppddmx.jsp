<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.queryTitle}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<t:page  i18n="i18n.xqjs.kdorder" >
	
	   <t:form id="kdorder_query"  reset="NOT" submit="NOT">
		<t:grid id="grid_aix" idKeys="dingdh,id,editor,edit_time" caption="${i18n.queryTitle}"  showNum="true"    multiple="true" editAlias="DingdUpdate"  usePager="true" selectRowEvent="xqjsRowSelect"
			src="/kdorder/queryOrderLine.ajax"    add="NOT"  remove="NOT"  edit="NOT"    load="true" scrollHeight="282">
				<t:fieldLayout prefix="kd">
				    <t:fieldText property="lingjbh" caption="${i18n.lingjbh}"></t:fieldText>
	              	<t:fieldHidden property="dingdh"></t:fieldHidden>
	              	<t:fieldHidden property="usercenter"></t:fieldHidden>
	              	<t:fieldHidden property="gongysdm"></t:fieldHidden>
	              	<t:fieldHidden property="dingdzt"></t:fieldHidden>
	              	<t:fieldHidden property="flag"></t:fieldHidden>
              	</t:fieldLayout>
              	<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
				<t:gridCol    property="dingdh"  type="text" caption="${i18n.dingdh}"  ></t:gridCol>
				<t:gridCol    property="gongysdm"  type="text" caption="${i18n.gongysdm}"  ></t:gridCol>
				<t:gridCol    property="lingjbh"  type="text" caption="${i18n.lingjbh}"  ></t:gridCol>
				<t:gridCol    property="lingjmc" type="text" caption="${i18n.lingjmc}" ></t:gridCol>
				<t:gridCol    property="uabzucrl" type="text" caption="${i18n.uabzucrl}" ></t:gridCol>
				<t:gridCol    property="uabzuclx" type="text" caption="${i18n.uabzlx}" ></t:gridCol>
				<t:gridCol    property="danw" type="text" caption="${i18n.danw}" ></t:gridCol>
				<t:gridCol    editor="fieldText" property="shul" type="text" caption="${i18n.lingjzl}"  editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"></t:gridCol>
				<t:gridCol    property="fayrq" type="text"  caption="${i18n.chugrq}" ></t:gridCol>
			</t:grid>
		   </t:form>
	<t:form id="axbpp" dialog="true" idKeys="id,lingjbh,fayrq" submit="NOT">
		<t:fieldLayout prefix="bpp">
			<t:fieldHidden property="usercenter"></t:fieldHidden>
			<t:fieldText property="dingdh" readonly="true" caption="${i18n.dingdh}" maxLength="9"></t:fieldText>
			<t:fieldText property="gongysdm" readonly="true" caption="${i18n.gongysdm}" maxLength="10"></t:fieldText>
			<t:fieldText property="lingjbh" notNull="true" caption="${i18n.lingjbh}" maxLength="10"></t:fieldText>
			<t:fieldText property="uabzuclx" caption="${i18n.uabzlx}" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="uabzucrl" caption="${i18n.uabzucrl}" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="danw" caption="${i18n.danw}" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="shul"  notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位10位，小数部分最大位3位' caption="零件总量" ></t:fieldText>
			<t:fieldCalendar property="fayrq" format="yyyy-MM-dd"  caption="${i18n.fayrq}" notNull="true" />
			<t:button caption="${i18n.tijiao}" name="btnSubmit"></t:button>
		</t:fieldLayout>
	</t:form>
		   
		    <t:fieldLayout>
    			<div class="but">
                    <t:buttons  id="update">
                             <t:button  name="update" caption="${i18n.update}" ></t:button>
                             <t:button  name="add" caption="${i18n.xinz}" ></t:button>
                    </t:buttons>
               </div>
        </t:fieldLayout>
		</t:page>
		
		<script type="text/javascript">
		
		function createCheckBox(){
			return "<input  name='choices' type='CheckBox' value='0'/>";
		}
		
		$.sdcui.serverConfig.convertArray['dingdlx']={'0':'${i18n.kdlx}','1':'${i18n.teslx}','2':'${i18n.aixlx}'};
	//根据零件号带出容量等
	$(document).ready(
			function() {
				$("#bpp_lingjbh").change(
						function() {
							var lingjbh = $("#bpp_lingjbh").fieldValue();
							if (lingjbh == null || lingjbh == "") {
								alert("${i18n.lingjts}");
								return;
							}
							var usercenter = $("#bpp_usercenter").fieldValue();
							var gongysbh = $("#bpp_gongysdm").fieldValue();
							if (lingjbh != null ) {
								$.sdcui.ajaxUtil.ajax({
									url : "${ctx}/kdorder/getrl.ajax",
									data : "lingjbh=" + lingjbh
											+ "&usercenter=" + usercenter
											+ "&gongysbh=" + gongysbh,
									success : function(result) {
										if (result.flag != null&&result.msg=='ljgongys') {
											alert(result.flag);
											return false;
										} else {
											$("#bpp_uabzucrl").fieldValue(
													result.uabzucrl);
											$("#bpp_uabzuclx").fieldValue(
													result.uabzuclx);
											$("#bpp_danw").fieldValue(
													result.danw);
										}
									}
								});
							} else {
								alert("${i18n.dingdhyouw}");
							}

						});

			});
		
    //发运日期CHECK，必须大于PO的日期
	/*$(document).ready(function() {
				$("#bpp_fayrq").change(function() {
						    var dingdh = $("#bpp_dingdh").fieldValue();
							var lingjbh = $("#bpp_lingjbh").fieldValue();
							var usercenter = $("#bpp_usercenter").fieldValue();
							var gongysdm = $("#bpp_gongysdm").fieldValue();
							var fayrq = $("#bpp_fayrq").fieldValue();
							if (lingjbh!='') {
							    if(fayrq=='') return false;
								$.sdcui.ajaxUtil.ajax({
									url : "${ctx}/kdorder/checkAddmx.ajax",
									data : "lingjbh=" + lingjbh
											+ "&usercenter=" + usercenter
											+ "&gongysdm=" + gongysdm
											+ "&dingdh=" + dingdh
											+ "&fayrq=" + fayrq,
									success : function(result) {
										if (result.flag != null) {
										    $('#bpp_fayrq').attr("error","【发运日期】输入有误");
											alert(result.flag);
											return false;
										} else if(result.ljflag != null){
										    $('#bpp_lingjbh').attr("error","【零件号】输入有误");
											alert(result.ljflag);
											return false;
										}
									}
								});
							}else {
							      alert("【零件号】不能为空");
							      return ;
							}

						});

			});*/
		
		
		function func_button_add(){
			$("#axbpp").form("open");
			$("#axbpp").form("clear");
			var dingdh = $("#kd_dingdh").fieldValue();
			var usercenter = $("#kd_usercenter").fieldValue();
			var gongysdm = $("#kd_gongysdm").fieldValue();
			$("#bpp_usercenter").fieldValue(usercenter);
			$("#bpp_gongysdm").fieldValue(gongysdm);
			$("#bpp_dingdh").fieldValue(dingdh);

		}

     
			//爱信不匹配新增
			function func_button_btnSubmit() {
				var dingdzt = $("#kd_dingdzt").fieldValue();
				var address = "";
				var message = "";
				var errorMessage = [];
				var param = [];
				var dingdh = $("#bpp_dingdh").fieldValue();
				var usercenter = $("#bpp_usercenter").fieldValue();
				var gongysdm = $("#bpp_gongysdm").fieldValue();
				var lingjbh = $("#bpp_lingjbh").fieldValue();
				var shul = $("#bpp_shul").fieldValue();
				var uabzuclx = $("#bpp_uabzuclx").fieldValue();
				var uabzucrl = $("#bpp_uabzucrl").fieldValue();
				var danw = $("#bpp_danw").fieldValue();
				var fayrq = $("#bpp_fayrq").fieldValue();
				if (!$('#axbpp').form('validate')) {
					$('#axbpp')
							.find(
									'.youi-field.validating,.youi-field.validate-error')
							.each(function() {
								if (this.title)
									errorMessage.push(this.title);
							});

				}
				/*	if($('#bpp_fayrq[error]').length!=0){
					   var msg = $('#bpp_fayrq').attr("error");
					   errorMessage.push(msg);
					}	
					if($('#bpp_lingjbh[error]').length!=0){
					   var msg = $('#bpp_lingjbh').attr("error");
					   $('#bpp_lingjbh').attr("class","youi-field fieldText validate-error");
					   errorMessage.push(msg);
					}	*/
				if (lingjbh !== '' && fayrq !== '') {
					$.sdcui.ajaxUtil
							.ajax({
								url : "${ctx}/kdorder/checkAddmx.ajax",
								data : "lingjbh=" + lingjbh + "&usercenter="
										+ usercenter + "&gongysdm=" + gongysdm
										+ "&dingdh=" + dingdh + "&fayrq="
										+ fayrq,
								success : function(result) {
									if (result.flag != null) {
										errorMessage.push("${i18n.kuohfyrq}"
												+ result.flag);
									} else if (result.ljflag != null) {
										errorMessage.push("${i18n.kuohlingjh}"
												+ result.ljflag);
										$('#bpp_lingjbh')
												.attr("class","youi-field fieldText validate-error");
									}

									if (errorMessage.length != 0) {
										alert(errorMessage.join('\n'));
										return false;
									} else {

										param.push('dingdh=' + dingdh);
										param.push('usercenter=' + usercenter);
										param.push('gongysdm=' + gongysdm);
										param.push('lingjbh=' + lingjbh);
										param.push('fayrq=' + fayrq);
										param.push('shul=' + shul);
										param.push('uabzuclx=' + uabzuclx);
										param.push('uabzucrl=' + uabzucrl);
										param.push('danw=' + danw);
										param.push('dingdzt=' + dingdzt);

										address = "${ctx}/kdorder/addBppMx.ajax";

										$.sdcui.ajaxUtil
												.ajax({
													url : address,
													data : param.join('&'),
													success : function(result) {
														if (result.msg != null) {
															alert(result.msg);
															$("#axbpp").form('close');
															$("#grid_aix").grid('reload');
															//修改订单零件
															$.sdcui.ajaxUtil.ajax({
																		url : "${ctx}/kdorder/sumOrderParts.ajax",
																		data : "dingdh="
																				+ dingdh,
																		success : function(
																				result) {
																			//alert(result.flag);
																		}
																	});
														} else {
															
                                                              alert(result.errorMsg); 
														}
													}
												});

									}
								}
							});
				} else if (errorMessage.length != 0) {
					alert(errorMessage.join('\n'));
					return false;
				}

				//window.setTimeout('alertError('+errorMessage+')',1500); 

			}

			function func_button_update() {
				var dingdh = $("#kd_dingdh").fieldValue();
				var dingdzt = $("#kd_dingdzt").fieldValue();
				var param = $("#grid_aix").grid("getSelectedRecords");
				if (param.length == 0) {
					alert("${i18n.xuanzts}");
					return false;
				}
				var error = $('#grid_aix').find('td.validate-error');
				var errorMessage = [];
				if (error != null && error.length != 0) {
					errorMessage.push($(error[0]).attr('title'));
					$.sdcui.messageUtil.showError(errorMessage.join('\n'));
					return;
				}
				var params = [];
				for ( var i = 0, len = param.length; i < len; i++) {
					params.push('update[' + i + '].id=' + param[i].id);
					params.push('update[' + i + '].dingdh=' + param[i].dingdh);
					params.push('update[' + i + '].shul=' + param[i].shul);
					params.push('update[' + i + '].fahzq=' + param[i].fahzq);
					params.push('update[' + i + '].editor=' + param[i].editor);
					params.push('update[' + i + '].edit_time='
							+ param[i].edit_time);
				}
				params.push('dingdzt=' + dingdzt);
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/kdorder/upDateDingdmx.ajax",
					data : params.join('&'),
					success : function(result) {
						alert(result.flag);
						$('#grid_aix').grid('reload');
					}
				});

				//修改订单零件
				/*$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/kdorder/sumOrderParts.ajax",
					data : "dingdh=" + dingdh,
					success : function(result) {
						//alert(result.flag);
					}
				});*/

			}
		</script>
	
	<style type="text/css">
		.but{
			width:100px ;
			float:left ;
			text-align:center ;
			margin:0 0 0 5px ;
		}
	</style>
</t:html>