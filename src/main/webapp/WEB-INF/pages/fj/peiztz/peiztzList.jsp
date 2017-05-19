<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
<!--
#main {
 float: left;
 height: auto;
 width: auto;
 
}
#left {
 float: left;
 height: auto;
 width: 48%;
 
}
#right {
 float: right;
 height: auto;
 width: 46%;
 
}
#mid{
margin:0 0 0 3px;
float: left; 
width: 4%;
}
#right_2{
 float:left;
 height:auto;
 width:100%;
}
#leftLJ {
 float: left;
 height: auto;
 width:50%;
}
#leftBZ {
 float: left;
 height: auto;
 width:50%;
}
.outer { 
	float: left;
	
    overflow: hidden;
    position: relative;  
    cursor:pointer; 
    font: bold 13px/1.2 tahoma,arial,黑体,sans-serif; 
} 

.outer[class] {
        display: table;
        position: static;
} 

.middle {
        position: absolute;
        top: 50%;
} /* for explorer only*/ 

.middle[class] {
        display: table-cell;
        vertical-align: middle;
        position: static;
} 

.inner {
        position: relative;
        top: -50%; 
} /* for explorer only */ 

 
.youi-fieldLayout table td.contral.label-col {
    width: 58px;
}
 
 
-->
</style>
</head>
<t:page i18n="i18n.fj.peiztz" >
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['shifmz'] ={'0':'${i18n.fou }','1':'${i18n.shi }'};
$(function(){
	$('#mid').height(500);
});
</script>

<div id="main">
 <div id="left">
 <!-- 配载计划 -->	
     <div id="left_1" >
			<t:grid id="peizjhGrid" idKeys="PEIZDH" caption="${i18n.peiztz_title }"
				src="/fj/queryPeizjhOfTiaoz.ajax" scrollHeight="110" 
				add="NOT" edit="NOT" remove="NOT" usePager="false" 
				save="NOT"  load="false" >
			<t:fieldLayout id="peizjh_select" prefix="pz" >
				<t:fieldCalendar property="faysj" format="yyyy-MM-dd" caption="${i18n.fysj }" width="110"></t:fieldCalendar>
				<t:fieldSelect property="chex" caption="${i18n.chex }" width="110" src="/fj/queryChex.ajax" show="CHEXBH" code="CHEXBH" ></t:fieldSelect>
				<t:fieldSelect property="shifmz" caption="${i18n.shifmz }" width="110" convert="shifmz"></t:fieldSelect>
			</t:fieldLayout>
 
				<t:gridCol property="JIHCX"   caption="${i18n.chex }"></t:gridCol>
				<t:gridCol property="YUNSLX"   caption="${i18n.yunslx }"></t:gridCol>
				<t:gridCol property="YUNSSBM"   caption="${i18n.yunssbm }"></t:gridCol>
				<t:gridCol property="BAOZSL"  caption="${i18n.baozsl }"></t:gridCol>
				<t:gridCol property="FAYSJ"   width="110" caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="SHIFMZ"   caption="${i18n.shifmz }" convert="shifmz" ></t:gridCol>
				<t:gridCol property="PEIZDH"   caption="${i18n.peizdh }"></t:gridCol>
				
			</t:grid>
	</div>
	<!-- 要货令 -->
    <div id="left_2">
		<t:grid id="yaohlGrid" idKeys="YAOHLH" caption="${i18n.yaohl_title }"
				src="/fj/queryYaohlOfPeizd.ajax" usePager="false"
				add="NOT" edit="NOT" remove="NOT"  scrollHeight="110" 
				save="NOT" showCheckbox="true" submit="NOT" reset="NOT">
				<t:fieldLayout id="yaohl_select" prefix="yh" >
					<t:fieldHidden property="peizdh"></t:fieldHidden>
				</t:fieldLayout>
 
				<t:gridCol property="BAOZXH"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="LINGJBH"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="YAOHSL"   caption="${i18n.lingjsl }"></t:gridCol>
				<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
				<t:gridCol property="KEHBM"  caption="${i18n.keh }"></t:gridCol>
				<t:gridCol property="FAYSJ" width="110"  caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="JIAOFSJ"  width="110"  caption="${i18n.jiaofsj }"></t:gridCol>
				<t:gridCol property="YAOHLBH"  caption="${i18n.yaohlbh }"></t:gridCol>
				
			</t:grid>
		</div>
    </div>
    <div id="mid" class="outer"><div class="middle"><div class="inner"><button name="btnMove" id="btnMove" onclick="yaohlMove();">${i18n.zhuany }</button></div></div></div>
    <div id="right">
		<div id="right_1">
			<t:grid id="chelxzGrid" idKeys="PEIZDH,CELBH,ID" caption="${i18n.chelxz_title }"
				src="/fj/queryPeizjhOfTiaoz.ajax" usePager="false"
				add="NOT" edit="NOT" remove="NOT" scrollHeight="110" 
				save="NOT" load="false">
			<t:fieldLayout  id="chelxz_select" prefix="cx"   >
				<t:fieldCalendar property="faysj" format="yyyy-MM-dd" caption="${i18n.fysj }" width="110"></t:fieldCalendar>
				<t:fieldSelect property="chex" caption="${i18n.chex }" width="110" src="/fj/queryChex.ajax" show="CHEXBH" code="CHEXBH" ></t:fieldSelect>
				<t:fieldSelect property="shifmz" caption="${i18n.shifmz }" width="110" convert="shifmz"></t:fieldSelect>
			</t:fieldLayout>
				<t:gridCol property="JIHCX"   caption="${i18n.chex }"></t:gridCol>
				<t:gridCol property="YUNSLX"   caption="${i18n.yunslx }"></t:gridCol>
				<t:gridCol property="YUNSSBM"   caption="${i18n.yunssbm }"></t:gridCol>
				<t:gridCol property="BAOZSL"   caption="${i18n.baozsl }"></t:gridCol>
				<t:gridCol property="FAYSJ"  width="110" caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="SHIFMZ"   caption="${i18n.shifmz }" convert="shifmz" ></t:gridCol>
				<t:gridCol property="PEIZDH"   caption="${i18n.peizdh }"></t:gridCol>
				
			</t:grid>
		</div>
		<div id="right_2">
	<!-- 动态添加行数量表格 -->
		<div id="leftLJ">
			<t:grid id="lingjGrid" idKeys="lingj" add="NOT" edit="NOT" load="false" scrollHeight="125"
					remove="NOT" usePager="false" src="/fj/queryPeizjhOfLingj.ajax"    
					save="NOT" submit="NOT" reset="NOT" caption="${i18n.lingjhz_title }">
				<t:fieldLayout id="yaohl_Lj" prefix="yhlLj" >
					<t:fieldHidden property="peizdh" ></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="LINGJBH" width="120"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="LINGJSL" width="10"  caption="${i18n.lingjsl }"></t:gridCol>
			</t:grid>
		</div>
		<div id="leftBZ">
			<t:grid id="baozGrid"  idKeys="baozz"  add="NOT" edit="NOT" load="false"  scrollHeight="125"
					remove="NOT" usePager="false"  src="/fj/queryPeizjhOfBaozz.ajax"
					save="NOT" submit="NOT" reset="NOT"  caption="${i18n.baozhz }">
				<t:fieldLayout id="yaohl_Bzz" prefix="yhlBz" >
					<t:fieldHidden property="peizdh"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="BAOZXH" width="120"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="BAOZSL" width="10" caption="${i18n.baozsl }"></t:gridCol>
			</t:grid>
		</div>
	 	</div>
	</div>
	
