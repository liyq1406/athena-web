<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html >
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>
<style type="text/css">
<!--
#main{
 float: left;
 height: auto;
 width:100%;
}

#left {
 float: left;
 height: auto;
 width: 65%;
 
}
#left_1 {
 float: right;
 height: auto;
 width:35%;
}

#right{
float:right;
width:100%;
}

#btns{

}
-->
</style>
</head>
<t:page i18n="i18n.fj.pzfj"  >
<script type="text/javascript">

	function initPage(){
		var ms  = "${msgs}";
		if(ms != null && ms != ""){
			alert(ms);
		}
	}
	
/**
 * 查看选择中记录的车辆明细
 */
function selectCelMx(record ,rowIndex ,_this)
{
	//车辆明细
	$("#cl_USERCENTER").fieldValue(record.USERCENTER);
	$("#cl_YAOCJHXH").fieldValue(record.YAOCJHXH);
	$('#celmx').grid("submit");
	//要车明细
	$("#yc_USERCENTER").fieldValue(record.USERCENTER);
	$("#yc_YAOCJHXH").fieldValue(record.YAOCJHXH);
	$('#ycmx').grid("submit");
}
/**
 * 详细
 */
function func_button_info(){
	    var role = $('#yaocejhzb').grid('getSelectedRecords')[0];
	    if(role==undefined){
	    	alert("${i18n.fenpycjh_xuanz_yaocjh }");
	    	return;
	    }
	    
	    if(role.SHIFWC==1){
	    	alert("${i18n.fenpycjh_dont_fenp }");
	    	return;
	    }
	    
		$.sdcui.pageUtils.goPage({
			url:'/fj_peizai/toPageYaocjhMx.do',
			record:role,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return;
	}
	
/**
 * 重新分配
 */
function func_button_fenPen (){
	
	
	if(!confirm("${i18n.fenpycjh_whether_refenp }")){
		return;
	}
	
	
	
	    var role = $('#yaocejhzb').grid('getSelectedRecords')[0];
	    
	    if (role==null||role.length==0) {
			alert("${i18n.fenpycjh_yaocjh }");
			return;
		}
	    if((role.SHIFWC*1)==1){
	    	alert("${i18n.fenpycjh_finish_dontfp }");
	    	return;
	    }
		$.sdcui.pageUtils.goPage({
			url:'/fj_peizai/caculateForFenPei.do',
			record:role,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return;
	}
/**
 * 重新计算
 */
function func_button_jishuan (){
	
	if(!confirm("${i18n.fenpycjh_whether_recal }")){
		return;
	}
	
	    var role = $('#yaocejhzb').grid('getSelectedRecords')[0];
	    if (role==null||role.length==0) {
			alert("${i18n.fenpycjh_yaocjh }");
			return;
		}
	    
	    if((role.SHIFWC*1)==1){
	    	alert("${i18n.fenpycjh_finish_dontcal }");
	    	return;
	    }
	    var params = [];
	    params.push("YAOCJHXH="+role.YAOCJHXH);
	    $.sdcui.ajaxUtil.ajax({
	    	url : "${ctx}/fj_peizai/caculateFotJiShuan.ajax",
			data:params.join("&"),
			success : function(result) {
				
			}
		});
	}
//查询
function func_button_btnSearch(){
	$('#yaocejhzb').grid("submit");
}	
//重置
function func_button_btnReset(){
	$('#yaocejhzb').grid("reset");
}


//数据格试化
var isPrint = function (v) {
	if (v == 0) {
		return "${i18n.no }";
	} else if (v == 1){
		return "${i18n.yes }";
	}
} 


//调用webService执行系统自动计算要车计划服务
function func_button_caculate(){
	 $.sdcui.ajaxUtil.ajax({
	    	url : "${ctx}/fj_peizai/caculateYaocjh.ajax",
			success : function(result) {
				$("#yaocejhzb").grid("reload");
			}
		});
	
}

//数据格试化
var issShifmz = function(v) {
	if (v == 0) {
		return "${i18n.no }";
	} else if (v == 1){
		return "${i18n.yes }";
	}
}

//文件 下载
function func_button_downLoad(){
	
	var role = $('#yaocejhzb').grid('getSelectedRecords')[0];
    if(role==undefined){
    	alert("${i18n.fenpycjh_xuanz_yaocjh }");
    	return;
    }
    
    
	$.sdcui.pageUtils.goPage({
		url:'/fj_peizai/down.do',
		record:role,
		mode:'form',
		beforeSubmit:function(){
			return true;
		}
	});
}

</script>	
<div id="main">
	<div id="left">
		<t:grid id="yaocejhzb" idKeys="YAOCJHXH,USERCENTER"   scrollHeight="95" 
				caption="${i18n.yaocjh_title }" src="/fj_peizai/fenpycjhForAjax.ajax"
				usePager="true" showNum="false" editable="false" clickRowEvent="selectCelMx"
				editModel="false"  add="NOT" edit="NOT"  remove="NOT" save="NOT" reset="NOT" submit="NOT"	>
			<t:fieldLayout id="yaocjh_select" prefix="sb">
				<t:fieldCalendar property="DATE" width="120" format="yyyy-MM-dd" caption="${i18n.date }"></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="YAOCJHXH" type="text" caption="${i18n.yaocjhxh }" width="100" ></t:gridCol>
			<t:gridCol property="ZONGCC"   type="text" caption="${i18n.yaocsl }"  ></t:gridCol>
			<t:gridCol property="SHIFWC"   type="text" caption="${i18n.shifwc }" renderer="isPrint"  ></t:gridCol>
			<t:button caption="${i18n.search }" name="btnSearch"></t:button>
			<t:button caption="${i18n.reset }" name="btnReset"></t:button>
			<t:button caption="${i18n.fenpei}" name="info" active="1" ></t:button>
			<t:button caption="${i18n.againFeipei }" name="fenPen" active="1"></t:button>
			<t:button caption="${i18n.againJishuan }" name="jishuan" active="1"></t:button>
			<t:button caption="${i18n.report }" name="downLoad" active="1" ></t:button>
			<t:button caption="${i18n.jisycjh }"  name="caculate" ></t:button>
		</t:grid>	
	</div>
	<div id="left_1">
		<t:grid id="celmx" caption="${i18n.celmx_title }" scrollHeight="146"
				src="/fj_peizai/queryYaocjhCelMx.ajax" load="flase" usePager="false"
				showNum="false" editable="false" editModel="false" add="NOT"
				edit="NOT" remove="NOT" save="NOT" submit="NOT" reset="NOT">
			<t:fieldLayout id="celMx_select" prefix="cl">
				<t:fieldHidden property="USERCENTER"></t:fieldHidden>
				<t:fieldHidden property="YAOCJHXH"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="CHEX" type="text" caption="${i18n.chex }"  ></t:gridCol>
			<t:gridCol property="ZONGCC" type="text" caption="${i18n.zongcc }" ></t:gridCol>
		</t:grid>
	</div>
</div>
<div id="right">
			<t:grid id="ycmx" caption="${i18n.yaocmx_title }" scrollHeight="160"
				src="/fj_peizai/selectYaoCelMxAll.ajax" load="flase"
				usePager="true" showNum="true" editable="false" editModel="false"
				add="NOT" edit="NOT" remove="NOT" save="NOT" submit="NOT" 
				reset="NOT">
				<t:fieldLayout id="ycMx_select" prefix="yc">
					<t:fieldHidden property="USERCENTER"></t:fieldHidden>
					<t:fieldHidden property="YAOCJHXH"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="CHEXBH" type="text" caption="${i18n.chex }"  ></t:gridCol>
				<t:gridCol property="YUNSLX" type="text" caption="${i18n.yunslx }" ></t:gridCol>
				<t:gridCol property="YUNSSBM" type="text" caption="${i18n.yunssbm }" ></t:gridCol>
				<t:gridCol property="SHIFMZ" type="text" caption="${i18n.shifmz }"  renderer="issShifmz" ></t:gridCol>
				<t:gridCol property="DAOCSJ" type="text" caption="${i18n.daocsj }"  width="120"></t:gridCol>
				<t:gridCol property="FAYSJ" type="text" caption="${i18n.fysj }" ></t:gridCol>
			</t:grid>
	</div>	
</t:page>
	
</t:html>