<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_leijjfce_title}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.pc.pc" >
		<t:grid id="leijjfGrid" idKeys="usercenter,lingjbh,shij" caption="${i18n.pc_leijjfce_title}" 
		src="/pc/queryLeijce.ajax" add="NOT" remove="NOT" 
		editable="true" showEditorRemove="NOT" showEditorAdd="NOT" saveRowsSrcs="/pc/updateLeijce.ajax" 
		 edit="NOT" usePager="true" showNum="true">
		<t:fieldLayout  id="sq_select" prefix="ljce" columns="2">
		        <t:fieldText property="lingjbh"  caption="${i18n.lingjbh }  "></t:fieldText>
		</t:fieldLayout>
		<t:button caption="${i18n.delete }" name="btnDel" />
		<t:gridCol   property="usercenter"  caption="${i18n.usercenter } "></t:gridCol>
		<t:gridCol   property="lingjbh"   caption="${i18n.lingjbh } "></t:gridCol>
		<t:gridCol   property="shij"    caption="${i18n.riq } "></t:gridCol>
		<t:gridCol   property="maoxq"   caption="${i18n.xuql } "></t:gridCol>
		<t:gridCol   property="sjjf"   caption="${i18n.jiaofl } "></t:gridCol>
		<t:gridCol   property="leijjfce" editor="fieldText"  caption="${i18n.leijjfce } "></t:gridCol>
		</t:grid>
		
	<script type="text/javascript">
	   //自定义查询按钮
//	   		<t:button caption="${i18n.search }" name="btnSearch" />
//		<t:button caption="${i18n.reset }" name="btnReset" />
//		function func_button_btnSearch(){
//			$("#leijjfGrid").grid("submit");
//		}
	   //自定义重置按钮
//		function func_button_btnReset(){
//			$("#leijjfGrid").grid("reset");
//		}
	   
	   function func_button_btnDel(){
		   var rowData = $("#leijjfGrid").grid("getSelectedRecords")[0];
			if(rowData==undefined){
				alert("${i18n.js_xuanz}");
				return;
			}
		   var params = [];
		   params.push("usercenter="+rowData.usercenter);
		   params.push("lingjbh="+rowData.lingjbh);
		   params.push("shij="+rowData.shij);
		   if(confirm("${i18n.leijjfce_whether_delete }")){
			   $.sdcui.ajaxUtil.ajax({
					 url:"${ctx}/pc/deleteLeijce.ajax",
					 data:params.join("&"), 
		         	 success:function (result){
		         		$("#leijjfGrid").grid('reload');
		         	 }
			   });
		   }
	   }
	   
	</script>		
	</t:page >
</t:html>