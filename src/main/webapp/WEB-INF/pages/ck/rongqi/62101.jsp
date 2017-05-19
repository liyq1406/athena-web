<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.ck.entity.rongqi.Rongqjs" %>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","62101");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_621}</title>
<jsp:include page="../../common/js.jsp" />
<OBJECT  id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0></OBJECT>
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
      window.location.href = "../index_ck.jsp" + st_Params;
   }
function printWithoutAlert() {//直接打印
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(6,6);
     window.location.href = "../index_ck.jsp" + st_Params;
   }

function printSetup() {//打印设置
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(8,1);
     
   }

function printPrieview() {//打印预览
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(7,1);
     window.location.href = "../index_ck.jsp" + st_Params;
   }   
</script>
<head>
<meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<title>容器调拨返还单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--media=print 这个属性可以在打印时有效-->
<style media=print>
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
 
<style>
.tdp
{
    border-bottom: 1 solid #000000;
    border-left:  1 solid #000000;
    border-right:  0 solid #ffffff;
    border-top: 0 solid #ffffff;
}
.tabp
{
    border-color: #000000 #000000 #000000 #000000;
    border-style: solid;
    border-top-width: 0px;
    border-right-width: 1px;
    border-bottom-width: 0px;
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
    <BUTTON title=打印 onclick="printWithAlert()">打印 </BUTTON>
     <BUTTON title=直接打印 onclick="printWithoutAlert()">直接打印 </BUTTON>
    <input type=button value="打印设置" onclick="printSetup()" >
    <button onclick ='printPrieview()' title='打印预览...' >打印预览 </button>
    </td>
    </tr>
</table>
  <hr align="center" width="90%" size="1" noshade>
</center>
<%
Map  map = (Map)request.getAttribute("result");
int pagesize=Integer.parseInt(map.get("pagesize").toString()) ;
List<Rongqjs> list=(List)map.get("list");
 for(int num=1; num <= Integer.parseInt(map.get("page").toString());num++ ){%>
<% if(num >=2) {%>
<div class="PageNext"></div>
<%} %>

<table width="90%" frame="void" >
<tr>
<td align="right"><font size="3"><strong>单号</strong></font>:</td>
<td align="left" id="danh"><%=map.get("danh") %></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<%	
	StringBuffer barCode = new StringBuffer();
	barCode.append("<img src='");
	barCode.append(request.getContextPath());
	barCode.append("/CreateBarCode?code=");
	barCode.append(map.get("danh"));
	barCode.append("&barType=CODE39&checkCharacter=n&checkCharacterInText=n'>");
%>
<td align="right"><%=barCode.toString() %></td>
</tr>
<tr>
<td align="center" colspan="5"><h3>容器调拨返还单(一式三联   仓库联)</h3></td>
<td align='left'><font size="3"><strong><%=num %></strong> /<strong><%=map.get("page") %></strong></font> </td>
</tr>
</table> 
<table width="90%" border="10" align="center"   class="tabp" cellSpacing="0" cellPadding="0">
 <tr align="center">
 <td><font size="3" ><strong>供应商</strong></font></td>
 <td><font size="3" ><strong>承运商</strong></font></td>
 <td><font size="3" ><strong>日期</strong></font></td>
 <td><font size="3" ><strong>时间</strong></font></td>
 <td><font size="3" ><strong>卡车号</strong></font></td>
  </tr>
<tr align="center" >
 <td id="gongysdm"><%=map.get("gongysdm") %></td>
 <td id="chengysdm"><%=map.get("chengysdm") %></td>
 <td id="riq" ><%=map.get("riq") %></td>
 <td id="shij"><%=map.get("shij") %></td>
 <td id="kach"><%=map.get("tch") %></td>
</tr>
<tr align="center" >
  <td><font size="3" ><strong>序号</strong></font></td>
 <td><font size="3" ><strong>容器编号</strong></font></td>
 <td><font size="3" ><strong>返还数量</strong></font></td>
 <td><font size="3" ><strong>容器余额</strong></font></td>
 <td><font size="3" ><strong>摘要</strong></font></td>
 </tr>
<%for(int n=(num-1)*8;(n < pagesize && n<num*8);n++){ %>
 <tr align="center" height="90%">
 <td id="xuh" height="1px"><%=n+1 %></td>
 <td id="rongqbh" height="1px"><%=list.get(n).getRongqxh() %> </td>
 <td id="fanhsl" height="1px"><%=list.get(n).getRongqsl() %></td>
 <td id="rongqye" height="1px"><%=list.get(n).getRongqye() %></td>
 <td id="zhaiy" height="1px">返还</td>
 </tr>  
 <%} %>
 </table> 
 
 <table frame="void" width="90%"  align="center" >
 <tr align="center" >
  <td align="left"><strong>容器保管员</strong>：</td>
  <td>&nbsp;</td>
  <td align="left"><strong>供应商/承运商</strong>：</td>
   <td>&nbsp;</td>
  <td align="left"><strong>卡车司机</strong>：</td>
   <td>&nbsp;</td>
  <td align="left"><strong>门卫</strong>：</td>
   <td>&nbsp;</td>
 </tr>
</table>
<%for(int i=0;i<2;i++){ %>
<br>
<table width="90%" frame="void">
<tr>
<td align="right"><font size="3"><strong>单号</strong></font>:</td>
<td align="left" id="danh"><%=map.get("danh") %></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td align="right"><%=barCode.toString() %></td>
</tr>
<tr>
<% if(i ==0 ){ %>
<td align="center" colspan="5"><h3>容器调拨返还单(一式三联   供应商/承运商联)</h3></td>
<%}else{ %>
<td align="center" colspan="5"><h3>容器调拨返还单(一式三联   门卫联)</h3></td>
<% }%>

<td align='left'><font size="3"><strong><%=num %></strong> /<strong><%=map.get("page") %></strong></font> </td>
</tr>
</table> 
<table width="90%" border="10" align="center"   class="tabp" cellSpacing="0" cellPadding="0">
 <tr align="center">
 <td rowspan="2"><font size="4" ><strong>送货</strong></font></td>
 <td><font size="3" ><strong>日期</strong></font></td>
 <td><font size="3" ><strong>时间</strong></font></td>
 <td><font size="3" ><strong>供应商</strong></font></td>
 <td><font size="3" ><strong>承运商</strong></font></td>
 <td><font size="3" ><strong>卡车号</strong></font></td>
 </tr>
 <tr align="center">
 <td id="riq" ><%=map.get("riq") %></td>
 <td id="shij"><%=map.get("shij") %></td>
 <td id="gongysdm"><%=map.get("gongysdm") %></td>
 <td id="chengysdm"><%=map.get("chengysdm")%></td>
 <td id="kach"><%=map.get("tch") %></td>
 </tr>
<tr align="center">
 <td><font size="3" ><strong>序号</strong></font></td>
 <td><font size="3" ><strong>容器编号</strong></font></td>
 <td><font size="3" ><strong>返还数量</strong></font></td>
 <td><font size="3" ><strong>容器余额</strong></font></td>
 <td colspan="2"><font size="3" ><strong>摘要</strong></font></td>
 </tr> 
  <%for(int m=(num-1)*8;(m < pagesize && m<num*8);m++){ %>
 <tr align="center">
 <td id="xuh"  ><%=m+1 %></td>
 <td id="rongqbh"  ><%=list.get(m).getRongqxh() %> </td>
 <td id="fanhsl"  ><%=list.get(m).getRongqsl() %></td>
 <td id="rongqye" ><%=list.get(m).getRongqye() %></td>
 <td id="zhaiy" colspan="2" >返还</td>
 </tr>  
 <%} %> 
 </table>
 <table frame="void" width="90%"  align="center" >
 <tr align="center" >
  <td align="left"><strong>容器保管员</strong>：</td>
  <td>&nbsp;</td>
  <td align="left"><strong>供应商/承运商</strong>：</td>
   <td>&nbsp;</td>
  <td align="left"><strong>卡车司机</strong>：</td>
   <td>&nbsp;</td>
  <td align="left"><strong>门卫</strong>：</td>
   <td>&nbsp;</td>
 </tr>
</table>
<%} %>
<%} %>


</body>
<center class="Noprint" >
<jsp:include page="../../common/bottom.jsp" />
</center>
</t:html>