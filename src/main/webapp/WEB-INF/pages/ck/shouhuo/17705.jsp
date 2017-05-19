<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.ck.entity.shouhuo.Daohtzd" %>

<%@ page import="com.athena.ck.entity.shouhuo.Uabq" %>

<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17702");%>
<%
Map  map = (Map)request.getAttribute("result");

int pagesize=10;

List<Uabq> list1=(List<Uabq>)map.get("list1");

List<Uabq> list2=(List<Uabq>)map.get("list2");

List<Uabq> list3=(List<Uabq>)map.get("list3");

%>

<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_17702}</title>
<jsp:include page="../../common/js.jsp" /><OBJECT  id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0></OBJECT>
<script language="javascript">
var HKEY_Root,HKEY_Path,HKEY_Key;   
HKEY_Root="HKEY_CURRENT_USER";   
HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";   
//设置网页打印的页眉页脚为空   
function PageSetup_Null()   
{   
    try  
    {   
        var Wsh=new ActiveXObject("WScript.Shell");   
        HKEY_Key="header";   
        Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");   
        HKEY_Key="footer";   
        Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");   
    }   
    catch(e){}   
  
}
function printWithAlert() {//打印方法
      this.PageSetup_Null( );
      document.all.WebBrowser.ExecWB(6,1);
     // window.location.href = "../index_ck.jsp" + st_Params;
   }
function printWithoutAlert() {//直接打印
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(6,6);
    // window.location.href = "../index_ck.jsp" + st_Params;
   }

function printSetup() {//打印设置
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(8,1);
     
   }

function printPrieview() {//打印预览
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(7,1);
     //window.location.href = "../index_ck.jsp" + st_Params;
   }   
</script>
<head>
<meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<title>卷料到货验收单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--media=print 这个属性可以在打印时有效-->
<style media=print>
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
 
<style>
.tdp
{
    border-bottom:0;
    border-left:  0;
    border-right: 0;
    border-top: 0;
}
.tabp
{
    border-color: #000000 #000000 #000000 #000000;
    border-style: hidden;
    border-top-width: 0px;
    border-right-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
}
.NOPRINT {
 font-family: "宋体";
 font-size: 9pt;
}
 
</style>
</head>
<body >
<center class="Noprint" >
 <table align="center" class=NOPRINT>
    <tr>
    <td align="center">
    <BUTTON title=打印 onClick="printWithAlert()">打印 </BUTTON>
     <BUTTON title=直接打印 onClick="printWithoutAlert()">直接打印 </BUTTON>
    <input type=button value="打印设置" onClick="printSetup()" >
    <button onclick ='printPrieview()' title='打印预览...' >打印预览 </button>
    </td>
    </tr>
</table>
  <hr align="center" width="90%" size="1" noshade>
