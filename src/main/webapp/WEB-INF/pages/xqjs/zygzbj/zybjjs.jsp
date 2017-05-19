<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygzbjjs">
	<t:grid id="grid_xqbc" caption="${i18n.xqbc}" showNum="true" showCheckbox="true" submit="NOT" reset="NOT" load="false"
	src="/zygzbj/selectMxq.ajax" add="NOT" edit="NOT" remove="NOT" usePager="false" scrollHeight="350" idKeys="xuqly,xuqbc,xuqcfsj">
	<t:fieldLayout prefix="gridLayout">
		<t:fieldSelect  property="jslx" src="/zygzbj/queryZyJslx.ajax" show="value" code="key"   caption="${i18n.jslx}"></t:fieldSelect>
	</t:fieldLayout>
	<t:gridCol property="xuqly" caption="${i18n.xqly}" convert="convertXqlyForChn"></t:gridCol>
	<t:gridCol property="xuqbc" width="200" type="link" caption="${i18n.xqbc}"></t:gridCol>
	<t:gridCol property="xuqcfsj" width="200" caption="${i18n.cfsj}"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}"></t:gridCol>
	</t:grid>
	<t:fieldLayout prefix="rqLayout">
	<t:fieldText property="zyhqrq" readonly="true" caption="${i18n.zyhqrq}"></t:fieldText>
	</t:fieldLayout>
	<t:buttons id="button_form">
	<t:button caption="${i18n.qued}" name="save"></t:button>
	</t:buttons>
	<input id="hiddenId" value="${hiddenId}" type="hidden"/>
	</t:page>
	<script type="text/javascript"> 
	/*
	*确定按钮点击事件
	*/
	function func_button_save(){
		var zyhqrq = $('#rqLayout_zyhqrq').fieldValue();//获取资源获取日期的值
		//资源获取日期判断
		if(zyhqrq == ""){
			alert('${i18n.chooseZyhqrq}!');
			return false;
		}
		var record = $('#grid_xqbc').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length < 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		//拼接参数
		var params = [];
		for(var i = 0;i < length;i++){
			var xuqly = record[i].xuqly;//需求来源
			for(var j = 0;j < length;j++){
				if(i != j){
					//判断需求来源是否有重复,单一需求来源只能选择一条数据
					if(xuqly == record[j].xuqly){
						alert('${i18n.chooseXuqly}!');
						return false;
					}
				}
			}
			var xuqbc = record[i].xuqbc;//获取需求版次
			var xuqcfsj = record[i].xuqcfsj;//需求拆分日期
			params.push('edit['+i+'].xuqbc='+xuqbc);
			params.push('edit['+i+'].xuqcfsj='+xuqcfsj);
			params.push('edit['+i+'].xuqly='+xuqly);
		}
		var jslx = $('#gridLayout_jslx').fieldValue();//获取选择计算类型的值
		params.push('jslx='+jslx);
		params.push('zyhqrq='+zyhqrq);
		
		$.sdcui.ajaxUtil.ajax({
            url:"jiS.ajax",//请求url
            data:params.join('&'),
           	success:function (result){
           		alert(result.result);
            }
    	});
	}
	
	/*
	*计算类型选择事件
	*/
	function gridLayout_jslx_change(){
		$('#grid_xqbc').grid('reload',false,[],true); 
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
		 /*
		$.sdcui.pageUtils.goPage({
			url:'/zygzbj/mxqMx.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		*/
		window.open ('${ctx}/zygzbj/mxqMx.do?removeId=layout-north,layout-west,layout-south&l&xuqbc='+record.xuqbc,'${i18n.mxqmx}','height=655,width=1268,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false;

	}
	</script>
	<style type="text/css"></style>
</t:html>