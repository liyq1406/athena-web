<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.editMaoxq}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.maoxq.addEditMaoxq">

	<t:form id="form_maoxqEdit" submit="NOT" reset="NOT">
		
	       <t:grid id="grid_editAmount"  caption="${i18n.editMaoxq}"  scrollHeight="520"  showCheckbox="true"  
			src="/maoxq/editQr.ajax"  idKeys="id,xuqbc,usercenter,lingjbh,editor,edit_time" showNum="true"   remove="NOT"  edit="NOT"  add="NOT"
			usePager="true"   save="NOT"  load="true"   submit="NOT" reset="NOT"  editAlias="mxsl" back="NOT" pageSize="20" >
			      <t:fieldLayout  prefix="record"  >
	                      <t:fieldHidden property="xuqbc" ></t:fieldHidden>
		                  <t:fieldHidden property="usercenter"></t:fieldHidden>
		                  <t:fieldHidden property="lingjbh" ></t:fieldHidden>
		                  <t:fieldHidden property="chanx" ></t:fieldHidden>
		                  <t:fieldHidden property="zhizlx" ></t:fieldHidden>
		                  <t:fieldHidden property="jihyz"></t:fieldHidden>
		                  <t:fieldHidden property="shiycj"></t:fieldHidden>
		           </t:fieldLayout>
			<t:gridCol  property="usercenter" type="text" caption="${i18n.usercenter}"  ></t:gridCol>
			<t:gridCol  property="lingjbh"    type="text" caption="${i18n.lingjbh}" ></t:gridCol>
			<t:gridCol  property="shiycj"    type="text" caption="${i18n.shiycj}" ></t:gridCol>
			<t:gridCol  property="chanx"      type="text" caption="${i18n.chanx}"  ></t:gridCol>
			<t:gridCol  property="xuqrq"      type="text" caption="${i18n.xuqrq}"  ></t:gridCol>
			<t:gridCol  property="xuqsl"      type="text" caption="${i18n.xuqsl}"  editor="fieldText" editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\.[0-9]{1,6})?$|^0[.][0-9]{1,6}$','expressionMessage':'整数部分最大位10位，小数部分最大位6位'}"></t:gridCol>
		    <t:gridCol  property="lingjmc"    type="text" caption="${i18n.lingjmc}"  ></t:gridCol>
		    <t:gridCol  property="danw"       type="text" caption="${i18n.danw}"  ></t:gridCol>
		    <t:gridCol  property="jihyz"      type="text" caption="${i18n.jihyz}"  ></t:gridCol>
		    <t:gridCol  property="zhizlx"     type="text" caption="${i18n.zhizlx}"  ></t:gridCol>
			</t:grid>
			    
	              <t:fieldLayout >
	                          <t:buttons id="btns2" >
				              <t:button caption="${i18n.qued}" name="update"></t:button>
				              </t:buttons>
	              </t:fieldLayout>
	</t:form>
 <input id="removeId" value="${removeId}" type="hidden"/>  
	</t:page>
	<script type="text/javascript">

	//修改零件数量
	function func_button_update(){
	    var error = $('#grid_editAmount').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		var param = $('#grid_editAmount').grid('getBatchRecords');//获取行编辑数据
		if(param.length==0){
		   return ;
		}
		//修改ajax请求       
		   $.sdcui.ajaxUtil.ajax({
	         url:"${ctx}/maoxq/editMx.ajax",
	 	 	   data:param.join('&'),
	 	       success:function (result){
	 	        	alert(result.result);
	 	        	$("#grid_editAmount").grid('reload');
	 	       }
	       });
	}
	
	
	//返回
	function func_button_back(){
		history.back(); 
	}
	
	</script>
	<style type="text/css">
	
	</style>
</t:html>