<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="按需手动下发">

<!-- 
	  按需手动下发
	 @author zghe
	 @date 2015-7-7
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.anx.anx_zh_CN">
	<t:grid id="grid_hand" caption="按需手动下发流水" idKeys="usercenter" edit="NOT" add="NOT" remove="NOT" load="false"  
	showNum="true"  back="NOT"	src="/anxorder/queryAnxHandSet.ajax"  scrollHeight="310" pageSize="15">
		<t:fieldLayout id="fl_hand" prefix="hand" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${usercenter}" convert="queryUserCenterMap"  width="120"/>
			<t:fieldCalendar property="startTime" caption="操作时间" format="yyyy-MM-dd HH:mm:ss" width="170"/>
			<t:fieldCalendar property="endTime" caption="至" format="yyyy-MM-dd HH:mm:ss" width="170"/>
			<t:fieldSelect property="zhuangt" caption="状态" convert="zhuangt"  width="120"/>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="用户中心" convert="queryUserCenterMap" />
		<t:gridCol property="zhuangt" caption="状态" convert="zhuangt"  width="150" />
		<t:gridCol property="creator" caption="操作人" width="150" />
		<t:gridCol property="create_time" caption="操作时间" width="150" />
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
	
	<t:form id="form_handset" submit="NOT" caption="按需手动下发设置" reset="NOT" action="/anxorder/saveAnxHandset.ajax ">
			<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter"  caption="用户中心"  convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
			<t:fieldSelect property="zhuangt"   caption="按需下发状态" notNull="true">
				<t:fieldOption value="Y" text="自动下发"></t:fieldOption>
				<t:fieldOption value="N" text="关闭下发"></t:fieldOption>
			</t:fieldSelect>
			<t:button caption="确定" name="saveHand"></t:button>
			</t:fieldLayout>
		</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'Y' : '自动下发',
		'N' : '关闭下发'
	};

	 
	//保存设置
	function func_form_saveHand() {
		var usercenter = $("#record_usercenter").fieldValue();
		var zhuangt = $("#record_zhuangt").fieldValue();
		var ztMsg = "是否设置为"+(zhuangt=='Y'?'自动下发并生效按需订单':'关闭下发');
		if(confirm(ztMsg)){
			$("#form_handset").form("submit");
		}
		
	}
	
	//保存成功后事件
	
	function form_handset_afterSubmit(result) {
		if (result.result.message == 'success') {
			if ($("#record_zhuangt").fieldValue() == 'N') {
				alert("按需订单暂停下发成功，请在按需订单计算完成核对后设置为自动下发");
			} else {
				alert("批量修改当天按需订单生效成功");
			}
		} else {
			alert("保存失败！");
		}
		//刷新列表
		$('#grid_hand').grid('reload', false, [], true);
		//清空表表单值
		//$("#form_handset").form("clear");
	}
</script>

</t:html>