<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.ck.entity.rongqi.RongQiPring_634" %>
<%@ page import="java.util.*,com.athena.ck.entity.rongqi.Rongqfh" %>

<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","64302");%>
<%
Map  map = (Map)request.getAttribute("result");

int pagesize=10;

List<RongQiPring_634> list2=(List<RongQiPring_634>)map.get("list2");
List<RongQiPring_634> list3=(List<RongQiPring_634>)map.get("list3");

int cs_temp = Integer.parseInt("000");

int cishu= Integer.parseInt(map.get("xuh").toString());//当天的流水号

int cs= Integer.parseInt(map.get("cishu").toString());//补打次数

//int cishu=cs_temp+cs+1;//当前次数 0011242

%>

<%request.setAttribute("cishu",cishu);%>

<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_642}</title>
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
<title>容器返还单</title>
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

<tr align="right" >
<div align="center"><font size="2"><strong>容器返还出库单</strong></font>
</div>
</tr>
<table width="90%" frame="void" >
<tr align="center">
<td align="right"><font size="2"><strong>返还单号:</strong></font></td>
<td align="left" ><%=map.get("fanhdh") %></td>
<td align="left">&nbsp;V<%=cs%></td>
<td align="right" ><font size="2"><strong>流水号:</strong></font></td>
<td align="left" ><%=cishu%></td>
<td align="right" ><font size="2"><strong>记账区:</strong></font></td>
 
<%if(map.get("fanhjzq")!=null){%>
<td align="left" ><%=map.get("fanhjzq")%></td>
<%}else{ %>
<td align="left" ></td>
<% }%>		 		 
		 
<%	

	StringBuffer barCode = new StringBuffer();
	barCode.append("<img src='");
	barCode.append(request.getContextPath());
	barCode.append("/CreateBarCode?code=");
	barCode.append(map.get("fanhdh"));
	barCode.append("&barType=CODE39&checkCharacter=n&checkCharacterInText=n'>");
%>
<td align="right" ><%=barCode.toString() %></td>
</tr>
<tr>
<td align="center" colspan="5"><h3>容器返还单(一式三联   仓库联)</h3></td>
<td align='left'><font size="3"><strong><%=num %></strong> /<strong><%=map.get("page") %></strong></font> </td>
</tr>
</table> 

<table width="95%" border="10" align="center"   class="tabp" cellSpacing="0" cellPadding="0">
 <tr align="center">
 <td><font size="3" ><strong>返还商/承运商</strong></font></td>
 
 <td colspan="2"><font size="3" ><strong>返还商/承运商名称</strong></font></td>
 <td><font size="3" ><strong>日期</strong></font></td>
 <td><font size="3" ><strong>时间</strong></font></td>
 <td><font size="3" ><strong>卡车号</strong></font></td>
  </tr>
<tr align="center" >
 <td id="fanhs"><%=map.get("fanhs") %></td>
 
 <%if(map.get("fanhsmc")!=null){%>
 <td colspan="2" id="fanhsmc"><%=map.get("fanhsmc")%></td>
 <%}else{ %>
 <td colspan="2" id="fanhsmc"></td>
 <% }%>	
 
 <td id="riq" ><%=map.get("riq") %></td>
 <td id="shij"><%=map.get("shij") %></td>
 
    <%if(map.get("tch")!=null){%>
  	<td id="tch"><%=map.get("tch") %></td>
	<%}else{ %>
	<td id="tch"></td>
	<% }%>
</tr>
<tr align="center" >
  <td><font size="3" ><strong>序号</strong></font></td>
  
  <td><font size="3" ><strong>供应商/承运商</strong></font></td>
  <td><font size="3" ><strong>供应商/承运商名称</strong></font></td> 
   
 <td><font size="3" ><strong>容器包号</strong></font></td>
 <td><font size="3" ><strong>数量</strong></font></td>
 <td><font size="3" ><strong>摘要</strong></font></td>
 </tr>
