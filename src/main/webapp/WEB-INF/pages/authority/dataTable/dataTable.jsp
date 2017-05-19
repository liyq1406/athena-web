<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="业务数据表管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			$.sdcui.serverConfig.convertArray['tableCl']={'0':'修改','1':'追加'};
			function initPage(){
				getGridHeight();
			}
		</script>
	</head>
	<t:page >
		
		<!-- 业务数据表列表 -->
		<t:grid id="grid_dataTable" 
			idKeys="id"
			dataFormId="form_dataTable"
			caption="业务数据表列表" 
			src="queryDataTable.ajax"
			editSrc="getDataTable.ajax"
			removeSrc="removeDataTable.ajax"  load="false"  back="NOT">
			<t:fieldLayout>
				<t:fieldText property="tableName" caption="数据表名"/>
			</t:fieldLayout>
			<t:gridCol property="tableCode" caption="数据编码"/>
			<t:gridCol property="tableName" width="300" caption="数据表名"/>
			<t:gridCol property="postField" width="100" caption="用户组字段"/>
			<t:gridCol property="dataField" width="300" caption="权限字段"/>
			<t:gridCol property="tableCl"  caption="业务策略" convert="tableCl" />
		</t:grid>
		
		<!-- 业务数据表表单 -->
		<t:form dialog="true" id="form_dataTable" caption="业务数据表" action="saveDataTable.ajax" reset="NOT">
			<t:fieldLayout prefix="record" columns="2">
				<t:fieldHidden property="id" caption="P_主键"/>
				<t:fieldSelect property="usercenter" caption="用户中心" notNull="true" convert="queryUserCenterMap"/>
				<t:fieldSelect property="dataId" caption="数据类型" code="dataId" show="dataName" src="listDataType.do" parents="usercenter" notNull="true"/>
				<t:fieldText property="tableCode" caption="业务数据编码"  minLength="3" maxLength="20" notNull="true"/>
				<t:fieldText property="tableName" caption="数据表名"  minLength="3" maxLength="40" notNull="true"/>
				<t:fieldText property="postField" caption="用户组字段"  minLength="2" maxLength="40" notNull="true"/>
				<t:fieldText property="dataField" caption="权限字段" minLength="2" maxLength="40"  notNull="true"/>
				<t:fieldSelect property="tableCl" caption="用户组策略" convert="tableCl"  notNull="true"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>