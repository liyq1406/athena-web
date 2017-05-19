<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.lbjdbsqd}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	           
	       });
		</script>
	</head>
<t:page i18n="i18n.xqjs.diaobl.diaoblquery">
 <t:form id="diaobl_edit"  reset="NOT" submit="NOT">
    <table align="center"  width="100%">
		 <tr >
		     <td  align="center"  colspan="2">${i18n.lbjdbsqd}${diaobsqdh}</td>
		 </tr>
		       
		 <tr>
		     <td  align="center" >${i18n.sj}:${diaobsqsj}</td>
		     <td  align="center" id="showbanc">${i18n.banc}:${banc}</td>
		 </tr>
		 
		 <tr>
			 <td  colspan="2">
				<t:grid id="grid_diaobsq" idKeys="usercenter,diaobsqdh,lux,lingjbh,editor,edit_time" caption="${i18n.diaoblsq}"  
				  showNum="true" scrollHeight="440" pageSize="20"
				  add="NOT"  edit="NOT"  remove="NOT"   
				  dataFormId="form_sqedit"   insertAlias="diaobsqmxs"  editAlias="diaobsqmxs"
				  src="/dfpvdiaobl/searchsqmx.ajax"   usePager="true"  >
					<t:fieldLayout  id="layout" prefix="dbsq">
						<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="20" width="150"></t:fieldText>
						<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt1}" convert="queryDblZZzt" width="150"></t:fieldSelect>
			            <t:fieldHidden property="usercenter" ></t:fieldHidden>
			            <t:fieldHidden property="diaobsqdh" ></t:fieldHidden>
			             </t:fieldLayout>
					<t:gridCol  property="lux" type="text" caption="${i18n.lux}"></t:gridCol>
					<t:gridCol  property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
					<t:gridCol  property="lingjmc" type="text" caption="${i18n.lingjmc}"></t:gridCol>
					<t:gridCol  editor="fieldText"  property="shenbsl" type="text" caption="${i18n.shenbsl}"></t:gridCol>
					<t:gridCol  property="shipsl" type="text" caption="${i18n.shipsl}"></t:gridCol>
					<t:gridCol  editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd'}" property="yaohsj" type="text" caption="${i18n.yaohsj}"></t:gridCol>
					<t:gridCol property="zhuangt" caption="${i18n.zhuangt}"  convert="queryDblzt"></t:gridCol>
					<t:gridCol  property="jihy" type="text"  caption="${i18n.jihy}"></t:gridCol>
				</t:grid>
			</td>
		</tr>
	</table>
</t:form>
                     <t:buttons  id="dbsq">
                              <t:button  name="print" caption="${i18n.print}" ></t:button>
                     </t:buttons>
        <input id="usercenter" type="hidden" value="${usercenter}"> 
		<input id="diaobsqdh" type="hidden" value="${diaobsqdh }"> 
		<input id="diaobsqsj" type="hidden" value="${diaobsqsj }">
		<input id="banc" type="hidden" value="${banc}">
		<form id="printform" name="printform" method="post"  style="display: none;">
			<div>
				<input type="text"  id="justDoPrint" name="justDoPrint" value=""/><!-- 立即预览打印 -->
				<input type="text" id="billcode" name="billcode" value=""/><!-- 单据号（唯一标识单据，用作打印历史维护） -->
				<input type="text" id="jsondataprovider" name="jsondataprovider" value=""/><!-- 自定义封装的json字符串 -->		
				<input type="text" id="selectedid" name="selectedid" value=""/><!-- 选择数据表格时的多选id -->
				<input type="text" id="clazzparams" name="clazzparams" value=""/><!-- 配置为clazz时传递的json形式参数 -->	
				<input type="text" id="templatecode" name="templatecode" value=""/><!-- 直接预览（打印）不进行模板选择时使用 -->
			</div>
		</form>	
			<input id="removeId" value="${removeId}" type="hidden"/>  
</t:page>
	<script type="text/javascript">
	
	 //用户中心
	var usercenter = $("#usercenter").val();
	
	//调拨申请单号
	 var   diaobsqdh = $("#diaobsqdh").val(); 
	 
	 //调拨申请时间
	 var  diaobsqsj = $("#diaobsqsj").val();
	 
	 
	 
	 
   function  func_button_print(){
		/* var obj ={};
		obj.usercenter = usercenter;
		obj.diaobsqdh  = diaobsqdh;
		obj.diaobsqsj = diaobsqsj; */
		var  usercenter = $("#usercenter").val();
		var  diaobsqdh = $("#diaobsqdh").val(); 
		var  diaobsqsj = $("#diaobsqsj").val(); 
		var param = [];

        param.push('sq[0].usercenter='+usercenter);
        param.push('sq[0].diaobsqdh='+diaobsqdh);
        param.push('sq[0].diaobsqsj='+diaobsqsj);

         //a1=111&a2=999
		$.sdcui.ajaxUtil.ajax({
			url:"print.ajax",
	 		data:param.join('&'),
			success:function (result){
				var jsondata = result.json;
				print(jsondata);
			}
		});
	 
	}  
	
		function  print(jsondata){
			    var templatecode = "DIAOBSQ";
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
				fm.action = "${ctx}/webprint/print_doit.jsp";
				fm.target = "_blank";
				fm.submit();	
		    }
	</script>
	<style type="text/css"></style>
</t:html>