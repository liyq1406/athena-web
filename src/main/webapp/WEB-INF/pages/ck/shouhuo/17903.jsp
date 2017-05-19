<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.ck.entity.shouhuo.Usbq" %>

<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17903");%>
<!-- V4_022 -->
<%
Map  map = (Map)request.getAttribute("result");

int pagesize=10;

%>


<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_179}</title>
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
    // window.location.href = "../index_ck.jsp" + st_Params;
   }   
</script>
<head>
<meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<title>US标签</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--media=print 这个属性可以在打印时有效-->
<style media=print>
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
 
<style>
.tdp
{
    border-bottom: 0 solid #000000;
    border-left:  0 solid #000000;
    border-right:  0 solid #ffffff;
    border-top: 0 solid #ffffff;
}
.tabp
{
    border-color: #000000 #000000 #000000 #000000;
    border-style: solid;
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

<table width="100%" frame="void" >
<tr align="center" ><font size="3"><strong>US标签</strong></font> </tr>
 
 <tr align="center" >
 <%	
	StringBuffer barCode = new StringBuffer();
	barCode.append("<img src='");
	barCode.append(request.getContextPath());
	barCode.append("/CreateBarCode?code=S");
	barCode.append(map.get("ush"));
	barCode.append("&barType=CODE39&checkCharacter=n&checkCharacterInText=n'>");
%>
<td align="left" ><%=barCode.toString() %></td>
</tr>
</table>
<table width="100%"  align="center"  cellSpacing="0" cellPadding="0">
<tr>
<td align="left"><font size="2"><strong>US标签:</strong></font></td>
<td align="left" ><%=map.get("ush") %></td>
<td align="left"><font size="2"><strong>火车号:</strong></font></td>
<td align="left" ><%=map.get("xiaohcbh") %></td>
<td align="left" ><font size="2"><strong>趟次:</strong></font></td>
<td align="left" ><%=map.get("tangc") %></td>
<td align="left" ><font size="2"><strong>巷道:</strong></font></td>
<td align="left" ><%=map.get("xiangd") %></td>
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>供应商编码:</strong></font></td>
<td align="left" ><%=map.get("gongysdm")%></td>
<td align="left"><font size="2"><strong>供应商名称:</strong></font></td>

   <%if(map.get("gongysmc")!=null){%>
<td align="left" ><%=map.get("gongysmc")%></td>
   <%}else{%>
<td></td>
   <%}%>

<td align="left"><font size="2"><strong>批次号:</strong></font> </td>
<td align="left"><%=map.get("pich")%></td>
<td align="left" ><font size="2"><strong>工作日:</strong></font></td>

   <%if(map.get("gongzr")!=null){%>
<td align="left" ><%=map.get("gongzr")%></td>
   <%}else{%>
<td></td>
   <%}%>
   
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>零件名称:</strong></font></td>
<td align="left" ><%=map.get("lingjmc") %></td>
<td align="left"><font size="2"><strong>零件编号:</strong></font></td>
<td align="left" ><%=map.get("lingjbh") %></td>
<td align="left" ><font size="2"><strong>数量:</strong></font> </td>
<td align="left" ><%=map.get("lingjsl")%></td>
<td align="left" ><font size="2"><strong>消耗点:</strong></font></td>
<td align="left" ><%=map.get("xiaohd")%></td>
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>US型号:</strong></font></td>
<%if(map.get("usxh")!=null){%>
<td align="left" ><%=map.get("usxh")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>

<td align="left"><font size="2"><strong>订货仓库:</strong></font></td>
<td align="left" ><%=map.get("cangkbh")%></td>
<td align="left"><font size="2"><strong>订货库位:</strong></font> </td>
<td align="left"><%=map.get("kuwbh")%> </td>
<td align="left"><font size="2"><strong>卷号:</strong></font> </td>
<td align="left" ><%=map.get("juanh")%> </td>
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>线边仓库:</strong></font> </td>
<td align="left"><%=map.get("xianbck")%></td>
<td align="left"><font size="2"><strong>线边库位:</strong></font></td>
<td align="left"><%=map.get("xianbckkw")%> </td>
<td align="left" ><font size="2"><strong>规格牌号:</strong></font></td>
<td align="left" ><%=map.get("ggph")%></td>
<td align="left"></td>
<td align="left"></td>
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>BL号:</strong></font></td>
<td align="left" ><%=map.get("blh") %></td>
<td align="left"><font size="2"><strong>入库日期:</strong></font> </td>

  <%if(map.get("rukrq")!=null){%>
<td align="left" ><%=map.get("rukrq")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>EL号:</strong></font></td> 

  <%if(map.get("elh")!=null){%>
<td align="left" ><%=map.get("elh")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>

<td align="left"><font size="2"><strong>失效期:</strong></font> </td>

  <%if(map.get("shixrq")!=null){%>
<td align="left" ><%=map.get("shixrq")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>

<td align="left"><font size="2"><strong>容量:</strong></font> </td>
<td align="left"><%=map.get("usrl") %></td>
<td></td>
<td></td>
</tr>

<tr align="center">
<td align="left"><font size="2"><strong>UA号:</strong></font></td>

  <%if(map.get("yuanbqbh")!=null){%>
<td align="left" ><%=map.get("yuanbqbh")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>
   
<td align="left"><font size="2"><strong>要货令号:</strong></font> </td>

  <%if(map.get("yaohlh")!=null){%>
<td align="left" ><%=map.get("yaohlh")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>
   
<td align="left"><font size="2"><strong>数量:</strong></font> </td>
<td align="left"><%=map.get("lingjsl") %> </td>
<td></td>
<td></td>
</tr>
</table> 

 <br/>
</body>
</t:html>