<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.ck.entity.shouhuo.Daohtzd" %>
<%@ page import="java.util.*,com.athena.ck.entity.shouhuo.Uabq" %>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17503");%>
<!-- V4_022 13077-->
<%
Map  map = (Map)request.getAttribute("result");

int pagesize=20;

List<Uabq> list1=(List<Uabq>)map.get("list1");


String ulh ="";
String sulh ="";	


String elh ="";
String selh ="";	
  
%>

<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_175}</title>
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
      //window.location.href = "../index_ck.jsp" + st_Params;
   }
function printWithoutAlert() {//直接打印
     this.PageSetup_Null( );
     document.all.WebBrowser.ExecWB(6,6);
     //window.location.href = "../index_ck.jsp" + st_Params;
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
<title>到货/验收单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--media=print 这个属性可以在打印时有效-->
<style media=print>
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
 
<style>
.tdp
{
    border-bottom: 0 ;
    border-left:  0 ;
    border-right:  0 ;
    border-top: 0 ;
}
.tabp
{
   
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
<% }%>

<table width="100%" frame="void" >
 <tr align="center" ><font size="3"><strong>到货/验收单</strong></font> </tr>
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
</tr>
</table>
<table width="100%"  align="center"  cellSpacing="0" cellPadding="0">
<tr>
<td align="right"><font size="2"><strong>到货/验收单:</strong></font></td>
<td align="left" ><%=map.get("blh")%></td>
<td align="right"><font size="2"><strong>用户名:</strong></font></td>
<td align="left" ><%=map.get("creator")%></td>
<td align="right" ><font size="2"><strong>打印时间:</strong></font></td>
<td align="left" ><%=map.get("sysdate") %></td>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>承运商:</strong></font></td>
<td align="left" ><%=map.get("chengysdm") %></td>
<td align="right"><font size="2"><strong>卸货点:</strong></font> </td>
<td align="left"><%=map.get("xiehzt") %></td>
<td align="right" ><font size="2"><strong>集装箱/卡车号:</strong></font></td>
<td align="left" ><%=map.get("tch") %></td>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>UT:</strong></font></td>
<td align="left" ><%=map.get("uth") %></td>
<td align="right" ><font size="2"><strong>原UT号:</strong></font> </td>

  <%if(map.get("yuth")!=null){%>
<td align="left" ><%=map.get("yuth")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>

<td align="right" ><font size="2"><strong>UT生成时间:</strong></font></td>
  <%if(map.get("utscsj")!=null){%>
<td align="left" ><%=map.get("utscsj")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>原BL号:</strong></font></td>
  <%if(map.get("yblh")!=null){%>
<td align="left" ><%=map.get("yblh")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>
   
<td align="right" ><font size="2"><strong>原始BL号:</strong></font> </td>

  <%if(map.get("ysblh")!=null){%>
<td align="left" ><%=map.get("ysblh")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>

<td align="right" ><font size="2"><strong>BL生成时间:</strong></font> </td>
  <%if(map.get("blscsj")!=null){%>
<td align="left" ><%=map.get("blscsj")%></td>
   <%}else{%>
<td id="left"></td>
   <%}%>
</tr>

<tr align="center">
<td align="right"><font size="2"><strong>仓库:</strong></font></td>
<td align="left" ><%=map.get("cangkbh") %></td>
<td align="right" ></td>
<td align="left" > </td>
<td align="right" ></td>
<td align="left" > </td>
</tr>

</table> 
<!-- 如果当前的ULh 和上一条数据的ULH不同的话 就新建一个table 打印  供应商和 子列表-->
<%
for(int m=(num-1)*29;(m < num*29 && m<list1.size() );m++){%> 		
	<% if( m > 0 ){  
	ulh =  list1.get(m).getUlh();   
	sulh = list1.get(m-1).getUlh();   
	elh = list1.get(m).getElh();     
	selh = list1.get(m-1).getElh();   
	   }
	if ( !ulh.equals(sulh)  ||  m == 0 ){ 
	%> 
<table width="100%" border="0" align="center"  cellSpacing="0" cellPadding="0">
 <tr align="center">
	 <td width="11%"><strong><font size="2">供应商</font></strong></td>
	 <td width="14%"><strong><font size="2">UL</font></strong></td>
	 <td width="11%"></td>
	 <td width="8%"></td>
	 <td width="12%"></td>
	 <td width="9%"></td>
	 <td width="9%"></td>
	 <td width="8%"></td>
	 <td width="9%"></td>
	 <td width="9%"></td>
  </tr>
  <tr align="center" >
 <td id="gongysdm"><%=list1.get(m).getGongysdm() %></td>
 <td id="ulh" ><%= list1.get(m).getUlh()  %></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
</tr>
   <tr align="center">
	 <td><strong><font size="2">EL</font></strong></td>
	 <td><strong><font size="2">零件</font></strong></td>
	 <td><strong><font size="2">数量</font></strong></td>
	 <td><strong><font size="2">提示</font></strong></td>
	 <td><strong><font size="2">容器个数</font></strong></td>
	 <td></td>
	 <td></td>
	 <td></td>
	 <td></td>
	 <td></td>
  </tr>
<tr align="center" >
 <td id="elh"><%= list1.get(m).getElh() %></td>
 <td id="lingjbh"><%=list1.get(m).getLingjbh() %></td>
 <td id="lingjsl"><%=list1.get(m).getLjsj() %></td>
 <td id="tishi"><%= list1.get(m).getTishi() %></td>
 <td id="rongqgs"><%= list1.get(m).getiBaozgs() %> </td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
  <td></td>
</tr>
 
 <tr align="center" >
  <td><font size="2" ><strong>序号</strong></font></td>
 <td><font size="2" ><strong>UA</strong></font></td>
 <td><font size="2" ><strong>要货令</strong></font></td>
 <td><font size="2" ><strong>UA型号</strong></font></td>
 <td><font size="2" ><strong>UC型号</strong></font></td>
 <td><font size="2" ><strong>UC个数</strong></font></td>
 <td><font size="2" ><strong>UC含量</strong></font></td>
 <td><font size="2" ><strong>验收数量</strong></font></td>
 <td><font size="2" ><strong>单位</strong></font></td>
 <td><font size="2" ><strong>备注</strong></font></td>
 </tr>

 </table> 
 <%} else if( !elh.equals(selh) ) { %>
<table width="100%" border="0" align="center"  cellSpacing="0" cellPadding="0">
 <tr align="center">
	 <td width="11%"><strong><font size="3">EL</font></strong></td>
	 <td width="14%"><strong><font size="3">零件</font></strong></td>
	 <td width="11%"><strong><font size="3">数量</font></strong></td>
	 <td width="8%"><strong><font size="3">提示</font></strong></td>
	 <td width="12%"><strong><font size="3">容器个数</font></strong></td>
	 <td width="9%"></td>
	 <td width="9%"></td>
	 <td width="8%"></td>
	 <td width="9%"></td>
	 
	 <td width="9%">&nbsp;&nbsp; </td>
  </tr>
<tr align="center" >
 <td id="elh"><%=list1.get(m).getElh()  %></td>
 <td id="lingjbh"><%=list1.get(m).getLingjbh()  %></td>
 <td id="lingjsl"><%=list1.get(m).getLjsj()  %></td>
 <td id="tishi"><%= list1.get(m).getTishi()  %></td>
 <td id="rongqgs"><%= list1.get(m).getiBaozgs() %></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
</tr>
 
 <tr align="center" >
 <td><font size="2" ><strong>序号</strong></font></td>
 <td><font size="2" ><strong>UA</strong></font></td>
 <td><font size="2" ><strong>要货令</strong></font></td>
 <td><font size="2" ><strong>UA型号</strong></font></td>
 <td><font size="2" ><strong>UC型号</strong></font></td>
 <td><font size="2" ><strong>UC个数</strong></font></td>
 <td><font size="2" ><strong>UC含量</strong></font></td>
 <td><font size="2" ><strong>验收数量</strong></font></td>
 <td><font size="2" ><strong>单位</strong></font></td>
 <td><font size="2" ><strong>备注</strong></font></td>
 </tr>
 </table> 
 <%}%>
 <table width="100%" border="0" align="left"  cellSpacing="0" cellPadding="0">	
 	<%if(list1.get(m).getXuh()!=null){%>
 		<tr align="center"> 
 		 <td width="11%" height="1px" id="xuh"><%=m+1 %></td>
  		 <td width="14%" height="1px" id="uah"><%=list1.get(m).getUah()%></td>
		 <td width="10%" height="1px" id="yaohlh"><%=list1.get(m).getYaohlh()%></td>
  		 <td width="9%" height="1px" id="uaxh"><%=list1.get(m).getUaxh()%></td>
		 <td width="11%" height="1px" id="ucxh"><%=list1.get(m).getUcxh()%></td>
		 <td width="9%" height="1px" id="ucgs"><%=list1.get(m).getUcgs()%></td>
		 <td width="10%" height="1px" id="uchl"><%=list1.get(m).getUchl()%></td>
	     <td width="8%" height="1px" id="yanssl"><%=list1.get(m).getYanssl()%></td>
		 <td width="9%" height="1px" id="danw"><%=list1.get(m).getDanw()%></td>
 	     <td width="9%" height="1px" id="beiz"><%=list1.get(m).getBeiz()%></td> 
 		</tr> 
	<%}%>
 </table>  
 	<br/>	
 	<br/> 
 <%}%>
 <%}%>
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