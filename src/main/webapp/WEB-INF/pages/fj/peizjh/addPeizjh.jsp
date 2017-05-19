<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script src="<%=request.getContextPath()%>/scripts/lib/field.core.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/field.select.js" type="text/javascript"></script>

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

#right{
float:right;
width:100%;
}

-->
</style>

</head>
<t:page i18n="i18n.fj.fj">
<!-- 未配载要货令列表  hzg 2012-03-20 -->
	<t:form id="shougpzForm" submit="NOT" reset="NOT" >
			<t:fieldLayout columns="4" prefix="sgpz">
				<t:fieldHidden property="celChex"></t:fieldHidden>
				<t:fieldSelect property="yunslxbh" width="90" caption="${i18n.yunslx }" src="/fj/queryYunslx.ajax" show="YUNSLXBH" code="YUNSLXBH" notNull="true"></t:fieldSelect>
				<t:fieldSelect property="keh" width="90" caption="${i18n.keh }" parents="yunslxbh" parentsAlias="yunslxbh" src="/fj/queryKehCpk.ajax" code="KEHBH" show="KEHBH" notNull="true"></t:fieldSelect>
				<t:fieldSelect property="yunssbm" width="120" caption="${i18n.yunss }" parents="yunslxbh" parentsAlias="yunslxbh"  src="/fj/queryYunssCpk.ajax" show="CHENGYSBH" code="CHENGYSBH" notNull="true"></t:fieldSelect>
				<t:fieldSelect property="jihcx" width="100" caption="${i18n.chex }" parents="yunssbm" parentsAlias="yunssbm"  src="/fj/queryChexYunss.ajax" show="CHEXBH" code="CHEXBH" notNull="true"></t:fieldSelect>
			</t:fieldLayout>
	</t:form>
	<t:grid id="noPeizYaohlGrid" idKeys="YAOHLH" caption="${i18n.nopeizyhl_title }"
				src="/fj/queryNoPeizYaohl.ajax" usePager="true" scrollHeight="105"
				add="NOT" edit="NOT" remove="NOT" load="false"
				save="NOT" showCheckbox="true" submit="NOT" reset="NOT">
				<t:fieldLayout columns="3" id="yaohl_select" prefix="yh" >
					<t:fieldHidden property="keh" caption="${i18n.keh }" ></t:fieldHidden>
					<t:fieldHidden property="yslxbh" caption="${i18n.yunslx }" ></t:fieldHidden>
					<t:fieldHidden property="yaohl_in" defaultValue=" "></t:fieldHidden>
					<t:fieldCalendar property="faysj" width="110" format="yyyy-MM-dd" caption="${i18n.fysj }"></t:fieldCalendar>
					<t:fieldText property="baozxh"  width="90" caption="${i18n.baozxh }"></t:fieldText>
					<t:fieldText property="lingjbh"  width="90" caption="${i18n.lingjbh }"></t:fieldText>
				</t:fieldLayout>
				<t:gridCol property="BAOZXH"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="LINGJBH"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="YAOHSL"   caption="${i18n.lingjsl }"></t:gridCol>
				<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
				<t:gridCol property="KEH"  caption="${i18n.keh }"></t:gridCol>
				<t:gridCol property="FAYSJ"  width="110" caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="JIAOFJ"  width="110"  caption="${i18n.jiaofsj }"></t:gridCol>
				<t:gridCol property="YAOHLH"  caption="${i18n.yaohlbh }"></t:gridCol>
		<t:button caption="${i18n.search }" name="btnSearch"></t:button>
		<t:button caption="${i18n.reset }" name="btnReset"></t:button>
		<t:button caption="${i18n.tianj }"  name="btnAdd"></t:button>
	</t:grid>

  <div id="left">
	   <t:grid id="peizYaohlGrid" idKeys="pzYaohlh" caption="${i18n.alreadypeizyhl_title }"
				usePager="false"  scrollHeight="120"
				add="NOT" edit="NOT" remove="NOT"
				save="NOT" submit="NOT" reset="NOT">
				<t:gridCol property="BAOZXH"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="LINGJBH"  caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="YAOHSL"   caption="${i18n.lingjsl }"></t:gridCol>
				<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
				<t:gridCol property="KEH"  caption="${i18n.keh }"></t:gridCol>
				<t:gridCol property="FAYSJ"  width="110" caption="${i18n.fysj }"></t:gridCol>
				<t:gridCol property="JIAOFJ"  width="110"  caption="${i18n.jiaofsj }"></t:gridCol>
				<t:gridCol property="YAOHLH"  caption="${i18n.yaohlbh }"></t:gridCol>
				<t:gridCol property="YAOHLH" renderer="isDelete" caption="${i18n.caozuo }"></t:gridCol>
	   </t:grid>
  </div>
	<!-- 动态添加行数量表格 -->
  <div id="left_1">
		<div id="leftLJ">
			<t:grid id="lingjGrid" add="NOT" idKeys="lingjbh" edit="NOT" remove="NOT" usePager="false"
					save="NOT" submit="NOT" reset="NOT" caption="${i18n.lingjhz }"  scrollHeight="120" > 
				<t:gridCol property="LINGJBH" width="70" caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="LINGJSL" width="30"  caption="${i18n.shul }"></t:gridCol>
			</t:grid>
		</div>
		<div id="leftBZ">
			<t:grid id="baozGrid" add="NOT" idKeys="baozbh" edit="NOT" remove="NOT" usePager="false"
					save="NOT" submit="NOT" reset="NOT"  caption="${i18n.baozhz }"  scrollHeight="120" >
				<t:gridCol property="BAOZXH" width="70"  caption="${i18n.baozxh }"></t:gridCol>
				<t:gridCol property="BAOZSL" width="30" caption="${i18n.shul }"></t:gridCol>
			</t:grid>
		</div>
  </div>

