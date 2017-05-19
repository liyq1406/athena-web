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
	<t:grid id="grid_chongsuanjij" caption="运费手工重算" 
	idKeys="usercenter" 
	back="NOT" 
	remove="NOT" 
	scrollHeight="500" 
	pageSize="25"
	src="/qhysfy/queryRukmx.ajax" 
	load="true" 
	showNum="true" 
	editable="true" 
    saveRowsSrcs="../qhysfy/chongsuanupdateRukmxJinjj.ajax"
      	afterSaveRowsEvent="afterSaveRows"
	        showEditorAddName="editorAdd" 
			showEditorRemoveName="editorRemove"
>
		
		<t:fieldLayout   prefix="record_chongsuan" columns="4">
			<t:fieldSelect readonly="true" property="usercenter" caption="用户中心" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			
		    <t:fieldText property="gongysdm" caption="供应商代码"  maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码"  maxLength="10" minLength="10" width="110" />

			<t:fieldSelect property="lingjlx" caption="零件类型"  convert="lingjlx" width="150"/>
			<t:fieldCalendar property="qisruksj" format="yyyy-MM-dd" caption="入库日期" width="130" ></t:fieldCalendar>
			<t:fieldCalendar property="jisruksj" format="yyyy-MM-dd" caption="至" width="130" ></t:fieldCalendar>
			
			<t:fieldHidden property="danjh" defaultValue="${danjh}"></t:fieldHidden>
			<t:fieldHidden property="danjlx" defaultValue="${danjlx}"> </t:fieldHidden>
		</t:fieldLayout>
		
	  
		<t:button caption="重算" name="chongsuan" active="0"  />
	  <t:button caption="导出" name="download" active="0"/>	
		
		<t:gridCol   property="usercenter" caption="用户中心"  convert="queryUserCenterMap" ></t:gridCol>
		<t:gridCol  property="chengysdm" caption="承运商代码"   width="90" ></t:gridCol>
		<t:gridCol property="gongysdm" caption="供应商代码" width="90" ></t:gridCol>
		<t:gridCol  property="lingjlx" caption="零件类型"  convert="lingjlx"  width="90" ></t:gridCol>
		<t:gridCol property="danjlx" caption="单据类型"  convert="danjlx" defaultValue="1" />	
		<t:gridCol  property="xinljdj" caption="趟次单价"  width="120" ></t:gridCol>
		<t:gridCol  property="lingjdj" caption="原趟次单价"  width="120" ></t:gridCol>
		<t:gridCol  property="lingjsl" editor="fieldText" caption="趟次"  width="70" 
		   editorOptions="{'expression':'^(0|[1-9][0-9]{0,8})$','expressionMessage':'只能输入0-999999999之间的整数值','notNull':true}"></t:gridCol>
		<t:gridCol  property="ytangc" caption="原趟次"  width="120" ></t:gridCol>
		<t:gridCol  property="xinysfy" caption="运输费用"  width="120" ></t:gridCol>
		<t:gridCol  property="jinjfy" caption="原运输费用"  width="120" ></t:gridCol>
		<t:gridCol  property="ruksj" caption="入库时间"  width="120" ></t:gridCol>
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
	$('#grid_chongsuanjij').grid('reload');
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