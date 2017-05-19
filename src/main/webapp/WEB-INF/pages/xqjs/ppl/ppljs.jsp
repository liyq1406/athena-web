<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.pplComputer}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css">

     #maoxq td.contral.label-col.col-0{width:140px;}

</style>
	</head>
	<t:page i18n="i18n.xqjs.ppl.pplbjjs">
		<t:form id="maoxq" submit="NOT" reset="NOT">
	 <t:fieldLayout  prefix="layout" >
     <t:fieldSelect property="LX" caption="${i18n.qxzpplx}"  convert="LX" notNull="true"> </t:fieldSelect>
     </t:fieldLayout>
    <t:grid id="maoxqGrid" idKeys="maoxqbc" showNum="true"  reset="NOT" submit="NOT" add="NOT" back="NOT"
    remove="NOT" edit="NOT" src="/ppl/queryMaoxq.ajax"  selectRowEvent="xqjsrowSelect" scrollHeight="370">
    <t:fieldLayout prefix="ppl">
         <t:fieldHidden property="lx"></t:fieldHidden>
    </t:fieldLayout>
    <t:gridCol property="jiz" align="center" renderer="createRadio" caption="${i18n.xuanz}"></t:gridCol>
    <t:gridCol property="xuqbc"  type="text"   caption="${i18n.xqbc}"></t:gridCol>
    <t:gridCol property="xuqcfsj"  type="text"  caption="${i18n.cfsj}"></t:gridCol>
    <t:gridCol property="xuqly"  type="text" caption="${i18n.xqly}" convert="convertXqlyForChn"></t:gridCol>
    <t:gridCol property="beiz"  type="text" caption="${i18n.beiz}"></t:gridCol>   
    </t:grid>
     <t:fieldLayout columns="1" prefix="sj" >
     	<t:fieldText property="jisnf" notNull="true" minLength="4" maxLength="4"  dataType="integer" caption="${i18n.srnyjsdnf}" ></t:fieldText>
    </t:fieldLayout>
    <t:buttons id="verify"><t:button caption="${i18n.qr}" name="dosubmit"></t:button></t:buttons>
	</t:form>
	</t:page>
	<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['LX'] = {'KD':'KD','IL':'IL'};  //给fieldselect添加值
	 /**
	*列渲染事件,创建Radio	
	*/
	function createRadio(){
		return "<input  name='jiz'   type='radio'  click=' radioClick()'/>";
	}
	
	function  xqjsrowSelect(selectedIds,rowtr,selectedrecords,selectedrecord,cell,cols){
	       /* if($(cell[0]).attr('type')!='radio')
	           $(rowtr).find('input[type="radio"]').attr("checked","checked");*/
	    if($(cell[0]).attr('type')!='radio'){
			return false;
		}   
	    return true;
	}
	
	
	//点击radio
	function radioClick() {
		var radios = document.getElementsByName("jiz");
		var param = {};
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				//alert(radios[i]);
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				xuqbc = rowElemt.find('td:eq(1)').text();
				xuqly = rowElemt.find('td:eq(3)').attr("value");
				xuqcfsj = rowElemt.find('td:eq(2)').text();
				param.xuqbc = xuqbc;
				param.xuqly = xuqly;
				param.xuqcfsj = xuqcfsj;
			}
		}
		return param;
	}
	

	function func_button_dosubmit(){
	var record1 =  radioClick();
	if(typeof record1.xuqbc =='undefined'){
				alert("${i18n.selectOneRow}!");
				return;
	}
	 //校验
	if(!$('#maoxq').form('validate')){
	var errorMessage = [];
	$('#maoxq').find('.youi-field.validating,.youi-field.validate-error').each(function(){
	  if(this.title)errorMessage.push(this.title);
	});
	$.sdcui.messageUtil.showError(errorMessage.join('\n'));
	return;
	}
	var lx=$('#layout_LX').fieldValue();
    var jissj = $('#sj_jissj').fieldValue();
    var  nf  =$('#sj_jisnf').fieldValue();
	 record1['LX']= lx;
     record1['jisnf'] = nf; 
   $.sdcui.ajaxUtil.ajax({
             url:"${ctx}/ppl/comparetime.ajax?&jisnf="+nf,//请求url
            	success:function (result){//回调函数
            		if(result.result){
            		 $.sdcui.pageUtils.goPage({   //将结果提交到后台
		             	url:'/ppl/maoxq_quer.do',//url
			            record:record1,
			            mode:'form'
	                	});
            		}else{
            		  alert("${i18n.inputError}！");
            		}
              }
     	});
    } 
	</script>
	
</t:html>