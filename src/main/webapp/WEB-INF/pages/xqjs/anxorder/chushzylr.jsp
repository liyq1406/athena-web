<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctPath" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.chishzylr}" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.anx.anx">
<script type="text/javascript">
//打印
function func_button_print(){
    var param = [];
    var lingjbh = $("#layout_lingjbh").fieldValue();
    var shengcxbh = $("#layout_shengcxbh").fieldValue();
    var xiaohdbh = $("#layout_xiaohdbh").fieldValue();
    param.push("lingjbh="+lingjbh);
    param.push("shengcxbh="+shengcxbh);
    param.push("xiaohdbh="+xiaohdbh);
	$.sdcui.ajaxUtil.ajax({
		url:"printChushzyb.ajax",
	 	data:param.join('&'),
		success:function (result){
			var jsondata = result.json;
			print(jsondata);
		}
	});
}
function  print(jsondata){
	var templatecode = "chushzyb";
	var jsondata = jsondata;
	var selectedid = null;
	var clazzparams = null;
	var billcode = "BILLKEY";
	doprint_view(templatecode,jsondata,selectedid,clazzparams,billcode);
}
		
function doprint_view(templatecode,jsondata,selectedid,clazzparams,billcode){
	document.getElementsByName("jsondataprovider")[0].value = jsondata;
	document.getElementsByName("selectedid")[0].value=selectedid;
	document.getElementsByName("clazzparams")[0].value=clazzparams;
	document.getElementsByName("billcode")[0].value = billcode;
	document.getElementsByName("templatecode")[0].value = templatecode;
	document.getElementsByName("justDoPrint")[0].value = "false";
	var fm = document.getElementById("printform");
	fm.action = "${ctPath}/webprint/print_doit.jsp";
	fm.target = "_blank";
	fm.submit();	
}

