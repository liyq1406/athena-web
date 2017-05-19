<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
<!--
#left {
 float: left;
 height: auto;
 width: 68%;
 
}
#left_1 {
 float: right;
 height: auto;
 width:32%;
}
#l1 {
 float: left;
 height: auto;
  width:50%;
}
#l2 {
 float: left;
 height: auto;
  width:50%;
}
#right{
float:right;
height:auto;
width:100%;
} 
#right_1{
float:right;
width:100%;
}

-->
</style>

</head>
<t:page i18n="i18n.fj.fj" >
<!-- 未配载要货令列表  hzg 2012-03-21 -->
	<t:form id="peizjhForm" submit="NOT" reset="NOT" >
			<t:fieldLayout columns="3" prefix="sgpz">
				<t:fieldLabel property="peizdh"defaultValue="${selRowData.peizdh }" width="120"  caption="${i18n.peizdh }"></t:fieldLabel>
				<t:fieldLabel property="yunslx" defaultValue="${selRowData.yunslx }"  width="120"  caption="${i18n.yunslxz }"></t:fieldLabel>
				<t:fieldSelect property="yunssbm" defaultValue="${selRowData.yunssbm }" width="120"  parents="yunslx" parentsAlias="yunslx" caption="${i18n.yunss }" src="/fj/queryYunssOfLXZ.ajax" show="GCBH" code="GCBH" notNull="true"></t:fieldSelect>
				<t:fieldLabel property="jihcx" defaultValue="${selRowData.jihcx }" width="120" caption="${i18n.chex }" ></t:fieldLabel>
				<t:fieldLabel property="daocsj" defaultValue="${selRowData.daocsj }" width="120" caption="${i18n.daocsj }" ></t:fieldLabel>
				<t:fieldLabel property="faysj" defaultValue="${selRowData.faysj }" width="120" caption="${i18n.fysj }" ></t:fieldLabel>
			</t:fieldLayout>
	</t:form>
	
	<div id="left">
		<t:grid id="peizYaohlGrid" idKeys="pzYaohlh" caption="${i18n.alreadypeizyhl_title }" scrollHeight="96" 
					src="/fj/queryPeizjhYaohl.ajax"  usePager="false" 
					add="NOT" edit="NOT" remove="NOT" 
					save="NOT" submit="NOT" reset="NOT" >
				<t:fieldLayout id="yaohl_all" prefix="yhlist" >
					<t:fieldHidden property="peizdh" defaultValue="${selRowData.peizdh }"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="BAOZXH"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="LINGJBH"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="LINGJSL"   caption="${i18n.lingjsl }"></t:gridCol>
				<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
				<t:gridCol property="KEH"  caption="${i18n.keh }"></t:gridCol>
				<t:gridCol property="FAYSJ"  width="110" caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="JIAOFJ" width="110" caption="${i18n.jiaofsj }"></t:gridCol>
				<t:gridCol property="YAOHLH"  caption="${i18n.yaohlbh }"></t:gridCol>
				<t:gridCol property="YAOHLH" renderer="isDelete" caption="${i18n.caozuo }"></t:gridCol>
		</t:grid>
	</div>
	<!-- 动态添加行表格 -->
	<div id="left_1">
		<div id="l1">
			<t:grid id="lingjGrid" idKeys="lingj" add="NOT" edit="NOT"   scrollHeight="96"
					remove="NOT" usePager="false" src="/fj/queryPeizjhYaohlOfLingj.ajax"
					save="NOT" submit="NOT" reset="NOT" caption="${i18n.lingjhz }">
				<t:fieldLayout id="yaohl_Lj" prefix="yhlLj" >
					<t:fieldHidden property="peizdh" defaultValue="${selRowData.peizdh }"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="LINGJBH" width="70"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="LINGJSL" width="30"  caption="${i18n.shul }"></t:gridCol>
			</t:grid>
		</div>
		<div id="l2">
			<t:grid id="baozGrid"  idKeys="baoz"  add="NOT" edit="NOT"   scrollHeight="96"
					remove="NOT" usePager="false"  src="/fj/queryPeizjhYaohlOfBaoz.ajax"
					save="NOT" submit="NOT" reset="NOT"  caption="${i18n.baozhz }">
				<t:fieldLayout id="yaohl_Bz" prefix="yhlBz" >
					<t:fieldHidden property="peizdh" defaultValue="${selRowData.peizdh }"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="BAOZXH" width="70"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="BAOZSL" width="30"  caption="${i18n.shul }"></t:gridCol>
			</t:grid>
		</div>
	 </div>
	
