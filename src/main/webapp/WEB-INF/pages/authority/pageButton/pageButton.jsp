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
	<t:page title="0204页面按钮管理">
		
		<!-- 0204页面按钮列表 -->
		<t:grid id="grid_pageButton" 
			idKeys="pageButtonId"
			dataFormId="form_pageButton"
			caption="0204页面按钮列表" 
			src="queryPageButton.ajax"
			editSrc="getPageButton.ajax"
			removeSrc="removePageButton.ajax">
			<t:fieldLayout>
				<t:fieldText property="id" caption="P_主键"/>
				<t:fieldText property="buttonName" caption="按钮名称"/>
				<t:fieldText property="buttonCaption" caption="按钮描述"/>
				<t:fieldText property="buttonCode" caption="按钮编号"/>
			</t:fieldLayout>
				<t:gridCol property="id" caption="P_主键"/>
				<t:gridCol property="buttonName" caption="按钮名称"/>
				<t:gridCol property="buttonCaption" caption="按钮描述"/>
				<t:gridCol property="buttonCode" caption="按钮编号"/>
		</t:grid>
		
		<!-- 0204页面按钮表单 -->
		<t:form dialog="true" id="form_pageButton" caption="0204页面按钮" action="savePageButton.ajax">
			<t:fieldLayout prefix="record">
					<t:fieldText property="id" caption="P_主键"/>
					<t:fieldText property="buttonName" caption="按钮名称"/>
					<t:fieldText property="buttonCaption" caption="按钮描述"/>
					<t:fieldText property="buttonCode" caption="按钮编号"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>