<%for(int n=(num-1)*7;(n < num*7 && n<list2.size() );n++){ %>
 <tr align="center" height="90%">
    <%if(list2.get(n).getRongqbh()==null){ break; }%>  	
  	<%if(list2.get(n).getRongqbh()!=null){ %>
		 <td id="xuh" height="1px"><%=n+1 %></td>
		 
		 <td id="gongysdm" height="1px"><%=list2.get(n).getGongysdm()  %> </td>
			 
		<%if(list2.get(n).getGongysmc()!=null){%>
	  	<td id="gongysmc" height="1px"><%=list2.get(n).getGongysmc()%></td>
		<%}else{ %>
		<td id="gongysmc" height="1px"></td>
		<% }%>		 		 	 	
		 
		 <td id="rongqbh" height="1px"><%=list2.get(n).getRongqbh() %> </td>
		 <td id="rongqsl" height="1px"><%=list2.get(n).getRongqsl() %></td>
		 <td id="zhaiy" height="1px">返还</td>
	<%}%>
 </tr> 
 <%} %>
 
 <tr align="center" >
  <td><font size="3" ><strong>序号</strong></font></td>
  
  <td><font size="3" ><strong>供应商/承运商</strong></font></td>
  <td><font size="3" ><strong>供应商/承运商名称</strong></font></td> 
   
 <td><font size="3" ><strong>容器型号</strong></font></td>
 <td><font size="3" ><strong>数量</strong></font></td>
 <td><font size="3" ><strong>摘要</strong></font></td>
 </tr>
<%for(int m=(num-1)*7;(m < num*7 && m<list3.size() );m++){ %>
 <tr align="center" height="90%">
 	 <%if(list3.get(m).getRongqxh()==null){break;}%>	
	
 	<%if(list3.get(m).getRongqxh()!=null){%>
 		<td id="xuh" height="1px"><%=m+1 %></td>
 		 				 		 
		<td id="gongysdm"><%=list3.get(m).getGongysdm() %></td>
		 
		<%if(list3.get(m).getGongysmc()!=null){%>
	  	<td id="gongysmc" height="1px"><%=list3.get(m).getGongysmc()%></td>
		<%}else{ %>
		<td id="gongysmc" height="1px"></td>
		<% }%>		 		 
		 
  		 <td id="rongqxh"><%=list3.get(m).getRongqxh()%></td>
  		 <td id="rongqsl" height="1px"><%=list3.get(m).getRongqsl()%></td>
 	     <td id="zhaiy" height="1px">返还</td>
	<%}%>
 </tr> 
 <%} %>
 </table> 
 
 <table frame="void" width="95%"  align="center" >
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
<td align="right"><font size="2"><strong>返还单号</strong></font>:</td>
<td align="left" ><%=map.get("fanhdh") %></td>
<td align="left">&nbsp;V<%=cs%></td>
<td align="right"><font size="2"><strong>流水号</strong></font>:</td>
<td align="left" ><%=cishu%></td>
<td align="right"><font size="2"><strong>记账区</strong></font>:</td>

<%if(map.get("fanhjzq")!=null){%>
<td align="left" ><%=map.get("fanhjzq")%></td>
<%}else{ %>
<td align="left" ></td>
<% }%>	
 
<td align="right" ><%=barCode.toString() %></td>
</tr>
<tr>
<% if(i ==0 ){ %>
<td align="center" colspan="5"><h3>容器返还单(一式三联   供应商/承运商联)</h3></td>
<%}else{ %>
<td align="center" colspan="5"><h3>容器返还单(一式三联   门卫联)</h3></td>
<% }%>

<td align='left'><font size="3"><strong><%=num %></strong> /<strong><%=map.get("page") %></strong></font> </td>
</tr>
</table> 


<table width="95%" border="10" align="center"   class="tabp" cellSpacing="0" cellPadding="0">
 <tr align="center">
 <td><font size="3" ><strong>返还商/承运商</strong></font></td>
 
 <td colspan="2"><font size="3" ><strong>返还商/承运商名称</strong></font></td>
 <td><font size="3" ><strong>日期</strong></font></td>
 <td><font size="3" ><strong>时间</strong></font></td>
 <td><font size="3" ><strong>卡车号</strong></font></td>
  </tr>
