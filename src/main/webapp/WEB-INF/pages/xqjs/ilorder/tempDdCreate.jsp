<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="临时订单创建">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>

<t:page>

	
	<t:form id="tempAdd" dialog="false" caption="临时订单创建" submit="NOT" reset="NOT">
		<t:fieldLayout prefix="add" columns="3">
			<t:fieldSelect property="usercenter" width="100" caption="用户中心" convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
			<t:fieldSelect property="chullx" caption="订单类别" width="100" notNull="true" convert="queryLSDDLB" defaultValue="PP"></t:fieldSelect>
			<t:fieldText property="gongysdm" caption="供应商/仓库编号" width="100" notNull="true" maxLength="10"></t:fieldText>
			<t:fieldText property="fahzq" caption="发运区间"  width="100" notNull="true" maxLength="10"></t:fieldText>
			<t:fieldText property="beiz" caption="备注" width="100" maxLength="100"></t:fieldText>
			<t:fieldSelect property="shiffsgys" caption="是否发送供应商" convert="shiffsgys" notNull="true" width="100" defaultValue="1"></t:fieldSelect>
			<t:button caption="创建" name="subAdd"></t:button>
		</t:fieldLayout>
	</t:form>
	
    <table  id="tempAddKb" style="display:none;">
       <tr>
        <td colspan="3">
        <t:form   id='lskbform' dialog="false" submit="NOT" reset="NOT">
         <t:fieldLayout prefix="addkb" columns="3">
			<t:fieldSelect property="usercenter" width="150" caption="用户中心" convert="queryUserCenterMap"  notNull="true"></t:fieldSelect>
			<t:fieldText property="lingjbh" caption="零件号" width="150" notNull="true" maxLength="10"></t:fieldText>
			<t:fieldSelect property="gongysdm" caption="供应商代码" width="150" notNull="true" ></t:fieldSelect>
			<t:fieldSelect property="gonghlx" caption="供货类型" width="150" notNull="true" convert="gonghlx"></t:fieldSelect>
			<t:fieldSelect property="keh" caption="客户"  width="150" notNull="true" parents="gonghlx,usercenter,lingjbh"  src="/ilorder/getKeh.ajax" show="keh" code="keh"></t:fieldSelect>
			<t:fieldSelect property="xunhbm" caption="循环编码" width="150" notNull="true"  parents="usercenter,lingjbh,gonghlx,keh" src="/ilorder/getKanbxhbm.ajax" show="KANBXHBM" code="KANBXHBM"></t:fieldSelect>
			<t:fieldText property="shul" caption="零件数量" width="150" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'  expressionMessage='整数部分最大位10位，小数部分最大位3位' maxLength="13"></t:fieldText>
			<t:fieldText property="uabzucsl" caption="包装个数"  width="150" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'  expressionMessage='整数部分最大位10位，小数部分最大位3位' maxLength="13"></t:fieldText>
			<t:fieldText property="beiz" caption="备注" width="150" maxLength="100"></t:fieldText>
			<t:fieldSelect property="shiffsgys" caption="是否发送供应商" convert="shiffsgys" notNull="true" width="150" defaultValue="1"></t:fieldSelect>
		</t:fieldLayout>
		</t:form>
        </td>
        <tr>
        <tr>
          <td align="center" colspan="3">
            <t:buttons id="tempkb">
			<t:button caption="创建" name="subAddKb"></t:button>
			</t:buttons>
          </td>
        </tr>
    </table>
		
			
    
    
    
        <t:form id="ilquery" reset="NOT" submit="NOT">
		<t:grid id="ilorderEe" idKeys="DINGDH,HETH,GONGYSDM,EDIT_TIME,EDITOR,DINGDNR" caption="" 
		src="/ilorder/queryDd.ajax" usePager="true" edit="NOT" reset="NOT" add="NOT" remove="NOT" save="NOT" submit="NOT"
		load="false"  scrollHeight="272">
			<t:fieldLayout id="tempselect" prefix="il" >
				<t:fieldHidden property="usercenter" ></t:fieldHidden>
				<t:fieldHidden property="gongysdm" ></t:fieldHidden>
				<t:fieldHidden property="dingdh"></t:fieldHidden>
				<t:fieldHidden property="dingdlx" defaultValue="3"></t:fieldHidden>
			</t:fieldLayout>
		    <t:gridCol property="DINGDH" type="link" caption="订单号"></t:gridCol>
			<t:gridCol property="USERCENTER" type="text" caption="用户中心" ></t:gridCol>
			<t:gridCol property="CHULLX" type="text" caption="订单类别" convert="queryLSDDLB" ></t:gridCol>
			<t:gridCol property="DINGDLX" caption="订单类型" convert="queryDingdlx" ></t:gridCol>
			<t:gridCol property="GONGYSDM" type="text" caption="供应商代码" ></t:gridCol>
			<t:gridCol property="FAHZQ" type="text" caption="发运区间" ></t:gridCol>
			<t:gridCol property="JIHYZ" type="text" caption="计划员组" convert="getJihz" ></t:gridCol>
			<t:gridCol property="BEIZ" type="text" caption="备注" editor="fieldText" ></t:gridCol>
			<t:gridCol property="SHIFFSGYS" type="text" caption="是否发送供应商" convert="shiffsgys" ></t:gridCol>
			<t:gridCol property="DINGDZT" type="text" caption="订单状态" convert="ddzt" ></t:gridCol>
		</t:grid>
        </t:form>

        <t:form id="kbquery"  reset="NOT" submit="NOT">
		<t:grid id="grid_kanbls" idKeys="id,dingdh,usercenter,gongysdm,edit_time,editor,zhuangt" caption="要货信息列表"  showNum="true" showCheckbox="true"
		src="/ilorder/querykanbls.ajax" usePager="true" edit="NOT" reset="NOT" add="NOT" remove="NOT" save="NOT" submit="NOT"
		load="false"  scrollHeight="160">
			
			<t:fieldLayout id="tepkb" prefix="kbselect" >
			<t:button caption="修改" name="editKb" icon="editRecord"  active="0"></t:button>
		    <t:button caption="删除" name="deleteKb" icon="removeRecord" active="0"></t:button>
				<t:fieldHidden property="usercenter" ></t:fieldHidden>
				<t:fieldHidden property="dingdh" ></t:fieldHidden>
				<t:fieldHidden property="gongysdm" ></t:fieldHidden>
				<t:fieldHidden property="lingjbh"></t:fieldHidden>
			</t:fieldLayout>
		
			<t:gridCol property="usercenter" type="text" caption="用户中心" ></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件号" convert="queryLSDDLB" ></t:gridCol>
			<t:gridCol property="gongysdm" type="text" caption="供应商" ></t:gridCol>
			<t:gridCol property="gonghlx" type="text" caption="供货模式" ></t:gridCol>
			<t:gridCol property="fahd" type="text" caption="发货地" ></t:gridCol>
			<t:gridCol property="keh" type="text" caption="客户" ></t:gridCol>
			<t:gridCol property="kanbxhbm" type="text" caption="循环编码" ></t:gridCol>
			<t:gridCol property="uabzrl" type="text" caption="包装容量" ></t:gridCol>
			<t:gridCol property="shul" type="text" caption="零件数量" editor="fieldText"  editorOptions="{'notNull':'true','expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}" ></t:gridCol>
		</t:grid>
       </t:form>
	