</div>

<script type="text/javascript">
//选中左边配载计划行的chang事件
function peizjhGrid_change(record, rowIndex) {
	$("#yh_peizdh").fieldValue(record.PEIZDH);
	$("#yaohlGrid").grid("reload");
}

//选中右边配载计划行的chang事件
function chelxzGrid_change(record, rowIndex) {
	$("#yhlLj_peizdh").fieldValue(record.PEIZDH);
	$("#yhlBz_peizdh").fieldValue(record.PEIZDH);
	$("#lingjGrid").grid("reload");
	$("#baozGrid").grid("reload");
}

//选中的要货令转移到其他车辆上
function yaohlMove(){
	//获得所选要添加的配载计划的配载单号
	var rowData_left = $("#peizjhGrid").grid('getSelectedRecords')[0];
	//获得所选被添加的配载计划的配载单号
	var rowData_right =   $("#chelxzGrid").grid('getSelectedRecords')[0];
	
	//判断左边配载计划是否选中
	if(rowData_left==null||rowData_left==undefined){
		alert("${i18n.js_xuanz_peizjh }");
		return ;
	}
	//获得所选要货令集合
	var records = $('#yaohlGrid').grid('getSelectedRecords');
	if(records==null||records.length==0){
		alert("${i18n.js_xuanz_yaohl }");
		return ;
		
	}
	//判断右边配载计划是否选中
	if(rowData_right==null||rowData_right==undefined){
		alert("${i18n.js_xuanz_right_peizjh }");
		return ;
	}
	
	var peizdh = rowData_right.PEIZDH;
	var peizdh_left =  rowData_left.PEIZDH;
	var celbh = rowData_right.CELBH;
	var id = rowData_right.ID;
	
	if(peizdh==peizdh_left){
		alert("${i18n.js_notxuanz_peizjh }");
		return;
	}
	
	if(rowData_left.YUNSLX!=rowData_right.YUNSLX){
		alert("${i18n.js_xuanz_notchanlz }");
		return;
	}

	var params = [];
	//将要货令放到数组中
	params.push("peizdh="+peizdh);
	params.push("celbh="+celbh);
	params.push("id="+id);
	params.push("peizdh_left="+peizdh_left);
	$.each(records,function(i,n){
		 params.push("yaohlhList["+i+"]=" + n.YAOHLBH);
	}); 
	//开始转移，将转移的要货令添加到被加的配载计划上
	 $.sdcui.ajaxUtil.ajax({
	 	 url:"${ctx}/fj/moveYaohlToPeizjh.ajax",
	 	 data:params.join("&"),
	 	 success:function (result){
			//转移成功，刷新配载计划列表
			$("#peizjhGrid").grid("reload"); 
			$("#chelxzGrid").grid("reload");
			$("#yaohlGrid").grid("reload");
			
	 	 }
	 });	
	
}
</script>
</t:page>
</t:html>