<!-- 推荐配载 -->
<t:form dialog="true" reset="NOT" submit="NOT" remove="NOT"  width="400" idKeys="lxzbh" id="form_tuij" caption="${i18n.yunss }推荐配载" >
		<t:grid id="peizclGrid" idKeys="celbh" add="NOT" edit="NOT" save="NOT" submit="NOT" reset="NOT"
					remove="NOT" usePager="false" src="/fj/queryPeizcl.ajax" load="false">
				<t:fieldLayout id="peizclLayout" columns="2" prefix="pzcl" >
					<t:fieldHidden property="lxzbh" caption="${i18n.yunslx }" ></t:fieldHidden>
					<t:fieldText property="celbh"  width="80" caption="${i18n.fangabh }"></t:fieldText>
					<t:fieldSelect property="chexbh" width="80" caption="${i18n.chex }" src="/fj/queryChex.ajax" show="CHEXBH" code="CHEXBH"></t:fieldSelect>
				</t:fieldLayout>
				<t:gridCol property="CELBH" width="130" caption="${i18n.fangabh }"></t:gridCol>
				<t:gridCol property="CHEXBH" width="130" caption="${i18n.chex }"></t:gridCol>
				<t:gridCol property="CELMC"  width="130" caption="${i18n.miaos }"></t:gridCol>
				<t:button caption="${i18n.search }" name="btnTJSearch"></t:button>
				<t:button caption="${i18n.reset }" name="btnTJReset"></t:button>
		</t:grid>
		<t:fieldLayout id="pzclBtn" prefix="pzclBtn">
			<t:button caption="${i18n.qued }" name="sure"></t:button>
		</t:fieldLayout>
</t:form>	