<div id="right">
	<t:grid id="noPeizYaohlGrid" idKeys="yaohlh" caption="${i18n.nopeizyhl_title }"
				src="/fj/queryNoPeizYaohl.ajax"  usePager="true"
				add="NOT" edit="NOT" remove="NOT" load="false"  scrollHeight="80"
				save="NOT" submit="NOT" reset="NOT">
				<t:fieldLayout id="yaohl_select" columns="4"  prefix="yh" >
					<t:fieldHidden property="yslxbh" defaultValue="${selRowData.yunslx }" caption="${i18n.yunslx }"></t:fieldHidden>
					<t:fieldHidden property="yaohl_in" defaultValue=" "></t:fieldHidden>
					<t:fieldCalendar property="faysj" width="110" format="yyyy-MM-dd" caption="${i18n.fysj }"></t:fieldCalendar>
					<t:fieldSelect property="keh" width="90"  caption="${i18n.keh }" parents="yslxbh" parentsAlias="yunslxbh" src="/fj/queryKehCpk.ajax" code="KEHBH" show="KEHBH" notNull="true"></t:fieldSelect>
					<t:fieldText property="baozxh" width="90" caption="${i18n.baozxh }"></t:fieldText>
					<t:fieldText property="lingjbh" width="90" caption="${i18n.lingjbh }"></t:fieldText>
				</t:fieldLayout>
				<t:gridCol property="BAOZXH"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="LINGJBH"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="YAOHSL"   caption="${i18n.lingjsl }"></t:gridCol>
				<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
				<t:gridCol property="KEH"  caption="${i18n.keh }"></t:gridCol>
				<t:gridCol property="FAYSJ"  width="110" caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="JIAOFJ" width="110" caption="${i18n.jiaofsj }"></t:gridCol>
				<t:gridCol property="YAOHLH"  caption="${i18n.yaohlbh }"></t:gridCol>
				<t:gridCol property="YAOHLH" renderer="isAdd" caption="${i18n.caozuo }"></t:gridCol>
		<t:button caption="${i18n.search }" name="btnSearch"></t:button>
		<t:button caption="${i18n.reset }" name="btnReset"></t:button>
	</t:grid>
</div>	

<!-- 按钮居中 -->
<div id="right_1">
	<table align="center">
		<tr align="center">
			<td align="center">
				<div class="youi-button active-0" id="button_saveMn">
				<div class="right"><div class="center"><a class="saveMn" href="javascript:onclick=func_button_sure();">${i18n.btn_save }</a>	</div></div>
				</div>
			</td>
			<td align="center">
				<div class="youi-button active-0" id="button_back">
				<div class="right"><div class="center"><a class="cancel" href="javascript:onclick=func_button_reback();">${i18n.btnBack }</a></div></div>
				</div>
			</td>
		</tr>
		</table>
	</div>	


<script type="text/javascript">
//保存
function func_button_sure(){
	var yunssbm = $('#sgpz_yunssbm').fieldValue();
	var peizdh = $('#sgpz_peizdh').fieldValue();
	var params = [];
	params.push("yunssbm="+yunssbm);
	params.push("peizdh="+peizdh);
	 $.sdcui.ajaxUtil.ajax({
	 	 url:"${ctx}/fj/updatePeizjhYunss.ajax",
	 	 data:params.join("&"),
	 	 success:function (result){
			//保存成功后跳转到配载计划页面
			window.location.href="${ctx}/fj/peizjh.do";
	 	 }
	 });	
}

//返回
function func_button_reback(){
	window.history.back();
}

//要货令号
var yaohl_in = [];
//自定义查询按钮功能
function func_button_btnSearch(){
	 $("#noPeizYaohlGrid").grid("submit");
}

//自定义重置按钮功能
function func_button_btnReset(){
	$("#noPeizYaohlGrid").grid("reset");
}

//客户属于运输路线组，根据运输路线查询要货令
function yh_keh_change(){
	$('#noPeizYaohlGrid').grid('reload'); 
}

//渲染事件，向已配载要货令操作列中加'删除'
var isDelete = function (v) {
	return '<a href="javascript:deleteYhl(\''+v+'\')">${i18n.editpeizjh_delete }</a>';
	
}

//执行删除操作，物理删除
function deleteYhl(v){
	var peizdh = $("#yhlist_peizdh").fieldValue();
	var params = [];
	if(confirm("${i18n.editpeizjh_whether_delete }")){
		params.push("peizdh="+peizdh);
		params.push("yaohls='"+v+"'");
		//从要货明细表中移除将要删除的要货令
		 $.sdcui.ajaxUtil.ajax({
		 	 url:"${ctx}/fj/deleteYaohlmx.ajax",
		 	 data:params.join("&"),
		 	 success:function (result){
				$('#peizYaohlGrid').grid('reload');  
				$('#noPeizYaohlGrid').grid('reload'); 
				$('#lingjGrid').grid('reload');  
				$('#baozGrid').grid('reload'); 
		 	 }
		 });	
	}
	
	//将删除的要货令添加到未配载要货令列表，通过not in( '20020','20011') 要货令来查询得到新的未配载要货令列表
	 $.each(yaohl_in,function(i,n){
		 if(n==v){
			 yaohl_in.splice(i,1);
			 if(yaohl_in.length==0){
				 $("#yh_yaohl_in").fieldValue(" ");
			 }else{
				 $("#yh_yaohl_in").fieldValue(yaohl_in.join(','));
			 } 
			$('#noPeizYaohlGrid').grid('reload'); 
			return false;
		 }
	 });
	
}	
//渲染事件，向未配载要货令操作列中加'增加'
var isAdd =  function(v){
	return '<a href="javascript:addYhl(\''+v+'\')">${i18n.editpeizjh_add }</a>';
}

//执行增加操作，物理增加
function addYhl(v){
	yaohl_in.push(v);
	$("#yh_yaohl_in").fieldValue(yaohl_in.join(','));
	var params = [];
	var peizdh = $("#yhlist_peizdh").fieldValue();
	params.push("peizdh="+peizdh);
	params.push("yaohls='"+v+"'");
	$.sdcui.ajaxUtil.ajax({
	 	 url:"${ctx}/fj/addYaohlmx.ajax",
	 	 data:params.join("&"),
	 	 success:function (result){
			$('#peizYaohlGrid').grid('reload');  
			$('#noPeizYaohlGrid').grid('reload'); 
			$('#lingjGrid').grid('reload');  
			$('#baozGrid').grid('reload');  
	 	 }
	 });	
}

</script>
</t:page>
</t:html>
