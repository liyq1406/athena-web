<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.isoftstone.com/sdc/toft3" prefix="t"%>
<%@ taglib uri="http://www.isoftstone.com/swan-base" prefix="base"%>

  <t:page title="" i18n="" borderlayout="false">
					
	<t:grid idField="warehouseId" id="WarehouseGrid" url="/pd/queryWarehouse.do" height="300"
		rownumbers="true" searchFormId="" dataFormId="WarehouseDataform"
		onSelect="">
			<t:column field="warehouseName" header="仓库名称" align="center" width="110" />
			<t:column field="warehouseNo" header="仓库编号" align="center" width="110" />
			<t:column field="warehouseId" header="仓库ID" align="center" width="110" />
	</t:grid>
	
	<t:dataform actionurl="/pd/warehouse.ajax"  dataFormId="WarehouseDataform" idfield="warehouseId" 
			 afterdelete="" aftersave="">
			<label for="warehouseName">仓库名称</label><input type="text" id="warehouseName" name="warehouseName" />
			<label for="warehouseNo">仓库编号</label><input type="text" id="warehouseNo" name="warehouseNo" />
			<label for="warehouseId">仓库ID</label><input type="text" id="warehouseId" name="warehouseId" />
		</t:dataform>
		<div id="buttons" class=" clearfix buttons">
		<input type="button" id="btnAdd" value="${i18n.add }" class="sysBtn"/> 
		<input type="button" id="btnCancel" value="${i18n.cancel }" class="sysBtn"  /> 
		<input type="button" id="btnSave" value="${i18n.save }" class="sysBtn"  />  
   	 	<input type="button" id="btnDel" value="${i18n.delete}" class="sysBtn" /> 
  	</div>
</t:page>