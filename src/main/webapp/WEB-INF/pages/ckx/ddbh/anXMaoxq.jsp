<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="按需毛需求">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.ckx.ddbh.ilOrder">
	
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
<!--  0008257: 增加按需毛需求查询界面  按需 毛需求主页面初始化 -->
<t:grid id="grid_anx_maoxq" caption="" scrollHeight="212"  src="/ddbh/queryMaoxqAnx.ajax" idKeys="xuqbc,editor,edit_time" showNum="true" remove="NOT" edit="NOT"
			add="NOT" usePager="true" save="NOT" load="false" multiple="true" exportXls="true">
			<t:fieldLayout id="layout" prefix="record" columns="3">
				<t:fieldSelect property="usercenter"   caption="用户中心"  defaultValue="${usercenter}" convert="queryUserCenterMap"  width="165" ></t:fieldSelect>
				<t:fieldText property="xianh"          caption="产线"       width="165" maxLength="20"></t:fieldText>
				<t:fieldText property="lingj"        caption="零件编号"   width="165" maxLength="20"></t:fieldText>
				<t:fieldText property="xiaohd"         caption="消耗点"     width="165" maxLength="20"></t:fieldText>
				<t:fieldText property="ofh"         caption="OF号"     width="165" maxLength="20"></t:fieldText>
				<t:fieldText property="zongzlsh"         caption="总装流水号"     width="165" maxLength="20"></t:fieldText>
				<t:fieldCalendar property="xhsjTo"   caption="消耗时间从" width="165" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
				<t:fieldCalendar property="xhsjFrom" caption="至"         width="165"format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			</t:fieldLayout>
			
			<t:gridCol property="usercenter" caption="用户中心"></t:gridCol>
			<t:gridCol property="lingj"   caption="零件编号" ></t:gridCol>
			<t:gridCol property="xiaohd"    caption="消耗点" ></t:gridCol>
			<t:gridCol property="xiaohsj"   width="135"   caption="消耗时间" ></t:gridCol>
			<t:gridCol property="xiaohxs"   caption="消耗系数" ></t:gridCol>		
			<t:gridCol property="xuqly"     caption="需求来源" ></t:gridCol>
			<t:gridCol property="chej"     caption="车间" ></t:gridCol>
			<t:gridCol property="xianh"     caption="产线" ></t:gridCol>
<!-- 			0008077   准备层的界面，不显示 OF号、流水号、Emon时间、顺序号。 -->
			<t:gridCol property="ofh"       caption="OF号"></t:gridCol>
			<t:gridCol property="zongzlsh" caption="总装流水号"></t:gridCol>
			<t:gridCol property="hanzzzbz"    caption="焊装总装标识"></t:gridCol>
			<t:gridCol property="emonsj"  width="135"    caption="EMON时间" ></t:gridCol>
			<t:gridCol property="shunxh"    caption="顺序号" ></t:gridCol>			
			<t:gridCol property="danw"      caption="单位" ></t:gridCol>			
			<t:gridCol property="zhizlx"    caption="制造路线" ></t:gridCol>
			<t:gridCol property="chaifsj" width="135"   caption="拆分时间" ></t:gridCol>
			<t:gridCol property=""  caption="" ></t:gridCol>
<!-- 			0008257 导出提示：导出结果不能大于5000条,否则为空 -->
			
		</t:grid>
		<div  ><font color="red">导出结果不能大于5000条,否则为空</font></div>
</t:page>



</t:html>
	<script type="text/javascript">
	//需求类型
	$.sdcui.serverConfig.convertArray['xuqly'] = {
		'1' : 'CLV',
		'3' : 'SPPV'
	};
	function initPage(){

	}
	</script>