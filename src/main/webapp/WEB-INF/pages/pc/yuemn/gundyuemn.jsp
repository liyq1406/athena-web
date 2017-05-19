<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>
<script type="text/javascript">
$(document).ready(function(){
});
	$.sdcui.serverConfig.convertArray['chanxh'] =${chanxhJson};
                                                //{'UW5L1':'UW5L1','UW5L2':'UW5L2','UW5L3':'UW5L3'}
    $.sdcui.serverConfig.convertArray['gongyzq'] =${gongyzqJson};                                            
	//查询前执行方法
	function yuemnjhGrid_beforeSubmit() {
		var chanxzString = $("#yuemnjh_chanxz").fieldValue(); 
		if(chanxzString == ""){
			alert("${i18n.gundyuemn_chanxz_err }");
			return false;
		}
		
	}
</script>
</head>
<t:page i18n="i18n.pc.pc">
	<!--滚动周期模拟计划列表 -->
	<t:grid id="yuemnjhGrid" idKeys="usercenter" caption="${i18n.pc_gundyuemn_title }" scrollHeight="230"
		src="/pc/queryGundyuemn.ajax" showNum="true"  exportXls="false" add="NOT" edit="NOT" remove="NOT" load="false" >
		<t:fieldLayout id="yuemnjh_select" prefix="yuemnjh">
			<t:fieldSelect property="chanxh" caption="${i18n.chanxh }" notNull="true" convert="chanxh" defaultValue="${chanxall}"></t:fieldSelect>
			<t:fieldSelect property="gongyzq" caption="${i18n.gongyzq }" notNull="true" convert="gongyzq" defaultValue="${gyzq}"></t:fieldSelect>
			<t:fieldHidden property="chanxz"></t:fieldHidden>
			<t:fieldHidden property="chanxall"></t:fieldHidden>
			<t:fieldHidden property="gyzq"></t:fieldHidden>
			<t:fieldHidden property="shengcx" defaultValue="${shengcx}"></t:fieldHidden>
		</t:fieldLayout>
		<t:button caption="${i18n.baojxx }" name="btnMessage"></t:button>
		<t:button caption="${i18n.cover }" name="btnCover"></t:button>
		<t:button caption="${i18n.gongstz }" name="btnGongstz"></t:button>
		
		<t:gridCol property="USERCENTER" caption="${i18n.usercenter }"></t:gridCol>
		<t:gridCol property="CHANXH" caption="${i18n.chanxh }"></t:gridCol>
		<t:gridCol property="SHIJ" caption="${i18n.riq }"></t:gridCol>
		<t:gridCol property="GUNDMNGS" width="120" caption="${i18n.gundmngs }"  ></t:gridCol>
		<t:gridCol property="HOUR" width="120" caption="${i18n.zqhour }" ></t:gridCol>
	</t:grid>
	
		<t:form  id="form_mg" dialog="true" submit="NOT" reset="NOT" width="550"  caption="${i18n.baojxinx }" >
		<t:grid src="/pc/queryMessage.ajax" id="messageGrid" 
		  idKeys="xiaox"  usePager="true" showNum="true" 
		  add="NOT" edit="NOT" remove="NOT"  load="false"
		  reset="NOT" save="NOT" submit="NOT" >
		<t:fieldLayout id="msg" prefix="messageLayout">
			<t:fieldHidden property="gongyzq"></t:fieldHidden>
			<t:fieldHidden property="chanxh"></t:fieldHidden>
			<t:fieldHidden property="chanxall"></t:fieldHidden>
			<t:fieldHidden property="shengcx" defaultValue="${shengcx}"></t:fieldHidden>
		</t:fieldLayout>
			<t:gridCol property="XIAOX" caption="${i18n.gundbjxx }" width="550"></t:gridCol>
		</t:grid>
	</t:form>	
<script type="text/javascript">	
	//报警信息
	function func_button_btnMessage() {
		var shengcx = $("#yuemnjh_shengcx").fieldValue();
		var gongyzq = $("#yuemnjh_gongyzq").fieldValue();
		var chanxh = $("#yuemnjh_chanxh").fieldValue();
		var chanxall = $("#yuemnjh_chanxall").fieldValue();
			//点击报警信息时验证时间是否为空	
		if(shengcx==""){
			alert("${i18n.gundyuemn_nullchanxz_nullmessage }");
			return;
		}
		$("#messageLayout_gongyzq").fieldValue(gongyzq);
		$("#messageLayout_chanxh").fieldValue(chanxh);
		$("#messageLayout_chanxall").fieldValue(chanxall);
		$("#form_mg").form("open");
		$("#messageGrid").grid("reload");	
	}
	
	//滚动周期模拟覆盖周期模拟
function func_button_btnCover(){
	var shengcx = $("#yuemnjh_shengcx").fieldValue(); 
	if(shengcx == ""){
		alert("${i18n.gundyuemn_nullchanxz }");
		return false;
	}
	var params = [];
	params.push("shengcx="+$("#yuemnjh_shengcx").fieldValue()+"&gongyzq="+$("#yuemnjh_gongyzq").fieldValue());
	$.sdcui.ajaxUtil.ajax({
			 url:"${ctx}/pc/queryShiFFG.ajax",
			 data:params.join("&"), 
			 success:function(results){
				if(results.pcCount==0){
					alert("${i18n.gundyuemn_notcover }");
					return;
				} 
			if(confirm("${i18n.gundyuemn_whether_cover }")){
				$.sdcui.ajaxUtil.ajax({
	      		url:"${ctx}/pc/gundCover.ajax",
	      		data:params.join("&"),  
          		success:function (result){
					if(result.count>0){
						alert("${i18n.gundyuemn_cover_success }");
					}else{
						alert("${i18n.gundyuemn_cover_fail }");
					}
	       		}
			 });
			}
		 }
  	});
}

 //跳转到工时调整页面 hzg 2012-6-20
            function func_button_btnGongstz()
    	    { 
            	var gongyzq = $('#yuemnjh_gongyzq').fieldValue();
            	if(gongyzq==null || gongyzq==''){
            		alert("${i18n.gundyuemn_null_gongyzq }");
            		return;
            	}
            	var params = [];
            	params.push("gongyzq="+gongyzq);
            	$.sdcui.pageUtils.goPage({
        			url:'/pc/toPageGongstzGun.do?gongyzq='+gongyzq+"&biaos=G",
        			record:params.join("&"),
        			mode:'form',
        			beforeSubmit:function(){
        				return true;
        			}
            	});
    	    } 	

</script>	
</t:page>
</t:html>