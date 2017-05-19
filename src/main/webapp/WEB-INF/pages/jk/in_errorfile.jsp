<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<t:html title="接口错误查询" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<script type="text/javascript">

	</script>
	</head>
	<t:page i18n="i18n.fj.fj">
		<t:grid id="jieKouGrid"  caption="接口错误查询" 
		src="/jk/queryJieKouErrorfile.ajax" 
		showNum="true" usePager="true" idKeys="inbh"
		add="NOT" edit="NOT" remove="NOT" load="false">
		<t:fieldLayout  id="in_select" prefix="insearch" columns="3">
			<t:fieldText property="inbh" caption="接口编号"></t:fieldText>
			<t:fieldCalendar property="yunxkssj" caption="接口开始时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="yunxkssjTo" caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		</t:fieldLayout>
		 
		<t:gridCol property="inbh" type="text" caption="接口编号" convert="yunss" ></t:gridCol>
		<t:gridCol property="file_errorinfo" width="500" type="text" caption="文件数据错误内容"></t:gridCol>
		<t:gridCol property="error_date" width="300"  type="text" caption="错误数据记录参数"></t:gridCol>
		<t:gridCol property="yunxkssj" type="text"   caption="接口运行开始时间"></t:gridCol>
		</t:grid>
	</t:page>
	

</t:html>