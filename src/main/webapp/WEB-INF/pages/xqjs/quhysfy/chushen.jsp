<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.title}">

<!-- 
	运费重算
	 @author denggq
	 @date 2012-4-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

		<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_quhys">
	<t:grid id="grid_chongsuan" caption="审核单据明细" 
	idKeys="usercenter" 
	back="NOT" 
	remove="NOT" 
	scrollHeight="500" 
	pageSize="25"
	src="/qhysfy/queryRukmxChus.ajax" 
	load="true" 
	showNum="true" 
	add="NOT"
	edit="NOT"

	
>
		
		<t:fieldLayout   prefix="record_chushen" columns="4">
				<t:fieldSelect  readonly="true" property="usercenter" caption="用户中心" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			
		    <t:fieldText property="gongysdm" caption="供应商代码"  maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码"  maxLength="10" minLength="10" width="110" />
			<t:fieldText property="lingjbh" caption="零件编号"  width="150"/>
			<t:fieldSelect property="danjlx" caption="单据类型" convert="danjlx"  defaultValue="" width="150"/>
	
	
			<t:fieldText property="baozxh" caption="包装型号"   width="150"/>
		    <t:fieldSelect property="lingjlx" caption="零件类型"  convert="lingjlx" width="150"/>
			<t:fieldSelect property="lxjlb" caption="零星件类型" src="/qhysfy/queryPostLxjlb.ajax" parents="lingjlx" code="key"   show="value" width="150"/>
			<t:fieldCalendar property="qisruksj" format="yyyy-MM-dd" caption="入库日期" width="130" ></t:fieldCalendar>
			<t:fieldCalendar property="jisruksj" format="yyyy-MM-dd" caption="至" width="130" ></t:fieldCalendar>
			<t:fieldHidden property="danjh" defaultValue="${danjh}" ></t:fieldHidden>
			<t:fieldHidden property="usercenter" defaultValue="${usercenter}" ></t:fieldHidden>
			<t:fieldHidden property="jinjjdjh" defaultValue="${jinjjdjh}" ></t:fieldHidden>
		</t:fieldLayout>
	    <t:button caption="导出" name="download" active="0"/>	

	
		
		<t:gridCol   property="usercenter" caption="用户中心"  convert="queryUserCenterMap" ></t:gridCol>
		<t:gridCol  property="chengysdm" caption="承运商代码"   width="90" ></t:gridCol>
		<t:gridCol property="gongysdm" caption="供应商代码" width="90" ></t:gridCol>
		<t:gridCol   property="lingjbh" caption="零件编号"  convert="danjlx"  width="90" ></t:gridCol>
		<t:gridCol  property="baozxh" caption="包装型号"  width="90" ></t:gridCol>
		<t:gridCol  property="baozrl" caption="包装容量"   width="90" ></t:gridCol>
		<t:gridCol  property="lingjlx" caption="零件类型"  convert="lingjlx"  width="90" ></t:gridCol>
		<t:gridCol property="lxjlb" caption="零星件类型"  convert="queryLxjlb" />
		<t:gridCol property="danjlx" caption="单据类型"  convert="danjlx" defaultValue="1" width="90" />
		<t:gridCol  property="xinljdj" caption="零件单价"  width="90" ></t:gridCol>
		<t:gridCol  property="lingjsl" caption="零件数量/趟次"  width="90" ></t:gridCol>
		<t:gridCol  property="xinysfy" caption="运输费用"  width="90" ></t:gridCol>
		<t:gridCol  property="xinjjfy" caption="紧急费用"  width="90" ></t:gridCol>
		<t:gridCol  property="xinlfmdj" caption="立方米单价"  width="90" ></t:gridCol>	
		<t:gridCol property="xinfkfy" caption="返空费用" width="90"/>
		<t:gridCol property="xintpfy" caption="托盘费用" width="90"/>
		<t:gridCol  property="xintpfkfy" caption="托盘返空费用"  width="90" ></t:gridCol>	
		<t:gridCol property="baozgs" caption="包装个数" width="90"/>
		<t:gridCol  property="ruksj" caption="入库时间"  width="120" ></t:gridCol>
				<t:gridCol property="" caption=""/>
	</t:grid>	
	
		<t:form caption="保存" dialog="true" id="form_danjmc" action="/qhysfy/saveyushen.ajax" width="420" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="record_danjmc" showLabel="true" >
				<t:fieldText  width="140" property="danjmc" caption="单据名称"  maxLength="5" minLength="2" notNull="true" />
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="danjlx"></t:fieldHidden>
		</t:fieldLayout>
		<t:button caption="提交" name="tijiao"></t:button>
	</t:form>
	<input id="removeId" value="${removeId}" type="hidden"/> 
</t:page>

<script type="text/javascript">

$.sdcui.serverConfig.convertArray['lingjlx'] = {

		'1' : '正常件',
		'2' : '紧急件',
		'3' : '零星件'
	};



//单据类型
$.sdcui.serverConfig.convertArray['danjlx'] = {

	'1' : '正常件',
	'2' : '紧急件'
};




//导出数据
function func_button_download(){
	var usercenter = trim($('#record_chushen_usercenter').fieldValue());
	var gongysdm = trim($('#record_chushen_gongysdm').fieldValue());
	var chengysdm = trim($("#record_chushen_chengysdm").fieldValue());
	var lingjbh = trim($('#record_chushen_lingjbh').fieldValue());
	var baozxh = $('#record_chushen_baozxh').fieldValue();
	var lingjlx = $('#record_chushen_lingjlx').fieldValue();
	var qisruksj = $('#record_chushen_qisruksj').fieldValue();
	var jisruksj = $('#record_chushen_jisruksj').fieldValue();
	var danjh = $('#record_chushen_danjh').fieldValue();
	var shenhzt = $('#record_chushen_shenhzt').fieldValue();
	var jinjjdjh = $('#record_chushen_jinjjdjh').fieldValue();
	var record = {'usercenter':usercenter,'gongysdm':gongysdm,'chengysdm':chengysdm,'lingjbh':lingjbh,'baozxh':baozxh,'lingjlx':lingjlx,'qisruksj':qisruksj,'jisruksj':jisruksj,'danjh':danjh,'shenhzt':shenhzt,'jinjjdjh':jinjjdjh};
	$.sdcui.pageUtils.goPage({
		url : '../qhysfy/downloadchushen.do',
		record : record,
		mode : 'form',
		beforeSubmit : function(){
			return true;
		}
   });
}
</script>

</t:html>