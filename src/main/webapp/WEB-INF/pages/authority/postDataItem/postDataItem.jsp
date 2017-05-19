<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page title="岗位数据管理">
		
		<!-- 岗位数据列表 -->
		<t:grid id="grid_postDataItem" 
			idKeys="postDataItemId"
			dataFormId="form_postDataItem"
			caption="岗位数据列表" 
			src="queryPostDataItem.ajax"
			editSrc="getPostDataItem.ajax"
			removeSrc="removePostDataItem.ajax">
			<t:fieldLayout>
				<t:fieldText property="value" caption="数据项值"/>
				<t:fieldText property="text" caption="数据项名称"/>
				<t:fieldText property="id" caption="P_主键"/>
			</t:fieldLayout>
				<t:gridCol property="value" caption="数据项值"/>
				<t:gridCol property="text" caption="数据项名称"/>
				<t:gridCol property="id" caption="P_主键"/>
		</t:grid>
		
		<!-- 岗位数据表单 -->
		<t:form dialog="true" id="form_postDataItem" caption="岗位数据" action="savePostDataItem.ajax">
			<t:fieldLayout prefix="record">
					<t:fieldText property="value" caption="数据项值"/>
					<t:fieldText property="text" caption="数据项名称"/>
					<t:fieldText property="id" caption="P_主键"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>