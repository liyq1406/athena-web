<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.bj}" >
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
	<t:page i18n="i18n.xqjs.ppl.pplbjjs">
	<t:grid id="grid_niandppl" caption="${i18n.ygbj}" showNum="true" scrollHeight="230"
	src="/ppl/bjJMx.ajax" add="NOT" edit="NOT" remove="NOT" submit="NOT" reset="NOT" exportXls="true">
		
	<t:fieldLayout  id="layout" prefix="record" >
		<t:fieldHidden property="pplbc1"></t:fieldHidden>
		<t:fieldHidden property="pplbc2"></t:fieldHidden>
	</t:fieldLayout>
		
	<t:button caption="${i18n.button_comparePpl_send}" name="comparePpl_send" active="3"></t:button> 
		
	<t:gridCol property="usercenter" caption="${i18n.yhzx}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.ljbh}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol property="fawmc" caption="${i18n.fawljmc}"></t:gridCol>
	<t:gridCol property="gongys" caption="${i18n.gys}"></t:gridCol>
	
	<t:gridCol property="zhizlx" caption="${i18n.zzlx}"></t:gridCol>
	<t:gridCol property="lingjdw" caption="${i18n.ljdw}"></t:gridCol>
	<t:gridCol property="p1sl1" caption="${i18n.yy}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p1sl2" caption="${i18n.yy}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p1" caption="${i18n.yyce}"   renderer="merginCss"></t:gridCol>
	<t:gridCol property="p2sl1" caption="${i18n.ey}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p2sl2" caption="${i18n.ey}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p2" caption="${i18n.eyce}"   renderer="merginCss"></t:gridCol>
	<t:gridCol property="p3sl1" caption="${i18n.sy}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p3sl2" caption="${i18n.sy}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p3" caption="${i18n.syce}"   renderer="merginCss"></t:gridCol>
	<t:gridCol property="p4sl1" caption="${i18n.siy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p4sl2" caption="${i18n.siy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p4" caption="${i18n.siyce}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p5sl1" caption="${i18n.wuy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p5sl2" caption="${i18n.wuy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p5" caption="${i18n.wuyce}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p6sl1" caption="${i18n.liuy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p6sl2" caption="${i18n.liuy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p6" caption="${i18n.liuyce}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p7sl1" caption="${i18n.qiy}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p7sl2" caption="${i18n.qiy}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p7" caption="${i18n.qiyce}"   renderer="merginCss"></t:gridCol> 
	<t:gridCol property="p8sl1" caption="${i18n.bay}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p8sl2" caption="${i18n.bay}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p8" caption="${i18n.bayce}"   renderer="merginCss"></t:gridCol>
	<t:gridCol property="p9sl1" caption="${i18n.jiuy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p9sl2" caption="${i18n.jiuy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p9" caption="${i18n.jiuyce}"   renderer="merginCss"></t:gridCol>
	<t:gridCol property="p10sl1" caption="${i18n.shiy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p10sl2" caption="${i18n.shiy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p10" caption="${i18n.shiyce}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p11sl1" caption="${i18n.shiyy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p11sl2" caption="${i18n.shiyy}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p11" caption="${i18n.shiyyce}"  renderer="merginCss"></t:gridCol>
	<t:gridCol property="p12sl1" caption="${i18n.shiey}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p12sl2" caption="${i18n.shiey}" renderer="merginCss"></t:gridCol>
	<t:gridCol property="p12" caption="${i18n.shieyce}" renderer="merginCss"></t:gridCol>
	
	<t:gridCol  property="gongysmc"   width="170" 	caption="${i18n.gongysmc}" ></t:gridCol>
	<t:gridCol  property="gcbh"       width="100"   caption="${i18n.gcbh}" ></t:gridCol>
	<t:gridCol  property="chengysmc"  width="130"   caption="${i18n.chengysmc}" ></t:gridCol>	

	
	</t:grid>
	
	<input id="removeId" value="${removeId}" type="hidden"/>  
	<div>
	${i18n.beiz}: 
	<p>
	*${i18n.pageshuoming1}
	</p>
	*${i18n.pageshuoming2}
	<p>
	*${i18n.pageshuoming3} 
	</p>
	</div>
	</t:page>
	
	<script type="text/javascript">

	function merginCss(col,value,  rowIndex,colIndex){
	        var obj = this;
	        var property = this.property;
	        var margin;
	        if(property.indexOf("sl")==0){
	           margin = value[property];
	        }else{
	           var att = colIndex<34?property.substring(0,2):property.substring(0,3);
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
	
   <!--  xss V4_008-->		
	function func_button_comparePpl_send() {//导出到外部系统
		        var red = $("#grid_niandppl").grid("getRecords");
		        if(red.length==0){
		           alert("明细不能为空");
		            return false;
		        } 
				
				var biaos = "1";//插入数据库标识
				
			    var pplbc1 = $('#record_pplbc1').fieldValue(); 
			    var pplbc2 = $('#record_pplbc2').fieldValue(); 
			    
			    var params = [];
				
				params.push("pplbc1="+pplbc1);
				params.push("pplbc2="+pplbc2);	
				
				//如果否存在相同的版次 和基准版次      ，并且已经发送则不允许再次发送 
				$.sdcui.ajaxUtil.ajax({
					url : '${ctx}/ppl/maoxqSffs.ajax',
					data : params.join('&'),
					success : function(result) {
							if (result.flag != null) {
								alert(result.flag);
								return false;
							}else{  
							    $.sdcui.pageUtils.goPage({
								url:'/ppl/SendComparePage.do?pplbc1='+pplbc1+'&pplbc2='+pplbc2+'&biaos='+biaos,//url
								mode:'form',
									beforeSubmit:function(){ 
									 	alert("导出数据中！");	
										return true;
									}
								});	 
							} 
					}
				});	
			     
	}	
	
	
	</script>
	<style type="text/css"></style>
</t:html>