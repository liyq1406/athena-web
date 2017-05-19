<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单修改">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>

<t:page>
    <t:grid id="queryExpddh" add="NOT" back="NOT" edit="NOT" 
            src="/ilorder/queryExpDingdh.ajax" showCheckbox="true"
    		load="false" usePager="true" showNum="true" remove="NOT">
	          <t:fieldLayout id="ilselect" prefix="il" columns="3">
					<t:fieldSelect property="chullx"   caption="订单类别"        width="120" convert="chullx" defaultValue="PP" notNull="true"></t:fieldSelect>
					<t:fieldText property="jiszq"     caption="计算周期"         width="120" maxLength="10" notNull="true"></t:fieldText>
					<t:fieldSelect property="dinghlx"    caption="订货路线"     width="120" convert="DINGHLX"></t:fieldSelect>
					<t:fieldCalendar property="dingdjssj" caption="计算时间"     width="120" format="yyyy-MM-dd HH:mm"></t:fieldCalendar>
					<t:fieldCalendar property="dingdjssjEnd" caption="至"     width="120" format="yyyy-MM-dd HH:mm"></t:fieldCalendar>
			 </t:fieldLayout>
			<t:gridCol property="DINGDH" type="text" caption="订单号"></t:gridCol>
			<t:gridCol property="CHULLX" type="text" caption="订单类别" convert="chullx"></t:gridCol>
			<t:gridCol property="JISZQ" caption="计算周期" ></t:gridCol>
			<t:gridCol property="DINGDJSSJ" type="text" caption="订单计算时间"></t:gridCol>
    </t:grid>

	<form id="exp" name="exp" action="${ctx}/ilorder/downLoadFileIlOrder.do" method="post" style="background-color: white;" target="hiddenUp">
		 <div style="display: none;">
		      <t:fieldLayout prefix="dto">
					<t:fieldHidden property="dingdh"></t:fieldHidden>
					<t:fieldHidden property="chullx"></t:fieldHidden>
			 </t:fieldLayout>
		 </div>
		 <t:buttons id="ilexp"><t:button caption="导出" name="export" active="0"/></t:buttons>
	</form>
<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
</t:page>

<script type="text/javascript">
$.sdcui.serverConfig.convertArray['chullx'] = {
		'PP' : '周期',
		'PS' : '周',
		'PJ' : '日'
	};
$.sdcui.serverConfig.convertArray['DINGHLX'] = {
		'97W' : 'IL订货',
		'UGB' : '钢卷订货'
	};	
function callback(msg){
     if(msg!=null){
    	 alert(msg);
     }	
}

function func_button_export(){
	var records = $("#queryExpddh").grid("getSelectedRecords");
	if(records.length==0){
	   alert("请选择要导出的订单");
	   return false;
	}
	var dingdh = "(";
	for(var i=0;i<records.length;i++){
		if(i==records.length-1){
		   dingdh +="'"+records[i].DINGDH+"')";
		   break;
		}
		dingdh +="'"+records[i].dingdh+"',";
	}
	$("#dto_dingdh").fieldValue(dingdh);
	$("#dto_chullx").fieldValue($("#il_chullx").fieldValue());
	var fm = document.getElementById("exp");
	fm.submit();
	/* var record = {};
	record.jiszq = $("#il_jiszq").fieldValue();
	record.chullx = $("#il_chullx").fieldValue();
	record.dingdhlx = $("#il_dingdhlx").fieldValue();
	record.dingdjssj = $("#il_dingdjssj").fieldValue();
	$.sdcui.pageUtils.goPage({
		url:'/ilorder/downLoadFileIlOrder.do',//url
		record : record,//
		mode:'form',
		beforeSubmit:function(){
			//
			return true;
		}
	});*/
	
}	


</script>

<style type="text/css">

</style>
</t:html>