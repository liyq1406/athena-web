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
	<t:page title="0201菜单类别管理">
		
		<!-- 0201菜单类别列表 -->
		<t:grid id="grid_menuGroup" 
			idKeys="menuGroupId"
			dataFormId="form_menuGroup"
			caption="0201菜单类别列表" 
			src="queryMenuGroup.ajax"
			editSrc="getMenuGroup.ajax"
			removeSrc="removeMenuGroup.ajax">
			<t:fieldLayout>
				<t:fieldText property="菜单类别名称" caption="菜单类别名称"/>
				<t:fieldText property="id" caption="P_主键"/>
				<t:fieldText property="菜单类别编号" caption="菜单类别编号"/>
			</t:fieldLayout>
				<t:gridCol property="菜单类别名称" caption="菜单类别名称"/>
				<t:gridCol property="id" caption="P_主键"/>
				<t:gridCol property="菜单类别编号" caption="菜单类别编号"/>
		</t:grid>
		
		<!-- 0201菜单类别表单 -->
		<t:form dialog="true" id="form_menuGroup" caption="0201菜单类别" action="saveMenuGroup.ajax">
			<t:fieldLayout prefix="record">
					<t:fieldText property="菜单类别名称" caption="菜单类别名称"/>
					<t:fieldText property="id" caption="P_主键"/>
					<t:fieldText property="菜单类别编号" caption="菜单类别编号"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>