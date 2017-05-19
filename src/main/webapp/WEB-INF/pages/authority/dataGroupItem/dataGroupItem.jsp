<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			function initPage(){
				//页面初始化
			}
		</script>
	</head>
	<t:page title="0302数据权限组项管理">
		
		<!-- 0302数据权限组项列表 -->
		<t:grid id="grid_dataGroupItem" 
			idKeys="dataGroupItemId"
			dataFormId="form_dataGroupItem"
			caption="0302数据权限组项列表" 
			src="queryDataGroupItem.ajax"
			editSrc="getDataGroupItem.ajax"
			removeSrc="removeDataGroupItem.ajax">
			<t:fieldLayout>
				<t:fieldText property="dataDesc" caption="代码描述"/>
				<t:fieldText property="dataValue" caption="代码项"/>
				<t:fieldText property="id" caption="P_主键"/>
			</t:fieldLayout>
				<t:gridCol property="dataDesc" caption="代码描述"/>
				<t:gridCol property="dataValue" caption="代码项"/>
				<t:gridCol property="id" caption="P_主键"/>
		</t:grid>
		
		<!-- 0302数据权限组项表单 -->
		<t:form dialog="true" id="form_dataGroupItem" caption="0302数据权限组项" action="saveDataGroupItem.ajax">
			<t:fieldLayout prefix="record">
					<t:fieldText property="dataDesc" caption="代码描述"/>
					<t:fieldText property="dataValue" caption="代码项"/>
					<t:fieldText property="id" caption="P_主键"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>