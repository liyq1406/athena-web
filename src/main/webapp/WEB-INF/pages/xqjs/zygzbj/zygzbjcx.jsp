<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygzbjcx">
	<t:fieldLayout prefix="layout">
	<t:fieldSelect  property="jslx" src="/zygzbj/queryZyJslx.ajax" show="value" code="key" caption="${i18n.jslx}"></t:fieldSelect>
	</t:fieldLayout>
	<t:grid id="grid_xqbc" caption="${i18n.xqbc}" showNum="true" submit="NOT" reset="NOT" load="false"
	src="/zygzbj/selectMxq.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="gridLayout">
		<t:fieldHidden property="zyjslx"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="xuqly" caption="${i18n.xqly}" convert="convertXqlyForChn"></t:gridCol>
	<t:gridCol property="xuqbc" type="link" caption="${i18n.xqbc}"></t:gridCol>
	<t:gridCol property="xuqcfsj" caption="${i18n.cfsj}"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}"></t:gridCol>
	</t:grid>
	<t:fieldLayout prefix="rqLayout">
	<t:fieldSelect property="zyhqrq" convert="cacheZiyhqrl" caption="${i18n.zyhqrq}"></t:fieldSelect>
	</t:fieldLayout>
	<t:buttons id="button_form">
	<t:button caption="${i18n.qued}" name="save"></t:button>
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	/*
	*确定按钮点击事件
	*/
	function func_button_save(){
		var record = $('#grid_xqbc').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length != 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
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
	
	/*
	*计算类型选择事件
	*/
	function layout_jslx_change(){
		var jslx = $('#layout_jslx').fieldValue();//获取选择计算类型的值
		$('#gridLayout_zyjslx').fieldValue(jslx);//为grid的查询条件计算类型赋值
		$('#grid_xqbc').grid('reload');
	}
	
	/**
	*链接点击事件
	*/
	function link_xuqbc(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_xqbc').grid('getRecord',rowDoc);//获取当前行对应的记录
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/zygzbj/mxqMx.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;

	}
	</script>
	<style type="text/css"></style>
</t:html>