<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="业务日记表管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			function initPage(){
				//页面初始化
			}
		</script>
	</head>
	<t:page>
		
		<!-- 业务日记表列表 -->
		<t:grid id="grid_busLog" 
			idKeys="cid" add="NOT" remove="NOT" edit="查看"
			dataFormId="form_busLog" editSrc="getBusLog.ajax"
			caption="业务日记表列表" 
			src="queryBusLog.ajax" back="NOT">
			<t:fieldLayout columns="3" prefix="log">
				<t:fieldText property="operatorsIp" caption="操作用户IP"/>
				<t:fieldText property="operators" caption="操作用户"/>
				<t:fieldText property="transDesc" caption="交易描述"/>
				<t:fieldCalendar property="createTime_from"  caption="操作时间从" width="120" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="createTime_to"    caption="至" width="120" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="operators" caption="操作用户"/>
			<t:gridCol property="transDesc" width="200" caption="交易描述"/>
			<t:gridCol property="transUrl" width="200" caption="URL"/>
			<t:gridCol property="operatorsIp" width="150" caption="操作用户IP"/>
			<t:gridCol property="cexception" caption="异常信息"/>
			<t:gridCol width="120" property="createTime" caption="操作时间"></t:gridCol>
		</t:grid>
		
		<!-- 业务日记表表单 -->
		<t:form dialog="true" submit="NOT" reset="NOT" id="form_busLog" caption="业务日记表">
			<t:fieldLayout prefix="record">
				<t:fieldLabel column="2" width="500" property="transUrl" caption="URL"/>
				<t:fieldLabel property="operatorsIp" caption="操作用户IP"/>
				<t:fieldLabel property="operators" caption="操作用户"/>
				<t:fieldLabel property="transDesc" caption="交易描述"/>
				<t:fieldLabel property="createTime" caption="操作时间"/>
				<t:fieldLabel column="2" width="500"  property="cexception" caption="异常信息"/>
				<t:fieldArea readonly="true" column="2" rows="15" width="500" property="tranContent" caption="日记内容"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
	<script type="text/javascript">
	//空格查询
	function grid_busLog_beforeSubmit() {
		if($("#log_createTime_from").fieldValue()!="" && $("#log_createTime_to").fieldValue() != ""){
		}else if($("#log_createTime_from").fieldValue()=="" && $("#log_createTime_to").fieldValue() == "" ){
		}else{
			alert("若根据时间筛选，请将时间段填写完整。");
			return false;
		}
		return true;
	}
	</script>
</t:html>