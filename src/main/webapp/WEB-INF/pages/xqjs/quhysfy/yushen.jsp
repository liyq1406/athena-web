<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.title}">

<!-- 
	
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
	<t:grid id="grid_yunsfyhz" caption="取货运费预审" 
	idKeys="usercenter" 
	back="NOT" 
	remove="NOT" 
	scrollHeight="500" 
	pageSize="25"
	src="/qhysfy/queryRukmx.ajax" 
	load="true" 
	showNum="true" 
	add="NOT"
	edit="NOT"
>
		
		<t:fieldLayout   prefix="record_yushen" columns="4">
			<t:fieldSelect readonly="true" property="usercenter" caption="用户中心"  notNull="true" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="gongysdm" caption="供应商代码"  maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码"  maxLength="10" minLength="10" width="110" />
			<t:fieldText property="lingjbh" caption="零件编号"  width="150"/>
			<t:fieldSelect property="danjlx" caption="单据类型" defaultValue="1" notNull="true" convert="danjlx"   width="150" />

			<t:fieldText property="baozxh" caption="包装型号"   width="150"/>
			<t:fieldCalendar  property="qisruksj" format="yyyy-MM-dd" caption="入库日期" width="130" ></t:fieldCalendar>
			<t:fieldCalendar property="jisruksj" format="yyyy-MM-dd" caption="至" width="130" ></t:fieldCalendar>
				<t:fieldSelect property="lingjlx" caption="零件类型"  convert="lingjlx" width="150"/>
				<t:fieldSelect property="lxjlb" caption="零星件类型" src="/qhysfy/queryPostLxjlb.ajax" parents="lingjlx" code="key"   show="value" width="150"/>
			<t:fieldHidden property="shenhzt"  defaultValue="1" ></t:fieldHidden>
			<t:fieldHidden property="biaos"  defaultValue="1" ></t:fieldHidden>
			<t:fieldHidden property="jiszt"  defaultValue="1" ></t:fieldHidden>
		</t:fieldLayout>
		
		<t:button caption="预审" name="save" active="0"/>
		    <t:button caption="导出" name="download" active="0"/>	
		
		<t:gridCol   property="usercenter" caption="用户中心"  convert="queryUserCenterMap" ></t:gridCol>
		<t:gridCol  property="chengysdm" caption="承运商代码"   width="90" ></t:gridCol>
		<t:gridCol property="gongysdm" caption="供应商代码" width="90" ></t:gridCol>

		<c:if test="${danjlx!='2'}">
		<t:gridCol   property="lingjbh" caption="零件编号"  convert="danjlx"  width="90" ></t:gridCol>
		<t:gridCol  property="baozxh" caption="包装型号"  width="70" ></t:gridCol>
		<t:gridCol  property="baozrl" caption="包装容量"  width="70" ></t:gridCol>
		</c:if>
		<t:gridCol  property="lingjlx" caption="零件类型"    convert="lingjlx" width="70" ></t:gridCol>
		<t:gridCol property="danjlx" caption="单据类型"  convert="danjlx" defaultValue="1" />
		<t:gridCol property="lxjlb" caption="零星件类型"  convert="queryLxjlb" />
		<t:gridCol  property="xinljdj" caption="零件单价/趟次单价"  width="130" ></t:gridCol>
		<t:gridCol  property="lingjsl" caption="零件数量/趟次"  width="110" ></t:gridCol>
		<t:gridCol  property="xinysfy" caption="运输费用"  width="70" ></t:gridCol>
		<t:gridCol  property="xinlfmdj" caption="立方米单价"  width="70" ></t:gridCol>	
		<t:gridCol property="xinfkfy" caption="返空费用" width="90"/>
		<t:gridCol property="xintpfy" caption="托盘费用" width="90"/>
		<t:gridCol  property="xintpfkfy" caption="托盘返空费用"  width="90" ></t:gridCol>	
		<t:gridCol property="baozgs" caption="包装个数" width="90"/>
		<t:gridCol  property="ruksj" caption="入库时间"  width="130" ></t:gridCol>
		<t:gridCol property="" caption=""/>
	</t:grid>	
	
 		<t:form caption="保存" dialog="true" id="form_danjmc" action=""  width="300" reset="NOT" submit="NOT">

	<div style="text-align: center; color: red; height: 60px;">单据名称<input  id="danjmc" type="text"></div>
		
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

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

