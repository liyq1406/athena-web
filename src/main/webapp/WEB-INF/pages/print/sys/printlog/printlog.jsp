<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="打印设备">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
			function initPage(){
				var btnAction = {
					'selectAll':function(){
						$('#tree_menu_part').find('li.treeNode').not('.hide').each(function(){
							$('#tree_menu_result').find('li#'+this.getAttribute('id')+'.treeNode').addClass('show');
						});
					},'select':function(){
						$('#tree_menu_part').find('li.treeNode.checked,li.treeNode.partchecked').not('.hide').each(function(){
							$('#tree_menu_result').find('li#'+this.getAttribute('id')+'.treeNode').addClass('show');
						});
					},'cancel':function(){
						$('#tree_menu_result').find('li.treeNode.checked').removeClass('show');
					},'cancelAll':function(){
						$('#tree_menu_result').find('li.treeNode').removeClass('show');
					}
				};
				//按钮点击
				$('.btn').click(function(){
					btnAction[this.getAttribute('id')]();
				});
			}
		</script>
</head>
<t:page>
	<t:grid id="grid_PrintLog" idKeys="lid" dataFormId="form_printLog"
		caption="打印日志列表" src="/sys/queryPrintlog.ajax" add="NOT" remove="NOT"
		edit="NOT" editSrc="" removeSrc="">
		<t:fieldLayout>
			<t:fieldCalendar property="operatetime" caption="${i18n.time}"
				format="yyyy-MM-dd hh:mm:ss" />
			<t:fieldText property="soperater" caption="${i18n.operater}"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol property="soperater" caption="${i18n.operater}"></t:gridCol>
		<t:gridCol property="smenuname" caption="${i18n.menuname}"></t:gridCol>
		<t:gridCol property="sfunctionname" caption="${i18n.functionname}"></t:gridCol>
		<t:gridCol property="sdesc" caption="${i18n.sdesc}"></t:gridCol>
		<t:gridCol property="operatetime" caption="${i18n.operatetime}"></t:gridCol>
	</t:grid>
</t:page>
</t:html>
