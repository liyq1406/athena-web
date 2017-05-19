<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.lingjhz}">

<!-- 
	BOM零件汇总
	@author CSY
	@date 2016-05-12
 -->

<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css">

	#fieldText-lingjhz_banbh{
		color: red;
	}
	#fieldSelect-lingjhz_banbh2{
		color: red;
	}
	
	</style>
</head>
<t:page i18n="i18n.ckx.xuqjs.i18n_lingjhz" >

		<t:grid id="grid_lingjhz" caption="${i18n.lingjhz}" idKeys="banbh" load="false" add='NOT' edit='NOT' remove="NOT" dataFormId="form_lingjhz" back="NOT"
			src="/xuqjs/queryDFPVLingjhz.ajax" showNum="true" showCheckbox="false" pageSize="50" scrollHeight="290" >
			<t:fieldLayout id="lingjhz" prefix="lingjhz" columns="3">
				<t:fieldText property="banbh" caption="${i18n.banbh}" dataType="text" maxLength="11" minLength="11" width="140"/>
				<t:fieldSelect property="banbh2" caption="${i18n.zuijbbh}" src="/xuqjs/getDFPVLingjhzBBH.ajax"
				show="banbh" code="banbh" width="140"/> 
				<t:fieldCalendar property="shijqhrq" caption="${i18n.toucrq}" format="yyyy-MM-dd" width="140"/>
				
				<t:fieldText property="liush" caption="${i18n.zongzlsh}" dataType="text" maxLength="9" minLength="9" width="140" />
				<t:fieldText property="lingjbh" caption="${i18n.yuanljh}" dataType="text" maxLength="10" minLength="10" width="140" />
				<t:fieldText property="xlingjbh" caption="${i18n.xlingjbh}" dataType="text" maxLength="10" minLength="10" width="140" />
				
			</t:fieldLayout>
	        
	        <t:gridCol property="banbh" caption="${i18n.banbh}" width="100"/>
	        <t:gridCol property="lingjbh" caption="${i18n.yuanljh}" width="100"/>
	        <t:gridCol property="yshul" caption="${i18n.yshul}" width="100"/>
	        
			<t:gridCol property="xlingjbh" caption="${i18n.xlingjbh}" width="100"/>
	        <t:gridCol property="xshul" caption="${i18n.xshul}" width="100"/>
			<t:gridCol property="liush" caption="${i18n.zongzlsh}" width="160"/>
			
			<t:gridCol property="touflwjh" caption="${i18n.touflwjh}" width="200"/>
			<t:gridCol property="shijqhrq" caption="${i18n.toucrq}" width="160"/>
			<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"/>
			
			<t:gridCol property="" caption=""/>
			
		</t:grid>
	
</t:page>


<script type="text/javascript">

		//查询前执行方法
		function grid_lingjhz_beforeSubmit() {
			var babbh = $("#lingjhz_banbh").fieldValue();
			var babbh2 = $("#lingjhz_banbh2").fieldValue();
			if(babbh!="" && babbh2!=""){
				alert("\"版本号\"和\"最近版本号\"不能同时有值！");
				return false;
			}else if(babbh=="" && babbh2==""){
				alert("\"版本号\"或\"最近版本号\"为必填项！");
				return false;
			}
		}
		
	</script>
</t:html>