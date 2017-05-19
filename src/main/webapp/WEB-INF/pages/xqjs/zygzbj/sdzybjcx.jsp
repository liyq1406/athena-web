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
		<t:fieldText width="100" property="cangkdm"  caption="${i18n.ck}" maxLength="9"></t:fieldText>
		<t:fieldSelect width="100" property="jihydm" convert="getJihz" caption="${i18n.jhyz}"></t:fieldSelect>
		<t:fieldSelect width="100" property="zygy" convert="zygy" caption="${i18n.gyzy}"></t:fieldSelect>
		<t:fieldSelect width="100" property="zhizlx" convert="queryZhizlx" caption="${i18n.zzlx}"></t:fieldSelect>
		<t:fieldText width="100" property="lingjbh" caption="${i18n.ljh}" maxLength="10"></t:fieldText>
		<t:fieldHidden property="type"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="lingjbh" type="link" caption="${i18n.ljh}"></t:gridCol>
	<t:gridCol property="jislx" caption="${i18n.jslx}" convert="cacheJslx"></t:gridCol>
	<t:gridCol property="zhizlx" caption="${i18n.zzlx}"></t:gridCol>
	<t:gridCol property="cangkdm" caption="${i18n.mud}"></t:gridCol>
	<t:gridCol property="jissj" caption="J0${i18n.riq}"></t:gridCol>
	<t:gridCol property="xuq0" renderer="xq0Renderer" type="link" colNum="2"  caption="J0"></t:gridCol>
	<t:gridCol property="yijf0" renderer="jf0Renderer" colNum="-1" caption=""></t:gridCol>
	<t:gridCol property="xuq1" renderer="xq1Renderer" type="link" colNum="2" caption="J1"></t:gridCol>
	<t:gridCol property="yijf1" renderer="jf1Renderer" colNum="-1" caption=""></t:gridCol>
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
			url:'/zygzbj/initZygzSd.do',//url
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
	function link_xuq0(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxSd.do?xuh=0&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	/**
	*总需求1链接点击事件
	*/
	function link_xuq1(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_zygzbj').grid('getRecord',rowDoc);//获取当前行对应的记录
		window.open ('${ctx}/zygzbj/initMxSd.do?xuh=1&removeId=layout-north,layout-west,layout-south&id='+record.id+'&anqkc='+record.anqkc+'&cangkdm='+record.cangkdm,
				'${i18n.bjlb}','height=550,width=1100,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	
	</script>
	<style type="text/css"></style>
</t:html>