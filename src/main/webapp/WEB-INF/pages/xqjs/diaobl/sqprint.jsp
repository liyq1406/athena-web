<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="调拨单打印" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<t:page>
	<table align="center"  width="100%"  class="PageNext"> 
	<tr>
	   <td colspan="2"  align='center'>神龙汽车有限公司<hr></td>
	</tr>
     <tr>
     	<td  align="center" width="100%" align='center'>零（备）件调拨申请单${diaobsq.diaobsqdh}</td>
     	<td width="50%" id="time" align="center">时间：${diaobsq.diaobsqsj}</td>
     </tr>
    <tr>
	    <td colspan="2">
			<t:grid id="grid_diaobsq"  caption=""  submit="NOT"
			src="/diaobl/print.ajax"    reset="NOT"
			add="NOT"  edit="NOT" remove="NOT"
 		    showNum="true"  usePager="false" >
 		    	<t:fieldLayout  id="layout" prefix="dbsq">
			            <t:fieldHidden property="usercenter" ></t:fieldHidden>
			            <t:fieldHidden property="diaobsqdh" ></t:fieldHidden>
			      </t:fieldLayout>
			<t:gridCol   property="lux"     type="text" caption="制造路线" ></t:gridCol>
			<t:gridCol   property="lingjbh"  type="text" caption="零件号"  ></t:gridCol>
			<t:gridCol   property="lingjmc" type="text" caption="零件名称"  ></t:gridCol>
			<t:gridCol   property="shenbsl" type="text" caption="申报数量"  ></t:gridCol>
			<t:gridCol   editorOptions="{'format':'yyyy-MM-dd'}"  property="yaohsj"  caption="要货时间" ></t:gridCol>
			</t:grid>
		</td>
	</tr>
	</table>
    
    <div   class="PageNext" style="height: 100px">
            备注:${diaobsq.beiz}
     <hr width="100%">   
     <div>
            需求申请人:${diaobsq.creator}
     <hr width="100%">   
	<div>
            会计科目:${diaobsq.huijkm}
     <hr width="100%">   
   <div>
            成本中心:${diaobsq.chengbzx}
     <hr width="100%">   
    <div>
            申请调入部门/外购单位:
     <hr width="100%">   
    <div>
       <p>经办人:    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   预算员：                                                                                                          </p>
     <hr width="100%">   
   <div>
           主任:      
     <hr width="100%">   
   <div>
             财务规划部
     <hr width="100%">
             财务分部成本及价格室/综合管理室：
     <hr width="100%">  
             调度中心计划供应室/备件储运分部：
    <hr width="100%">
           仓库/车间管理员：
    <hr width="100%">  
            领用地点：
    <hr width="100%">     
    <table  class='NOPRINT'  align ='center'>
    <tr  align="center">
	 <td><input type="button"  value="打印" onclick = "print()" /></td>
	 <td><input type="button"  value="返回" onclick = "goback()"  /></td>
	</tr>
   </table>  
   </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   
</t:page>
	
<script type="text/javascript">
	       function  print(){
	              window.print();
	       }
	       
	       function  goback(){
	               $.sdcui.pageUtils.goPage({
        			url:'/diaobl/diaobsq.do',//url
        			record:{},//
        			mode:'form',
        			beforeSubmit:function(){
        				//
        				return true;
        			}
        		});
	           event.stopPropagation();//阻止事件冒泡
		       return false;
	       }
	</script>
	<OBJECT  id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 style="display:none">
     </OBJECT>
	<style type="text/css"  media="print">
	      .Noprint{display:none;} 
	       .PageNext{page-break-after: always;}  
	       .grid-table{
	                  border-top: 1px  solid;
	                  border-right: 1px  solid;
	       }
	</style>
	</t:html>