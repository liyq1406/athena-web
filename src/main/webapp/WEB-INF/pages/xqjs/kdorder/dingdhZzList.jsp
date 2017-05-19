<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="ctPath" value="${pageContext.request.contextPath}" />
<t:html title="kd件订单行终止" >
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
		alert("${i18n.lingjxzts}");
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
        url:"${ctPath}/kdorder/dingdmxZz.ajax",//请求url
           data:params.join('&'),
               success:function (result){
               alert(result.result);
               $('#dingdmxGrid').grid('reload');
           }
    });
}

function createCheckBox(){
	return "<input  name='choices'  type='CheckBox' value='0'/>";
}

function selectRow(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		//var chk = $(rowTr).find("input[type='checkbox']");
		//var red = $(rowTr).find("input[type='radio']");
        if(checkbox.type == 'checkbox'){
			return true;
		}
		return false;
   }
</script>
<!--主体内容开始-->
<t:form id="dingdmxForm" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="dingdmxGrid" caption="${i18n.ljdingdh}" showNum="true" idKeys="usercenter,dingdh,lingjbh,gonghlx"
	src="/kdorder/queryDingdmxByParam.ajax" add="NOT" edit="NOT" remove="NOT" load="false" back="NOT" selectRowEvent="selectRow" multiple="true" scrollHeight="222" pageSize="10">
	<t:fieldLayout prefix="layout" columns="4">
		<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="100"></t:fieldSelect>
		<t:fieldSelect property="jihyz" caption="${i18n.jihyz}" width="100" convert="getJihz"></t:fieldSelect>
		<t:fieldText property="dingdh" caption="${i18n.dingdh}" width="100"></t:fieldText>
		<t:fieldText property="gongysdm" caption="${i18n.gongysdm}" width="100"></t:fieldText>
		<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" width="100"></t:fieldText>
		<t:fieldCalendar property="jiaofrqStart" format="yyyy-MM-dd" caption="${i18n.jiaofrqStart}" width="100" ></t:fieldCalendar>
		<t:fieldCalendar property="jiaofrqEnd" format="yyyy-MM-dd" caption="${i18n.jiaofrqEnd}" width="100" ></t:fieldCalendar>
		<t:fieldSelect property="searchSymbols" caption="${i18n.searchSymbols}" width="100">
			<t:fieldOption value="1" text="${i18n.dengyu}"></t:fieldOption>
			<t:fieldOption value="2" text="${i18n.xiaoyu}"></t:fieldOption>
			<t:fieldOption value="3" text="${i18n.dayu}"></t:fieldOption>
		</t:fieldSelect>
		<t:fieldText property="jfbl" width="100" caption="%" dataType="number" fractionLength="2" maxLength="4"></t:fieldText>
		
	</t:fieldLayout>
	<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
	<t:gridCol property="id" caption="${i18n.ddmxh}" width="100"></t:gridCol>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}" width="100"></t:gridCol>
	<t:gridCol property="usercenter"  caption="${i18n.usercenter}" width="150"></t:gridCol>
	<t:gridCol property="gongysdm"  caption="${i18n.gongysdm}" width="100"></t:gridCol>
	<t:gridCol property="gongsmc"  caption="${i18n.gongsmc}" width="100"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.zhongwmc}" width="100"></t:gridCol>
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
<script type="text/javascript">


	</script>
</t:page>
</t:html>