<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="物理点容器关系">

<!-- 
	  物理点容器关系
	 @author wangyu
	 @date 2012-12-10
 -->
 
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 95px; } 
	
	#grid_gongyxhd  .grid-footer   .pRemoveRow{
				display: none;
			}
	</style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_rongqcxhd" >
	<t:grid id="grid_wuldrqgx" caption="物理点容器关系" 
		idKeys="usercenter,wuld"  dataFormId="form_wuldrqgx1"
		src="/cangk/queryWuldrqgx.ajax" add="NOT" removeSrc="/cangk/removeWuldrqgx.ajax"
		load="false" editable="false"  showNum="true" back="NOT" scrollHeight="335" pageSize="15" >
		 
		<t:fieldLayout id="layout" prefix="wuldrqgx" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" 
						defaultValue="${usercenter}" width="150" />
			<t:fieldText property="wuld" caption="物理点" dataType="text" width="100"/>
			<t:fieldText property="wuld2" caption="容器场编号" dataType="text" maxLength="10" width="100"/>
		</t:fieldLayout>
		
		<t:button caption="增加" name="addwuld" active="0" icon="addRecord"></t:button>
		
		<t:gridCol property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="100"/>
		<t:gridCol property="wuld" caption="物理点" width="200"/>
		<t:gridCol property="wuldlx" caption="物理点类型" convert="wuldlx"  width="200"/>
		<t:gridCol property="wuld2" caption="容器场编号" width="100"/>
		<t:gridCol property="" caption="" width="20"/>	
	</t:grid>
	<t:form dialog="true" caption="增加物理点容器" id="form_wuldrqgx" action="/cangk/addWuldrqgx.ajax" width="500" reset="NOT">
				<t:fieldLayout prefix="groups1" columns="2">
					<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" 
						defaultValue="${usercenter}" width="150" />
					<t:fieldText property="wuld" caption="物理点"  maxLength="20" dataType="text" width="100" notNull="true"/>
					<t:fieldSelect property="wuldlx" caption="物理点类型" convert="wuldlx" defaultValue="1" width="150" notNull="true"/>
					<t:fieldText property="wuld2" caption="容器场编号" dataType="text" maxLength="10" width="100" notNull="true"/>
					<t:gridCol property="" caption=" " />
				</t:fieldLayout>
	</t:form>
	<t:form dialog="true" caption="修改物理点容器" id="form_wuldrqgx1" action="/cangk/saveWuldrqgx.ajax" width="500" reset="NOT" idKeys="wuld,usercenter">
				<t:fieldLayout prefix="groups" columns="2">
					<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150" />
					<t:fieldText property="wuld" caption="物理点" dataType="text"  maxLength="20" notNull="true" width="100"/>
					<t:fieldSelect property="wuldlx" caption="物理点类型" convert="wuldlx" defaultValue="1" width="150" readonly="true"/>
					<t:fieldText property="wuld2" caption="容器场编号" dataType="text" maxLength="10" notNull="true" width="100"/>
					<t:gridCol property="" caption=" " />
				</t:fieldLayout>
	</t:form>
</t:page>

<script type="text/javascript">

	//是否返空区
	$.sdcui.serverConfig.convertArray['wuldlx'] = {
		'2' : '其它',	
		'1' : '产线'
	};
	

	//空格查询
	function grid_rongqcxhd_beforeSubmit() {
		$("#wuldrqgx_wuld").fieldValue(trim($("#wuldrqgx_wuld").fieldValue()));
		$("#wuldrqgx_wuld2").fieldValue(trim($("#wuldrqgx_wuld2").fieldValue()));
	}
	
	//增加容器场弹出窗口
	function func_button_addwuld(){
		var user = $("#groups1_usercenter").fieldValue();
		var cxlx= $("#groups1_wuldlx").fieldValue();
		$("#form_wuldrqgx").form("clear");//清除弹出窗口的数据
		$("#groups1_usercenter").fieldValue(user);
		$("#groups1_wuldlx").fieldValue(cxlx);
		$("#form_wuldrqgx").form("open");
	}
	
	function form_wuldrqgx_afterSubmit(result){
		if(typeof result.success=="undefined"||result.success!==false){
		$("#form_wuldrqgx").form("close");
		$('#grid_wuldrqgx').grid("reload");
		}
	}
	
	//修改容器场弹出窗口
	function func_button_edit(){
		$("#form_wuldrqgx1").form("clear");
		 var record=$("#grid_wuldrqgx").grid("getSelectedRecords")[0];
		$('#form_wuldrqgx1').form('fillRecord',$.extend(record));
		$("#form_wuldrqgx1").form("open");
	}
	
	function form_wuldrqgx1_afterSubmit(result){
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_wuldrqgx1").form("close");
			$('#grid_wuldrqgx').grid("reload");
		}
		
	}
	
</script>

</t:html>