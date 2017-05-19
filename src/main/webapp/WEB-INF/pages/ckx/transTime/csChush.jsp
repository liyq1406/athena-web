<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.cschush}">

<!-- 
	  CS初始化盘点
	 @author xss
	 @date 2014-9-05
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.transTime.i18n_cschush">
	<t:grid id="grid_cschush" caption="${i18n.cschush}" idKeys="usercenter,chanx" 
		 scrollHeight="335" pageSize="20" src="/transTime/queryCkxCsChush.ajax"
		editable="true"  load="false"  showNum="true" submit="NOT" reset="NOT"
		saveRowsSrcs="/transTime/saveCkxCsChush.ajax" afterSaveRowsEvent="afterSaveRows"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		>
		
		<t:fieldLayout id="fl_kuwdj" prefix="cschush" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${loginUsercenter}" convert="queryUserCenterMap" readonly="true" width="110"/>
			<t:fieldText property="fenpqh" caption="${i18n.fenpq}" dataType="text" maxLength="10" minLength="3" width="110"/>
			<t:fieldText property="chanx" caption="${i18n.chanx}" notNull="true" dataType="text" maxLength="5" width="110"/>
			<t:fieldText property="xiaohd" caption="${i18n.xiaohd}" dataType="text" maxLength="25" width="110"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjh}" dataType="text" maxLength="10" width="110"/>
			<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt}"  convert="zhuangt2" width="110"/>
		    <t:fieldCalendar property="qissj" caption="${i18n.pandkssj}"  format="yyyy-MM-dd"></t:fieldCalendar>
		    <t:fieldCalendar property="zhongzsj" caption="${i18n.pandjssj}"  format="yyyy-MM-dd"></t:fieldCalendar>
		    <t:fieldText property="l1" caption="${i18n.yipsl}" dataType="number" readonly="true" width="110"/>
		    <t:fieldText property="l5" caption="${i18n.yingpsl}"  dataType="text" readonly="true" width="110"/>		
		
		    </t:fieldLayout>
       
        <t:button caption="${i18n.chax}" name="chaxun"></t:button>
        <t:button caption="${i18n.pand}" name="pand"></t:button>
        <t:button caption="${i18n.subReset}" name="subReset"></t:button>
		<t:gridCol property="chanx" caption="${i18n.chanx}"></t:gridCol>
		<t:gridCol property="xiaohd" caption="${i18n.xiaohd}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
		<t:gridCol property="pandr" caption="${i18n.pandr}"></t:gridCol>
		<t:gridCol property="zhengclsh" caption="${i18n.zhengclsh}" editor="fieldText"></t:gridCol>		
		<t:gridCol property="pandsl" caption="${i18n.pandsl}" editor="fieldText"
editorOptions="{'notNull':true,'expression':'^[1-9][0-9]{0,8}(?:\.[0-9]{1,3})?$|0|0\.[0-9]{1,3}$','expressionMessage':'请输入0 至  999999999.999 之间的数字'}">
		 </t:gridCol>
		<t:gridCol property="pandsj" caption="${i18n.pandsj}"></t:gridCol>			
		<t:gridCol property="zhuangt" caption="${i18n.zhuangt}" convert="zhuangt" />


		 
	</t:grid>
	
</t:page>

<script type="text/javascript">
	//标识
	$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'C_CSCSHZT0' : '${i18n.C_CSCSHZT0}',
		'C_CSCSHZT1' : '${i18n.C_CSCSHZT1}',
		'C_CSCSHZT2' : '${i18n.C_CSCSHZT2}',
		'C_CSCSHZT3' : '${i18n.C_CSCSHZT3}',
		'C_CSCSHZT4' : '${i18n.C_CSCSHZT4}'
	};
	
		//标识
	$.sdcui.serverConfig.convertArray['zhuangt2'] = {
		'0' : '${i18n.one}',
		'1' : '${i18n.two}',
		'2' : '${i18n.three}',
		'3' : '${i18n.four}',
		'4' : '${i18n.five}'
	};
	
	
	/* 
	function grid_cschush_afterSubmit(result) {
		
	alert(result);
	}
	*/
	
	function func_button_subReset() {
         $('#grid_cschush').grid('reset');
         //$("#grid_cschush").grid('clearBatchData');
	}
	
	
	function func_button_chaxun(){
		var tmp = trim($('#cschush_chanx').fieldValue());
			if(!tmp){
			    alert("产线不能为空");
			return false;
		}
		
		var params = [];

		var usercenter = trim($('#cschush_usercenter').fieldValue());
		var fenpqh = trim($('#cschush_fenpqh').fieldValue());
		var chanx = trim($('#cschush_chanx').fieldValue());
		var xiaohd= trim($('#cschush_xiaohd').fieldValue());
		var lingjbh= trim($('#cschush_lingjbh').fieldValue());
		var zhuangt= trim($('#cschush_zhuangt').fieldValue());
		var zhongzsj= trim($('#cschush_zhongzsj').fieldValue());
		var qissj= trim($('#cschush_qissj').fieldValue());
		
		params.push("usercenter="+usercenter);	//用户中心
		params.push("chanx="+chanx);	//产线
		params.push("fenpqh="+fenpqh);	//分配区号
		params.push("xiaohd="+xiaohd);	//消耗点
		params.push("lingjbh="+lingjbh);	//零件编号
		params.push("zhuangt="+zhuangt);	//状态
		params.push("zhongzsj="+zhongzsj);	//终止时间
		params.push("qissj="+qissj);	//起始时间

					 $.sdcui.ajaxUtil.ajax({
			 	 	   url:"../transTime/queryCkxCsChush.ajax",
			 	 	   data:params.join('&'),
			 	       success:function (result){
			 	          //alert("已盘数量："+result.result.l1+"应盘数量："+result.result.l5);
			 	          $("#grid_cschush").grid("reload");
			 	          $('#cschush_l1').fieldValue(result.result.l1);
			 	          $('#cschush_l5').fieldValue(result.result.l5);		       	 	    	 
			 	       }
			     	});

	}


	//保存按钮
	function func_button_save() {
		$('#grid_cschush').grid('saveRows');
	}
	
		//行编辑保存后的方法
	function afterSaveRows(result){
		var m =  result.result.response.message;
		if(m!='0000'){
			alert(m);		
		}else{
		  $('#grid_cschush').grid('reload');
		  $('#cschush_l1').fieldValue(result.result.l1);
		  $('#cschush_l5').fieldValue(result.result.l5);	
		}
	}
	
	function func_button_pand() {
		//alert("1111");
		$("#grid_cschush").grid("saveRows");
		
	}

	/* 行编辑保存后的方法
	function afterSaveRows(result){
		//alert(result.response);
		if(false == result.success){
			return false;
		}
		return true;
	}
	*/
	
	
</script>

</t:html>