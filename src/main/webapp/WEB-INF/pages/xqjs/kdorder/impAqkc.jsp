<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.daordhaqkc}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
	#qhkc_exp .youi-fieldLayout table td.contral.label-col.col-0{
		    width: 150px;
	}
	
	#aqkc {
		    width: 300px;
	}
</style>

</head>



<t:page i18n="i18n.xqjs.kdorder">
   <t:panel id="IMPKC">
    <div  class="youi-panel">
    <div class="panel-header">
        <div>${i18n.daordhaqkc}</div>
        </div>
    </div>
     <form id="upload" action="${ctx}/kdorder/impUpdateKc.do"  method="POST"  enctype='multipart/form-data' 
                                                         target="hiddenUp" style="background-color: white;">
     		<div >
     		<table>
     		<tr>
     		   <td><input name="fileName" type="file" id="file"  /></td>
     		   <td><t:buttons id="imp"><t:button caption="${i18n.daoru}" name="impFrExc"></t:button></t:buttons></td>
     		<tr>
			</table>
			</div>
		</form>

        <div  id="qhkc_exp">
		<table>
		<tr>
		 <td>
		 <t:fieldLayout id="aqkc" prefix="aqkc" columns="1" >
				 <t:fieldCalendar property="dinghsj" 
					format="yyyy-MM-dd" width="150" caption="${i18n.daocdhaqkc}"></t:fieldCalendar>
		    </t:fieldLayout>
		 </td>
		 <td><div class="youi-buttons" align="right">
			<table>
				<tbody>
					<tr>
						<td>
							<div class="youi-button active-0" id = "button_expExc">
								<div class="right">
									<div class="center">
										<a href="#" onclick="return expExc()"> ${i18n.daochu}</a>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div></td>
		</tr>
        
		</table>
		   </div>


	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>

	<t:fieldLayout id="res_select" prefix="kd" columns="4">
		<t:grid id="impkc" caption="${i18n.dhaqkclb}" showNum="true" src="/kdorder/queryKdAqkc.ajax"  idKeys="USERCENTER,LINGJBH,CANGKBH,EDITOR,EDIT_TIME"
		usePager="true" add="NOT" remove="NOT" edit="NOT" load="false"   save="NOT" scrollHeight="190" back="NOT" selectRowEvent="xqjsRowSelect" multiple="true">
            	<t:fieldLayout  id="impselect" prefix="imp" columns="5">
				   <t:fieldSelect property="usercenter" width="150"  caption="${i18n.usercenter}"  convert="queryUserCenterMap"  defaultValue="${usercenter}" notNull="true"></t:fieldSelect>
	              <t:fieldText property="lingjbh"  caption="${i18n.lingjbh}" width="150" maxLength="10"></t:fieldText>
	              <t:fieldSelect property="jihy"  caption="${i18n.jihyz}" width="150" convert="getJihz" defaultValue="${jihyz}"></t:fieldSelect>
	              <t:fieldCalendar property="dinghsj" caption="${i18n.ziyrq}" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
				</t:fieldLayout>
			<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
			<t:gridCol property="USERCENTER" type="text" caption="${i18n.usercenter}"></t:gridCol>
			<t:gridCol property="LINGJBH"    type="text" caption="${i18n.lingjbh}"></t:gridCol>
			<t:gridCol property="CANGKBH"    type="text" caption="${i18n.dinghck}"></t:gridCol>
			<t:gridCol property="DINGHCJ"    type="text" caption="${i18n.dinghcj}"></t:gridCol>
			<t:gridCol property="JISTZZ"    type="text" caption="${i18n.jistzz}"  
			editor="fieldText"  editorOptions="{'notNull':true,'expression':'^-?[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage7}'}"></t:gridCol>
			<t:gridCol property="DINGDBDZL"    type="text" caption="订单累计"
			editor="fieldText"  editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'订单累计格式有误,该值的取值范围为(0  ~~ 9999999999.999),正数为最多10位小数位最多3位!'}"></t:gridCol>
			<t:gridCol property="YIJFZL"    type="text" caption="已交付累计"
			editor="fieldText"  editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'交付累计格式有误,该值的取值范围为(0  ~~ 9999999999.999),正数为最多10位小数位最多3位!'}"></t:gridCol>
			<t:gridCol property="ZHONGZZL"    type="text" caption="终止累计"
			editor="fieldText"  editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'终止累计格式有误,该值的取值范围为(0  ~~ 9999999999.999),正数为最多10位小数位最多3位!'}"></t:gridCol>
			<t:gridCol property="SYSTIME"    type="text" caption="资源获取日期"></t:gridCol>
			<t:gridCol property="JIHY"       type="text" caption="${i18n.jihyz}"></t:gridCol>
		</t:grid>
	</t:fieldLayout>
	<t:buttons id="btn">
		<t:button name="edit" caption="${i18n.update}"></t:button>
	</t:buttons>
	</t:panel>
