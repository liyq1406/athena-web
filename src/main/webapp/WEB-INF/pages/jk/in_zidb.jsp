<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<t:html title="接口错误查询" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<script type="text/javascript">
	var isYunxzt = function (v) {
		if (v == 0) {
			return "未运行";
		} else if (v == 1){
			return "运行中";
		}else if (v == 2){
			return "运行出错";
		}
	} 
	</script>
	</head>
	<t:page i18n="i18n.fj.fj">
		<t:grid id="jieKouGrid"  caption="接口错误查询" src="/jk/queryJieKouZidb.ajax" showNum="true" usePager="true" 
		add="NOT" edit="NOT" remove="NOT" load="false">
		<t:fieldLayout  id="in_select" prefix="insearch" columns="4">
			<t:fieldText property="inbh" caption="接口编号" width="110"></t:fieldText>
			<t:fieldText property="inname" caption="接口名称" width="150"></t:fieldText>
			<t:fieldCalendar property="yunxkssj" caption="接口开始时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="yunxkssjTo" caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		</t:fieldLayout>
		 
		<t:gridCol property="inbh" type="text" caption="接口编号"></t:gridCol>
		<t:gridCol property="inname" type="text" caption="接口名称" width="150"></t:gridCol>
		<t:gridCol property="lastcpltime" type="text" caption="上次完成时间" width="150"></t:gridCol>
		<t:gridCol property="lastlctime" type="text" caption="上上次完成时间" width="150"></t:gridCol>
		<t:gridCol property="outfiletype" type="text" caption="输出文件类型"  width="200"></t:gridCol>
		<t:gridCol property="yunxzt" type="text" caption="运行状态" renderer="isYunxzt" ></t:gridCol>
		<t:gridCol property="yunxkssj" type="text"  caption="运行开始时间"></t:gridCol>
		</t:grid>
	</t:page>
	

</t:html>