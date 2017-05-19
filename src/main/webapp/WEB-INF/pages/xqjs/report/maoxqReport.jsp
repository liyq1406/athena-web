<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page>
	<t:grid id="grid_ziykz" caption="毛需求报表" idKeys="lingjbh" showNum="true" 
	src="/report/queryMaoxq.ajax" add="NOT" edit="NOT" remove="NOT" exportXls="true">
	<t:fieldLayout prefix="gridLayout" columns="3">
	    <t:fieldSelect property="usercenter" width="150" convert="queryUserCenterMap" caption="用户中心"></t:fieldSelect>
		<t:fieldText property="lingjbh" width="150" caption="零件编号" maxLength="10"></t:fieldText>
		<t:fieldText property="gongysdm" width="150" caption="供应商代码" maxLength="10"></t:fieldText>
		<t:fieldSelect property="xianslx" convert="xianslx" defaultValue="2" width="150" caption="显示类型"></t:fieldSelect>
		<t:fieldText property="dinghlx" width="150" caption="订货路线" maxLength="10"></t:fieldText>
		<t:fieldSelect property="baoblx" notNull="true" convert="baoblx" defaultValue="1" width="150" caption="零件类型"></t:fieldSelect>
	</t:fieldLayout>
	<t:button caption="毛需求分析" name="mxqFenx"></t:button>
	<t:gridCol property="usercenter" caption="用户中心"></t:gridCol>
	<t:gridCol property="lingjbh" caption="零件编号"></t:gridCol>
	<t:gridCol property="lingjmc" caption="零件名称"></t:gridCol>
	<t:gridCol property="dinghlx" caption="订货路线"></t:gridCol>
	<t:gridCol property="chanx"  caption="产线"></t:gridCol>
	<t:gridCol property="gongysdm" caption="供应商代码"></t:gridCol>
	<t:gridCol property="gongysmc" caption="供应商名称"></t:gridCol>
	<t:gridCol property="gongyfe" caption="供应份额"></t:gridCol>
	<t:gridCol property="jihy" caption="计划员组"></t:gridCol>
	<t:gridCol property="danw" caption="单位"></t:gridCol>
	<t:gridCol property="j0" caption="J0"></t:gridCol>
	<t:gridCol property="j1" caption="J1"></t:gridCol>
	<t:gridCol property="j2" caption="J2"></t:gridCol>
	<t:gridCol property="j3" caption="J3"></t:gridCol>
	<t:gridCol property="j4" caption="J4"></t:gridCol>
	<t:gridCol property="j5" caption="J5"></t:gridCol>
	<t:gridCol property="j6" caption="J6"></t:gridCol>
	<t:gridCol property="j7" caption="J7"></t:gridCol>
	<t:gridCol property="j8" caption="J8"></t:gridCol>
	<t:gridCol property="j9" caption="J9"></t:gridCol>
	<t:gridCol property="j10" caption="J10"></t:gridCol>
	<t:gridCol property="j11" caption="J11"></t:gridCol>
	<t:gridCol property="j12" caption="J12"></t:gridCol>
	<t:gridCol property="j13" caption="J13"></t:gridCol>
	<t:gridCol property="s0" caption="S0"></t:gridCol>
	<t:gridCol property="s1" caption="S1"></t:gridCol>
	<t:gridCol property="s2" caption="S2"></t:gridCol>
	<t:gridCol property="s3" caption="S3"></t:gridCol>
	<t:gridCol property="s4" caption="S4"></t:gridCol>
	<t:gridCol property="p0" caption="P0"></t:gridCol>
	<t:gridCol property="p1" caption="P1"></t:gridCol>
	<t:gridCol property="p2" caption="P2"></t:gridCol>
	<t:gridCol property="p3" caption="P3"></t:gridCol> 
	<t:gridCol property="p4" caption="P4"></t:gridCol>
	<t:gridCol property="p5" caption="P5"></t:gridCol>
	<t:gridCol property="p6" caption="P6"></t:gridCol>
	<t:gridCol property="p7" caption="P7"></t:gridCol>
	<t:gridCol property="p8" caption="P8"></t:gridCol>
	<t:gridCol property="p9" caption="P9"></t:gridCol>
	<t:gridCol property="p10" caption="P10"></t:gridCol>
	<t:gridCol property="p11" caption="P11"></t:gridCol>
	</t:grid>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['xianslx']={'1':'按用户中心','2':'按产线'};
	$.sdcui.serverConfig.convertArray['baoblx']={'1':'IL','2':'KD'};
	
	function grid_ziykz_beforeSubmit(){
		var baoblx = $('#gridLayout_baoblx').fieldValue();//报表类型
		var xianslx = $('#gridLayout_xianslx').fieldValue();//显示类型
		//如果报表类型为1
		if(baoblx == '1'){
			if(xianslx == ''){
				alert('IL类型请选择显示类型');
				return false;
			}
		}else{
			if(xianslx == '2'){
				alert('KD类型只能选择按用户中心显示');
				return false;
			}
		}
		return true;
	}
	
	/*
	*毛需求分析
	*/
	function func_button_mxqFenx(){
		var params = [];
		var usercenter =  $('#gridLayout_usercenter').fieldValue();
		params.push('usercenter='+usercenter);
		$.sdcui.ajaxUtil.ajax({
            url:"maoxqFenx.ajax",//请求url
            data:params.join('&'),
           	success:function (result){
           		alert(result.result);
            }
    	});
	}
	</script>
	<style type="text/css"></style>
</t:html>