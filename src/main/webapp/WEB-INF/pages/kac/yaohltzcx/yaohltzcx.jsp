 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="要货令调整查询">

<!-- 
	要货令调整查询
	 @author 陈鹏
	 @date 2015-1-29
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_yaohltzcx" caption="要货令调整查询" 
		src="/kac/queryYaohltz.ajax"
		idKeys="usercenter,chenysbh"  
		back="NOT"
		load="false" 
		showNum="true"
		add="NOT"
		edit="NOT"
		remove="NOT"
		scrollHeight="350"  
		pageSize="15"
		>
		<t:fieldLayout id="yaohltzcx" prefix="yaohltz" columns="3">
			<t:fieldHidden property="usercenter" caption="用户中心" defaultValue="${usercenter}" />
			<t:fieldSelect property="daztbh" caption="大站台编号" parents="usercenter,quybh" parentsAlias="usercenter,quybh" src="/kac/listDaztbh.ajax" code="daztbh" show="daztbh"  width="150"/>
			<t:fieldSelect property="xiehzt" caption="卸货站台" parents="usercenter,daztbh" parentsAlias="usercenter,daztbh" src="/kac/queryXiehzt.ajax" code="XIEHZTBH" show="XIEHZTBH"  width="150"/>
			<t:fieldSelect property="xiehztbz" caption="卸货站台编组"  parents="usercenter" parentsAlias="usercenter"  src="/kac/xiehztbz.ajax" itemText=" " itemValue=" "  code="XIEHZTBZH" show="XIEHZTBZH"  width="150"/>
			<t:fieldCalendar property="tiaozkssj" caption="要货令调整时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="tiaozjssj" caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldSelect property="yaohlzt" convert="yaohlzt" caption="要货令状态" width="100"></t:fieldSelect>
			<t:fieldSelect property="yaohllx" convert="queryWghms" caption="供货模式" width="100"></t:fieldSelect>
			<t:fieldText property="chengysbh" caption="承运商编号" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="用户中心"  convert="queryUserCenterMap" 
			></t:gridCol>
		<t:gridCol property="xiehzt" caption="卸货点"  width="90" 
			/>
		<t:gridCol property="xiehztbz" caption="卸货站台编组"  width="90" 
		/>
		<t:gridCol property="daztbh" caption="大站台编号"  width="120" 
			/>
		<t:gridCol property="chengysbh" caption="承运商编号"  width="120" 
			/>	
		<t:gridCol property="tiaozkssj" caption="要货令调整开始时间"  width="140" 
			/>
		<t:gridCol property="tiaozjssj" caption="要货令调整结束时间"  width="140" 
			/>
		<t:gridCol width="80" property="yaohllx" caption="供货模式"></t:gridCol>		
		<t:gridCol width="80" property="yaohlzt" convert="yaohlzt" caption="要货令状态"></t:gridCol>
		<t:gridCol property="tiaozgs" caption="调整要货令个数"  width="140" 
			/>
		<t:gridCol property="tiaozsj" caption="调整时间(小时)"  width="140" 
			/>	
		<t:gridCol property="operator" caption="操作人"  width="140" 
			/>	
		<t:gridCol property="operate_time" caption="操作时间"  width="140" 
			/>	
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	function grid_yaohltzcx_beforeSubmit() {
		var t1 = $("#yaohltz_tiaozkssj").fieldValue();	//要货令调整开始时间
		var t2 = $("#yaohltz_tiaozjssj").fieldValue();	//要货令调整结束时间
		var d1 = new Date(t1.replace(/\-/g,"\/"));
		var d2 = new Date(t2.replace(/\-/g,"\/"));
		if(""!=t1&&""!=t2&&d1>d2){
			alert("开始时间不能大于结束时间！");
			return false;
		}
	}
	 //要货令状态
	$.sdcui.serverConfig.convertArray['yaohlzt'] = {
		'01' : '表达',
		'02' : '在途',
	};
</script>

</t:html>