<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
<!--
	input{
		border:1px solid #ccc;
		width:80px;
	}
	.viewTab{
	background:#FFFFEE;
	border:1px solid #BDBDBD;
	width:100%;
	vertical-align:top;
	text-align:left;
}
.viewTab th{
	background: #93A8C5;
	text-align:center;
	height:24px;
	vertical-align:middle;
	padding:0 3px;
}
.viewTab th.noBorder{
	border-right:0;
}
.viewTab td.noBorder{
	border-right:0;
}
.viewTab td{
	padding:0 3px;
	height:24px;
	text-align:center;
	vertical-align:middle;
}
.viewTab tr.evenTr{
	background:#DAE1EB;
}
.viewTab tr:hover{
	background:#93A8C5;
}
.viewTab tr.selectedTr{
	background:#FBCCC8;
}
-->
</style>
<t:html title="${i18n.pplComputer}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.ppl.pplbjjs">
    <p style="font-size:12px; font-weight:bold">${LX}${i18n.qrtitle}</p>
    <p><span>${i18n.xzbc}</span></p>
    <table cellspacing="1" cellpadding="1"  class="viewTab">
      <tr height="50px">
        <th width="8%" >${i18n.xqly}</th>
        <th width="23%">${i18n.xqbc}</th>
        <th width="23%">${i18n.cfsj}</th>
        
    </tr>
    <tr height="50px">
        <td width="8%">${xuqly}</td>
        <td width="23%">${xuqbc}</td>
        <td width="23%">${xuqcfsj}</td> 
   </tr>
   </table>
  <p> <lable>${i18n.szjsnf}</lable><input type="text" value=${jisnf}><br></p>
  <input type="button" value="${i18n.qr}" onclick="dosubmit()" id="btn" ></input>
	</t:page>
	<script type="text/javascript">
	function dosubmit(){
	var params = [];
		params.push('LX='+"${LX}");
		params.push('xuqbc='+"${xuqbc}");
		params.push('xuqly='+"${xuqly}");
		params.push('jisnf='+"${jisnf}");
		params.push('xuqcfsj='+"${xuqcfsj}");
	var lx = "${LX}" ;
	var xuqly = "${xuqly}" ;
     
    //对选择的PPL类型及版次进行判断是否符合条件（如果选中的是KD件毛需求类型必须是周 需求如果是IL件则毛需求类型必须是周期需求）
    if((lx=="KD" && xuqly=="DKS")||(lx=="IL" && xuqly.indexOf("P")!=-1)){
	 $.sdcui.ajaxUtil.ajax({
             url:"${ctx}/ppl/niandygjs.ajax",//请求url
               data:params.join('&'), 
            	success:function (result){//回调函数
            	       alert(result.result);
            	}
            	});
		 $("#btn").hide();
	 }else{
	   alert("${i18n.verifyXuqlyOrjslx}！");
	 }
	 }
	</script>
	<style type="text/css"></style>
</t:html>