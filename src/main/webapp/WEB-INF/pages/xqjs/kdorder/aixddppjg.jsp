<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.kdzqdd.aixdd">
	<t:grid id="grid_aixddppjg" caption="${i18n.dingdxljlb}" idKeys="id,usercenter" showNum="true" reset="NOT"
	src="/kdorder/queryAixddppgzjg.ajax" remove="NOT" dataFormId="form_aixddppjg" scrollHeight="292">
	<t:fieldLayout prefix="gridLayout">	
		<t:fieldText property="lingjbh" caption="${i18n.lingjh}" maxLength="10"></t:fieldText>
		<t:fieldHidden property="dingdh"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.lingjmc}"></t:gridCol>
	<t:gridCol property="uabzucrl" caption="${i18n.baozrl}"></t:gridCol>
	<t:gridCol property="uabzlx" caption="${i18n.baozlx}"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.danw}"></t:gridCol>
	<t:gridCol property="dinghsl" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="fayrq" caption="${i18n.chugrq}"></t:gridCol>
	</t:grid>
	<t:form id="form_aixddppjg" action="/kdorder/saveAixddppgzjg.ajax" dialog="true" idKeys="id,lingjbh,fayrq">
		<t:fieldLayout prefix="aixddppjg">
			<t:fieldHidden property="id"></t:fieldHidden>
			<t:fieldHidden property="usercenter"></t:fieldHidden>
			<t:fieldText property="dingdh" readonly="true" caption="${i18n.dingdh}" maxLength="9"></t:fieldText>
			<t:fieldText property="gongysdm" readonly="true" caption="${i18n.gongysdm}"></t:fieldText>
			<t:fieldText property="lingjbh" notNull="true" maxLength="10" caption="${i18n.lingjh}"></t:fieldText>
			<t:fieldText property="dinghsl" dataType="number" fractionLength="3" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='${i18n.numbermessage7}' caption="${i18n.lingjzl}"></t:fieldText>
			<t:fieldCalendar property="fayrq" format="yyyy-MM-dd" caption="${i18n.chugrq}"/>
		</t:fieldLayout>
	</t:form>
	</t:page>
	<script type="text/javascript"> 
	
	
	/*
	*匹配装箱规则按钮点击事件
	*/
	function func_button_pipzxgz(){
		var record = $('#grid_aixdd').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length != 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		var params = [];//传递参数
		params.push('dingdmx.dingdh='+record[0].dingdh);//订单号
		params.push('dingdmx.usercenter='+record[0].usercenter);//用户中心
		params.push('dingdmx.gongysdm='+record[0].gongysdm);//供应商代码
		params.push('dingdmx.lingjbh='+record[0].lingjbh);//零件编号
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/kdorder/piPzxgz.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
	}
	
	//修改按钮
	function func_button_edit() {
		
		$('#form_aixddppjg').form("clear");//清除弹出窗口的数据
		
		$('#form_aixddppjg').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_aixddppjg").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_aixddppjg').form('fillRecord', $.extend({
			aixddppjg : '--'
		}, record));
		
		$("#form_aixddppjg").form("open");
		
	}
	</script>
	<style type="text/css"></style>
</t:html>