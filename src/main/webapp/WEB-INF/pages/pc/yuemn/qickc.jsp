<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_qickc_title }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.pc.pc" >
		<t:grid id="qickcGrid" idKeys="usercenter" caption="${i18n.pc_qickc_title }" 
		src="/pc/querySGQickcAll.ajax" submit="NOT" reset="NOT" add="NOT" remove="NOT" edit="NOT" usePager="true" showNum="true" >
		<t:fieldLayout  id="sq_select" prefix="gongstz">
		        <t:fieldHidden property="gongyzq"  defaultValue="${gongyzq}"></t:fieldHidden> 
		        <t:fieldHidden property="biaos"  defaultValue="${biaos}"></t:fieldHidden> 
		</t:fieldLayout>
		<t:gridCol   property="usercenter"  caption="${i18n.usercenter } "></t:gridCol>
		<t:gridCol   property="lingjbh"   caption="${i18n.lingjbh } "></t:gridCol>
		<t:gridCol   property="shij"   caption="${i18n.riq }"></t:gridCol>
		<t:gridCol   property="lingjsl"    caption="${i18n.paicl }  "></t:gridCol>
		<t:gridCol   property="maoxq"   caption="${i18n.xuql } "></t:gridCol>
		<t:gridCol   property="qickc"   caption="${i18n.qickc } "></t:gridCol>
		<t:button caption="${i18n.quer }" name="btnConfirm"></t:button>
		<t:button caption="${i18n.btnBack }" name="btnBack"></t:button>
		</t:grid>
			<script type="text/javascript">
		//确认调整
		function func_button_btnConfirm(){
			//alert($("#gongstz_gongyzq").fieldValue()+" biaos->"+$("#gongstz_biaos").fieldValue());
			//alert("确认调整");
			if(confirm("${i18n.qickc_whether_tiaoz }")){
				var params = [];
				var biaos = $("#gongstz_biaos").fieldValue();
				params.push("gongyzq="+$("#gongstz_gongyzq").fieldValue());
				params.push("biaos="+biaos);
				$.sdcui.ajaxUtil.ajax({
		 	 	        url:"${ctx}/pc/confirmTiaoz.ajax",
		 	 	        data:params.join("&"), 
		 	            success:function (result){
		 	            	alert("${i18n.qickc_sure_finish }");
		 	            	if(biaos=='Y'){
		 	            		window.location.href="${ctx}/pc/yuemn.do";	
		 	            	}else if(biaos=='G'){
		 	            		window.location.href="${ctx}/pc/gundyuemn.do";
		 	            	}
		 	            	
		 	            }
					 });
			}
			
			
		}
		//返回
		function func_button_btnBack(){
			window.history.back();
		}
	
	</script>	
	</t:page >
</t:html>