function func_button_save() {
	var qisruksj=trim($("#record_yushen_qisruksj").fieldValue());
	var jisruksj=trim($("#record_yushen_jisruksj").fieldValue());
	if(qisruksj=="" || jisruksj==""){
		alert("入库日期段不能为空");
		return;
	}
	var now=getNowFormatDate();
	if(!compareDate(jisruksj,now)){
		alert("入库日期结束时间必须小于系统当前时间");
		return;
	}
	if(!compareDate(qisruksj,jisruksj)){
		if(qisruksj!=jisruksj){
		alert("开始入库日期必须小于结束入库日期");
		return;
		}
	}

	$('#form_danjmc').form("clear");//清除弹出窗口的数据
	$("#form_danjmc").form("open");
	
	$("#danjmc").val('');
}


//提交创建或者修改form
function func_button_tijiao(){
			
	if(trim($("#danjmc").val())==""){
		alert("单据名称不能为空");
		return;
	}
	if($("#danjmc").val().length>20){
		alert("单据名长度不能大于20");
		return;
	}
	 var params = [];
	 
	 params.push("danjmc="+trim($("#danjmc").val()));
	 params.push("usercenter="+$("#record_yushen_usercenter").fieldValue());
//	 params.push("gongysdm="+$("#record_yushen_gongysdm").fieldValue());
//	 params.push("chengysdm="+$("#record_yushen_chengysdm").fieldValue());
//	 params.push("lingjbh="+$("#record_yushen_lingjbh").fieldValue());
//	 params.push("baozxh="+$("#record_yushen_baozxh").fieldValue());
	 params.push("qisruksj="+$("#record_yushen_qisruksj").fieldValue());
	 params.push("jisruksj="+$("#record_yushen_jisruksj").fieldValue());
	 params.push("danjlx="+$("#record_yushen_danjlx").fieldValue());
	 params.push("jiszt="+$("#record_yushen_jiszt").fieldValue());
	 $.sdcui.ajaxUtil.ajax({
			url : '../qhysfy/saveyushen.ajax',
			data:params.join('&'),
			success:function(result){
				if(typeof result.success=="undefined"||result.success!==false){
					$.sdcui.pageUtils.goPage({
						url : '../qhysfy/quhysfy.do',
						mode : 'form',
						beforeSubmit : function(){
							return true;
						}
				   });
				}
			}
	   });
}	

//导出数据
function func_button_download(){
	var usercenter = trim($('#record_yushen_usercenter').fieldValue());
	var gongysdm = trim($('#record_yushen_gongysdm').fieldValue());
	var chengysdm = trim($("#record_yushen_chengysdm").fieldValue());
	var lingjbh = trim($('#record_yushen_lingjbh').fieldValue());
	var baozxh = $('#record_yushen_baozxh').fieldValue();
	var lingjlx = $('#record_yushen_lingjlx').fieldValue();
	var qisruksj = $('#record_yushen_qisruksj').fieldValue();
	var jisruksj = $('#record_yushen_jisruksj').fieldValue();
	var danjh = $('#record_yushen_danjh').fieldValue();
	var shenhzt = $('#record_yushen_shenhzt').fieldValue();
	var danjlx = $('#record_yushen_danjlx').fieldValue();
	var record = {'usercenter':usercenter,'gongysdm':gongysdm,'chengysdm':chengysdm,'lingjbh':lingjbh,'baozxh':baozxh,'lingjlx':lingjlx,'qisruksj':qisruksj,'jisruksj':jisruksj,'danjh':danjh,'shenhzt':shenhzt,'danjlx':danjlx};
	$.sdcui.pageUtils.goPage({
		url : '../qhysfy/downloadYunsfyhz.do',
		record : record,
		mode : 'form',
		beforeSubmit : function(){
			return true;
		}
   });
}
</script>

</t:html>