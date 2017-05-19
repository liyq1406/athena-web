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
	<t:grid id="grid_chongsuan" caption="运费手工重算" 
	idKeys="usercenter" 
	back="NOT" 
	remove="NOT" 
	scrollHeight="500" 
	pageSize="25"
	src="/qhysfy/queryRukmx.ajax" 
	load="true" 
	showNum="true" 
	editable="true" 
	saveRowsSrcs="../qhysfy/updateRukmxBaoz.ajax"
	  	afterSaveRowsEvent="afterSaveRows"
	        showEditorAddName="editorAdd" 
			showEditorRemoveName="editorRemove"
>
		
		<t:fieldLayout   prefix="record_chongsuan" columns="4">
			<t:fieldSelect readonly="true" property="usercenter" caption="用户中心" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			
		    <t:fieldText property="gongysdm" caption="供应商代码"  maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码"  maxLength="10" minLength="10" width="110" />
	
			<t:fieldText property="lingjbh" caption="零件编号"  width="150"/>
			<t:fieldText property="baozxh" caption="包装型号"   width="150"/>
	         <t:fieldSelect property="lingjlx" caption="零件类型"  convert="lingjlx" width="150"/>
				<t:fieldSelect property="lxjlb" caption="零星件类型" src="/qhysfy/queryPostLxjlb.ajax" parents="lingjlx" code="key"   show="value" width="150"/>
			<t:fieldCalendar property="qisruksj" format="yyyy-MM-dd" caption="入库日期" width="130" ></t:fieldCalendar>
			<t:fieldCalendar property="jisruksj" format="yyyy-MM-dd" caption="至" width="130" ></t:fieldCalendar>
			
			<t:fieldHidden property="danjh" defaultValue="${danjh}"></t:fieldHidden>
			<t:fieldHidden property="danjlx" defaultValue="${danjlx}"> </t:fieldHidden>
		</t:fieldLayout>
		

		<t:button caption="重算" name="chongsuan" active="0"  />
		    <t:button caption="导出" name="download" active="0"/>	
		
		<t:gridCol   property="usercenter" caption="用户中心"  convert="queryUserCenterMap" width="70"></t:gridCol>
		<t:gridCol  property="chengysdm" caption="承运商代码"   width="80" ></t:gridCol>
		<t:gridCol property="gongysdm" caption="供应商代码" width="80" ></t:gridCol>
		<t:gridCol   property="lingjbh" caption="零件编号"  convert="danjlx"  width="80" ></t:gridCol>
		<t:gridCol property="baozxh" caption="包装型号" editor="fieldText" width="70" 
		           editorOptions="{'maxLength':'5','dataType':'text','notNull':true}"/>
		<t:gridCol property="ybaozxh" caption="原包装型号"  width="70"  ></t:gridCol>
		<t:gridCol  property="baozrl" caption="包装容量"  editor="fieldText" width="70" editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$','expressionMessage':'包装容量只能输入大于0-9999999999.999的整数或小数','notNull':true}"></t:gridCol>
		<t:gridCol property="ybaozrl" caption="原包装容量"  width="70"  ></t:gridCol>
		<t:gridCol  property="lingjlx" caption="零件类型"  convert="lingjlx"  width="70" ></t:gridCol>
		<t:gridCol property="lxjlb" caption="零星件类型"  convert="queryLxjlb" />
		<t:gridCol property="danjlx" caption="单据类型"  convert="danjlx" defaultValue="1" width="70"/>	
		<t:gridCol  property="xinljdj" caption="零件单价"  width="70" ></t:gridCol>
		<t:gridCol  property="lingjdj" caption="原零件单价"  width="70" ></t:gridCol>
		<t:gridCol  property="lingjsl" caption="零件数量"  width="70" ></t:gridCol>
		<t:gridCol  property="xinysfy" caption="运输费用"  width="70" ></t:gridCol>
		<t:gridCol  property="yunsfy" caption="原运输费用"  width="70" ></t:gridCol>
		<t:gridCol  property="xinlfmdj" caption="立方米单价"  width="80" ></t:gridCol>	
		<t:gridCol  property="lifmdj" caption="原立方米单价"  width="80" ></t:gridCol>	
		<t:gridCol property="xinfkfy" caption="返空费用" width="70"/>
		<t:gridCol property="fankfy" caption="原返空费用" width="70"/>
		<t:gridCol property="xintpfy" caption="托盘费用" width="70"/>
		<t:gridCol property="tuopfy" caption="原托盘费用" width="70"/>
		<t:gridCol  property="xintpfkfy" caption="托盘返空费用"  width="90" ></t:gridCol>	
		<t:gridCol  property="tuopfkfy" caption="原托盘返空费用"  width="90" ></t:gridCol>	
		<t:gridCol property="baozgs" caption="包装个数" width="70"/>
		<t:gridCol  hidden="true"  type="text" property="ybaozxh" caption="原包装型号" ></t:gridCol>
		<t:gridCol  hidden="true"  type="text" property="ybaozrl" caption="原包装容量" ></t:gridCol>
		<t:gridCol  property="ruksj" caption="入库时间"  width="90" ></t:gridCol>
	<t:gridCol   hidden="true"  property="danjh" caption="" width="0" />
				<t:gridCol property="" caption=""/>
			
	</t:grid>	
	

	<input id="removeId" value="${removeId}" type="hidden"/>  
</t:page>

<script type="text/javascript">




//单据类型
$.sdcui.serverConfig.convertArray['danjlx'] = {

	'1' : '正常件',
	'2' : '紧急件'
};


$.sdcui.serverConfig.convertArray['lingjlx'] = {

		'1' : '正常件',
		'2' : '紧急件',
		'3' : '零星件'
	};


//行编辑保存后的方法
function afterSaveRows(result){
	if(false == result.success){
		return false;
	}
	$('#grid_chongsuan').grid('reload');
	return true;
}

//提交创建或者修改form
function func_button_tijiao(){
	$('#form_danjmc').form('submit');				
}	

function func_button_chongsuan(){
	 var params = [];

		 params.push("usercenter="+$("#record_chongsuan_usercenter").fieldValue());
		 params.push("danjh="+$("#record_chongsuan_danjh").fieldValue());
		 params.push("danjlx="+$("#record_chongsuan_danjlx").fieldValue());
		 params.push("banch="+'${banch}');

	 if(confirm("你确定要重算吗?")){
		 $.sdcui.ajaxUtil.ajax({
				url:'../qhysfy/chongsuan.ajax',
				data:params.join('&'),
				success:function(result){
						if(result.result.message=="成功"){
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
}


//导出数据
function func_button_download(){
	var usercenter = trim($('#record_chongsuan_usercenter').fieldValue());
	var gongysdm = trim($('#record_chongsuan_gongysdm').fieldValue());
	var chengysdm = trim($("#record_chongsuan_chengysdm").fieldValue());
	var lingjbh = trim($('#record_chongsuan_lingjbh').fieldValue());
	var baozxh = $('#record_chongsuan_baozxh').fieldValue();
	var lingjlx = $('#record_chongsuan_lingjlx').fieldValue();
	var qisruksj = $('#record_chongsuan_qisruksj').fieldValue();
	var jisruksj = $('#record_chongsuan_jisruksj').fieldValue();
	var danjh = $('#record_chongsuan_danjh').fieldValue();
	var shenhzt = $('#record_chongsuan_shenhzt').fieldValue();
	var danjlx = $('#record_chongsuan_danjlx').fieldValue();
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