</t:page>
<script type="text/javascript">

	
	function callback(msg)
	{
			alert(msg);

	}
	
	function func_button_impFrExc() {
		var form = document.forms["upload"];
		var file = form["file"];
		var fvalue = file.value;
		if (fvalue.length > 0) {
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')==-1) {
				alert("${i18n.wenjgs}");
				return false;
			}
			form.submit();
		} else {
			alert("${i18n.wenjxz}");
			return false;
		}

	}
	
	/**
	 *订货安全库存导出
	*/
	function expExc(){
	         var dinghsj = $("#aqkc_dinghsj").fieldValue();
	 		$.sdcui.ajaxUtil.ajax({
	 			url : "${ctx}/kdorder/readyExpExc.ajax?dinghsj="+dinghsj,
	 			success : function(result) {
	 				if(result.result.status!="1"){
	 					window.location = "${ctx}/kdorder/expExc.ajax?dinghsj="+dinghsj;
	 				}else{
	 					result.result.message;
	 				}
	 			}
	 		});
	
	}
	
	function createCheckBox(){
		return "<input  name='choices'  type='CheckBox' value='0'/>";
	}
	
	/**
	 *订货安全库存修改
	 */
	function  func_button_edit(){
	       var param = $("#impkc").grid('getSelectedRecords');
	       if(param.length<1){
	          alert("${i18n.jiluxz}");
	          return  false;
	       }
	       
	    var error = $('#impkc').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}   
	    var  params = [];
	    for ( var i = 0; i < param.length; i++) {
			params.push('edit[' + i + '].usercenter=' + param[i].USERCENTER);
			params.push('edit[' + i + '].lingjbh=' + param[i].LINGJBH);
			var cangkbh = param[i].CANGKBH==''?'CANGKBH':param[i].CANGKBH;
			params.push('edit[' + i + '].cangkbh=' +cangkbh);
			var jistzz = param[i].JISTZZ;
			if(typeof(jistzz)=='undefined'){
			   alert("${i18n.dinghaqkcwk}");
			   return false;
			}
			params.push('edit[' + i + '].jistzz=' + param[i].JISTZZ);
			params.push('edit[' + i + '].dingdlj=' + param[i].DINGDBDZL);
			params.push('edit[' + i + '].jiaoflj=' + param[i].YIJFZL);
			params.push('edit[' + i + '].zhongzlj=' + param[i].ZHONGZZL);
			params.push('edit[' + i + '].ziyhqrq=' + param[i].SYSTIME);
			params.push('edit[' + i + '].edit_time=' + param[i].EDIT_TIME);
			params.push('edit[' + i + '].editor=' + param[i].EDITOR);
		}   
	     //修改ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kdorder/updateAqkc.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$('#impkc').grid('reload');
			}
		});
	
	}
</script>
<style type="text/css">
 div#exp{
    background: url("images/button/button-bg.gif") repeat scroll 0 0 transparent;
    height: 21px;
    line-height: 21px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
}
</style>
</t:html>