<tr align="center" >
 <td id="fanhs"><%=map.get("fanhs") %></td>
 
  <%if(map.get("fanhsmc")!=null){%>
 <td colspan="2" id="fanhsmc"><%=map.get("fanhsmc")%></td>
 <%}else{ %>
 <td colspan="2" id="fanhsmc"></td>
 <% }%>	
 
 <td id="riq" ><%=map.get("riq") %></td>
 <td id="shij"><%=map.get("shij") %></td>
 
    <%if(map.get("tch")!=null){%>
  	<td id="tch"><%=map.get("tch") %></td>
	<%}else{ %>
	<td id="tch"></td>
	<% }%>
</tr>
<tr align="center" >
  <td><font size="3" ><strong>序号</strong></font></td>
  
  <td><font size="3" ><strong>供应商/承运商</strong></font></td>
  <td><font size="3" ><strong>供应商/承运商名称</strong></font></td> 
   
 <td><font size="3" ><strong>容器包号</strong></font></td>
 <td><font size="3" ><strong>数量</strong></font></td>
 <td><font size="3" ><strong>摘要</strong></font></td>
 </tr>
<%for(int n=(num-1)*7;(n < num*7 && n<list2.size() );n++){ %>
 <tr align="center" height="90%">
    <%if(list2.get(n).getRongqbh()==null){ break; }%>  	
  	<%if(list2.get(n).getRongqbh()!=null){ %>
		 <td id="xuh" height="1px"><%=n+1 %></td>
		 
		 <td id="gongysdm" height="1px"><%=list2.get(n).getGongysdm()  %> </td>
		 		 
		<%if( list2.get(n).getGongysmc()!=null ){%>
	  	<td id="gongysmc" height="1px"><%=list2.get(n).getGongysmc()%></td>
		<%}else{ %>
		<td id="gongysmc" height="1px"></td>
		<% }%>		 		 		 	
		 
		 <td id="rongqbh" height="1px"><%=list2.get(n).getRongqbh() %> </td>
		 <td id="rongqsl" height="1px"><%=list2.get(n).getRongqsl() %></td>
		 <td id="zhaiy" height="1px">返还</td>
	<%}%>
 </tr> 
 <%} %>
 
 <tr align="center" >
  <td><font size="3" ><strong>序号</strong></font></td>
  
  <td><font size="3" ><strong>供应商/承运商</strong></font></td>
  <td><font size="3" ><strong>供应商/承运商名称</strong></font></td> 
   
 <td><font size="3" ><strong>容器型号</strong></font></td>
 <td><font size="3" ><strong>数量</strong></font></td>
 <td><font size="3" ><strong>摘要</strong></font></td>
 </tr>
<%for(int m=(num-1)*7;(m < num*7 && m<list3.size() );m++){ %>
 <tr align="center" height="90%">
 	 <%if(list3.get(m).getRongqxh()==null){break;}%>	
	
 	<%if(list3.get(m).getRongqxh()!=null){%>
 		 <td id="xuh" height="1px"><%=m+1 %></td>
		 
		 <td id="gongysdm"><%=list3.get(m).getGongysdm() %></td>	 
		  
		<%if(list3.get(m).getGongysmc()!=null){%>
	  	<td id="gongysmc" height="1px"><%=list3.get(m).getGongysmc()%></td>
		<%}else{ %>
		<td id="gongysmc" height="1px"></td>
		<% }%>		 		 	 
		 
  		 <td id="rongqxh"><%=list3.get(m).getRongqxh()%></td>
  		 <td id="rongqsl" height="1px"><%=list3.get(m).getRongqsl()%></td>
 	     <td id="zhaiy" height="1px">返还</td>
	<%}%>
 </tr> 
 <%} %>
 </table> 
 
 <table frame="void" width="95%"  align="center" >
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
 <br/>


</body>
</t:html>