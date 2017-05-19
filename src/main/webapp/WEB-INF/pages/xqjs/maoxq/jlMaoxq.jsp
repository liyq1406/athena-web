<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="JL毛需求">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.xqjs.ilOrder">
	
<style>
#maoxqGrid .youi-fieldLayout table td.contral.label-col.col-0 {
	width: 120px;
}
 #form_gjsz .youi-fieldLayout table td.contral.label-col {     width: 100px; }
#maoxqForm td.contral.label-col.col-0{width:100px;}
 #record_aaa .youi-fieldLayout table td.contral.label-col.col-0 {
	width: 170px;
}
</style>
<t:grid id="grid_anx_maoxq" caption="" scrollHeight="212"  src="/maoxq/queryJLMaoxq.ajax" idKeys="usercenter,lingjbh,xiaohd,xiaohcbh,tangc,xiaohcrq" showNum="true" remove="NOT" edit="NOT"
			add="NOT" usePager="true" save="NOT" load="false" multiple="true" exportXls="true">
			<t:fieldLayout id="layout" prefix="record" columns="3">
				<t:fieldSelect property="usercenter"   caption="用户中心"  defaultValue="${usercenter}" convert="queryUserCenterMap"  width="165" ></t:fieldSelect>
				<t:fieldText property="chanx"          caption="产线"       width="165" maxLength="5"></t:fieldText>
				<t:fieldText property="lingjbh"        caption="零件编号"   width="165" maxLength="10"></t:fieldText>
				<t:fieldText property="xiaohd"         caption="消耗点"     width="165" maxLength="9"></t:fieldText>
				<t:fieldCalendar property="xiaohcrqFrom"   caption="小火车日期从" width="165" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldCalendar property="xiaohcrqTo" caption="至"         width="165"format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldText property="tangc"     caption="趟次"    width="165" maxLength="3"
				expression="^[1-9][0-9]{0,2}$|^0$" expressionMessage="只能输入0-999之间的值"></t:fieldText>
				<t:fieldText property="xiaohcbh"          caption="小火车编号"       width="165" maxLength="5"></t:fieldText>
				
			</t:fieldLayout>
			<!-- mantis:0012854 JL按需毛需求----界面字段问题 by CSY 20161221 -->
			<t:gridCol property="usercenter" caption="用户中心"></t:gridCol>
			<t:gridCol property="lingjbh"  	 caption="零件编号" ></t:gridCol>
			<t:gridCol property="xiaohd"  caption="消耗点编号" ></t:gridCol>
			<t:gridCol property="xiaohcbh"     caption="小火车编号" ></t:gridCol>
			<t:gridCol property="xiaohcrq"     caption="小火车日期" ></t:gridCol>
			<t:gridCol property="tangc"   caption="趟次" ></t:gridCol>		
			<t:gridCol property="xiaohxs"     caption="消耗系数" ></t:gridCol>
			<t:gridCol property="chanx"     caption="生产线编号" ></t:gridCol>
			<t:gridCol property="danw"   	caption="单位" ></t:gridCol>
			<t:gridCol property="editor"    caption="修改人"></t:gridCol>
			<t:gridCol property="edit_time"   width="135"     caption="修改时间" ></t:gridCol>		
			<t:gridCol property="" caption="" />	
		</t:grid>
		<div  ><font color="red">导出结果不能大于5000条,否则为空</font></div>
</t:page>



</t:html>
	<script type="text/javascript">
	
	//需求类型
	//$.sdcui.serverConfig.convertArray['xuqly'] = {
	//	'1' : 'CLV',
	//	'2' : 'SPPV'
	//};
	
	function initPage(){

	}
	</script>