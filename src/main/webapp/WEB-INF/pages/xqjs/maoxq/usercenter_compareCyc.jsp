<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcxbj}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
			<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.maoxq.compareMaoxqCyc">

	<t:form id="form_maoxqCyc" submit="NOT" reset="NOT">
		
	       <t:grid id="grid_compareCenterCyc"  caption="${i18n.zqmxq}"    
			src="/maoxq/compareQr.ajax"  idKeys="id,xuqbc,usercenter,lingjbh,editor,edit_time"   showNum="true"  remove="NOT"  edit="NOT"  add="NOT"
			usePager="true"   save="NOT"  load="true"    scrollHeight="400" back="NOT" pageSize="20">
			  <t:button caption="${i18n.dc}" name="expxls" active="3"></t:button>
	       
	        <t:button caption="${i18n.button_compareCyc_send}" name="compareCyc_send" active="3"></t:button> 
			 
	        <t:fieldLayout id="layout" prefix="record"  columns="3">
		                  <t:fieldSelect property="usercenter"  caption="${i18n.usercenter}"  convert="queryUserCenterMap" width="150"></t:fieldSelect>
		                  <t:fieldSelect  property="jihyz"   caption="${i18n.jihyz}" width="150" convert="getJihz"></t:fieldSelect>
		                  <t:fieldText   property="lingjbh" caption="${i18n.lingjbh}" expression='^[A-Z0-9]{10}$' expressionMessage='10位的字母和数字' width="150" maxLength="10"></t:fieldText>
		                  <t:fieldHidden property="xuqbc" ></t:fieldHidden>
		                  <t:fieldHidden property="xuqbc1"></t:fieldHidden>
		                  <t:fieldHidden property="xuqlx" ></t:fieldHidden>
		                  <t:fieldHidden property="xsfs"></t:fieldHidden>
		                  <t:fieldHidden property="mode"></t:fieldHidden>
		                  <t:fieldHidden property="usercenter_login" defaultValue="${usercenter}" /> 
			</t:fieldLayout>
				<div style=" font-size: 15px; line-height: 50px;">
				<div align="left" >P0:${kaisrq}</div>
			</div>
			<t:gridCol property="usercenter" type="text" caption="${i18n.usercenter}"></t:gridCol>
			<t:gridCol property="lingjbh"    type="text" caption="${i18n.lingjbh}"></t:gridCol>
			
			
			<!-- XSS V4_008 -->
			<t:gridCol  property="gongysbh"   width="100"  type="text" caption="${i18n.gongysdm}"   ></t:gridCol>
			<t:gridCol  property="gongysmc"   width="170" type="text" caption="${i18n.gongysmc}"   ></t:gridCol>
			<t:gridCol  property="gcbh"       width="100"  type="text" caption="${i18n.chengysdm}"   ></t:gridCol>
			<t:gridCol  property="chengysmc"  width="130"   type="text" caption="${i18n.chengysmc}"   ></t:gridCol>
			 
			<t:gridCol property="p0Cyc1"     type="text" caption="P0" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p0Cyc2"     type="text" caption="P0" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p0Margin"   type="text" caption="P0${i18n.ce}" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p1Cyc1"     type="text" caption="P1" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p1Cyc2"     type="text" caption="P1" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p1Margin"   type="text" caption="P1${i18n.ce}" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p2Cyc1"     type="text" caption="P2" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p2Cyc2"     type="text" caption="P2" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p2Margin"   type="text" caption="P2${i18n.ce}" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p3Cyc1"     type="text" caption="P3" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p3Cyc2"     type="text" caption="P3" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p3Margin"   type="text" caption="P3${i18n.ce}" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p4Cyc1"     type="text" caption="P4" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p4Cyc2"     type="text" caption="P4" renderer="merginCss"></t:gridCol>
			<t:gridCol property="p4Margin"   type="text" caption="P4${i18n.ce}" renderer="merginCss"></t:gridCol>
			<t:gridCol property="lingjmc"    type="text" caption="${i18n.lingjmc}" ></t:gridCol>
			<t:gridCol property="danw"       type="text" caption="${i18n.danw}"></t:gridCol>
			<t:gridCol property="jihyz"      type="text" caption="${i18n.jihyz}"></t:gridCol>
			<t:gridCol property="zhizlx"     type="text" caption="${i18n.zhizlx}"></t:gridCol>
		</t:grid>
			    
	     
	</t:form>
     <input id="removeId" value="${removeId}" type="hidden"/>  
	</t:page>
	<script type="text/javascript">
     //返回
	/*	function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		} */
	    function merginCss(col,value,  rowIndex,colIndex){
	        var obj = this;
	        var property = this.property;
	        var margin;
	        if(property.indexOf("Margin")!=-1){
	           margin = value[property];
	        }else{
	           var att = property.substring(0,2)+"Margin";
	           margin = value[att];
	        }
	        
	        var showValue = value[property];
	        if(margin!=""){
	            var index = margin.indexOf("%");
	            var bfb = margin.substring(0,index);
	            if(bfb>0||bfb<0){
	               return "<span style=\"color: red;\">"+showValue+"</span>";
	            }
	        }
	        return "<span >"+showValue+"</span>";
	}
	    
		function func_grid_expxls(){
		        var red = $("#grid_compareCenterCyc").grid("getRecords");
		        if(red.length==0){
		           alert("${i18n.dcdatanotnull}");
		            return false;
		        }
				var usercenter = $('#record_usercenter').fieldValue();
				var jihyz =  $('#record_jihyz').fieldValue();
				var lingjbh = $('#record_lingjbh').fieldValue();
				var xuqbc = $('#record_xuqbc').fieldValue();
				var xuqbc1 = $('#record_xuqbc1').fieldValue();
				var xuqlx = $('#record_xuqlx').fieldValue(); 
				var xsfs = $('#record_xsfs').fieldValue(); 
				var mode = $('#record_mode').fieldValue(); 
				$.sdcui.pageUtils.goPage({
					url:'/maoxq/downLoadFileCompare.do?usercenter='+usercenter+'&jihyz='+jihyz+'&lingjbh='+lingjbh+'&xuqbc='+xuqbc+'&xuqbc1='+xuqbc1+'&xuqlx='+xuqlx+'&xsfs='+xsfs+'&mode='+mode,//url
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
			}
			
	 <!--  xss V4_008-->		
	function func_button_compareCyc_send() {//导出到外部系统
		        var red = $("#grid_compareCenterCyc").grid("getRecords");
		        if(red.length==0){
		           alert("${i18n.dcdatanotnull}");
		            return false;
		        }
				var usercenter = $('#record_usercenter').fieldValue();
				var jihyz =  $('#record_jihyz').fieldValue();
				var lingjbh = $('#record_lingjbh').fieldValue();
				var xuqbc = $('#record_xuqbc').fieldValue();
				var xuqbc1 = $('#record_xuqbc1').fieldValue();
				var xuqlx = $('#record_xuqlx').fieldValue(); 
				var xsfs = $('#record_xsfs').fieldValue(); 
				var mode = $('#record_mode').fieldValue(); 
				
				var biaos = "1";//插入数据库标识
				
				var params = [];
				
				var usercenter_login = $('#record_usercenter_login').fieldValue();
				params.push("xuqbc="+xuqbc);
				params.push("xuqbc1="+xuqbc1);		
				params.push("xsfs="+xsfs);
						
				//如果否存在相同的版次 和基准版次      ，并且已经发送则不允许再次发送 
				$.sdcui.ajaxUtil.ajax({
					url : '${ctx}/maoxq/maoxqSffs.ajax',
					data : params.join('&'),
					success : function(result) {
							if (result.flag != null) {
								alert(result.flag);
								return false;
							}else{  
							    $.sdcui.pageUtils.goPage({
								url:'/maoxq/SendComparePage.do?usercenter='+usercenter+'&jihyz='+jihyz+'&lingjbh='+lingjbh+'&xuqbc='+xuqbc+'&xuqbc1='+xuqbc1+'&xuqlx='+xuqlx+'&xsfs='+xsfs+'&mode='+mode+'&biaos='+biaos+'&usercenter_login='+usercenter_login,//url
								mode:'form',
									beforeSubmit:function(){ 
									 	alert("导出数据中！请稍等！");	
										return true;
									}
								});	 
							} 
					}
				});
	}		
	
	</script>
	<style type="text/css">
	
	</style>
</t:html>