<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<t:html title="字典管理">
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
			function initPage(){
				getGridHeight();
			}
		</script>
	</head>
	<t:page >
		
		<!-- 业务数据表列表 -->
		<t:grid id="grid_dic" 
			idKeys="dicCode"
			dataFormId="form_dic"
			caption="业务列表" 
			src="queryDic.ajax"
			editSrc="getDic.ajax"
			removeSrc="removeDic.ajax" back="NOT" add="NOT" remove="NOT" edit="NOT">
			<t:fieldLayout columns="3">
				<t:fieldText width="100"  property="dicCode" caption="业务标识"></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="dicCode" width="100"  caption="业务标识" />
			<t:gridCol property="dicName" width="300" caption="业务名称"/>
			<t:gridCol property="postGroupId" caption="所属角色" convert="getAllPostGroup" />
			<t:gridCol property="dicMemo" width="100" caption="描述"/>
		</t:grid>
		
		<!-- 业务数据表表单 -->
		<t:form dialog="true" id="form_dic" caption="业务定义" action="saveDic.ajax" reset="NOT" idKeys="dicCode">
			<t:fieldLayout prefix="record" columns="2">
				<t:fieldHidden property="validateFlag"  defaultValue="1"/>
				<t:fieldText property="dicCode" caption="业务标识" notNull="true" expression="^(?!_)(?!.*?_$)[a-zA-Z0-9_]*$" expressionMessage="业务标识不能含有特殊字符" minLength="4" maxLength="10"/>
				<t:fieldText property="dicName" caption="业务名称" notNull="true" expression="^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$"  expressionMessage="业务名称不能含有特殊字符"  minLength="2" maxLength="20"/>
				<t:fieldSelect property="postGroupId" column="2" caption="所属角色" src="listAllPostGroup.ajax" code="postGroupId" show="postGroupName" />
				<t:fieldText property="dicMemo" column="2" width="496" maxLength="50" caption="描述" />
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>