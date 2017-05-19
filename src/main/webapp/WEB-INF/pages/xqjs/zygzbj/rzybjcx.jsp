<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygzbjcx">
	<t:grid id="grid_zygzbj" caption="${i18n.bjlb}" load="false" idKeys="id,zuidkcsl" exportXls="true" showNum="true"
	src="/zygzbj/queryZygzbj.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="layout" columns="4">
		<t:fieldSelect width="100" property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:fieldSelect>
		<t:fieldSelect  property="jislx" width="100" src="/zygzbj/queryZyJslx.ajax" show="value" code="key" caption="${i18n.jslx}"></t:fieldSelect>
		<t:fieldText width="100" property="cangkdm"  caption="${i18n.ck}" maxLength="3"></t:fieldText>
		<t:fieldSelect width="100" property="jihydm" convert="getJihz" caption="${i18n.jhyz}"></t:fieldSelect>
		<t:fieldSelect width="100" property="zygy" convert="zygy" caption="${i18n.gyzy}"></t:fieldSelect>
		<t:fieldSelect width="100" property="zhizlx" convert="queryZhizlx" caption="${i18n.zzlx}"></t:fieldSelect>
		<t:fieldText width="100" property="lingjbh" caption="${i18n.ljh}" maxLength="10"></t:fieldText>
		<t:fieldHidden property="type"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="lingjbh" type="link" caption="${i18n.ljh}"></t:gridCol>
	<t:gridCol property="jislx" caption="${i18n.jslx}" convert="cacheJslx"></t:gridCol>
	<t:gridCol property="zhizlx" caption="${i18n.zzlx}"></t:gridCol>
	<t:gridCol property="cangkdm" caption="${i18n.ck}"></t:gridCol>
	<t:gridCol property="jissj" caption="J0${i18n.riq}"></t:gridCol>
	<t:gridCol property="xuq0" renderer="xq0Renderer" colNum="2"  caption="J0"></t:gridCol>
	<t:gridCol property="yijf0" renderer="jf0Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq1" renderer="xq1Renderer" colNum="2" caption="J1"></t:gridCol>
	<t:gridCol property="yijf1" renderer="jf1Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq2" renderer="xq2Renderer" colNum="2" caption="J2"></t:gridCol>
	<t:gridCol property="yijf2" renderer="jf2Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq3" renderer="xq3Renderer" colNum="2" caption="J3"></t:gridCol>
	<t:gridCol property="yijf3" renderer="jf3Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq4" renderer="xq4Renderer" colNum="2" caption="J4"></t:gridCol>
	<t:gridCol property="yijf4" renderer="jf4Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq5" renderer="xq5Renderer" colNum="2" caption="J5"></t:gridCol>
	<t:gridCol property="yijf5" renderer="jf5Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq6" renderer="xq6Renderer" colNum="2" caption="J6"></t:gridCol>
	<t:gridCol property="yijf6" renderer="jf6Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq7" renderer="xq7Renderer" colNum="2" caption="J7"></t:gridCol>
	<t:gridCol property="yijf7" renderer="jf7Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq8" renderer="xq8Renderer" colNum="2" caption="J8"></t:gridCol>
	<t:gridCol property="yijf8" renderer="jf8Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq9" renderer="xq9Renderer" colNum="2"  caption="J9"></t:gridCol>
	<t:gridCol property="yijf9" renderer="jf9Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq10" renderer="xq10Renderer" colNum="2" caption="J10"></t:gridCol>
	<t:gridCol property="yijf10" renderer="jf10Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq11" renderer="xq11Renderer" colNum="2" caption="J11"></t:gridCol>
	<t:gridCol property="yijf11" renderer="jf11Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq12" renderer="xq12Renderer" colNum="2" caption="J12"></t:gridCol>
	<t:gridCol property="yijf12" renderer="jf12Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq13" renderer="xq13Renderer" colNum="2" caption="J13"></t:gridCol>
	<t:gridCol property="yijf13" renderer="jf13Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq14" renderer="xq14Renderer" colNum="2" caption="J14"></t:gridCol>
	<t:gridCol property="yijf14" renderer="jf14Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq15" renderer="xq15Renderer" colNum="2" caption="J15"></t:gridCol>
	<t:gridCol property="yijf15" renderer="jf15Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq16" renderer="xq16Renderer" colNum="2" caption="J16"></t:gridCol>
	<t:gridCol property="yijf16" renderer="jf16Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq17" renderer="xq17Renderer" colNum="2" caption="J17"></t:gridCol>
	<t:gridCol property="yijf17" renderer="jf17Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq18" renderer="xq18Renderer" colNum="2"  caption="J18"></t:gridCol>
	<t:gridCol property="yijf18" renderer="jf18Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq19" renderer="xq19Renderer" colNum="2" caption="J19"></t:gridCol>
	<t:gridCol property="yijf19" renderer="jf19Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq20" renderer="xq20Renderer" colNum="2" caption="J20"></t:gridCol>
	<t:gridCol property="yijf20" renderer="jf20Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq21" renderer="xq21Renderer" colNum="2" caption="J21"></t:gridCol>
	<t:gridCol property="yijf21" renderer="jf21Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq22" renderer="xq22Renderer" colNum="2" caption="J22"></t:gridCol>
	<t:gridCol property="yijf22" renderer="jf22Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq23" renderer="xq23Renderer" colNum="2" caption="J23"></t:gridCol>
	<t:gridCol property="yijf23" renderer="jf23Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq24" renderer="xq24Renderer" colNum="2" caption="J24"></t:gridCol>
	<t:gridCol property="yijf24" renderer="jf24Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq25" renderer="xq25Renderer" colNum="2" caption="J25"></t:gridCol>
	<t:gridCol property="yijf25" renderer="jf25Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq26" renderer="xq26Renderer" colNum="2" caption="J26"></t:gridCol>
	<t:gridCol property="yijf26" renderer="jf26Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq27" renderer="xq27Renderer" colNum="2" caption="J27"></t:gridCol>
	<t:gridCol property="yijf27" renderer="jf27Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq28" renderer="xq28Renderer" colNum="2" caption="J28"></t:gridCol>
	<t:gridCol property="yijf28" renderer="jf28Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq29" renderer="xq29Renderer" colNum="2" caption="J29"></t:gridCol>
	<t:gridCol property="yijf29" renderer="jf29Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="weifysl" caption="${i18n.wjf}"></t:gridCol>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="jihydm" caption="${i18n.jhyz}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol property="lingjdw" caption="${i18n.ljdw}"></t:gridCol>
	<t:gridCol property="baozrl" caption="${i18n.bzrl}"></t:gridCol>
	<t:gridCol property="qickc" caption="${i18n.qckc}"></t:gridCol>
	<t:gridCol property="daixhl" caption="${i18n.dxh}"></t:gridCol>
	<t:gridCol property="anqkc" caption="${i18n.aqkc}"></t:gridCol>
	</t:grid>
	<p>${i18n.bz}:${i18n.bz2}&nbsp;${i18n.bz3}
	<br>
	${i18n.bz5}&nbsp;${i18n.bz6}
	</p>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['zygy'] = {'1':'${i18n.zhengc}','2':'${i18n.duanq}','3':'${i18n.guol}'};
	
	/*
	*已交付0
	*/
	function jf0Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf0;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付1
	*/
	function jf1Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf1;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付2
	*/
	function jf2Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf2;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付3
	*/
	function jf3Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf3;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付4
	*/
	function jf4Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf4;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付5
	*/
	function jf5Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf5;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付6
	*/
	function jf6Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf6;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付7
	*/
	function jf7Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf7;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付8
	*/
	function jf8Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf8;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付9
	*/
	function jf9Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf9;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付10
	*/
	function jf10Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf10;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付11
	*/
	function jf11Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf11;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付12
	*/
	function jf12Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf12;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付13
	*/
	function jf13Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf13;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付14
	*/
	function jf14Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf14;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付15
	*/
	function jf15Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf15;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付16
	*/
	function jf16Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf16;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付17
	*/
	function jf17Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf17;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付18
	*/
	function jf18Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf18;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付19
	*/
	function jf19Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf19;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付20
	*/
	function jf20Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf20;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付21
	*/
	function jf21Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf21;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付22
	*/
	function jf22Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf22;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付23
	*/
	function jf23Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf23;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付24
	*/
	function jf24Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf24;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付25
	*/
	function jf25Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf25;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付26
	*/
	function jf26Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf26;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付27
	*/
	function jf27Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf27;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付28
	*/
	function jf28Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf28;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	/*
	*已交付29
	*/
	function jf29Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var yijf = value.yijf29;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+yijf+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+yijf+"</span>";
		}else{//正常显示
			return yijf;
		}
	}
	
	/*
	*需求0
	*/
	function xq0Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq0;//需求0
		var yijf = value.yijf0;//已交付0
		var anqkc = value.anqkc;//安全库存
		var zuidkcsl = value.zuidkcsl;//最大库存
		if(yijf < anqkc){//已交付小于安全库存,显示红色
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){//已交付大于最大库存显示黄色
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{//正常显示
			return xuq;
		}
	}
	/*
	*需求1
	*/
	function xq1Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq1;
		var yijf = value.yijf1;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求2
	*/
	function xq2Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq2;
		var yijf = value.yijf2;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求3
	*/
	function xq3Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq3;
		var yijf = value.yijf3;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求4
	*/
	function xq4Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq4;
		var yijf = value.yijf4;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求5
	*/
	function xq5Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq5;
		var yijf = value.yijf5;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求6
	*/
	function xq6Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq6;
		var yijf = value.yijf6;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求7
	*/
	function xq7Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq7;
		var yijf = value.yijf7;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求8
	*/
	function xq8Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq8;
		var yijf = value.yijf8;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求9
	*/
	function xq9Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq9;
		var yijf = value.yijf9;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求10
	*/
	function xq10Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq10;
		var yijf = value.yijf10;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求11
	*/
	function xq11Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq11;
		var yijf = value.yijf11;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求12
	*/
	function xq12Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq12;
		var yijf = value.yijf12;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求13
	*/
	function xq13Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq13;
		var yijf = value.yijf13;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求14
	*/
	function xq14Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq14;
		var yijf = value.yijf14;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求15
	*/
	function xq15Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq15;
		var yijf = value.yijf15;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求16
	*/
	function xq16Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq16;
		var yijf = value.yijf16;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求17
	*/
	function xq17Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq17;
		var yijf = value.yijf17;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求18
	*/
	function xq18Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq18;
		var yijf = value.yijf18;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求19
	*/
	function xq19Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq19;
		var yijf = value.yijf19;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求20
	*/
	function xq20Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq20;
		var yijf = value.yijf20;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求21
	*/
	function xq21Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq21;
		var yijf = value.yijf21;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求22
	*/
	function xq22Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq22;
		var yijf = value.yijf22;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求23
	*/
	function xq23Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq23;
		var yijf = value.yijf23;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求24
	*/
	function xq24Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq24;
		var yijf = value.yijf24;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求25
	*/
	function xq25Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq25;
		var yijf = value.yijf25;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求26
	*/
	function xq26Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq26;
		var yijf = value.yijf26;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求8
	*/
	function xq27Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq27;
		var yijf = value.yijf27;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求28
	*/
	function xq28Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq28;
		var yijf = value.yijf28;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	/*
	*需求29
	*/
	function xq29Renderer(col,
			value,  
			rowIndex,
			colIndex){
		var xuq = value.xuq29;
		var yijf = value.yijf29;
		var anqkc = value.anqkc;
		var zuidkcsl = value.zuidkcsl;
		if(yijf < anqkc){
			return "<span style=\"color: red;\">"+xuq+"</span>";
		}else if(yijf > zuidkcsl){
			return "<span style=\"color: #0000ff;\">"+xuq+"</span>";
		}else{
			return xuq;
		}
	}
	
	/*
	*确定按钮点击事件
	*/
	function func_button_export(){
		var record = $('#grid_zygzbj').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length != 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		return false;
		var jslx = $('#layout_jslx').fieldValue();//获取选择计算类型的值
		var zyhqrq = $('#rqLayout_zyhqrq').fieldValue();//获取资源获取日期的值
		var xuqbc = record[0].xuqbc;//获取需求版次
		var xuqcfsj = record[0].xuqcfsj;//需求拆分日期
		var xuqly = record[0].xuqly;//需求来源
		var params = [];
		params.push('jslx='+jslx);
		params.push('zyhqrq='+zyhqrq);
		params.push('xuqbc='+xuqbc);
		params.push('xuqcfsj='+xuqcfsj);
		params.push('xuqly='+xuqly);
		$.sdcui.ajaxUtil.ajax({
            url:"/${ctx}/zygzbj/jiS.ajax",//请求url
            data:params.join('&'),
           	success:function (result){
           		alert(result.result);
            }
    	});
	}
	
	/**
	*零件号链接点击事件
	*/
	function link_lingjbh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/zygzbj/initZygzR.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;

	}
	
	/**
	*总需求0链接点击事件
	*/
	function link_zongxq0(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxR.do?xuh=0&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	/**
	*总需求1链接点击事件
	*/
	function link_zongxq1(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxR.do?xuh=1&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	/**
	*总需求2链接点击事件
	*/
	function link_zongxq2(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxR.do?xuh=2&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	/**
	*总需求3链接点击事件
	*/
	function link_zongxq3(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxR.do?xuh=3&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	/**
	*总需求4链接点击事件
	*/
	function link_zongxq4(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxR.do?xuh=4&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	/**
	*总需求5链接点击事件
	*/
	function link_zongxq5(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxR.do?xuh=5&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	</script>
	<style type="text/css"></style>
</t:html>