//保存
function func_button_edit(){
/* 单行数据修改 mantis:0011510 modify by hzg 2015.7.15 */	
	//获得选中行参数
	var chushzy = $('#chushzyGrid').grid('getSelectedRecords')[0];
	$("#form_chushzyEdit").form('clear');
	$("#form_chushzyEdit").removeClass('operant-add');
	$("#form_chushzyEdit").form('fillRecord', $.extend({},chushzy));
	$("#form_chushzyEdit").form("open","修改");

	/* //判断是否有选中一条数据
	if(chushzy.length == 0){
		alert("${i18n.qingxzytsj}!");
		return  false;
	}
	var  params = [];
	for(var i=0;i<chushzy.length;i++){
		var slr =/^[0-9]{1,7}(?:\.[0-9]{1,3})?$|^0\.[0-9]{1,3}$/;
		var xianbkc = chushzy[i].xianbkc;
		var liush = chushzy[i].liush;
		var beiz = chushzy[i].beiz;
		//验证线边库存
		if(xianbkc==null) {
			alert("${i18n.xianbkcbnwk}!");
			return false;
		}
		if(!slr.test(xianbkc) || xianbkc.length > 11){
		    alert("${i18n.xianbkczdqwzsswxs}!");		
		    return false;
		}
		if(liush==null) {
			alert("${i18n.liushbnwk}!");
			return false;
		}
		if(liush.length>9) {
			alert("${i18n.liushbncgjw}!");
			return false;
		}
		if(beiz==null) {
			beiz="";
		}
		params.push('edit['+i+'].lingjbh='+chushzy[i].lingjbh);
		params.push('edit['+i+'].usercenter='+chushzy[i].usercenter);
		params.push('edit['+i+'].shengcxbh='+chushzy[i].shengcxbh);
		params.push('edit['+i+'].xiaohdbh='+chushzy[i].xiaohdbh);
		params.push('edit['+i+'].xianbkc='+chushzy[i].xianbkc);
		params.push('edit['+i+'].liush='+chushzy[i].liush);
		params.push('edit['+i+'].beiz='+beiz);
	}
	
	$.sdcui.ajaxUtil.ajax({
		url:"${ctPath}/anxorder/saveChushzyb.ajax",
	   	data:params.join('&'),
	 	success:function (result){
	 	if(result.error != null){
	 		alert(result.error);
	 	}else{
	 	    alert(result.result);
	 	}
	 		$('#chushzyGrid').grid('reload');
	 	}
	}); 
	*/
}
//删除
function func_button_remove(){
	//获得选中行参数
	var chushzy = $('#chushzyGrid').grid('getSelectedRecords');
	//判断是否有选中一条数据
	if(chushzy.length == 0){
		alert("${i18n.qingxzytsj}!");
		return  false;
	}
	var  params = [];
	for(var i=0;i<chushzy.length;i++){
		params.push('edit['+i+'].lingjbh='+chushzy[i].lingjbh);
		params.push('edit['+i+'].usercenter='+chushzy[i].usercenter);
		params.push('edit['+i+'].shengcxbh='+chushzy[i].shengcxbh);
		params.push('edit['+i+'].xiaohdbh='+chushzy[i].xiaohdbh);
	}
	
	if(confirm("${i18n.quedscxzdjl}!")){
	   	$.sdcui.ajaxUtil.ajax({
	    	url:"${ctPath}/anxorder/deleteChushzyb.ajax",
	 	 	data:params.join('&'),
	 	    success:function (result){
	 	    	if(result.error != null){
	 	        	alert(result.error);
	 	        	return  false;
	 	        }else{
	 	        	 alert(result.result);
	 	        }
	 	        $('#chushzyGrid').grid('reload');
	 	 	}
	    });
	}
}
//消耗点改变事件
function chushzyEdit_xiaohdbh_change() {
	/* 加IF语句,判断是增加还是修改页面,修改页面不触发change事件 modify by hzg 2015.7.15 */
 	var judgeEdit = $("#chushzyEdit_lingjbh input").attr("disabled"); 
	if(judgeEdit!='disabled'){
		var lingjbh = $("#chushzyEdit_lingjbh").fieldValue();
		var usercenter = $("#chushzyEdit_usercenter").fieldValue();
		var shengcxbh = $("#chushzyEdit_shengcxbh").fieldValue();
		var xiaohdbh = $("#chushzyEdit_xiaohdbh").fieldValue();
		var  param =[];
		param.push('usercenter='+usercenter);
		param.push('lingjbh='+lingjbh);
		param.push('shengcxbh='+shengcxbh);
		param.push('xiaohdbh='+xiaohdbh);
		
		var  paramXiaohdbh =[];
		paramXiaohdbh.push('gongyxhd='+xiaohdbh);
		
		//查询流水号
		$.sdcui.ajaxUtil.ajax({
			url:'${ctPath}/anxorder/queryLiushByXhd.ajax',//url
			data:paramXiaohdbh.join('&'),
			success:function (result){
				//设置流水号
				$("#chushzyEdit_liush").fieldValue(result.result);
				return true;
			}
		});
	}
}

	function checkRenderer(){
		return "<input name='selectXuqbcs' type='checkbox'/>";
	}
</script>

<style>
	#chushzyGrid .youi-fieldLayout table td.contral.label-col.col-0 {
		width:120px;
	}
