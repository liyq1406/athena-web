<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.shouhdcl.shouhdcl">
	<t:grid id="grid_shouhdcl" caption="${i18n.shouhdcljuj}" showNum="true" showCheckbox="true" 
	idKeys="usercenter,jusgzdh,jusdh,xiehd,cangkbh,gonghms,chengysdm" 
	src="/shouhdcl/queryShouhdclshlb.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="gridLayout" columns="3">
		<t:fieldSelect width="150" property="flag" convert="chuljg" caption="${i18n.chuljg}"></t:fieldSelect>
		<t:fieldText width="150" property="blh" caption="${i18n.fahtzd}" maxLength="17"></t:fieldText>
		<t:fieldCalendar format="yyyy-MM-dd" property="daohsj" caption="${i18n.daohsj}"></t:fieldCalendar>
		<t:fieldCalendar format="yyyy-MM-dd" property="utrq" caption="${i18n.daohsj}2"></t:fieldCalendar>
	     <t:fieldHidden property="lingjbh"></t:fieldHidden>
	     <t:fieldHidden property="danw"></t:fieldHidden>
	     <t:fieldHidden property="usercenter"></t:fieldHidden>
	     <t:fieldHidden property="gongysdm"></t:fieldHidden>
	     <t:fieldHidden property="gongysmc"></t:fieldHidden>
	     <t:fieldHidden property="gonghms"></t:fieldHidden>
	     <t:fieldHidden property="yansy"></t:fieldHidden>
	     <t:fieldHidden property="cangkbh"></t:fieldHidden>
	     <t:fieldHidden property="zhuangt"></t:fieldHidden>
	
		<t:fieldHidden property="usercenter1"></t:fieldHidden>
		<t:fieldHidden property="lingjbh1"></t:fieldHidden>
		<t:fieldHidden property="gongysdm1"></t:fieldHidden>
		<t:fieldHidden property="jihydm1"></t:fieldHidden>
		<t:fieldHidden property="gonghms1"></t:fieldHidden>
		<t:fieldHidden property="cangkbh1"></t:fieldHidden>
		<t:fieldHidden property="zhuangt1"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="jusgzdh" caption="${i18n.jusgzdh}"></t:gridCol>
	<t:gridCol property="jusdh" caption="${i18n.jusdh}"></t:gridCol>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
	<t:gridCol property="yaohlh" caption="${i18n.yaohl}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="jusljs" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="dinghcj" caption="${i18n.dinghcj}"></t:gridCol>
	<t:gridCol property="uah"  caption="UA${i18n.hao}"></t:gridCol>
	<t:gridCol property="uabzlx" caption="UA${i18n.leix}"></t:gridCol>
	<t:gridCol property="uarl" caption="UA${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucbzlx" caption="UC${i18n.leix}"></t:gridCol>
	<t:gridCol property="uchl" caption="UC${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucgs" caption="UC${i18n.ges}"></t:gridCol>	
	<t:gridCol property="blh" caption="${i18n.fahtzd}"></t:gridCol>
	<t:gridCol property="qissj" caption="${i18n.fahsj}"></t:gridCol>	
	<t:gridCol property="zhongzsj" caption="${i18n.daohsj}"></t:gridCol>		
	<t:gridCol property="danw" caption="${i18n.danw}"></t:gridCol>
	<t:gridCol property="xiehd" caption="卸货点"></t:gridCol>
	<t:gridCol property="chuljg" convert="chuljg" caption="${i18n.chuljg}"></t:gridCol>
	<t:gridCol property="zhuangt" convert="shenhzt" caption="${i18n.shenhzt}"></t:gridCol>
	<t:gridCol property="jusyy" caption="${i18n.beiz}"></t:gridCol>
	<t:gridCol property="beiz4" caption="审核人"></t:gridCol>
	<t:gridCol property="beiz7" caption="审核时间" ></t:gridCol>
	</t:grid>
	<t:buttons id="button_forms">
		<t:button caption="${i18n.qued}" name="qued"></t:button>
		<t:button name="shdclback"  caption="${i18n.shdclback}"  />
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['shenhzt']={'-1':'&nbsp','0':'${i18n.chuangj}','1':'${i18n.daicl}','2':'${i18n.yichul}','3':'${i18n.yish}'};
	$.sdcui.serverConfig.convertArray['chuljg']={'0':'${i18n.juj}','1':'${i18n.tongy}'};
	$.sdcui.serverConfig.convertArray['shiffsgys'] = {'0':'${i18n.fou}','1':'${i18n.shi}'};
	$.sdcui.serverConfig.convertArray['dingDlx'] = {'3':'${i18n.linsdd}'};
	/**
	*格式化补0函数
	*/
	function appendZero(s){
		return ("00"+s).substr((s+"").length);
	}
	function func_button_shdclback(){
		var usercenter1= $('#gridLayout_usercenter1').fieldValue();
		var lingjbh1 = $('#gridLayout_lingjbh1').fieldValue();
		var gongysdm1 =  $('#gridLayout_gongysdm1').fieldValue();
		var jihydm1 =  $('#gridLayout_jihydm1').fieldValue();
		var gonghms1 =  $('#gridLayout_gonghms1').fieldValue();  
		var cangkbh1 = $('#gridLayout_cangkbh1').fieldValue();
		var zhuangt1 =  $('#gridLayout_zhuangt1').fieldValue();
		window.location.href='${ctx}/shouhdcl/initShouhdcl.do?usercenter='+usercenter1+'&lingjbh='+lingjbh1+'&gongysdm='+gongysdm1+'&jihydm='+jihydm1+'&gonghms='+gonghms1+'&cangkbh='+cangkbh1+'&zhuangt1='+zhuangt1;
	}
	function gridReload(){
		$('#grid_shouhdcl').grid('reload');
	}
	/*
	*审核按钮点击事件
	*/
	function func_button_qued(){
		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length < 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		var str = "";
		//拼参数
		var params = [];
		for (var i =0;i < record.length;i++){
			var value = record[i];
			if(value.zhuangt != 1||value.jusdh.length>0){
				str += value.jusgzdh+"|";
			}else{
				params.push('list['+i+'].usercenter='+value.usercenter);
				params.push('list['+i+'].jusgzdh='+value.jusgzdh);
				params.push('list['+i+'].chuljg=0');
			}
		}
		if(str != ""){
			alert("${i18n.jusdh}"+str+"${i18n.yiclhzyjbjj}");
			return false;
		}
		
		$.sdcui.ajaxUtil.ajax({
           url:"shenH.ajax",//请求url
           data:params.join('&'),
          	success:function (result){
          		alert(result.result);
          		$('#grid_shouhdcl').grid('reload');
           }
   		});
		
	}
	</script>
	<style type="text/css">
	.youi-fieldLayout table td.contral.label-col {
    	width: 105px;
	}
	</style>
</t:html>