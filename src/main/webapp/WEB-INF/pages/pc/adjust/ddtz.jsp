<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_ddtz_title }">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>
</head>
<t:page i18n="i18n.pc.pc">
	<script type="text/javascript">
		
		//状态为已排产就不可编辑
		function checkEditAble(){
			var record=$("#rigdGrid").grid("getSelectedRecords")[0];
			if(record == null)
				return false;
			var zt = record.KSSJENBLE;
			if(zt=="0"){
				return false;
			}
			return true;
		}
		
		//保存前验证开始时间和结束时间是否为空，及开始时间是否大于结束时间
		function validData(){
			var records = $("#rigdGrid").grid("getRecords",false); 
			for(var i=0;i<records.length;i++){
				var kssj = records[i].PCKAISSJ;
				var jssj = records[i].PCJIESSJ;
				if(kssj>jssj){
					alert("第"+(i+1)+"行,开始时间不能大于结束时间! 请检查");
					return false;
				}
				var kssjB = records[i].KAISSJB;
				var jssjB = records[i].JIESSJB;
				var DATE = $("#cx_DATE").fieldValue(); 

				if(kssjB != kssj && DATE>kssj){
					alert("第"+(i+1)+"行,开始时间不能小于"+DATE+"! 请检查");
					return false;
				}
				if(jssjB != jssj && DATE>jssj){
					alert("第"+(i+1)+"行,结束时间不能小于"+DATE+"! 请检查");
					return false;
				}
			}
			return true;
		}
		
	</script>

	<t:grid id="rigdGrid" idKeys="USERCENTER,ID,KSSJENBLE,KAISSJB,JIESSJB"  load="false"
		caption="${i18n.pc_ddtz_title }" src="/pc/adjustSelect.ajax" usePager="true"
		showNum="true" editable="true" editModel="true" add="NOT" edit="NOT"
		remove="NOT" showEditorAdd="false" showEditorRemove="false" 
		saveRowsSrcs="/pc/adjustUpdate.ajax"
		preSaveRowsEvent="validData">
		<t:fieldLayout id="select" prefix="cx">
			<t:fieldCalendar property="KSSJ" format="yyyy-MM-dd" caption="${i18n.kaissj }" notNull="true" ></t:fieldCalendar>
			<t:fieldCalendar property="JSSJ" format="yyyy-MM-dd" caption="${i18n.jiessj }" notNull="true" ></t:fieldCalendar>
			<t:fieldSelect property="LX" caption="${i18n.leix }"  src="/pc/selectLx.ajax?TZLX=${TZLX}" show="name" code="value" notNull="true"></t:fieldSelect>
			<t:fieldText property="LJBH" caption="${i18n.lingjbh }"></t:fieldText>
			<t:fieldHidden property="DATE"></t:fieldHidden>
		</t:fieldLayout>

		<t:gridCol property="USERCENTER" type="text" caption="${i18n.usercenter }"></t:gridCol>
		<t:gridCol property="LINGJBH" type="text" caption="${i18n.lingjbh }"></t:gridCol>
		<t:gridCol property="DINGDH" type="text" caption="${i18n.dingdmxh }"></t:gridCol>
		<t:gridCol property="SHUL" type="text" caption="${i18n.lingjsl }"></t:gridCol>
		<t:gridCol property="PCKAISSJ" type="text" caption="${i18n.kaissj }"  width="100"  editor="fieldCalendar" editorOptions="{openEvent:checkEditAble,notNull:true,format:'yyyy-MM-dd' }"></t:gridCol>
		<t:gridCol property="PCJIESSJ" type="text" caption="${i18n.jiessj }"  width="100"  editor="fieldCalendar" editorOptions="{notNull:true,format:'yyyy-MM-dd' }" > </t:gridCol>
	</t:grid>

</t:page>

</t:html>