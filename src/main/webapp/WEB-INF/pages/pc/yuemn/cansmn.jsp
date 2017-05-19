<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html i18n="i18n.pc.pc" >
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<body>
<!-- 期初库存列表 -->
		<t:grid id="cansmnGrid" idKeys="usercenter"  scrollHeight="230"
			src="/pc/queryQickc.ajax"  save="NOT"  usePager="false" reset="NOT" submit="NOT" showNum="true" add="NOT" edit="NOT" remove="NOT" >
			<t:fieldLayout>
			<t:fieldHidden property="gongyzq" defaultValue="${gongyzq}"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="SHIJ" caption="${i18n.shij}"></t:gridCol>
			<t:gridCol property="LINGJBH" caption="${i18n.lingjbh}" ></t:gridCol>
			<t:gridCol property="LINGJSL" caption="${i18n.jihpcl}"></t:gridCol>
			<t:gridCol property="ANQKC" caption="${i18n.anqkc}"></t:gridCol>
			<t:gridCol property="KCSL" caption="${i18n.dangqkc}"></t:gridCol>
			<t:gridCol property="MAOXQ" caption="${i18n.daixh}"></t:gridCol>
			<t:gridCol editor="fieldText" property="QCKC" editorOptions="{'expression':'^(0|[1-9][0-9]{0,7})$','expressionMessage':'0-99999999的整数','notNull':true}"  caption="${i18n.qickc}"></t:gridCol>
		</t:grid>
		<table align="center">
		<tr align="center">
			<td align="center">
				<div class="youi-button active-0" id="button_saveMn">
				<div class="right"><div class="center"><a class="saveMn" href="javascript:onclick=func_button_saveMn();">${i18n.baocbmn}</a>	</div></div>
				</div>
			</td>
			<td align="center">
				<div class="youi-button active-0" id="button_cancel">
				<div class="right"><div class="center"><a class="cancel" href="javascript:onclick=func_button_cancel();">${i18n.cancel}</a></div></div>
				</div>
			</td>
		</tr>
		</table>
</body>
<script type="text/javascript">
//保存并模拟
function func_button_saveMn(){  
	var records = $("#cansmnGrid").grid('getRecords',false); 
	var gongyzq = window.parent.$("#gongyzq").val(); 
	var params = [];
	for(var i=0;i<records.length;i++){
		params.push('qckclList['+i+'].shij='+records[i].SHIJ);
		params.push('qckclList['+i+'].lingjbh='+records[i].LINGJBH);
		params.push('qckclList['+i+'].lingjsl='+records[i].LINGJSL);
		params.push('qckclList['+i+'].anqkc='+records[i].ANQKC);
		params.push('qckclList['+i+'].kcsl='+records[i].KCSL);
		params.push('qckclList['+i+'].maoxq='+records[i].MAOXQ);
		params.push('qckclList['+i+'].qickc='+records[i].QCKC);
	}
	params.push("gongyzq="+gongyzq); 
	$("#cansmnGrid").grid('triggerCloseEdited'); 
 	 $.sdcui.ajaxUtil.ajax({
	        url:"${ctx}/pc/monPaic.ajax",
	        data:params.join('&'),
         	success:function (result){
	           //alert("排产计划完成!");
	           parent.refurbish();
	        }
     });	 
}

//取消
function func_button_cancel(){ 
	parent.CloseModelWindow('','');
}


</script>
</t:html>
