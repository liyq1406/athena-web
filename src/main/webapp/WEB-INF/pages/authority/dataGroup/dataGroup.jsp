<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="数据权限组管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			function initPage(){
				getGridHeight();
			}
			function func_button_dataItem(){
				var dataGroup = $('#grid_dataGroup').grid('getSelectedRecords')[0];
				if(dataGroup){
					$('#form_dataGroupItem').form('open',dataGroup.groupName+' - ');
					$('#field_dataId').fieldValue(dataGroup.dataId);
					$('#field_groupId').fieldValue(dataGroup.groupId);
					$('#items_dataId').fieldValue(dataGroup.dataId);
					$('#items_groupId').fieldValue(dataGroup.groupId);
					$('#grid_dataParam').grid('reload');
					$('#grid_dataParaSelected').grid('reload');
				}
			}
			 
			function move_right_all_selected(){
			    $('#grid_dataParaSelected .grid-content .grid-fixed').append($('#grid_dataParam .grid-content .grid-fixed .grid-table').clone());	
				$('#grid_dataParaSelected .grid-content .grid-scroll').append($('#grid_dataParam .grid-content .grid-scroll .grid-table').clone());			
			}
			function move_right_selected(){
				if($('#grid_dataParaSelected .grid-content .grid-fixed .grid-table').length==0){
					$('#grid_dataParaSelected .grid-content .grid-fixed').append('<table  class=grid-table width=20 cellspacing=1 cellpadding=0></table>');
				}
				if($('#grid_dataParaSelected .grid-content .grid-scroll .grid-table').length==0){
					$('#grid_dataParaSelected .grid-content .grid-scroll').append('<table  class=grid-table width=250 cellspacing=1 cellpadding=0></table>');
				}
				$('#grid_dataParam .grid-content .grid-fixed table tr.row.selected').each(function(){
					var targetFixedTable = $('#grid_dataParaSelected .grid-content .grid-fixed table');
					if(targetFixedTable.find('#'+this.getAttribute('id')).length){
						return ;
					} 
					targetFixedTable.append($(this).clone());
				});
				$('#grid_dataParam .grid-content .grid-scroll table tr.row.selected').each(function(){
					var targetScrollTable = $('#grid_dataParaSelected .grid-content .grid-scroll table');
					if(targetScrollTable.find('#'+this.getAttribute('id')).length){
						return;
					}
					targetScrollTable.append($(this).clone());
				});
				
				
			}
			function move_left_selected(){
				$('#grid_dataParaSelected .grid-content .grid-fixed table tr.row.selected').each(function(){
					$(this).remove();
				});
				
				$('#grid_dataParaSelected .grid-content .grid-scroll table tr.row.selected').each(function(){
					$(this).remove();
				});
			}
			function move_left_all_selected(){
				$('#grid_dataParaSelected .grid-content .grid-fixed .grid-table').remove();
				$('#grid_dataParaSelected .grid-content .grid-scroll .grid-table').remove();
			}
			function form_dataGroupItem_beforeSubmit(){
				var dataGroupItems = $('#grid_dataParaSelected').grid('getRecords');
				var dataGroup = $('#grid_dataGroup').grid('getSelectedRecords')[0];
				var dataGroupId = dataGroup.groupId;
				var htmls = [];
			    for(var i=0;i<dataGroupItems.length;i++){
			        htmls.push('<input type="hidden" name="dataGroupItems['+i+'].value" class="extra-field" value="'+dataGroupItems[i].value+'"/>');
			        htmls.push('<input type="hidden" name="dataGroupItems['+i+'].text" class="extra-field" value="'+dataGroupItems[i].text+'"/>');
			        htmls.push('<input type="hidden" name="dataGroupItems['+i+'].usercenter" class="extra-field" value="'+dataGroupItems[i].usercenter+'"/>');
			    }
			    htmls.push('<input type="hidden" name="groupId" class="extra-field" value="'+dataGroupId+'"/>');
			    $('#dataItems_selectedValues').empty().html(htmls.join(''));
			   
			    return true;
			}
			
			function form_dataGroupItem_afterSubmit(result){
				$('#grid_dataGroup').grid('reload');
			}
		</script>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<style type="text/css">
			#grid_dataGroup  .youi-fieldLayout table td.contral.label-col.col-0{
				    width: 100px;
				    white-space: nowrap;
			}
			#form_dataGroup  .youi-fieldLayout table td.contral.label-col.col-0{
				    width: 100px;
				    white-space: nowrap;
			}
			
			#form_dataGroupItem .youi-fieldLayout table td.field-label{
				
			}
		</style>
	</head>
	<t:page i18n="i18n.authority.data_group">
		
		<!-- 0301数据权限组列表 -->
		<t:grid id="grid_dataGroup" 
			idKeys="groupId"
			dataFormId="form_dataGroup"
			caption="数据权限组列表" 
			src="queryDataGroup.ajax"
			editSrc="getDataGroup.ajax"
			removeSrc="removeDataGroup.ajax" showNum="true"  load="false"  back="NOT">
			<t:fieldLayout>
				<t:fieldText property="groupName" caption="${i18n.groupName}"/>
			</t:fieldLayout>
			
			<t:button name="dataItem" active="1" caption="分配数据"/>
				<t:gridCol width="100" property="usercenter" caption="用户中心"  convert="queryUserCenterMap"></t:gridCol>
				<t:gridCol property="groupName" caption="${i18n.groupName}" width="200"/>
				<t:gridCol property="dataId" width="200" caption="${i18n.dataId}"  convert="getAllData" />
				<t:gridCol property="groupDesc" caption="${i18n.groupDesc}"/>
		</t:grid>
		
		<!-- 0301数据权限组表单 -->
		<t:form dialog="true" id="form_dataGroup" caption="数据权限组" action="saveDataGroup.ajax" reset="NOT" >
			<t:fieldLayout prefix="record" columns="1">
			       	<t:fieldHidden property="groupId"></t:fieldHidden>
			       	<t:fieldHidden property="biaos"  defaultValue="1"/>
			       	<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true"/>
			       	<t:fieldSelect property="dataId" caption="${i18n.dataId}"  src="listDataType.ajax" code="dataId" show="dataName" notNull="true" parents="usercenter" />
			        <t:fieldText property="groupName" caption="${i18n.groupName}" maxLength="50" notNull="true"/>
					<t:fieldText property="groupDesc" caption="${i18n.groupDesc}" width="500" maxLength="125"/>
			</t:fieldLayout>
		</t:form>
		
		<t:form action="saveDataGroupItem.ajax" reset="NOT" dialog="true" id="form_dataGroupItem" width="800" caption="分配数据">
			<table cellspacing="1" cellpadding="0" class="bg-border">
				<tbody>
					<tr>
						<td>
							<t:grid id="grid_dataParam" load="false" width="370"
								idKeys="value"
								dataFormId="form_dataParam"
								caption="备选数据" showCheckbox="true" edit="NOT" remove="NOT" add="NOT" reset="NOT" submit="NOT" src="getData.ajax" back="NOT">
								    <t:fieldLayout>
										<t:fieldHidden property="dataId" />
										<t:fieldHidden property="groupId" />
									</t:fieldLayout>
									<t:gridCol property="usercenter" caption="用户中心" />
									<t:gridCol property="text" caption="名称" />
									<t:gridCol property="value" caption="值"  />
							</t:grid>
						</td>
						<td valign="top">
							<table align="center" class="btn-container">
								<tr><td><span id="selectAll" title="全选择" class="btn" onclick="move_right_all_selected()">&gt;&gt;</span></td></tr>
								<tr><td><span id="select" title="选择" class="btn" onclick="move_right_selected()">&nbsp;&gt;&nbsp;</span></td></tr>
								<tr><td><span id="cancel" title="取消"  class="btn" onclick="move_left_selected()">&nbsp;&lt;&nbsp;</span></td></tr>
								<tr><td><span id="cancelAll" title="全取消" class="btn" onclick="move_left_all_selected()">&lt;&lt;</span></td></tr>
							</table>
						</td>
						<td  valign="top">
								<t:fieldGrid property="dataItems" width="370">
									<t:grid id="grid_dataParaSelected" load="false" 
										idKeys="value"
										dataFormId="form_dataSelect" width="270"
										caption="已选数据" showCheckbox="true" edit="NOT" remove="NOT" add="NOT" usePager="false" reset="NOT" submit="NOT" src="getSelectedData.ajax"  back="NOT">
											 <t:fieldLayout prefix="items">
												<t:fieldHidden property="dataId" />
												<t:fieldHidden property="groupId" />
											</t:fieldLayout>
											<t:gridCol property="usercenter" caption="用户中心" />
											<t:gridCol property="text" caption="名称" />
											<t:gridCol property="value" caption="值"  />
									</t:grid>
								</t:fieldGrid>
						</td>
				
					</tr>
				</tbody>
			</table>
			 <div id="dataItems_selectedValues">
			 	
			 </div>
		</t:form>
		
	</t:page>
</t:html>