<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
	</head>
	<t:page i18n="i18n.fj.fj">
		<t:grid id="chelsbGrid" idKeys="usercenter,yunssbm,chex,shul,shenbsj" caption="${i18n.chelsb_title }" 
		src="/fj/queryChelsb.do"  usePager="true"  showNum="false" editable="true" saveRowsSrcs="/fj/saveChelsb.ajax" 
		editModel="true" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
		<t:fieldLayout  id="sb_select" prefix="sb">
		     <t:fieldSelect property="yunssbm" caption="${i18n.yunss }" src="/fj/queryYunss.ajax" show="GCBH" code="GCBH"  ></t:fieldSelect>
		</t:fieldLayout>
		 
		<t:gridCol  editor="fieldSelect" editorOptions="{'notNull':true}" property="yunssbm" width="120" type="text" caption="${i18n.yunss }" convert="yunss" ></t:gridCol>
		<t:gridCol  editor="fieldSelect" editorOptions="{'notNull':true}"  property="chex" type="text" convert="chex"  caption="${i18n.chex }"></t:gridCol>
		<t:gridCol  editor="fieldText" editorOptions="{'dataType':'integer',allowNegative:false,maxLength:4,'notNull':true}" property="shul" type="text" caption="${i18n.chelsb_shul }"></t:gridCol>
		<t:gridCol  editor="fieldCalendar" editorOptions="{format:'yyyy-MM-dd','notNull':true}" property="shenbsj"  caption="${i18n.chelsb_shenbsj }"></t:gridCol>
		<t:gridCol property="aaa" caption=""></t:gridCol>
		</t:grid>
	</t:page>
	<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['chex'] = ${chexJson};
	                                           //{'cx001':'大车','cx002':'小车'} 
	$.sdcui.serverConfig.convertArray['yunss'] = ${yunssJson};
	
		function func_button_save(){ 
			$('#chelsbGrid').grid('saveRows');
		}
	</script>
	<style type="text/css"></style>
</t:html>