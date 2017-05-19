<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="菜单资源管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			function   Trim(m){   
			  while((m.length>0)&&(m.charAt(0)==' '))   
			  m   =   m.substring(1, m.length);   
			  while((m.length>0)&&(m.charAt(m.length-1)==' '))   
			  m = m.substring(0, m.length-1);   
			  return m;   
			}
			function form_menuResource_beforeSubmit(){
			    var menuName = $('#record_menuName').fieldValue();
				var menuCode = $('#record_menuCode').fieldValue();
				var menuPath = $('#record_menuPath').fieldValue();
				menuName = Trim(menuName);
				menuCode = Trim(menuCode);
				menuPath = Trim(menuPath);
				if(menuName==''||menuCode==''||menuPath==''){
					alert("资源名称、资源编号、资源URL不能为空格!");
					return false;
				}else{
					return true;
				}
			}
		</script>
	</head>
	<t:page>
		
		<!-- 0203菜单资源列表 -->
		<t:grid id="grid_menuResource" 
			idKeys="id"
			dataFormId="form_menuResource"
			caption="菜单资源列表" 
			src="queryMenuResource.ajax"
			editSrc="getMenuResource.ajax"
			removeSrc="removeMenuResource.ajax" showNum="true">
			<t:fieldLayout>
				<t:fieldText property="menuName" caption="资源名称"/>
			</t:fieldLayout>
				<t:gridCol orderBy="desc" property="menuName" caption="资源名称"/>
				<t:gridCol property="menuCode" caption="资源编号"/>
				<t:gridCol orderBy="desc" width="400" property="menuPath" caption="资源url"/>
		</t:grid>
		
		<!-- 0203菜单资源表单 -->
		<t:form dialog="true" reset="NOT" id="form_menuResource" caption="菜单资源" action="saveMenuResource.ajax">
			<t:fieldLayout prefix="record">
				<t:fieldHidden property="id" caption="主键"/>
				
				<t:fieldText property="menuName" caption="资源名称" notNull="true" expression="^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$" expressionMessage="用户组名称不能含有特殊字符"/>
				<t:fieldText property="menuCode" caption="资源编号" notNull="true"/>
				<t:fieldText property="menuPath" column="2" width="500" caption="菜单url" notNull="true"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>