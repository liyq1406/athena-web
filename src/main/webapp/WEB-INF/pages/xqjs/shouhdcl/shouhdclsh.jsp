<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.shouhdcl.shouhdcl">
	<t:grid id="grid_shouhdcl" caption="${i18n.shouhdcl}" showNum="true" idKeys="lingjbh"
	src="/shouhdcl/queryShouhdcl.ajax" add="NOT" edit="NOT"  remove="NOT">
	<t:fieldLayout prefix="gridLayout" columns="3">
		<t:fieldText property="lingjbh" width="150" caption="${i18n.lingjh}" maxLength="10"></t:fieldText>
		<t:fieldText property="gongysdm" width="150" caption="${i18n.gongysdm}" maxLength="10"></t:fieldText>
		<t:fieldSelect property="jihydm" width="150" convert="getJihz" caption="${i18n.jihyz}"></t:fieldSelect>
		<t:fieldSelect property="gonghms" width="150" convert="queryGHMS3" caption="${i18n.gonghms}"></t:fieldSelect>
		<t:fieldText width="150" property="cangkbh"  caption="${i18n.cangk}"></t:fieldText>
		<t:fieldSelect property="usercenter" width="150" notNull="true" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:fieldSelect>
		<t:fieldSelect property="zhuangt1" notNull="true" width="150" convert="shenhzt" defaultValue="1" caption="${i18n.shenhzt}"></t:fieldSelect>
	</t:fieldLayout>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.danw}"></t:gridCol>
	<t:gridCol property="jusljs" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="gongysmc" caption="${i18n.gongysmc}"></t:gridCol>
	<t:gridCol property="gonghms" caption="${i18n.gonghms}"></t:gridCol>
	<t:gridCol property="yansy" caption="${i18n.jihyz}"></t:gridCol>
	<t:gridCol property="cangkbh" caption="${i18n.cangk}"></t:gridCol>
	<t:gridCol property="zhuangt" convert="shenhzt" caption="${i18n.shenhzt}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_forms">
		<t:button caption="${i18n.shenh}" name="shenh"></t:button>
		<t:button caption="${i18n.juj}" name="juj"></t:button>
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['shenhzt']={'-1':'','0':'${i18n.chuangj}','1':'${i18n.daicl}','2':'${i18n.yichul}','3':'${i18n.yish}'};
	/*
	*审核按钮点击事件
	*/
	function func_button_shenh(){

		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		var params = [];
		
		if(length != 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		params.push('usercenter='+record[0].usercenter);
		params.push('lingjbh='+record[0].lingjbh);
		params.push('gongysdm='+record[0].gongysdm);
		params.push('gonghms='+record[0].gonghms);
		params.push('zhuangt1='+record[0].zhuangt);
		params.push('cangkbh='+record[0].cangkbh);
		
		/**
		 * 该参数是保存到下个页面作为返回用
		 */
		var usercenter1= $('#gridLayout_usercenter').fieldValue();
		var lingjbh1 = $('#gridLayout_lingjbh').fieldValue();
		var gongysdm1 =  $('#gridLayout_gongysdm').fieldValue();
		var jihydm1 =  $('#gridLayout_jihydm').fieldValue();
		var gonghms1 =  $('#gridLayout_gonghms').fieldValue();  
		var cangkbh1 = $('#gridLayout_cangkbh').fieldValue();
		var zhuangt1 =  $('#gridLayout_zhuangt1').fieldValue();
		var backparam ='usercenter1='+usercenter1+'&lingjbh1='+lingjbh1+'&gongysdm1='+gongysdm1+'&jihydm1='
		+jihydm1+'&gonghms1='+gonghms1+'&cangkbh1='+cangkbh1+'&zhuangt1='+zhuangt1+'&param=shenh';
		$.sdcui.ajaxUtil.ajax({
            url:"updateJusgzd.ajax",//请求url
            data:params.join('&'),
           	success:function (result){
           		if(result.result == 'success'){
           			record[0].gonghms = result.gonghms; 
           			/**
           			 * form跳转模式提交
           			 */
           			$.sdcui.pageUtils.goPage({
           				url:'/shouhdcl/initShouhdclshlb.do?'+backparam,//url
           				record:record[0],
           				mode:'form',
           				beforeSubmit:function(){
           					return true;
           				}
           			});
           		}else{
           			alert("调用WTC更新拒收跟踪单异常"+result.result);
           			return false;
           		}
            }
    	});
	}
	
	/*
	*拒绝按钮点击事件
	*/
	function func_button_juj(){
		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		var params = [];
		if(length != 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		params.push('usercenter='+record[0].usercenter);
		params.push('lingjbh='+record[0].lingjbh);
		params.push('gongysdm='+record[0].gongysdm);
		params.push('gonghms='+record[0].gonghms);
		params.push('zhuangt1='+record[0].zhuangt);
		params.push('cangkbh='+record[0].cangkbh);
		
		/**
		 * 该参数是保存到下个页面作为返回用
		 */
		var usercenter1= $('#gridLayout_usercenter').fieldValue();
		var lingjbh1 = $('#gridLayout_lingjbh').fieldValue();
		var gongysdm1 =  $('#gridLayout_gongysdm').fieldValue();
		var jihydm1 =  $('#gridLayout_jihydm').fieldValue();
		var gonghms1 =  $('#gridLayout_gonghms').fieldValue();  
		var cangkbh1 = $('#gridLayout_cangkbh').fieldValue();
		var zhuangt1 =  $('#gridLayout_zhuangt1').fieldValue();
		var backparam ='usercenter1='+usercenter1+'&lingjbh1='+lingjbh1+'&gongysdm1='+gongysdm1+'&jihydm1='
		+jihydm1+'&gonghms1='+gonghms1+'&cangkbh1='+cangkbh1+'&zhuangt1='+zhuangt1+'&param=juj';
		
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/shouhdcl/initShouhdclshlb.do?'+backparam,//url
			record:record[0],
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
 
	}
	</script>
	<style type="text/css">
	</style>
</t:html>