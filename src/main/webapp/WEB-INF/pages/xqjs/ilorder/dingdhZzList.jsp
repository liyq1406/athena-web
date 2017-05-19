<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctPath" value="${pageContext.request.contextPath}" />
<t:html title="IL件订单行终止" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.ilOrder">
<script type="text/javascript">
//表单验证
function vali() {
	//是否选中了零件
	var record = $('#dingdmxGrid').grid('getSelectedRecords');
	if(record.length == 0) {
		//请选择零件
		alert("请选择零件!");
		return false;
	}
	return true;
}
//零件终止按妞事件
function func_button_dingdhzz() {
	vali();
	
	var param = $('#dingdmxGrid').grid('getSelectedRecords');//获取选中的订单零件,可以为多条
	var params = [];
	for (var i =0;i < param.length;i++){
		params.push('checkedDingdmx['+i+'].dingdh='+param[i].dingdh);
		params.push('checkedDingdmx['+i+'].usercenter='+param[i].usercenter);
		params.push('checkedDingdmx['+i+'].lingjbh='+param[i].lingjbh);
		params.push('checkedDingdmx['+i+'].dingdmxid='+param[i].id);
		params.push('checkedDingdmx['+i+'].gonghms='+param[i].gonghlx);
	}
	$.sdcui.ajaxUtil.ajax({
        url:"${ctPath}/ilorder/dingdmxZz.ajax",//请求url
           data:params.join('&'),
               success:function (result){
               alert(result.result);
               $('#dingdmxGrid').grid('reload');
           }
    });
}
</script>
<!--主体内容开始-->
<t:form id="dingdmxForm" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="dingdmxGrid" caption="${i18n.ljdingdh}" idKeys="usercenter,dingdh,lingjbh,gonghlx"
	src="/ilorder/queryDingdmxByParam.ajax" add="NOT" edit="NOT" remove="NOT" load="false" showCheckbox="true"  showNum="true" scrollHeight="215" >
	<t:fieldLayout prefix="layout" columns="4">
		<t:fieldSelect property="usercenter" width="100" caption="${i18n.usercenter}" convert="queryUserCenterMap"></t:fieldSelect>
		<t:fieldSelect property="jihyz" width="100" caption="${i18n.jihyz}" convert="getJihz"></t:fieldSelect>
		<t:fieldText property="dingdh" width="100" caption="${i18n.dingdh}" maxLength="9"></t:fieldText>
		<t:fieldText property="gongysdm" width="100" caption="${i18n.gongysdm}" maxLength="10"></t:fieldText>
		<t:fieldCalendar property="jiaofrqStart" width="100" format="yyyy-MM-dd" defaultValue="${currentDate }" caption="${i18n.jiaofrqStart}"></t:fieldCalendar>
		<t:fieldCalendar property="jiaofrqEnd" width="100" format="yyyy-MM-dd" defaultValue="${currentDate }" caption="${i18n.jiaofrqEnd}"></t:fieldCalendar>
		<t:fieldSelect property="searchSymbols" width="100" caption="${i18n.searchSymbols}">
			<t:fieldOption value="1" text="等于"></t:fieldOption>
			<t:fieldOption value="2" text="小于"></t:fieldOption>
			<t:fieldOption value="3" text="大于"></t:fieldOption>
		</t:fieldSelect>
		<t:fieldText property="jfbl" width="50" caption="%"  expression="^[0-9]*[1-9][0-9]*$" expressionMessage="请输入正整数!"></t:fieldText>
		<t:fieldText property="lingjbh" width="100" caption="${i18n.lingjbh}" maxLength="10"></t:fieldText>
	</t:fieldLayout>
	<t:gridCol property="id" caption="${i18n.ddmxh}" width="100"></t:gridCol>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}" width="100"></t:gridCol>
	<t:gridCol property="usercenter"  caption="${i18n.usercenter}" width="150"></t:gridCol>
	<t:gridCol property="gongysdm"  caption="${i18n.gongysdm}" width="100"></t:gridCol>
	<t:gridCol property="gongsmc"  caption="${i18n.gongsmc}" width="100"></t:gridCol>
	<t:gridCol property="zhongwmc" caption="${i18n.zhongwmc}" width="100"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="100"></t:gridCol>
	<t:gridCol property="cangkdm" caption="${i18n.cangkdm}" width="100"></t:gridCol>
	<t:gridCol property="uabzucrl" caption="${i18n.uabzucrl}" width="100"></t:gridCol>
	<t:gridCol property="uabzlx" caption="${i18n.uabzuclx}" width="100"></t:gridCol>
	<t:gridCol property="uabzucsl" caption="${i18n.uabzucsl}" width="100"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.danw}" width="100"></t:gridCol>
	<t:gridCol property="shul" caption="${i18n.yaohlgszl}" width="100"></t:gridCol>
	<t:gridCol property="yaohlgsyjf" caption="${i18n.yaohlgsyjf}" width="100"></t:gridCol>
	<t:gridCol property="jfbl" caption="${i18n.jfbl}" width="100"></t:gridCol>
	<t:gridCol property="jihyz" caption="${i18n.jihyz}" width="100"></t:gridCol>
	<t:gridCol property="jiaofrq" caption="${i18n.jiaofrq}" width="100"></t:gridCol>	
	</t:grid>

<t:buttons id="button_form">
  <t:button name="dingdhzz" caption="${i18n.dingdhzz}"></t:button>
</t:buttons>
</t:form>
<p>
</p>
</t:page>
</t:html>