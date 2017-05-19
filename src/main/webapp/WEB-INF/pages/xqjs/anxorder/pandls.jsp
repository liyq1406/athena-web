<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="盘点修正历史">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	function initPage(){
		var pageHeight = document.body.clientHeight;
		var gridHeight = pageHeight - 435;
		$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
			 return gridHeight;
		});
		$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
			 return gridHeight;
		});
	}
</script>
</head>

<t:page>

	<t:form id="pandlsquery" reset="NOT" submit="NOT">
		<t:grid id="pandls" idKeys="usercenter,lingjbh,xiaohd,yicxhl,zhongzlxh,xianbllkc,pdsjkc,kucsldxh,pandckl,pandycxh,creator,jilrq,create_time"  caption=""  src="/anxorder/queryPandls.ajax" usePager="true" edit="NOT"
			load="false"  remove="NOT" scrollHeight="130" add="NOT" back="NOT"   showNum="true" exportXls="true" >
			<t:fieldLayout id="pandlsselect" prefix="pdls" columns="4">
				<t:fieldSelect property="usercenter" width="100" caption="用户中心" convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="零件编号" width="100"></t:fieldText>
				<t:fieldText property="xiaohd" caption="消耗点" width="100"></t:fieldText>
				<t:fieldText property="creator" caption="盘点人" width="100"></t:fieldText>
				<t:fieldCalendar property="jilrqFrom" caption="盘点时间"  format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="jilrqTo" caption="至" format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="createtimeFrom" caption="创建时间" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="createtimeTo" caption="至" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="usercenter" type="text" caption="用户中心"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件编号" ></t:gridCol>
			<t:gridCol property="xiaohd" caption="消耗点" type="text" ></t:gridCol>
			<t:gridCol property="yicxhl" caption="差异量" type="text" ></t:gridCol>
			<t:gridCol property="zhongzlxh" caption="总装流水号" type="text" ></t:gridCol>
			<t:gridCol property="xianbllkc" caption="盈余量/盘点时线边理论库存" type="text" ></t:gridCol>
			<t:gridCol property="pdsjkc" caption="盘点时实际库存" type="text" ></t:gridCol>
			<t:gridCol property="kucsldxh" caption="盘点时待消耗" type="text" ></t:gridCol>
			<t:gridCol property="pandckl" caption="待交付/盘点时出库量" type="text" ></t:gridCol>
			<t:gridCol property="pandycxh" caption="盘点时异常消耗量" type="text" ></t:gridCol>
			<t:gridCol property="creator" caption="盘点人" type="text" ></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}" property="jilrq" type="text" caption="盘点时间"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}" property="create_time" type="text" caption="创建时间"></t:gridCol>
		</t:grid>
	</t:form>
</t:page>


<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
#ilAdd td.contral.label-col.col-0{width:100px;}
#ilAdd td.contral.label-col.col-2{width:130px;}
</style>
</t:html>