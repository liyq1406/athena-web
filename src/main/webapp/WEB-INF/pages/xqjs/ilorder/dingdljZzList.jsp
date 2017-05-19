<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctPath" value="${pageContext.request.contextPath}" />
<t:html title="IL件订单零件终止" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.ilOrder">
<script type="text/javascript">
//表单验证
function vali() {
	//是否选中了零件
	var record = $('#dingdljGrid').grid('getSelectedRecords');
	if(record.length == 0) {
		//请选择零件
		alert("请选择零件!");
		return false;
	}
	return true;
}
//零件终止按妞事件
function func_button_ljzz() {
	vali();
	
	var param = $('#dingdljGrid').grid('getSelectedRecords');//获取选中的订单零件,可以为多条
	var params = [];
	for (var i =0;i < param.length;i++){
		params.push('checkedDingdlj['+i+'].dingdh='+param[i].dingdh);
		params.push('checkedDingdlj['+i+'].usercenter='+param[i].usercenter);
		params.push('checkedDingdlj['+i+'].lingjbh='+param[i].lingjbh);
		params.push('checkedDingdlj['+i+'].gonghms='+param[i].gonghms);
	}
	$.sdcui.ajaxUtil.ajax({
        url:"${ctPath}/ilorder/dingdljZz.ajax",//请求url
           data:params.join('&'),
               success:function (result){
               alert(result.result);
               $('#dingdljGrid').grid('reload');
           }
    });
}
</script>
<!--主体内容开始-->
<t:form id="dingdljForm" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="dingdljGrid" caption="${i18n.ljzz}" showNum="true" idKeys="usercenter,dingdh,gonghms"
	src="/ilorder/queryDingdljByParam.ajax" add="NOT" edit="NOT" remove="NOT" load="false" showCheckbox="true" scrollHeight="226">
	<t:fieldLayout prefix="layout" columns="4" >
		<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="120"></t:fieldSelect>
		<t:fieldSelect property="jihyz" caption="${i18n.jihyz}" width="120" convert="getJihz"></t:fieldSelect>
		<t:fieldText property="dingdh" caption="${i18n.dingdh}" width="120" maxLength="9"></t:fieldText>
		<t:fieldText property="gongysdm" caption="${i18n.gongysdm}" width="120" maxLength="10"></t:fieldText>
		<t:fieldCalendar property="dingdzzsj_start" format="yyyy-MM-dd" defaultValue="${currentDate }" caption="${i18n.dingdzzsj_start}" width="120"></t:fieldCalendar>
		<t:fieldCalendar property="dingdzzsj_end" format="yyyy-MM-dd" defaultValue="${currentDate }"  caption="${i18n.dingdzzsj_end}" width="120"></t:fieldCalendar>
		<t:fieldSelect property="searchSymbols" caption="${i18n.searchSymbols}" width="120">
			<t:fieldOption value="1" text="等于"></t:fieldOption>
			<t:fieldOption value="2" text="小于" ></t:fieldOption>
			<t:fieldOption value="3" text="大于"></t:fieldOption>
		</t:fieldSelect>
		<t:fieldText property="jfbl" width="50" caption="%"  maxLength="3"  expression="^[0-9]*[1-9][0-9]*$" expressionMessage="请输入正整数!"></t:fieldText>
        <t:fieldText property="lingjbh" caption="${i18n.lingjbh}" width="120" maxLength="10"></t:fieldText>
	</t:fieldLayout>
	
	
	<t:gridCol property="dingdh" caption="${i18n.dingdh}" width="100"></t:gridCol>
	<t:gridCol property="usercenter"  caption="${i18n.usercenter}" width="150"></t:gridCol>
	<t:gridCol property="gongysdm"  caption="${i18n.gongysdm}" width="100"></t:gridCol>
	<t:gridCol property="gongsmc"  caption="${i18n.gongsmc}" width="100"></t:gridCol>
	<t:gridCol property="zhongwmc" caption="${i18n.zhongwmc}" width="100"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="100"></t:gridCol>
	<t:gridCol property="jihyz" caption="${i18n.jihyz}" width="100"></t:gridCol>
	<t:gridCol property="uabzucrl" caption="${i18n.uabzucrl}" width="100"></t:gridCol>
	<t:gridCol property="dingdljddlj" caption="${i18n.dingdljddlj}" width="100"></t:gridCol>
	<t:gridCol property="jiaofljddlj" caption="${i18n.jiaofljddlj}" width="100"></t:gridCol>
	<t:gridCol property="jfbl" caption="${i18n.jfbl}" width="100"></t:gridCol>
	<t:gridCol property="dingdzzsj" caption="${i18n.dingdzzsj_start}" width="100"></t:gridCol>	
	</t:grid>
<t:buttons id="button_form">
  <t:button name="ljzz" caption="${i18n.ljzz}"></t:button>
</t:buttons>
</t:form>
</t:page>
</t:html>