</style>
<!--主体内容开始 ; modify by hzg 将grid的行编辑去掉-->
<t:form id="form_chushzy" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="chushzyGrid" caption="${i18n.chishzylr}" idKeys="lingjbh,usercenter,shengcxbh,xiaohdbh" showNum="true" dataFormId="form_chushzyEdit"
	src="/anxorder/queryChushzybByParam.ajax" multiple="true" load="true" remove="NOT">
	<t:fieldLayout prefix="layout">
		<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10"></t:fieldText>
		<t:fieldText property="shengcxbh" caption="${i18n.chanx}" maxLength="5"></t:fieldText>
		<t:fieldText property="xiaohdbh" caption="${i18n.xiaohd}" maxLength="9"></t:fieldText>
		<t:fieldCalendar property="startTime" caption="开始时间" format="yyyy-MM-dd" />
		<t:fieldCalendar property="endTime" caption="结束时间" format="yyyy-MM-dd" />
	</t:fieldLayout>
	<t:gridCol property="check" width="30" type="text" caption="${i18n.xuanz}" renderer="checkRenderer"></t:gridCol>
	<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="shengcxbh" caption="${i18n.chanx}"></t:gridCol>
	<t:gridCol property="xiaohdbh" caption="${i18n.xiaohd}"></t:gridCol>
	<t:gridCol property="jicdwjfl" caption="${i18n.jicdwjfl}"></t:gridCol>
	<t:gridCol  property="xianbkc" caption="${i18n.xianbkc}"></t:gridCol>
	<t:gridCol  property="liush" caption="${i18n.liush}"></t:gridCol>
	<t:gridCol  property="beiz" caption="${i18n.beiz}" ></t:gridCol>
	<t:gridCol  property="chukl" caption="出库量" ></t:gridCol>
	<t:gridCol  property="yicxhl" caption="异常消耗量" ></t:gridCol>
	<t:gridCol property="editor" caption="修改人"></t:gridCol>
	<t:gridCol property="edit_time" caption="修改时间"></t:gridCol>
	</t:grid>
</t:form>
	
<t:form dialog="true" id="form_chushzyEdit" reset="NOT" caption="${i18n.chishzylr}"  idKeys="usercenter,lingjbh,shengcxbh,xiaohdbh"
	action="/anxorder/addChushzyb.ajax">
	<t:fieldLayout prefix="chushzyEdit" id="add_chushzy">
		<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" notNull="true" maxLength="10"></t:fieldText>
		<t:fieldSelect property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}" notNull="true"></t:fieldSelect>
		<t:fieldSelect property="shengcxbh" caption="${i18n.chanx}" parents="lingjbh,usercenter" 
			src="/anxorder/queryShengcxByParam.ajax" show="shengcxbh" code="shengcxbh" notNull="true"></t:fieldSelect>
		<t:fieldSelect property="xiaohdbh" caption="${i18n.xiaohd}" parents="lingjbh,usercenter,shengcxbh" 
			src="/anxorder/queryXiaohdByParam.ajax" show="xiaohdbh" code="xiaohdbh" notNull="true"></t:fieldSelect>
		<t:fieldText property="xianbkc" caption="${i18n.xianbkc}" notNull="true" expression="^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$" expressionMessage="整数部分最大位7位，小数部分最大位3位"></t:fieldText>
		<t:fieldText property="liush" caption="${i18n.liush}" notNull="true" maxLength="9"></t:fieldText>
		<t:fieldText property="beiz" caption="${i18n.beiz}"></t:fieldText>
	</t:fieldLayout>
</t:form>

	<form id="printform" name="printform" method="post"
		style="display: none;">
		<div>
			<input type="text" id="justDoPrint" name="justDoPrint" value="" />
			<!-- 立即预览打印 -->
			<input type="text" id="billcode" name="billcode" value="" />
			<!-- 单据号（唯一标识单据，用作打印历史维护） -->
			<input type="text" id="jsondataprovider" name="jsondataprovider"
				value="" />
			<!-- 自定义封装的json字符串 -->
			<input type="text" id="selectedid" name="selectedid" value="" />
			<!-- 选择数据表格时的多选id -->
			<input type="text" id="clazzparams" name="clazzparams" value="" />
			<!-- 配置为clazz时传递的json形式参数 -->
			<input type="text" id="templatecode" name="templatecode" value="" />
			<!-- 直接预览（打印）不进行模板选择时使用 -->
		</div>
	</form>

	<t:buttons  id="buttons">
	<t:button name="print" caption="${i18n.day}"></t:button>
	<%-- <t:button name="edit" caption="${i18n.baoc}"></t:button>   单行编辑,不需要批量保存按钮 hzg 2015.7.15 --%>
	<t:button name="remove" caption="${i18n.shanc}"></t:button>
</t:buttons>		
<p>
</p>
</t:page>
</t:html>