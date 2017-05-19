<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<% 
LoginUser loginU = AuthorityUtils.getSecurityUser();
String usernameI = loginU.getUsername();
%>
<t:html  title="菜单管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<!-- 
		 -->
		<link type="text/css" rel="stylesheet" href="<c:url value="/styles/default/sdc.ui.treegrid.css"/>"/>
		
		<script type="text/javascript">
			function initPage(){
				//页面初始化
				_disableButton(['addChild','addSame','remove']);
				var username = "<%=usernameI%>";
				if("ROOT" != username){
					$("#button_submit").css('display','none');
					$("#button_remove").css('display','none');
				}
			}
			
			function func_button_expandAll(){
				$('#tree_menu').tree('expandAll',$('#tree_menu').tree('getSelected'));
			}
			
			function func_button_closeAll(){
				$('#tree_menu').tree('closeAll',$('#tree_menu').tree('getSelected'));
			}
			
			function _disableButton(buttonIds){
				$(buttonIds).each(function(){
					$('.youi-button#button_'+this).addClass('disabled');
				});
			}
			
			function _activeButton(buttonIds){
				$(buttonIds).each(function(){
					$('.youi-button#button_'+this).removeClass('disabled');
				});
			}
			/**
			 * 树节点选择变化回调函数
			 */
			function tree_menu_change(){
				var id = this.getAttribute('id');
				var text = $('>span',this.parentNode.parentNode).text();
				if($(this).hasClass('root')){
					_activeButton(['addChild']);
					_disableButton(['addSame','remove']);
					id = '';
				}else{
					_activeButton(['addChild','addSame','remove']);
				}
				_fillMenuForm(id,text);
			}
			
			function _fillMenuForm(id,parentText){
				$('#form_menu').form('find','getMenuDirectory.ajax?id='+id,function(record){
					$('#form_menu').form('fieldDefaultValue','parent',parentText);
				});
			}
			/**
			 * 保存成功后的回调函数
			 */
			function form_menu_afterSubmit(results){
				var id = results.result;//
				var text = $('#field_dirName').fieldValue();
				var parentId = $('#field_parentId').fieldValue();
				_fillMenuForm(results.result);//从数据库读取数据刷新form数据
				//var dirName = field_dirName;
				
				var selectedNode = $('#tree_menu').tree('getSelected');
				//处理树
				var treeNode = $('#tree_menu').find('li.treeNode#'+id);
				if(!treeNode.length){
					//插入节点 addNode:function(relativeNode,id,text,attributes,data,afterAdd,type)
					$('#tree_menu').tree('addNode',
						selectedNode,id,text,null,null,null,(parentId==selectedNode.attr('id')?'child':'after'));
				}else{
					treeNode.find('>span>a').text(text);
				}
				
			}
			/**
			 * 删除成功后的回调函数
			 */
			function form_menu_afterRemove(results){
				$('#tree_menu').tree('removeNode',results.result);
			}
			/**
			 * 表单按钮动作：设置模式,增加下级菜单
			 */
			function func_button_addChild(){
				$('#form_menu').form('clear');//清空数据
				
				var selectedNode = $('#tree_menu').tree('getSelected');
				//
				var parentId,parentText;
				if(selectedNode.length){
					parentId = selectedNode.hasClass('root')?'':selectedNode.attr('id');
					parentText = selectedNode.find('>span').text();
				}
				$('#form_menu').form('fieldDefaultValue','parentId',parentId);
				$('#form_menu').form('fieldDefaultValue','parent',parentText);
			}
			/**
			 * 表单按钮动作：设置模式,增加平级菜单
			 */
			function func_button_addSame(){
				$('#form_menu').form('clear');//清空数据
				
				var selectedNode = $('#tree_menu').tree('getSelected');
				//
				var parentId,parentText;
				if(selectedNode.length){
					var parentNode = selectedNode.parent().parent();
					if(parentNode.length){
						parentId = parentNode.hasClass('root')?'':parentNode.attr('id');
						parentText = parentNode.find('>span').text();
					}
				}
				
				$('#form_menu').form('fieldDefaultValue','parentId',parentId);
				$('#form_menu').form('fieldDefaultValue','parent',parentText);
			}
			function func_button_changeActive(){
				var currentId = $('#menu_id').fieldValue();
				var childIds = $('#'+currentId).find("li");
				var length = childIds.length;
				var params = [];
				params.push($.sdcui.parameterUtils.propertyParameter("currentId",currentId));
				var biaos = $('#menu_biaos').fieldValue();
				params.push($.sdcui.parameterUtils.propertyParameter("biaos",biaos));
				for(var i=0;i<length;i++){
					var childId = childIds[i];
					var id = $(childId).attr("id");
			    	params.push($.sdcui.parameterUtils.propertyParameter("ids["+i+"]",id));
				}
				$.sdcui.ajaxUtil.ajax({
					url:'changeMenuActive.ajax',
					data:params.join('&'),
					success:function(result){
						if(result.rebiaos==0){
							$("#menu_biaos").fieldValue('0');
						}else if(result.rebiaos==1){
							$("#menu_biaos").fieldValue('1');
						}
						alert(result.result);
					}
				});
			}
			
				//状态：停用 启用
			$.sdcui.serverConfig.convertArray['biaos'] = {
				'0' : '停用',
				'1' : '启用'
			};
		</script>
	</head>
	<t:page>
		<!-- 菜单目录-->
		<t:panel id="panel_menu" caption="菜单管理">
			<table width="100%">
				<tbody>
					<tr>
						<td valign="top" width="30%">
							<div style="border:1pt solid silver;height:334px;overflow:auto;">
								<t:tree id="tree_menu" tree="${menuTree}" rootText="菜单"></t:tree>
							</div>
							<t:buttons id="buttons_menu">
								<t:button caption="展开菜单" name="expandAll"/>
								<t:button caption="收拢菜单" name="closeAll"/>
								<t:button name="addChild" caption="增加下级"></t:button>
								<t:button name="addSame" caption="增加平级"></t:button>
							</t:buttons>
						</td>
						<td valign="top" width="70%">
							<t:form idKeys="id" removeAction="removeMenuDirectory.ajax"
								panel="false" id="form_menu" action="saveWithButtons.ajax">
								<t:fieldLayout showBorder="true" prefix="menu">
									<t:button caption="启/停" name="changeActive" active="1"></t:button>
									<t:fieldHidden property="id"/>
									<t:fieldHidden property="parentId"/>
									<t:fieldLabel property="parent" caption="上级地址"/>
									<t:fieldText notNull="true" property="dirCode" caption="地址编码"/>
									<t:fieldText notNull="true" property="dirName" caption="地址名称"/>
									
									<t:fieldText property="dirOrder" defaultValue="0" caption="地址序号" notNull="true"/>
									<t:fieldSelect property="dirType" caption="地址类型"  notNull="true">
										<t:fieldOption value="0" text="菜单"></t:fieldOption>
										<t:fieldOption value="1" text="链接"></t:fieldOption>
									</t:fieldSelect>
									<t:fieldSelect property="dirIsCK"  caption="登录类型" notNull="true">
										<t:fieldOption value="0" text="非全键盘"></t:fieldOption>
										<t:fieldOption value="1" text="全键盘"></t:fieldOption>
										<t:fieldOption value="2" text="手持机"></t:fieldOption>
									</t:fieldSelect>
									<t:fieldSelect property="biaos"  caption="状态" readonly="true" defaultValue="1" convert="biaos" />
									<t:fieldText property="dirPath" column="2" width="496" caption="地址URL" upperCase="false"/>
									<t:fieldGrid width="485" column="2" property="buttons" caption="菜单按钮">
										<t:grid id="grid_button" idKeys="id" caption="菜单按钮列表"
												reset="NOT" submit="NOT" usePager="false"
												scrollHeight="203"
												panel="false" editable="true"  back="NOT" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
											<t:gridCol editor="fieldText" width="200"  property="buttonName"  caption="NAME" editorOptions="{'minLength':'2','maxLength':'60','dataType':'text','notNull':true,'dataType':'text','upperCase':false}"/>
											<t:gridCol editor="fieldText" width="200" property="buttonCaption"  caption="按钮描述"/>
										</t:grid>
									</t:fieldGrid>
								</t:fieldLayout>
							</t:form>
						</td>
					</tr>
				</tbody>
			</table>
			
		</t:panel>
		
	</t:page>
</t:html>