<!-- 按钮居中 -->
<div id="right">
	<table align="center">
		<tr align="center">
			<td align="center">
				<div class="youi-button active-0" id="button_saveMn">
				<div class="right"><div class="center"><a class="saveMn" href="javascript:onclick=func_button_save();">${i18n.btn_save }</a>	</div></div>
				</div>
			</td>
			<td align="center">
				<div class="youi-button active-0" id="button_cancel">
				<div class="right"><div class="center"><a class="cancel" href="javascript:onclick=func_button_recommend();">${i18n.btn_tuijPZ }</a></div></div>
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
//返回
function func_button_reback(){
	window.history.back();
}


//要货令号
var yaohl_in = [];
//已配载要货令集合
var pzYaohls = [];
//自定义查询按钮功能
function func_button_btnSearch(){
    var yunslx = $("#sgpz_yunslxbh").fieldValue();
    if(yunslx==""){
    	alert("${i18n.addpeizjh_yunslx_notnull }");
    	return;
    }
    var keh = $("#sgpz_keh").fieldValue();
    if(keh==""){
    	alert("【客户】不能为空");
    	return;
    }
    var keh = $("#sgpz_keh").fieldValue();
	$("#yh_keh").fieldValue(keh);
	$("#yh_yslxbh").fieldValue(yunslx);
	$("#noPeizYaohlGrid").grid("submit");
	
}

//自定义重置按钮功能
function func_button_btnReset(){
	$("#noPeizYaohlGrid").grid("reset");
}

//客户属于运输路线组，根据运输路线查询要货令
function sgpz_yunslxbh_change(){
	var yunslxbh = $("#sgpz_yunslxbh").fieldValue();
	$("#yh_yslxbh").fieldValue(yunslxbh);
	$("#yh_keh").fieldValue("");
	//根据运输路线查询要货令
	$('#noPeizYaohlGrid').grid('reload'); 
}

//客户属于运输路线组，根据运输路线查询要货令
function sgpz_keh_change(){
	var keh= $("#sgpz_keh").fieldValue();
	$("#yh_keh").fieldValue(keh);
	//根据运输路线查询要货令
	$('#noPeizYaohlGrid').grid('reload'); 
}

//添加要货令事件
	var mapLingj = {};
	var mapBaoz = {};
function func_button_btnAdd(){
	
	var records = $('#noPeizYaohlGrid').grid('getSelectedRecords');
	/*是否有选中记录*/
	if (records==null||records.length==0) {
		alert("${i18n.addpeizjh_no_select }");
		return;
	}
	//添加到已配载要货令列表，并汇总零件和包装
	$.each(records, function(i,o) {
		pzYaohls.push(o);
		yaohl_in.push(o.YAOHLH);
		
	//零件汇总 
		var sumLj = mapLingj[o.LINGJBH]||0;
		mapLingj[o.LINGJBH]= sumLj + parseInt(o.YAOHSL); 
	//包装汇总
		var sumBz = mapBaoz[o.BAOZXH]||0;
		mapBaoz[o.BAOZXH] = sumBz+1;
	});
	
	LjBaozCollect(mapLingj,mapBaoz);
	//将添加的要货令解析到已配载列表
	$('#peizYaohlGrid').grid('parseRecords', pzYaohls);  
	$("#yh_yaohl_in").fieldValue(yaohl_in.join(','));
	$('#noPeizYaohlGrid').grid('reload'); 
}

//零件包装汇总
function  LjBaozCollect(mapLingj,mapBaoz){
	var arrLingj = [];
	var arrBaoz = [];
	//零件和数量添加到数组中
	$.each(mapLingj,function(k,v){
		arrLingj.push({'LINGJBH':k,'LINGJSL':v});
	});
	//包装和数量添加到数组中
	$.each(mapBaoz,function(k,v){
		arrBaoz.push({'BAOZXH':k,'BAOZSL':v});
	});
	
	$("#lingjGrid .grid-content .youi-editor table tr").remove();
	$("#baozGrid .grid-content .youi-editor table tr").remove();
	//汇总后将添加的要货令统计解析到零件和包装列表
	$('#lingjGrid').grid('parseRecords', arrLingj);  
	$('#baozGrid').grid('parseRecords', arrBaoz);  
	
}