</center>
<%
 for(int num=1; num <= Integer.parseInt(map.get("page").toString());num++ ){%>
<% if(num >=2) {%>
<div class="PageNext"></div>
<%} %>

<table width="100%" frame="void" >
<tr align="center" ><font size="3"><strong>验收单</strong></font> </tr>
 
<tr align="center" >
<%	
	StringBuffer barCode = new StringBuffer();
	barCode.append("<img src='");
	barCode.append(request.getContextPath());
	barCode.append("/CreateBarCode?code=");
	barCode.append(map.get("blh"));
	barCode.append("&barType=CODE39&checkCharacter=n&checkCharacterInText=n'>");
%>
<td align="left" ><%=barCode.toString() %></td>
<td align='left'><font size="2"><strong><%=num %></strong> /<strong><%=map.get("page") %></strong></font> </td>
</table>
<table width="100%"  align="center"  cellSpacing="0" cellPadding="0">
<tr>
<td align="right"><font size="2"><strong>验收单:</strong></font></td>
<td align="left" ><%=map.get("blh") %></td>
<td align="right" ><font size="2"><strong>用户名:</strong></font></td>
<td align="left" ><%=map.get("creator") %></td>
<td align="right" ><font size="2"><strong>打印时间:</strong></font></td>
<td align="left" ><%=map.get("sysdate") %></td>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>承运商编号:</strong></font></td>
<td align="left" ><%=map.get("chengysdm") %></td>
<td align="right"><font size="2"><strong>集装箱/卡车号:</strong></font> </td>
<td align="left"><%=map.get("tch") %></td>
<td align="right" ><font size="2"><strong>卸货点:</strong></font></td>
<td align="left" ><%=map.get("xiehzt") %></td>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>承运商名称:</strong></font></td>

 <%if(map.get("chengysmc")!=null){%>
 <td align="left" ><%=map.get("chengysmc")%></td>
 <%}else{%>
  <td align="left" ></td>
 <%}%>
 
<td align="right" ><font size="2"><strong>BL单号:</strong></font> </td>
<td align="left" ><%=map.get("blh") %></td>
<td align="right" ><font size="2"><strong>仓库号:</strong></font></td>
<td align="left" ><%=map.get("cangkbh") %></td>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>UT号:</strong></font></td>
<td align="left" ><%=map.get("uth") %></td>
<td align="right" >&nbsp;</td>
<td align="left" > </td>
<td align="right" > </td>
<td align="left" > </td>
</tr>
</table> 
<br/>
<!-- 如果当前的ULh 和上一条数据的ULH不同的话 就新建一个table 打印  供应商和 子列表-->
<table width="100%" border="0" align="center"   cellSpacing="0" cellPadding="0">
 <tr align="center">
	 <td><strong><font size="2">序号</font></strong></td>
	 <td><strong><font size="2">UA号</font></strong></td>
	 <td><strong><font size="2">零件编号</font></strong></td>
	 <td><strong><font size="2">零件名称</font></strong></td>
	 <td><strong><font size="2">零件数量</font></strong></td>
	 <td><strong><font size="2">验收数量</font></strong></td>
	 <td><strong><font size="2">单位</font></strong></td>
	 <td><strong><font size="2">UL号</font></strong></td>
	 <td><strong><font size="2">EL号</font></strong></td>
	 <td><strong><font size="2">供应商编码</font></strong></td>
	 <td><strong><font size="2">验收备注</font></strong></td>
  </tr>
<%
for(int m=(num-1)*50;(m < num*50 && m<list1.size() );m++){
%>   
<tr align="center" >
 <td id="xuh"><%=m+1 %></td>
 <td id="uah" ><%=list1.get(m).getUah()%></td>
 <td id="lingjbh"><%=list1.get(m).getLingjbh()%></td>
 <td id="lingjmc"><%=list1.get(m).getLingjmc()%></td>
 <td id="lingjsl"><%=list1.get(m).getLingjsl().intValue()%></td>
 <td id="yanssl"><%=list1.get(m).getYanssl()%></td>
 <td id="danw"><%=list1.get(m).getDanw()%></td>
 <td id="ulh"><%=list1.get(m).getUlh()%></td>
 <td id="elh"><%=list1.get(m).getElh()%></td>
 <td id="gongysdm"><%=list1.get(m).getGongysdm()%></td>
 <%if(list1.get(m).getTishi()!=null){%>
 <td id="beiz"><%=list1.get(m).getTishi()%></td>
 <%}else{%>
  <td id="beiz"></td>
 <%}%>
</tr>
 <% } %> 
  </table> 
  
   
 <% if( num == Integer.parseInt(map.get("page").toString()) ) {%> 
   <br/>
   
<table width="100%" border="0" align="center"  cellSpacing="0" cellPadding="0">
 <tr align="center">
	 <td><strong><font size="2">UA型号</font></strong></td>
	 <td><strong><font size="2">UA数量</font></strong></td>
  </tr>
  
<%
for(int tt=0; tt<list2.size();tt++){
%>  	
<tr align="center" height="90%"> 
	<td id="yanssl" height="1px"><%=list2.get(tt).getUaxh()%></td>
	<td id="ucgs" height="1px"><%=list2.get(tt).getUasl()%></td>  
 
</tr>
<%}%>
</table> 

<br/>
<table width="100%" border="0" align="center"  cellSpacing="0" cellPadding="0">
 <tr align="center">
	 <td><strong><font size="2">UC型号</font></strong></td>
	 <td><strong><font size="2">UC数量</font></strong></td>
  </tr>
  
<%
for(int t=0; t<list3.size();t++){
%>  	
<tr align="center" height="90%"> 
	<td id="yanssl" height="1px"><%=list3.get(t).getUcxh()%></td>
	<td id="beiz" height="1px"><%=list3.get(t).getUcsl()%></td>   
</tr>
<%}%>
</table>
 
<%}%>
  
<%}%>

 <br/>
 <table frame="void" width="100%"  align="center" >
 <tr align="center" >
  <td align="left"><strong>承运商签字人：</strong>：</td>
  <td>&nbsp;</td>
  <td align="left"></td>
   <td>&nbsp;</td>
  <td align="left"></td>
   <td>&nbsp;</td>
  <td align="left"><strong>DPCA签字人</strong>：</td>
   <td>&nbsp;</td>
 </tr>
</table>
 <br/>


</body>
</t:html>