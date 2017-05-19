<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.toft.ui.tags.UiConstants " %>
<%@ page import="com.toft.ui.tags.auth.UiAuthorization " %>
<%@ page import="com.toft.ui.tags.auth.DefaultUiAuthorization " %>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<script type="text/javascript">
			function   Trim(m){   
			  while((m.length>0)&&(m.charAt(0)==' '))   
			  m   =   m.substring(1, m.length);   
			  while((m.length>0)&&(m.charAt(m.length-1)==' '))   
			  m = m.substring(0, m.length-1);   
			  return m;   
			}
		    $.sdcui.serverConfig.convertArray['biaos']={'1':'是','0':'否'};
		    function initPage(){
		    	getGridHeight();
		    }
		    
		    function form_post_beforeSubmit(){
		        var postCode = $('#formPost_postCode').fieldValue();
				var postName = $('#formPost_postName').fieldValue();
				postCode = Trim(postCode);
				postName = Trim(postName);
				if(postCode==''||postName==''){
					alert("组代码、组名称不能为空格!");
					return false;
				}
				return true;
			}

			function func_grid_changeActive(){
				var postGrid = $('#grid_post').grid('getSelectedRecords');
				var biaos = "";
				if(postGrid[0].biaos!=null){
					biaos = postGrid[0].biaos;
				}else{
					biaos = "";
				}
				var params = [];
			    params.push($.sdcui.parameterUtils.propertyParameter("postCodes[0]",postGrid[0].postCode));
			    params.push($.sdcui.parameterUtils.propertyParameter("usercenters[0]",postGrid[0].usercenter));
			    params.push($.sdcui.parameterUtils.propertyParameter("biaoss[0]",biaos));
			    if(confirm("确认启/停用户组?")){
			    	$.sdcui.ajaxUtil.ajax({
					url:'changePostActive.ajax',
					data:params.join('&'),
					success:function(result){
						//
						if(result.rebiaos=='-1'){
						}else{
							if(biaos==null||biaos=='0'){
								alert("用户组启用成功!");
								$('#grid_post').grid('reload');
							}else{
								alert("用户组停用成功!");
								$('#grid_post').grid('reload');
							}
						}

					}
					});
			    }
			}
			
			/**
			 * 仓库数据授权
			 */
			function func_grid_ckInitPostAuthorize(){
				var record = $('#grid_post').grid('getSelectedRecords')[0];
				var biaos=record.biaos;
				var postCode = record.postCode;
				var dicCode = record.dicCode;
				if(dicCode == 'CK_001' || dicCode == 'CK_002' || dicCode == 'CK_003'|| dicCode == 'QUYGLY'){
					if(biaos==1){
						$("#form_ck_post_authorize_init").form('clear');
						$('#form_ck_post_authorize_init').form('open',record.postName+' - ');
						//$('#form_ck_post_authorize_init').form('clear');
//						$("#form_ck_post_authorize_init").form('clear');
						$("#authorize_dicCode").fieldValue(dicCode);
						$('#field-pop-authorize_ckDTId').removeClass("loaded");//刷新表格数据
						$("#grid_ck_postParam").grid('clear');
          			    //$("#grid_ck_postDataItemSelected").grid('clear');
						$('#grid_ck_postDataItemSelected .grid-content .grid-fixed table tr.row').each(function(){
							$(this).remove();
						});
						
						$('#grid_ck_postDataItemSelected .grid-content .grid-scroll table tr.row').each(function(){
							$(this).remove();
						});
						
						$('#grid_ck_postParam .grid-content .grid-fixed table tr.row').each(function(){
							$(this).remove();
						});
						
						$('#grid_ck_postParam .grid-content .grid-scroll table tr.row').each(function(){
							$(this).remove();
						});
						var ckDTId = $("#authorize_ckDTId").fieldValue();
						if(ckDTId!=null&&ckDTId!=''){

							
//							 $("#dataItems_postCode").fieldValue(postCode);
//							 $("#showAlldataItems_postCode").fieldValue(postCode);
							
//							$('#grid_ck_postParam').grid('reload');
//							$('#grid_ck_postDataItemSelected').grid('reload');
						}
					}else{
						alert("数据已失效，无法授权");
					}
				}else{
					alert("用户组无对应的业务权限，无法授权");
				}
			}
			
			
			
			function ck_move_right_all_selected(){
//			    $('#grid_ck_postDataItemSelected .grid-content .grid-fixed').append($('#grid_ck_postParam .grid-content .grid-fixed .grid-table').clone());	
//				$('#grid_ck_postDataItemSelected .grid-content .grid-scroll').append($('#grid_ck_postParam .grid-content .grid-scroll .grid-table').clone());	
				if($('#grid_ck_postDataItemSelected .grid-content .grid-fixed .grid-table').length==0){
					$('#grid_ck_postDataItemSelected .grid-content .grid-fixed').append('<table  class=grid-table width=22 cellspacing=1 cellpadding=0></table>');
				}
				if($('#grid_ck_postDataItemSelected .grid-content .grid-scroll .grid-table').length==0){
					$('#grid_ck_postDataItemSelected .grid-content .grid-scroll').append('<table  class=grid-table width=100% cellspacing=1 cellpadding=0></table>');
				}
				$('#grid_ck_postParam .grid-content .grid-fixed table tr.row').each(function(){
					var targetFixedTable = $('#grid_ck_postDataItemSelected .grid-content .grid-fixed table');
					if(targetFixedTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return ;
					} 
					targetFixedTable.append($(this).clone());
				});
				$('#grid_ck_postParam .grid-content .grid-scroll table tr.row').each(function(){
					var targetScrollTable = $('#grid_ck_postDataItemSelected .grid-content .grid-scroll table');
					if(targetScrollTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return;
					}
					targetScrollTable.append($(this).clone());
				});		
				
				$('#grid_ck_postParam .grid-content .grid-fixed table tr.row').each(function(){
					$(this).remove();
				});
				
				$('#grid_ck_postParam .grid-content .grid-scroll table tr.row').each(function(){
					$(this).remove();
				});
			}
			function ck_move_right_selected(){
				if($('#grid_ck_postDataItemSelected .grid-content .grid-fixed .grid-table').length==0){
					$('#grid_ck_postDataItemSelected .grid-content .grid-fixed').append('<table  class=grid-table width=22 cellspacing=1 cellpadding=0></table>');
				}
				if($('#grid_ck_postDataItemSelected .grid-content .grid-scroll .grid-table').length==0){
					$('#grid_ck_postDataItemSelected .grid-content .grid-scroll').append('<table  class=grid-table width=100% cellspacing=1 cellpadding=0></table>');
				}
				$('#grid_ck_postParam .grid-content .grid-fixed table tr.row.selected').each(function(){
					var targetFixedTable = $('#grid_ck_postDataItemSelected .grid-content .grid-fixed table');
					if(targetFixedTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return;
					}
					targetFixedTable.append($(this).clone());
				});
				$('#grid_ck_postParam .grid-content .grid-scroll table tr.row.selected').each(function(){
					var targetScrollTable = $('#grid_ck_postDataItemSelected .grid-content .grid-scroll table');
					if(targetScrollTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return;
					}
					targetScrollTable.append($(this).clone());
				});
				
				$('#grid_ck_postParam .grid-content .grid-fixed table tr.row.selected').each(function(){
					$(this).remove();
				});
				
				$('#grid_ck_postParam .grid-content .grid-scroll table tr.row.selected').each(function(){
					$(this).remove();
				});
			}
			function ck_move_left_selected(){
				if($('#grid_ck_postParam .grid-content .grid-fixed .grid-table').length==0){
					$('#grid_ck_postParam .grid-content .grid-fixed').append('<table  class=grid-table width=22 cellspacing=1 cellpadding=0></table>');
				}
				if($('#grid_ck_postParam .grid-content .grid-scroll .grid-table').length==0){
					$('#grid_ck_postParam .grid-content .grid-scroll').append('<table  class=grid-table width=100% cellspacing=1 cellpadding=0></table>');
				}
				$('#grid_ck_postDataItemSelected .grid-content .grid-fixed table tr.row.selected').each(function(){
					var targetFixedTable = $('#grid_ck_postParam .grid-content .grid-fixed table');
					if(targetFixedTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return ;
					} 
					targetFixedTable.append($(this).clone());
				});
				$('#grid_ck_postDataItemSelected .grid-content .grid-scroll table tr.row.selected').each(function(){
					var targetScrollTable = $('#grid_ck_postParam .grid-content .grid-scroll table');
					if(targetScrollTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return;
					}
					targetScrollTable.append($(this).clone());
				});
			
				$('#grid_ck_postDataItemSelected .grid-content .grid-fixed table tr.row.selected').each(function(){
					$(this).remove();
				});
				
				$('#grid_ck_postDataItemSelected .grid-content .grid-scroll table tr.row.selected').each(function(){
					$(this).remove();
				});
			}
			function ck_move_left_all_selected(){
//				$('#grid_ck_postDataItemSelected .grid-content .grid-fixed .grid-table').remove();
//				$('#grid_ck_postDataItemSelected .grid-content .grid-scroll .grid-table').remove();

				if($('#grid_ck_postParam .grid-content .grid-fixed .grid-table').length==0){
					$('#grid_ck_postParam .grid-content .grid-fixed').append('<table  class=grid-table width=22 cellspacing=1 cellpadding=0></table>');
				}
				if($('#grid_ck_postParam .grid-content .grid-scroll .grid-table').length==0){
					$('#grid_ck_postParam .grid-content .grid-scroll').append('<table  class=grid-table width=100% cellspacing=1 cellpadding=0></table>');
				}
				$('#grid_ck_postDataItemSelected .grid-content .grid-fixed table tr.row').each(function(){
					var targetFixedTable = $('#grid_ck_postParam .grid-content .grid-fixed table');
					if(targetFixedTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return ;
					} 
					targetFixedTable.append($(this).clone());
				});
				$('#grid_ck_postDataItemSelected .grid-content .grid-scroll table tr.row').each(function(){
					var targetScrollTable = $('#grid_ck_postParam .grid-content .grid-scroll table');
					if(targetScrollTable.find('tr[id="'+this.getAttribute('id')+'"]').length){
						return;
					}
					targetScrollTable.append($(this).clone());
				});		
				
				$('#grid_ck_postDataItemSelected .grid-content .grid-fixed table tr.row').each(function(){
					$(this).remove();
				});
				
				$('#grid_ck_postDataItemSelected .grid-content .grid-scroll table tr.row').each(function(){
					$(this).remove();
				});
			}
			
			function  authorize_ckDTId_change(value){
				var ckDTId = $("#authorize_ckDTId").fieldValue();
				var recordPost = $('#grid_post').grid('getSelectedRecords')[0];
				var postCode = recordPost.postCode;
				$("#showAlldataItems_id").fieldValue(ckDTId);
				$("#dataItems_id").fieldValue(ckDTId);
				$("#dataItems_postCode").fieldValue(postCode);
				$("#showAlldataItems_postCode").fieldValue(postCode);
				$('#grid_ck_postParam').grid("reload");
				$('#grid_ck_postDataItemSelected').grid("reload");
				$.sdcui.ajaxUtil.ajax({
				url:'getCkDataInfo.ajax?id='+ckDTId+'&postCode='+postCode,
				success:function(result){
						var cuncTableName = result.result.cuncTableName;
						$('#authorize_cuncTableName').fieldValue(cuncTableName);
				}
				});
			}
			
			/**
			 * form 提交前回调动作
			 */
			function form_ck_post_authorize_init_beforeSubmit(){
				var ck_postDataItems = $('#grid_ck_postDataItemSelected').grid('getRecords');
				var post = $('#grid_post').grid('getSelectedRecords')[0];
				var postCode = post.postCode;
				var cuncTableName = $('#authorize_cuncTableName').fieldValue();
				var htmls = [];
				htmls.push('<input type="hidden" name="cuncTableNameForm" class="extra-field" value="'+cuncTableName+'"/>');
			    htmls.push('<input type="hidden" name="postCodeForm" class="extra-field" value="'+postCode+'"/>');
			    for(var i=0;i<ck_postDataItems.length;i++){
			        htmls.push('<input type="hidden" name="ckPostDataItems['+i+']" class="extra-field" value="'+ck_postDataItems[i].value+":"+ck_postDataItems[i].text+":"+ck_postDataItems[i].ucname+'"/>');
			        
			    }
			    $('#ck_dataItems_selectedValues').empty().html(htmls.join(''));
			    return true;
			}
			function form_ck_post_authorize_init_afterSubmit(){
				 $('#form_ck_post_authorize_init').form('close');
			}
			
			/**
			*自定义删除
			*/
			function func_grid_removeSelected(){
				var post = $('#grid_post').grid('getSelectedRecords');
				var postCode = post[0].postCode;
				var usercenter = post[0].usercenter;
				if(confirm("只能删除未使用的用户组，确认删除?")){
					 $.sdcui.ajaxUtil.ajax({
						url:'delPost.ajax?postCode='+postCode+'&usercenter='+usercenter,
						success:function(result){
							//
							if(result.result=='-1'){
								alert("该用户组已分配用户，无法删除!");
							}else{
								alert("删除成功");
								$('#grid_post').grid("reload");
							}
						}
					});
				}
			}
			function formPost_dicCode_change(){
				var dicCode = $('#formPost_dicCode').fieldValue();
				
				var dicCodeGrid = "";
				var postGroupIdGrid = "";
				if($('#grid_post').grid('getSelectedRecords')[0]){
					dicCodeGrid = $('#grid_post').grid('getSelectedRecords')[0].dicCode;
					postGroupIdGrid = $('#grid_post').grid('getSelectedRecords')[0].postGroupId;
				}
				$.sdcui.ajaxUtil.ajax({
					url:'getDicByDicCode.ajax?dicCode='+dicCode,
					success:function(result){
						//
						var postGroupId = result.result[0].postGroupId;
							$('#formPost_postGroupId').find('input.value').val(postGroupId);
							$('#formPost_postGroupId').find('input.textInput').val(result.result[0].postGroupName);
							$('#field-pop-formPost_postGroupId').addClass("loaded");
							$('#field-pop-formPost_postGroupId').addClass("item-srcoll");
							$('#formPost_postGroupId').find('input.textInput').attr('readonly','true');
							$('#formPost_postGroupId').addClass('readonly');
							var divSelectes = "";
							$.sdcui.ajaxUtil.ajax({
								url:'listAllPostGroup.ajax',
								success:function(result){
									//
									var tempPostGroupName = "";
									$.each(result.result, function(i, item) {
										if(item.postGroupId==postGroupIdGrid){
											divSelectes = divSelectes+'<div class=\"option-item selected\" value=\"'+item.postGroupId+'"\>'+item.postGroupName+'</div>';
											tempPostGroupName = item.postGroupName;
										}else if(item.postGroupId==postGroupId){
											divSelectes = divSelectes+'<div class=\"option-item selected\" value=\"'+item.postGroupId+'"\>'+item.postGroupName+'</div>';
											tempPostGroupName = item.postGroupName;
										}else if(item.postGroupId!=postGroupId){
											divSelectes = divSelectes+'<div class=\"option-item\" value=\"'+item.postGroupId+'\">'+item.postGroupName+'</div>';
										} 
										
									});
									$('#field-pop-formPost_postGroupId').html(divSelectes);
									if(!$('#form_post').hasClass('operant-add')){
										if(dicCodeGrid==dicCode && !postGroupId==''){
											$('#formPost_postGroupId').find('input.value').val(postGroupId);
										}else{
											$('#formPost_postGroupId').find('input.value').val(postGroupIdGrid);
											$('#formPost_postGroupId').find('input.textInput').val(tempPostGroupName);
										}
										
									}
									if(postGroupId==''){
										$('#formPost_postGroupId').find('input.textInput').attr('readonly','false');
										$('#formPost_postGroupId').removeClass('readonly');
									}
								}
							});
					}
				});
			}
			function func_grid_authUsercenter(){
				var postData = $('#grid_post').grid('getSelectedRecords')[0];
				var biaos=postData.biaos;
				if(postData){
					if(biaos=='1'){
						$('#authuc_postCode').fieldValue(postData.postCode);
						$.sdcui.ajaxUtil.ajax({
						url:'getRoleuc.ajax?postCode='+postData.postCode,
						success:function(result){
							//
							var ids = new Array();
							$.each(result.result, function(i, item) {
								var usercenter = item.USERCENTER;
								ids.push(usercenter);
							});
							$("#tree_uc_result").tree("checkedTreeNodes",ids);
							document.getElementById("tree_root_uc").className ="treeNode tree_root_uc check last expandable lastExpandable expanded partchecked";
							document.getElementById("tree_root_uc").childNodes[1].className ="tree-span treeNode tree_root_uc check last expandable lastExpandable expanded partchecked";
							$('#form_authUsercenter').form('open');
						}
						});
					}else{
						alert("数据已失败,无法授权用户中心");
					}
				}else{
					alert("未选择数据，无法授权用户中心");
				}
			}
			function form_authUsercenter_beforeSubmit(){
				var postGroupId  = $('#authuc_postGroupId').fieldValue();
				var treeNodeChecked = $('#tree_uc_result').tree("getCurrentCheckedIds");
				var htmls =[];
				for(var i=0;i<treeNodeChecked.length;i++){
					var node = treeNodeChecked[i];
					if(node!='tree_root_uc'){
						htmls.push('<input type="hidden" name="ucIds['+i+']" class="extra-field" value="'+node+'"/>');
					}
				}
				htmls.push('<input type="hidden" name="postGroupId" class="extra-field" value="'+postGroupId+'"/>');
				$('#post_ucIds').empty().html(htmls.join(''));
				return true;
			}
			function form_authUsercenter_afterSubmit(result){
				$('#grid_post').grid('reload');
				$('#form_authUsercenter').form('close');
			} 
		</script>
	</head>
	<t:page  i18n="i18n.authority.post">
		<t:grid id="grid_post" 
			idKeys="postCode,usercenter"
			dataFormId="form_post"
			caption="${i18n.title_index}" 
			src="queryPost.ajax"
			editSrc="getPost.ajax"
			remove="NOT" showNum="true" load="false" back="NOT">
			<t:fieldLayout columns="3">
				<t:fieldText width="100"  property="postCode" caption="组代码"></t:fieldText>
				<t:fieldText width="100"  property="postName" caption="${i18n.postName}"/>
				<t:fieldSelect width="100"  property="postGroupId" caption="${i18n.postGroupId}" parents="usercenter" src="listPostGroup.ajax" code="postGroupId" show="postGroupName" />
				<t:fieldSelect width="100"  property="dicCode" caption="所属业务" convert="queryDicCode" />
			</t:fieldLayout>
			<t:button name="authUsercenter" active="1" caption="授权用户中心"></t:button>
			<t:button name="ckInitPostAuthorize" active="1" caption="${i18n.button_ck_authorize}"/>
			<t:button name="changeActive" active="1" caption="${i18n.button_active}" />
			<t:button name="removeSelected" active="1" caption="删除"  icon="removeRecord" />
			
			<t:gridCol property="postCode" width="100" caption="${i18n.postCode} "/>
			<t:gridCol property="postName" width="100" caption="${i18n.postName} "/>
			<t:gridCol property="dicCode" width="150" caption="所属业务" convert="queryDicCode"/>
			<t:gridCol property="postGroupId" caption="${i18n.postGroupId}" convert="getAllPostGroup" />
			<t:gridCol property="attr" caption="${i18n.attr}" />
			<t:gridCol property="biaos" caption="${i18n.biaos}" width="20" convert="biaos"/>
		</t:grid>
		<!-- 用户组编辑弹出窗口 -->
		<t:form dialog="true" id="form_post" caption="用户组" action="savePost.ajax" reset="NOT" idKeys="postCode">
			<t:fieldLayout  prefix="formPost">
				<t:fieldHidden property="id"/>
				<t:fieldHidden property="flag"  defaultValue="1"/>
				<t:fieldText property="postCode" caption="${i18n.postCode}" notNull="true"  maxLength="3" expression="^[a-zA-Z0-9]*$"  expressionMessage="用户组代码只能为字母或数字" minLength="3"/>
				<t:fieldText property="postName" caption="${i18n.postName}" notNull="true" maxLength="10" expression="^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$"  expressionMessage="用户组名称不能含有特殊字符" />
				<t:fieldSelect property="dicCode"  caption="所属业务" convert="queryDicCode" notNull="true"/>
				<t:fieldSelect property="postGroupId" caption="${i18n.postGroupId}" notNull="true" />
				<t:fieldText property="attr" maxLength="20" expression="^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$" expressionMessage="必须为IP地址格式，最大为255.255.255.255" caption="${i18n.attr}"/>
				<t:fieldHidden property="biaos"  defaultValue="1"/>
			</t:fieldLayout>
		</t:form>
		<t:form id="form_authUsercenter" action="saveAuthUsercenter.ajax" reset="NOT" dialog="true" caption="授权用户中心">
			<t:fieldLayout prefix="authuc">
				<t:fieldHidden property="postCode"></t:fieldHidden>
			</t:fieldLayout>
			<table width="100%" cellspacing="1" cellpadding="0" class="bg-border">
				<tbody>
					<tr>
						<td width="30%" valign="top">
							<div class="menu-tree-title">用户中心</div>
							<div class="menu-tree-container">
								<div id="ucTree" class="youi-field">
									<t:tree id="tree_uc_result"  tree="${usercenterTree}" check="true"   />
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="post_ucIds">
			 	
			 </div>
		</t:form>
		<!-- 用户组数据授权弹出窗口  -->
		<t:form action="savePostDataItems.ajax" dialog="true" id="form_post_authorize_init" width="800" caption="数据授权"  reset="NOT">
			<t:fieldLayout prefix="authorize">
				<t:fieldSelect property="dataId"  caption="${i18n.dataId}" src="listDataType.ajax" code="dataId" show="dataName" notNull="true"/>
				<t:fieldSelect property="groupId"  caption="${i18n.groupId}" src="listDataGroup.ajax" code="groupId" show="groupName" parents="dataId"/>
			</t:fieldLayout>
			<table width="100%" cellspacing="1" cellpadding="0" class="bg-border">
				<tbody>
					<tr>
						<td valign="top">
								<t:grid width="370" id="grid_postParam" load="false"
									idKeys="value"
									dataFormId="form_postParam"
									caption="备选数据" showCheckbox="true"  edit="NOT" remove="NOT" add="NOT" reset="NOT" submit="NOT" src="getPostData.ajax" back="NOT">
									    <t:fieldLayout prefix="nosel">
											<t:fieldHidden property="dataId" />
											<t:fieldHidden property="text" />
											<t:fieldHidden property="ucid" />
											<t:fieldHidden property="postCode" />
										</t:fieldLayout>
										<t:gridCol property="usercenter" caption="用户中心" />
										<t:gridCol property="text" caption="${i18n.text}" />
										<t:gridCol property="value" caption="${i18n.value}"  />
								</t:grid>
						</td>
						<td  valign="top">
							<table align="center" class="btn-container">
								<tr><td><span id="selectAll" title="全选择" class="btn" onclick="move_right_all_selected()">&gt;&gt;</span></td></tr>
								<tr><td><span id="select" title="选择" class="btn" onclick="move_right_selected()">&nbsp;&gt;&nbsp;</span></td></tr>
								<tr><td><span id="cancel" title="取消"  class="btn" onclick="move_left_selected()">&nbsp;&lt;&nbsp;</span></td></tr>
								<tr><td><span id="cancelAll" title="全取消" class="btn" onclick="move_left_all_selected()">&lt;&lt;</span></td></tr>
							</table>
						</td>
						<td valign="top">
									<t:grid id="grid_postDataItemSelected"  load="false"
										idKeys="value" width="370" 
										dataFormId="form_postDataItemSelect"
										caption="已选数据" showCheckbox="true" src="listPostDataItems.ajax" edit="NOT" remove="NOT" add="NOT" usePager="false" reset="NOT" submit="NOT"  back="NOT">
											 <t:fieldLayout prefix="items">
												<t:fieldHidden property="groupId" />
												<t:fieldHidden property="dataId" />
												<t:fieldHidden property="postCode" />
											</t:fieldLayout>
											<t:gridCol property="usercenter" caption="用户中心" />
											<t:gridCol property="text" caption="名称" />
											<t:gridCol property="value" caption="值"  />
									</t:grid>
						</td>
				
					</tr>
				</tbody>
			</table>
			<div id="dataItems_selectedValues">
			 	
			 </div>
		</t:form>
		<t:form action="savePostDataItemsCk.ajax" dialog="true" id="form_ck_post_authorize_init" width="800" caption="仓库数据授权" reset="NOT">
			<t:fieldLayout prefix="authorize">
				<t:fieldHidden property="dicCode"></t:fieldHidden>				
				<t:fieldSelect property="ckDTId"  caption="${i18n.ckDTId}" src="listCkDataType.ajax" parents="dicCode"  code="id" show="dataParamName" notNull="true" />
				<t:fieldHidden property="cuncTableName"></t:fieldHidden>	
			</t:fieldLayout>
			<table width="100%" cellspacing="1" cellpadding="0" class="bg-border">
				<tbody>
					<tr>
						<td  valign="top">
								<t:grid id="grid_ck_postParam" 
									idKeys="ucname,value"
									dataFormId="form_ck_postParam" width="350"
									caption="备选数据" showCheckbox="true" edit="NOT" src="getCkDataInfo.ajax" load="false" remove="NOT" add="NOT" reset="NOT" submit="NOT" usePager="NOT"  back="NOT">
										 <t:fieldLayout prefix="showAlldataItems">
											<t:fieldHidden property="id" />
											<t:fieldHidden property="cuncTableName" />
											<t:fieldHidden property="postCode" />
										</t:fieldLayout>
										<t:gridCol property="ucname"  width="100" caption="用户中心" />
										<t:gridCol property="text"  width="100" caption="${i18n.text}" />
										<t:gridCol property="value" caption="${i18n.value}"  />
								</t:grid>
						</td>
						<td width="10%" valign="top">
							<table align="center" class="btn-container">
								<tr><td><span id="selectAll" title="全选择" class="btn" onclick="ck_move_right_all_selected()">&gt;&gt;</span></td></tr>
								<tr><td><span id="select" title="选择" class="btn" onclick="ck_move_right_selected()">&nbsp;&gt;&nbsp;</span></td></tr>
								<tr><td><span id="cancel" title="取消"  class="btn" onclick="ck_move_left_selected()">&nbsp;&lt;&nbsp;</span></td></tr>
								<tr><td><span id="cancelAll" title="全取消" class="btn" onclick="ck_move_left_all_selected()">&lt;&lt;</span></td></tr>
							</table>
						</td>
						<td align="top">
								<t:grid id="grid_ck_postDataItemSelected" 
									idKeys="ucname,value"
									dataFormId="form_ck_postDataItemSelect"
									caption="已选数据" showCheckbox="true"  width="350" src="listSysDataGroup.ajax" load="false" edit="NOT" remove="NOT" add="NOT" usePager="false" reset="NOT" submit="NOT" back="NOT">
										<t:fieldLayout prefix="dataItems">
											<t:fieldHidden property="id" />
											<t:fieldHidden property="postCode" />
										</t:fieldLayout>
										<t:gridCol property="ucname"  width="98"  caption="用户中心" />
										<t:gridCol property="text" width="100"  caption="${i18n.text}" />
										<t:gridCol property="value" caption="${i18n.value}"  />
								</t:grid>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="ck_dataItems_selectedValues"></div>
		</t:form>
	</t:page>
</t:html>