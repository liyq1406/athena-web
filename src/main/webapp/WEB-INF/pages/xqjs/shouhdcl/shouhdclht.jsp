<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.shouhdcl.shouhdcl">
	<t:grid id="grid_shouhdclht" caption="${i18n.shouhdclht}" showNum="true" idKeys="lingjbh"
	src="/shouhdcl/queryShouhdclht.ajax" add="NOT" edit="NOT"  remove="NOT" load="false" showCheckbox="true">
	<t:fieldLayout prefix="gridLayout" columns="4">
		<t:fieldSelect property="usercenter" width="120" notNull="true" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:fieldSelect>
		<t:fieldText property="jusgzdh" width="120" caption="${i18n.jusgzdh}" maxLength="10"></t:fieldText>
		<t:fieldText property="lingjbh" width="120" caption="${i18n.lingjh}" maxLength="10"></t:fieldText>
		<t:fieldText property="gongysdm" width="120" caption="${i18n.gongysdm}" maxLength="10"></t:fieldText>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="yaohlh" caption="${i18n.yaohl}"></t:gridCol>
	<t:gridCol property="jusgzdh" caption="${i18n.jusgzdh}" width="100"></t:gridCol>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="uah"  caption="UA${i18n.hao}"></t:gridCol>
	<t:gridCol property="uabzlx" caption="UA${i18n.leix}"></t:gridCol>
	<t:gridCol property="uarl" caption="UA${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucbzlx" caption="UC${i18n.leix}"></t:gridCol>
	<t:gridCol property="uchl" caption="UC${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucgs" caption="UC${i18n.ges}"></t:gridCol>	
	<t:gridCol property="blh" caption="${i18n.fahtzd}"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.danw}"></t:gridCol>
	<t:gridCol property="gonghms" caption="${i18n.gonghms}"></t:gridCol>
	<t:gridCol property="xiehd" caption="卸货点"></t:gridCol>	
	<t:gridCol property="chengysdm" caption="承运商代码"></t:gridCol>	
	<t:gridCol property="dinghcj" caption="${i18n.dinghcj}"></t:gridCol>
	<t:gridCol property="fahsj" caption="${i18n.fahsj}"></t:gridCol>
	<t:gridCol property="daohsj" caption="${i18n.daohsj}"></t:gridCol>
	<t:gridCol property="beiz4" caption="审核人"></t:gridCol>
	<t:gridCol property="beiz7" caption="审核时间" ></t:gridCol>	
	<t:gridCol property="t" caption="" width="10"></t:gridCol>
	</t:grid>
	<t:buttons id="button_forms">
		<t:button caption="${i18n.huit}" name="huit"></t:button>
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	
	/*
	*回退按钮点击事件
	*/
	function func_button_huit(){
		var record = $('#grid_shouhdclht').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length < 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}

		var params = [];
		for (var i =0;i < record.length;i++){
			var usercenter = record[i].usercenter==null?"":record[i].usercenter;
			var jusgzdh = record[i].jusgzdh==null?"":record[i].jusgzdh;
			var lingjbh = record[i].lingjbh==null?"":record[i].lingjbh;
			var yaohlh = record[i].yaohlh==null?"":record[i].yaohlh;
			var dingdh = record[i].dingdh==null?"":record[i].dingdh;
			params.push('list['+i+'].usercenter='+usercenter);
			params.push('list['+i+'].jusgzdh='+jusgzdh);
			params.push('list['+i+'].lingjbh='+lingjbh);
			params.push('list['+i+'].yaohlh='+yaohlh);
			params.push('list['+i+'].dingdh='+dingdh);
		}

		$.sdcui.ajaxUtil.ajax({
            url:"shouhdclhuit.ajax",//请求url
            data:params.join('&'),
           	success:function (result){
           		alert(result.result);
           		$('#grid_shouhdclht').grid('reload');
            }
    	});
	}
	</script>
	<style type="text/css">
	</style>
</t:html>