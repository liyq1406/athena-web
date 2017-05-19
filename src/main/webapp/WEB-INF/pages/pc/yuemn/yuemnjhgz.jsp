<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>

</head>
<t:page i18n="i18n.pc.pc">
	<!--月模拟计划跟踪列表 -->
	<t:grid id="yuemnjhGrid" idKeys="usercenter" caption="${i18n.pc_yuemnjhgz_title }" scrollHeight="200"
		src="/pc/queryYuemnjh.ajax" showNum="true"  exportXls="false" add="NOT" edit="NOT" remove="NOT" load="false">
		<t:fieldLayout id="yuemnjh_select" prefix="yuemnjh">
			<t:fieldCalendar property="kaissj" format="yyyy-MM-dd" notNull="true"
				caption="${i18n.kaissj }"></t:fieldCalendar>
			<t:fieldCalendar property="jiessj" format="yyyy-MM-dd" notNull="true"
				caption="${i18n.jiessj }"></t:fieldCalendar>
			<t:fieldSelect property="chanxh" caption="${i18n.chanxh }" convert="chanxh"></t:fieldSelect>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh } " maxLength="10"></t:fieldText>
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }" defaultValue="${usercenter}"></t:fieldLabel>
			<t:fieldHidden property="chanxz"></t:fieldHidden>
			<t:fieldHidden property="shengcx" defaultValue="${shengcx}"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }"></t:gridCol>
		<t:gridCol property="chanxh" caption="${i18n.chanxh }"></t:gridCol>
		<t:gridCol property="shij" caption="${i18n.riq }"></t:gridCol>
		<t:gridCol property="lingjbh"  caption="${i18n.lingjbh }"></t:gridCol>
		<t:gridCol property="lingjsl" width="120" caption="${i18n.jihscsl }"></t:gridCol>
		<t:gridCol property="shijscsl" width="120" caption="${i18n.shijscsl }"></t:gridCol>
		<t:gridCol property="dantce"  caption="${i18n.dantce }" ></t:gridCol>
		<t:gridCol property="leijce" caption="${i18n.leijce }"></t:gridCol>
		<t:gridCol property="ywhour" caption="${i18n.ywhour }"></t:gridCol>
		<t:button caption="${i18n.report }" name="downLoad"  ></t:button>
	</t:grid>
	<script type="text/javascript">
$(document).ready(function(){
});
	$.sdcui.serverConfig.convertArray['chanxh'] =${chanxhJson};
                                                //{'UW5L1':'UW5L1','UW5L2':'UW5L2','UW5L3':'UW5L3'}
	//查询前执行方法
	function yuemnjhGrid_beforeSubmit() {
		var kaissj = $("#yuemnjh_kaissj").fieldValue();
		var jiessj = $("#yuemnjh_jiessj").fieldValue();
		var chanxh = $("#yuemnjh_chanxh").fieldValue();
			//点击报警信息时验证时间是否为空	
		if(kaissj==""||jiessj==""){
			alert("${i18n.yuemnjhgz_kaissjjiessj_null }");
			return false;
		}else{
			//验证开始时间与结束时间
			var start = new Date(kaissj.replace("-","/"));
			var end = new Date(jiessj.replace("-","/"));
			var n = end.getTime() - start.getTime();
			if(n<0){
				alert("${i18n.yuemnjhgz_jiessjMustbigkaissj }");
				return false;
			}
			var startfix = new Date(kaissj);
			var endfix = new Date(jiessj);
			var nfix = endfix.getTime() - startfix.getTime();
			if(nfix<0){
				alert("${i18n.yuemnjhgz_jiessjMustbigkaissj }");
				return false;
			}
		} 
		var chanxzString = $("#yuemnjh_chanxz").fieldValue(); 
		if(chanxzString == ""){
			alert("${i18n.yuemnjhgz_chanxz_err }");
			return false;
		}
		
		return true;
		
	}
	
	//文件 下载
	function func_button_downLoad(){
		
		if(!yuemnjhGrid_beforeSubmit()){
			return ;
		}
		
		var kaissj = $("#yuemnjh_kaissj").fieldValue();
		var jiessj = $("#yuemnjh_jiessj").fieldValue();
		var chanxh = $("#yuemnjh_chanxh").fieldValue();
		var lingjbh = $("#yuemnjh_lingjbh").fieldValue();
		
		
		
		var obj = new Object ();
		obj.kaissj = kaissj;
		obj. jiessj= jiessj;
		obj. chanxh= chanxh;
		obj. lingjbh= lingjbh;
		
		
		$.sdcui.pageUtils.goPage({
			url:'/pc/gzDownload.do',
			record:obj,
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
	}
</script>
</t:page>
</t:html>