</t:page>

<script type="text/javascript">
		
	$.sdcui.serverConfig.convertArray['ddzt'] = {'0':'已定义','1':'制作中','2':'待生效','3':'拒绝','4':'已生效'};
	$.sdcui.serverConfig.convertArray['shiffsgys'] = {'0':'否','1':'是'};
	$.sdcui.serverConfig.convertArray['gonghlx'] = {'R1':'R1','R2':'R2'};
	$.sdcui.serverConfig.convertArray['dingdlx'] = {'3':'临时订单'};
	
	function add_chullx_change(){
	       var chullx = $('#add_chullx').fieldValue();
	       if(chullx==='KB'){
	          $("#tempAdd").attr("style","display:none");
	          $("#ilquery").attr("style","display:none");
	          $("#tempAddKb").attr("style","display:block;background:white;");
	          $("#kbquery").attr("style","display:block");
	       }
	
	}
	
  $(function() {
        $("#kbquery").attr("style","display:none");
		$('#addkb_gongysdm').bind('click', function() {
			var usercenter = $('#addkb_usercenter').fieldValue();
			var lingjbh = $('#addkb_lingjbh').fieldValue();
			if (lingjbh == ''||usercenter=='') {
				//alert('供应商代码不能为空！');
				return false;
			}
	        var element = $("div#field-pop-addkb_gongysdm");
		    element.empty();
		    $("#addkb_gongysdm").find('input.textInput').val("");
		    $("#addkb_gongysdm").find('input.value').val("");
		    element.removeClass("loaded");
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/queryLjgys.ajax",
				data : 'usercenter=' + usercenter + '&lingjbh=' + lingjbh,
				success : function(result) {
						var ljgys = result.result;
					    for(var i=0;i<ljgys.length;i++){
					         var gysbh = ljgys[i].gongysbh;
		                     var html = '<div class="option-item" value="'+gysbh+'">'+gysbh+'</div>';
		                     element.append(html);
					    }
					    element.addClass("loaded");      
				}
			});
		})
	})
	
	//创建临时看板要货
	function func_button_subAddKb() {
	     //平台验证
			if (!$('#lskbform').form('validate')) {
			var errorMessage = [];
			$('#lskbform').find('.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title){
							errorMessage.push(this.title);
						}
					});	
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return ;
		}
		var params = [];
		var usercenter = $('#addkb_usercenter').fieldValue();
		var lingjbh = $('#addkb_lingjbh').fieldValue();
		var gongysdm = $('#addkb_gongysdm').fieldValue();
		var gonghlx = $('#addkb_gonghlx').fieldValue();
		var keh = $('#addkb_keh').fieldValue();
		var xunhbm = $('#addkb_xunhbm').fieldValue();
		
		var shul = $('#addkb_shul').fieldValue();
		var uabzucsl = $('#addkb_uabzucsl').fieldValue();
		var beiz = $('#addkb_beiz').fieldValue();
		var shiffsgys = $('#addkb_shiffsgys').fieldValue();
		params.push('usercenter=' + usercenter);
		params.push('lingjbh=' + lingjbh);
		params.push('gongysdm=' + gongysdm);
		params.push('gonghlx=' + gonghlx);
		params.push('keh=' + keh);
		params.push('kanbxhbm=' + xunhbm);
		params.push('shul=' + shul);
		params.push('uabzucsl=' + uabzucsl);
		params.push('shiffsgys=' +shiffsgys);
		params.push('beiz=' + beiz);
		params.push('pattern=' + 'T');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/insertLsKb.ajax",
			data : params.join('&'),
			success : function(result) {
			    var msg = result.result;
				alert(msg);
				if(msg==='新增成功!'){
		            $('#kbselect_usercenter').fieldValue(usercenter);
					$('#kbselect_lingjbh').fieldValue(lingjbh);
					$('#kbselect_gongysdm').fieldValue(gongysdm);
					$('#kbselect_dingdh').fieldValue(result.dingdh);
					$('#grid_kanbls').grid('reload');

				}
			}
		});
	}
	
	
	/**
	 *修改订单行
	 */
	function func_button_editKb() {
		//修改选中的记录
		var param = $("#grid_kanbls").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}
       
		var error = $('#grid_kanbls').find('td.validate-error');
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
			 var dingdzt = param[i].dingdzt;
	        if(dingdzt>2){
	          alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
	          return false;
	        }
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('usercenter=' + $('#kbselect_usercenter').fieldValue());
		params.push('lingjbh=' + $('#kbselect_lingjbh').fieldValue());
		params.push('dingdh=' + $('#kbselect_dingdh').fieldValue());
		params.push('gongysdm=' + $('#kbselect_gongysdm').fieldValue());
	
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateLsKbSl.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#grid_kanbls").grid('reload');
			}
		});

	}

	/**
	 *删除订单行
	 */
	function func_button_deleteKb() {
		//修改选中的记录
		var param = $("#grid_kanbls").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].id=' + param[i].id);
			var dingdzt = param[i].dingdzt;
	        if(dingdzt>3){
	          alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
	          return false;
	        }
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('usercenter=' + $('#kbselect_usercenter').fieldValue());
		params.push('lingjbh=' + $('#kbselect_lingjbh').fieldValue());
		params.push('dingdh=' + $('#kbselect_dingdh').fieldValue());
		params.push('gongysdm=' + $('#kbselect_gongysdm').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/deleteKbDdmx.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#grid_kanbls").grid('reload');
			}
		});

	}
	
	
	//订单新增后，刷新表格
	function func_button_subAdd() {
	
		var usercenter = $('#add_usercenter').fieldValue();
			var gongysdm = $('#add_gongysdm').fieldValue();
			var chullx = $('#add_chullx').fieldValue();
			if (gongysdm == ''||usercenter=='') {
				//alert('供应商代码不能为空！');
				return false;
			}
			var address = "${ctx}/ilorder/validateExistGys.ajax";
			var pagemsg = "【供应商代码】输入有误";
			if(chullx.indexOf("M")!=-1){
			   address = "${ctx}/ilorder/validateDindhck.ajax";
			   pagemsg = "【供应商代码/仓库编号】M订单订货仓库输入有误";
			}
			$.sdcui.ajaxUtil.ajax({
				url : address,
				data : 'usercenter=' + usercenter + '&gongysdm=' + gongysdm+"&chullx="+chullx,
				success : function(result) {
				    var msg = result.msg;
				    if(typeof(msg)!='undefined'){
				    $('#add_gongysdm').attr("error",pagemsg);
				    	alert(msg);
				    }else{
				    		$('#add_gongysdm').removeAttr("error"); 
				    	//平台验证
						 var errorMessage = [];
							if (!$('#tempAdd').form('validate')) {
							var errorMessage = [];
							$('#tempAdd').find('.youi-field.validating,.youi-field.validate-error').each(
									function() {
										if (this.title){
											errorMessage.push(this.title);
										}
									});
						}
						if($('#add_gongysdm[error]').length!=0){
							   var msg = $('#add_gongysdm').attr("error");
							   $('#add_gongysdm').attr("class","youi-field fieldText validate-error");
							   errorMessage.push(msg);
						}	
						if(errorMessage.length!=0){
						   	alert(errorMessage.join('\n'));
						    return ;
						}	
						var params = [];
						var usercenter = $('#add_usercenter').fieldValue();
						var gongysdm = $('#add_gongysdm').fieldValue();
						var dingdlx = "3";
						var fahzq = $('#add_fahzq').fieldValue();
						var chullx = $('#add_chullx').fieldValue();
						var beiz = $('#add_beiz').fieldValue();
						var shiffsgys = $('#add_shiffsgys').fieldValue();
						params.push('dd[0].usercenter=' + usercenter);
						params.push('dd[0].gongysdm=' + gongysdm);
						params.push('dd[0].dingdlx=' + dingdlx);
						params.push('dd[0].fahzq=' + fahzq);
						params.push('dd[0].chullx=' + chullx);
						params.push('dd[0].shiffsgys=' +shiffsgys);
						params.push('dd[0].beiz=' + beiz);
						params.push('pattern=' + 'T');
						params.push('gongysdm=' + gongysdm);
						params.push('usercenter=' + usercenter);
						
						$.sdcui.ajaxUtil.ajax({
							url : "${ctx}/ilorder/insertIlDd.ajax",
							data : params.join('&'),
							success : function(result) {
								    var msg = result.result;
									alert(msg);
									if(msg==='新增成功!'){
										$('#il_usercenter').fieldValue(usercenter);
										$('#il_dingdh').fieldValue(result.dingdh);
										$('#il_gongysdm').fieldValue(gongysdm);
										$('#il_chullx').fieldValue(chullx);
										$("#ilquery").attr("style","display:block");
										$('#ilorderEe').grid('reload');
									}
							}
						});
				    	
				    }
				}
			});	

	}


	/**
	 *订单号链接点击事件
	 */
	function link_DINGDH(event) {
	    var url = 'initTempDdmx.do';
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#ilorderEe').grid('getRecord', rowDoc);//获取当前行对应的记录
		var chullx = record.CHULLX;
		var DINGDH = record.DINGDH;
		var DINGDZT = record.DINGDZT;
		var DINGDNR = record.DINGDNR;
		var USERCENTER = record.USERCENTER;
		//var GONGYSDM = record.GONGYSDM;
		var GONGYSDM = record.GONGYSDM.replace(/ /g," ");
		var EDITOR=record.EDITOR;
		var EDIT_TIME=record.EDIT_TIME;
		if(chullx=='PJ' || chullx=='VJ'){
		 	url = 'initTempPJDdmx.do';
		}else if(chullx !='PP'&&chullx!='PS'){
			url = 'initCreateTempAnxDdmx.do';
		}
		url = url+'?GONGYSDM='+GONGYSDM+'&CHULLX='+chullx+'&DINGDH='+DINGDH+'&DINGDZT='+DINGDZT+'&DINGDNR='+DINGDNR+'&USERCENTER='+USERCENTER+'&GONGYSDM='+GONGYSDM+'&EDITOR='+EDITOR+'&EDIT_TIME='+EDIT_TIME;
		winOpen = window.open(url,'订单信息','top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		return false;
		/**
		 * form跳转模式提交
		 */
		/**$.sdcui.pageUtils.goPage({
			url : url,//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});*/

	}
	
</script>

<style type="text/css">
#tempAdd td.contral.label-col.col-4{width:120px;}
#tempAddKb td.contral.label-col.col-0{width:140px;}
</style>
</t:html>