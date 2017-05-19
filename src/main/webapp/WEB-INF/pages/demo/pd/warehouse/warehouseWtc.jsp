<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.isoftstone.com/sdc/toft3" prefix="t"%>
<%@ taglib uri="http://www.isoftstone.com/swan-base" prefix="base"%>

  <t:page title="" i18n="" borderlayout="false">
	<table width="100%">
		<tbody>
			<tr>
				<td valign="top" width="300">
					<t:dataform actionurl="/pd/inWarehouse.ajax"  dataFormId="WarehouseStorageDataform" idfield="warehouseStorageId" 
						 afterdelete="" aftersave="func_aftersave_warehouseStorage"
						 validate="{partNo:{required:true},partCount:{required:true,digits:true}}" >
						<input type="hidden" name="warehouseStorageId"/>
						<ul class="c1 l120 clearfix">
							<li><label for="warehouseId">入库仓库</label><input type="text" id="warehouseId" name="warehouseId" />
							</li>
							<li><label for="childWarehouseNo">子仓库编号</label><input type="text" id="childWarehouseNo" name="childWarehouseNo" />
							<li><label for="partNo">零件编号</label><input type="text" id="partNo" name="partNo" />
							</li>
							<li><label for="partCount">零件数量</label><input type="text" id="partCount" name="partCount" />
							</li>
						</ul>
					</t:dataform>
					<div id="buttons" class=" clearfix buttons">
						<input type="button" id="btnAdd" value="${i18n.add }" class="sysBtn"/> 
						<input type="button" id="btnCancel" value="${i18n.cancel }" class="sysBtn"  /> 
						<input type="button" id="btnSave" value="${i18n.save }" class="sysBtn"  />  
				   	 	<input type="button" id="btnDel" value="${i18n.delete}" class="sysBtn" /> 
				  	</div>
				</td>
			</tr>
		</tbody>
	</table>
</t:page>

<script>
	function func_aftersave_warehouseStorage(){
		//alert('保存成功！');
	}

</script>