//渲染事件，向未配载要货令操作列中加'删除'
var isDelete = function (v) {
	return '<a href="javascript:deleteYhl(\''+v+'\')">${i18n.addpeizjh_delete }</a>';
	
}

//执行删除操作
function deleteYhl(v){
	var arrLingj = [];
	var arrBaoz = [];
	//alert(v);
	if(confirm("${i18n.addpeizjh_whether_delete }")){
		//从要货令数组中移除将要删除的要货令
		//var selectedYhl = $("#peizYaohlGrid").grid("getSelectedRecords")[0];
		$.each(pzYaohls,function(i,o){
			if(o['YAOHLH']==v){
				pzYaohls.splice(i,1);
				//删除零件和包装数量
				$.each(mapLingj,function(k,v){ //删除零件
					//如果零件编号和删除的零件编号相同
					if(k==o['LINGJBH']){
						if(v>o['YAOHSL']){//减数量
							mapLingj[k]= v - parseInt(o['YAOHSL']); 
						}else{//移除掉零件
							delete mapLingj[k];
						}
					}	
				});
				
				$.each(mapBaoz,function(k,v){//删除包装
					if(k==o['BAOZXH']){
						if(v>1){//减数量
							mapBaoz[k]= v - 1; 
						}else{//移除掉包装
							delete mapBaoz[k];
						}
					}	
				});
				
				//将新的对象零件和数量添加到数组中
				$.each(mapLingj,function(k,v){
					arrLingj.push({'LINGJBH':k,'LINGJSL':v});
				});
				//包装和数量添加到数组中
				$.each(mapBaoz,function(k,v){
					arrBaoz.push({'BAOZXH':k,'BAOZSL':v});
				});
				
				$("#lingjGrid .grid-content .youi-editor table tr").remove();
				$("#baozGrid .grid-content .youi-editor table tr").remove();
				//汇总后将添加的要货令统计解析到零件和包装列表
				$('#lingjGrid').grid('parseRecords', arrLingj);   
				$('#baozGrid').grid('parseRecords', arrBaoz); 
				
				/*移除选中的要货令（移除后重新加载列表）*/
				$('#peizYaohlGrid').grid('parseRecords', pzYaohls);  
				return false;
			}
		});
		
	//$('#peizYaohlGrid >.grid-content tr.row.selected').remove();
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
}

//保存要货令，生成配载计划
function func_button_save(){
	var records = $("#peizYaohlGrid").grid('getRecords',false); 
	if(records==""||records==null||records==undefined){
		alert("${i18n.addpeizjh_select_addyaohl }");
		return;
	}
	var keh = $("#sgpz_keh").fieldValue();
    if(keh==""){
    	alert("【客户】不能为空");
    	return;
    }
	var params = [];
	$("#shougpzForm").form('submit');
	if($("#shougpzForm").form('validate')==true){
		var celChex = $("#sgpz_celChex").fieldValue();
		var xzChex =  $("#sgpz_jihcx").fieldValue();
		if(celChex!=""||celChex==undefined){
			if(celChex!=xzChex){
				alert("${i18n.addpeizjh_notsome_againselect }");
				return;
			}
		}
		
		$.each(pzYaohls,function(i,o){
			 params.push("yaohlmxList["+i+"]=" + o);
		});
		$.each(yaohl_in,function(j,p){
			 params.push("yaohls["+j+"]=" + p);
		});
		
		params.push("yunssbm="+$("#sgpz_yunssbm").fieldValue());
		params.push("jihcx="+$("#sgpz_jihcx").fieldValue());
		params.push("yunslx="+$("#sgpz_yunslxbh").fieldValue());
		 $.sdcui.ajaxUtil.ajax({
		 	 url:"${ctx}/fj/insertPeizjh.ajax",
		 	 data:params.join("&"),
		 	 success:function (result){
				//保存成功后跳转到配载计划页面
				window.location.href="${ctx}/fj/peizjh.do";
		 	 }
		 });	
	}
}

//推荐配载打开页面
function func_button_recommend(){
	var yunslx = $("#sgpz_yunslxbh").fieldValue();
	var chex = $("#sgpz_jihcx").fieldValue();
	if(yunslx==null||yunslx==""){
		alert("${i18n.addpeizjh_select_yunslx }");
		return;
	}
	//已配载要货令列表有数据则不能进行推荐配载
	if (pzYaohls.length>0) {
		alert("${i18n.addpeizjh_select_dontpeiz }");
		return;
	}
	$("#pzcl_lxzbh").fieldValue(yunslx);
	$("#pzcl_chexbh").fieldValue(chex);
	$("#peizclGrid").grid("reload");
	$("#form_tuij").form("open");
}

//推荐配载自定义查询按钮
function func_button_btnTJSearch(){
    $("#pzcl_lxzbh").fieldValue($("#sgpz_yunslxbh").fieldValue());
	$("#peizclGrid").grid("submit");
}

//推荐配载自定义重置按钮
function func_button_btnTJReset(){
	$("#peizclGrid").grid("reset");
}



//推荐配载确定
function func_button_sure(){
	var rowData = $("#peizclGrid").grid('getSelectedRecords')[0];
	if(rowData==undefined){
		alert("${i18n.addpeizjh_select_fanga }");
		return;
	}
	//保存策略车型
	$("#sgpz_celChex").fieldValue(rowData.CHEXBH);
	
	var PZBH = rowData.CELBH;
	var LXZBH = $("#sgpz_yunslxbh").fieldValue();
	var params = [];
	
	params.push("PZBH="+PZBH);
	params.push("LXZBH="+LXZBH);
	 $.sdcui.ajaxUtil.ajax({
	 	 url:"${ctx}/fj/tuiJanPeiZ.ajax",
	 	 data:params.join("&"),
	 	 success:function (result){
// 	 			var yaohlhs = result.result.yhlbh;
// 	 			alert(yaohlhs.length);
	 			addYHL(result.result.yhlbh,result.result.cllx.toString());
	 	 }
	 });	
	$("#form_tuij").form("close");	
}

/**新增要货令**/
function addYHL(yaohlhs,cx){
// 	$("#sgpz_jihcx").fieldValue(cx);
	$("#yh_yaohl_in").fieldValue(yaohlhs.join(','));
	$("#yh_yslxbh").fieldValue($("#sgpz_yunslxbh").fieldValue());
	$('#noPeizYaohlGrid').grid('reload'); 
	//将推荐的要货令编号保存到数组中
	for(i=0;i<yaohlhs.length;i++){
		yaohl_in.push(yaohlhs[i]);
	}
	
	var params = [];
	params.push("yaohlhs="+yaohlhs.join(','));
	//新增要货令
	 $.sdcui.ajaxUtil.ajax({
	 	 url:"${ctx}/fj/queryYaohlOfTuij.ajax",
	 	 data:params.join("&"),
	 	 success:function (result){
			$.each(result.result.rows,function(i,o){
				pzYaohls.push(o);
			//零件汇总 
				var sumLj = mapLingj[o.LINGJBH]||0;
				mapLingj[o.LINGJBH]= sumLj + parseInt(o.YAOHSL); 
			//包装汇总
				var sumBz = mapBaoz[o.BAOZXH]||0;
				mapBaoz[o.BAOZXH] = sumBz+1;
			}); 
	 		$('#peizYaohlGrid').grid('parseRecords', pzYaohls);  
	 		
	 	 //统计零件和包装数	
	 		LjBaozCollect(mapLingj,mapBaoz);
	 	 }
	 });	
}

</script>
</t:page>
</t:html>
