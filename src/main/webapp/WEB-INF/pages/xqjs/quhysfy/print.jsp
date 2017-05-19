<%@page import="com.athena.xqjs.entity.quhyuns.Yunsfyhz"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.ck.entity.shouhuo.Daohtzd" %>

<%@ page import="com.athena.ck.entity.shouhuo.Uabq" %>

<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17702");%>
<%
Map  map = (Map)request.getAttribute("result");

int pagesize=10;

Map<String,List<Yunsfyhz>> zcmap=(Map)map.get("zcmap");
Map<String,List<Yunsfyhz>> jjmap=(Map)map.get("jjmap");
Map<String,List<Yunsfyhz>> lxmap=(Map)map.get("lxmap");
Map<String, Object> lingxmc=(Map)map.get("lingxmc");
 //out.print(list1.size());
%>

<t:html i18n="i18n.ck">
	<head>
		<title>取货运输费用</title>
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

int pagedx=26;//每页的大小
int count=1; //当前页数
int chengysgs=0;//承运商的个数
for (String key : zcmap.keySet()) {
	List<Yunsfyhz> list1=zcmap.get(key);
	List<Yunsfyhz> list2=jjmap.get(key);
	List<Yunsfyhz> list3=lxmap.get(key);
	int nowpage=0;//该承运商的页数
	int jjcount=0;//急件的总条数
	int zccount=0;//正常件的总条数
	int lxcount=0;//零星件的总条数
	int flag=1;  //紧急件第一次进入
	int flag2=1;//正常件第一次进入
	int jjindex=0; //急件目前写入的行数
	int lxindex=0;//零星件目前写入的行数
	
	int count1=1;  //紧急件第一次进入
	int count2=1;  //紧急件第一次进入
	chengysgs++;
	if(list1!=null){
		zccount=list1.size();
	}
	if(list2!=null){
		jjcount=list2.size();
	}
	if(list3!=null){
		lxcount=list3.size();
	}
//	int zc=zccount;
//	int jj=jjcount+(jjcount % pagedx ==0 ? jjcount/ pagedx : jjcount /pagedx + 1);//紧急件加表头的个数
//	int lx=lxcount+(lxcount % pagedx ==0 ? lxcount / pagedx : lxcount /pagedx + 1)*2;//零星件加表头的个数
//	int pagecount= (zc+jj+lx) % pagedx ==0 ? (zc+jj+lx)  / pagedx :  (zc+jj+lx)  /pagedx + 1;//总页数
	int pagecount= (zccount+(jjcount==0?jjcount:jjcount+1)+(lxcount==0?lxcount:lxcount+2)) % pagedx ==0 ? (zccount+(jjcount==0?jjcount:jjcount+1)+(lxcount==0?lxcount:lxcount+2)) / pagedx :  (zccount+(jjcount==0?jjcount:jjcount+1)+(lxcount==0?lxcount:lxcount+2)) /pagedx + 1;
	int shengysljj= ((zccount+(jjcount==0?jjcount:jjcount+1)) % pagedx==0 && (zccount+jjcount)>0)?pagedx:(zccount+(jjcount==0?jjcount:jjcount+1)) % pagedx;//紧急件最后一页剩余的数量
	int shengyslzc= (zccount % pagedx==0 && zccount>0)?pagedx:zccount % pagedx;//正常件最后一页剩余的数量
	int lingxpage= (zccount+jjcount) % pagedx ==0 ? (zccount+jjcount) / pagedx :  (zccount+jjcount) /pagedx + 1;//正常件加紧急件的总页数
	int zhengcpage= (zccount) % pagedx ==0 ? (zccount) / pagedx :  (zccount) /pagedx + 1;//正常件的总页数
 for(int num=count; num <= Integer.parseInt(map.get("page").toString());num++ ){%>
<% nowpage++;
if(num >=2) {%>
<div class="PageNext"></div>
<%} %>

<table width="100%" frame="void" >
<tr align="center" style="text-align: center;"><div class="text" style=" text-align:center;"><font size="5" ><strong>取货运输费用</strong></font></div></tr>
 
<tr align="center" >


<td align='left'><font size="2"><strong><%=nowpage %></strong> /<strong><%=((zccount+jjcount+lxcount) % pagedx ==0 ? (zccount+jjcount+lxcount) / pagedx :  (zccount+jjcount+lxcount) /pagedx + 1) %></strong>
-<strong><%=chengysgs %></strong> /<strong><%=zcmap.size() %></strong></font> </td>

</table>
<table width="100%"  align="center"  cellSpacing="0" cellPadding="0">
<tr>
<td align="right"><font size="2"><strong>承运商:</strong></font></td>
<td align="left" ><strong><%=key %></strong></td>
<td align="right"><font size="2"><strong>单据号:</strong></font></td>
<td align="left" ><%=map.get("danjh") %></td>
<td align="right" ><font size="2"><strong>单据名称:</strong></font></td>
<td align="left" ><%=map.get("danjmc") %></td>

</tr>

<tr align="center">
<td align="right" ><font size="2"><strong>版次号:</strong></font></td>
<td align="left" ><%=map.get("banch") %></td>
<td align="right"><font size="2"><strong>打印人:</strong></font></td>
<td align="left" ><%=map.get("dayr") %></td>
<td align="right"><font size="2"><strong>打印时间:</strong></font> </td>
<td align="left"><%=map.get("daysj") %></td>
<td align="right" ><font size="2"><strong></strong></font></td>
<td align="left" ></td>
</tr>

</table> 
<br/>
<!-- 如果当前的ULh 和上一条数据的ULH不同的话 就新建一个table 打印  供应商和 子列表-->
<table width="100%" border="0" align="center"   cellSpacing="0" cellPadding="0">
<% //if( (nowpage-1)*pagedx<list1.size())  {%>    
 <tr align="center">
     <td><strong><font size="2">序号</font></strong></td>
	 <td><strong><font size="2">用户中心</font></strong></td>
	 <td><strong><font size="2">供应商代码</font></strong></td>
	 <td><strong><font size="2">运输总费用</font></strong></td>
	 <td><strong><font size="2">运输费用</font></strong></td>
	 <td><strong><font size="2">返空费用</font></strong></td>
	 <td><strong><font size="2">托盘返空费用</font></strong></td>
	 <td><strong><font size="2">托盘费用</font></strong></td>
	 <td><strong><font size="2">零星件费用</font></strong></td>
	 <td><strong><font size="2">立方米单价</font></strong></td>
	 <td><strong><font size="2">返空立方米单价</font></strong></td>
  </tr>
<%
 //}
for(int m=(nowpage-1)*pagedx;(m < nowpage*pagedx && m<list1.size() );m++){
%>   
<tr align="center" >
 <td id="xuh"><%=m+1 %></td>
 <td id="usercenter" style=" font-size: 13px;"><%=list1.get(m).getUsercenter()%></td>
  <td id="gongysdm" style=" font-size: 13px;"><%
	  if(list1.get(m).getGongysdm()!=null &&  list1.get(m).getGongysdm()!=""){ %>
	 <%=list1.get(m).getGongysdm()%>
 <% } %> 
	</td>

 <td id="yunszfy" style=" font-size: 13px;"><%=list1.get(m).getYunszfy()%></td>
 <td id="yunsfy" style=" font-size: 13px;"><%=list1.get(m).getYunsfy()%></td>
 <td id="fankfy" style=" font-size: 13px;"><%=list1.get(m).getFankfy()%></td>
 <td id="tuopfkfy" style=" font-size: 13px;"><%=list1.get(m).getTuopfkfy()%></td>
 <td id="tuopfy" style=" font-size: 13px;"><%=list1.get(m).getTuopfy()%></td>
 <td id="lingxfy" style=" font-size: 13px;"><%=list1.get(m).getLingxfy()%></td>
 <td id="zhengxlfmdj" style=" font-size: 13px;"><%=list1.get(m).getZhengxlfmdj()%></td>
  <td id="fanxlfmdj" style=" font-size: 13px;"><%=list1.get(m).getFanxlfmdj()%></td>
</tr>
 <% }%> 
<% 

if( nowpage >= zhengcpage) { //该承运商正常件的最后一页

if(list2!=null && list2.size()>0){//紧急件不为空
	  if(2<(pagedx-shengyslzc) || nowpage > zhengcpage){ //大于2条数据，是因为紧急件表头有一行，再加一行要显示的数据,或者当前页数大于正常件的总页数
		if(nowpage<=lingxpage){//紧急件已经写完，不需要表头
	%> 
 <tr align="center">
     <td><strong><font size="2">紧急件</font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
  </tr>

  <%
		} 
	  }
  if(list2.size()+1<(pagedx-shengyslzc) ){ //该承运商最后一页的面积足够写入紧急件的数量，加1是加上紧急件的表头
	if( nowpage == (zhengcpage ==0 ? zhengcpage + 1 :zhengcpage )){//正常价写完的那一页，当正常件总页数为0需要加1
	  for(int mm=0;mm < list2.size();mm++){
	  %>   
	  <tr align="center" >
	   <td id="xuh"><%=mm+1 %></td>
	   <td id="usercenter" style=" font-size: 13px;"><%=list2.get(mm).getUsercenter()%></td>
	   <td id="gongysdm" style=" font-size: 13px;"><%=list2.get(mm).getGongysdm()%></td>
	   <td id="yunszfy" style=" font-size: 13px;"><%=list2.get(mm).getYunszfy()%></td>
	   <td id="lingjsl"></td>
	   <td id="lingjsl"></td>
	   <td id="lingjsl"></td>
	   <td id="lingjsl"></td>
	   <td id="lingjsl"></td>
	   <td id="lingjsl"></td>
	    <td id="lingjsl"></td>
	  </tr>
	   <% }}
  }else{
		   
		   if(flag==1){
		   for(int mm=0;mm < pagedx-shengyslzc-1  && mm < list2.size();mm++){//写下正常件打印完的那张纸剩余的部分，减1是减去紧急件的表头
			   jjindex++;
		   
				  %>   
				  <tr align="center" >
				   <td id="xuh"><%=mm+1 %></td>
				   <td id="usercenter" style=" font-size: 13px;"><%=list2.get(mm).getUsercenter()%></td>
				   <td id="gongysdm" style=" font-size: 13px;"><%=list2.get(mm).getGongysdm()%></td>
				   <td id="yunszfy" style=" font-size: 13px;"><%=list2.get(mm).getYunszfy()%></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				    <td id="lingjsl"></td>
				  </tr>
				   <% }
		   flag=2;	//写入完改变状态
		   }else{
			   int ges=0;//每次写入的个数
		   for(int mm= jjindex;(mm < jjindex+pagedx  && mm<jjcount );mm++){
			   ges++;
				  %>   
				  <tr align="center" >
				   <td id="xuh"><%=mm+1 %></td>
				   <td id="usercenter" style=" font-size: 13px;"><%=list2.get(mm).getUsercenter()%></td>
				   <td id="gongysdm" style=" font-size: 13px;"><%=list2.get(mm).getGongysdm()%></td>
				   <td id="yunszfy" style=" font-size: 13px;"><%=list2.get(mm).getYunszfy()%></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				   <td id="lingjsl"></td>
				    <td id="lingjsl"></td>
				  </tr>
				   <% }
		   jjindex+=ges;
	   } %> 

  
<%}}}

if( nowpage >= lingxpage) { //该承运商紧急件的最后一页

if(list3!=null && list3.size()>0){//零星件不为空
	  if(3<(pagedx-shengysljj) || nowpage > lingxpage){ //大于3条数据，是因为零星件表头有两行,或者当前页数大于紧急件的总页数
	%> 
     <tr align="center">
     <td><strong><font size="2">零星件明细</font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
	 <td><strong><font size="2"></font></strong></td>
  </tr>
 <tr align="center">
	 <td><strong><font size="2">序号</font></strong></td>
	 <td><strong><font size="2">用户中心</font></strong></td>
	 <td><strong><font size="2">供应商代码</font></strong></td>
	 <td><strong><font size="2">零星件总费用</font></strong></td>
	 <%for (String k : lingxmc.keySet()) {%>
		 <td><strong><font size="2"><%=lingxmc.get(k)%></font></strong></td>
     
   <%}%>


  </tr>
  <%}
  if(list3.size()+2<(pagedx-shengysljj) ){ //当页的空间写入零星件的数据
		if(  nowpage == (lingxpage==0 ?  lingxpage+ 1 :lingxpage)){//紧急件写完的那页,当正常件加紧急件的总页数为0需要加1
	  for(int mmm=0;mmm < list3.size();mmm++){
	  %>   
	  <tr align="center" >
	   <td id="xuh"><%=mmm+1%></td>
	   <td id="usercenter111" style=" font-size: 13px;"><%=list3.get(mmm).getUsercenter()%></td>
	    <td id="gongysdm" style=" font-size: 13px;"><%
	  if(list1.get(mmm).getGongysdm()!=null &&  list1.get(mmm).getGongysdm()!=""){ %>
	 <%=list1.get(mmm).getGongysdm()%>
 <% } %> 
	</td>
	   <td id="lingxing" style=" font-size: 13px;"><%=list3.get(mmm).getLingxfy()%></td>
	   	     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing1()!=null &&  list3.get(mmm).getLingxing1()!=""){ %>
	 <%=list3.get(mmm).getLingxing1()%><% } %> 
	</td>
		     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing2()!=null &&  list3.get(mmm).getLingxing2()!=""){ %>
	 <%=list3.get(mmm).getLingxing2()%><% } %> 
	</td>
		     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing3()!=null &&  list3.get(mmm).getLingxing3()!=""){ %>
	 <%=list3.get(mmm).getLingxing3()%><% } %> 
	</td>
		     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing4()!=null &&  list3.get(mmm).getLingxing4()!=""){ %>
	 <%=list3.get(mmm).getLingxing4()%><% } %> 
	</td>
		     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing5()!=null &&  list3.get(mmm).getLingxing5()!=""){ %>
	 <%=list3.get(mmm).getLingxing5()%><% } %> 
	</td>
		     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing6()!=null &&  list3.get(mmm).getLingxing6()!=""){ %>
	 <%=list3.get(mmm).getLingxing6()%><% } %> 
	</td>
		     <td id="lingxing" style=" font-size: 13px;"><%
	  if(list3.get(mmm).getLingxing7()!=null &&  list3.get(mmm).getLingxing7()!=""){ %>
	 <%=list3.get(mmm).getLingxing7()%><% } %> 
	</td>

	
	  </tr>
	   <% } }}else{
		   if(flag2==1){
			  
			   for(int mmm=0;mmm < pagedx-shengysljj-2  && mmm<list3.size() ;mmm++){//写下正常件打印完的那张纸剩余的部分，减2是因为零星件有两行表头
				   lxindex++;
					  %>   
					  <tr align="center" >
					   <td id="xuh"><%=mmm+1%></td>
					   <td id="usercenter22" style=" font-size: 13px;"><%=list3.get(mmm).getUsercenter()%></td>
					    <td id="gongysdm" style=" font-size: 13px;"><%
					  if(list1.get(mmm).getGongysdm()!=null &&  list1.get(mmm).getGongysdm()!=""){ %>
					 <%=list1.get(mmm).getGongysdm()%>
				 <% } %> 
					</td>
					   <td id="lingxing" style=" font-size: 13px;"><%=list3.get(mmm).getLingxfy()%></td>
					   	     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing1()!=null &&  list3.get(mmm).getLingxing1()!=""){ %>
					 <%=list3.get(mmm).getLingxing1()%><% } %> 
					</td>
						     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing2()!=null &&  list3.get(mmm).getLingxing2()!=""){ %>
					 <%=list3.get(mmm).getLingxing2()%><% } %> 
					</td>
						     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing3()!=null &&  list3.get(mmm).getLingxing3()!=""){ %>
					 <%=list3.get(mmm).getLingxing3()%><% } %> 
					</td>
						     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing4()!=null &&  list3.get(mmm).getLingxing4()!=""){ %>
					 <%=list3.get(mmm).getLingxing4()%><% } %> 
					</td>
						     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing5()!=null &&  list3.get(mmm).getLingxing5()!=""){ %>
					 <%=list3.get(mmm).getLingxing5()%><% } %> 
					</td>
						     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing6()!=null &&  list3.get(mmm).getLingxing6()!=""){ %>
					 <%=list3.get(mmm).getLingxing6()%><% } %> 
					</td>
						     <td id="lingxing" style=" font-size: 13px;"><%
					  if(list3.get(mmm).getLingxing7()!=null &&  list3.get(mmm).getLingxing7()!=""){ %>
					 <%=list3.get(mmm).getLingxing7()%><% } %> 
					</td>

					
					  </tr>
					   <%
			   }flag2=2;	//写入完改变状态
		   }else{
			   int ges2=0;//每次写入的个数
		   for(int mmm= lxindex;(mmm < lxindex+pagedx  && mmm<lxcount );mmm++){//跟着每次写入的下标继续，写入下标小于总条数，
			   ges2++;
				  %>   
				  <tr align="center" >
				   <td id="xuh"><%=mmm+1%></td>
				   <td id="usercenter333" style=" font-size: 13px;"><%=list3.get(mmm).getUsercenter()%></td>
				    <td id="gongysdm" style=" font-size: 13px;"><%
				  if(list1.get(mmm).getGongysdm()!=null &&  list1.get(mmm).getGongysdm()!=""){ %>
				 <%=list1.get(mmm).getGongysdm()%>
			 <% } %> 
				</td>
				   <td id="lingxing" style=" font-size: 13px;"><%=list3.get(mmm).getLingxfy()%></td>
				   	     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing1()!=null &&  list3.get(mmm).getLingxing1()!=""){ %>
				 <%=list3.get(mmm).getLingxing1()%><% } %> 
				</td>
					     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing2()!=null &&  list3.get(mmm).getLingxing2()!=""){ %>
				 <%=list3.get(mmm).getLingxing2()%><% } %> 
				</td>
					     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing3()!=null &&  list3.get(mmm).getLingxing3()!=""){ %>
				 <%=list3.get(mmm).getLingxing3()%><% } %> 
				</td>
					     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing4()!=null &&  list3.get(mmm).getLingxing4()!=""){ %>
				 <%=list3.get(mmm).getLingxing4()%><% } %> 
				</td>
					     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing5()!=null &&  list3.get(mmm).getLingxing5()!=""){ %>
				 <%=list3.get(mmm).getLingxing5()%><% } %> 
				</td>
					     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing6()!=null &&  list3.get(mmm).getLingxing6()!=""){ %>
				 <%=list3.get(mmm).getLingxing6()%><% } %> 
				</td>
					     <td id="lingxing" style=" font-size: 13px;"><%
				  if(list3.get(mmm).getLingxing7()!=null &&  list3.get(mmm).getLingxing7()!=""){ %>
				 <%=list3.get(mmm).getLingxing7()%><% } %> 
				</td>

				
				  </tr>
				   <% 
		   }
		   lxindex+=ges2;
	   }%> 

  
<%}}}%>
</table> 
<%

//该承运商正常件的最后一页
if(nowpage == pagecount){%>
<br/>
 <table frame="void" width="100%"  align="center" >
 <tr align="center" >
  <td align="left"><strong>承运商签字人：</strong></td>
  <td>&nbsp;</td>
  <td align="left"></td>
   <td>&nbsp;</td>
  <td align="left"></td>
   <td>&nbsp;</td>
  <td align="left"><strong>DPCA确认：</strong></td>
   <td>&nbsp;</td>
 </tr>
 <tr align="center" >
  <td align="left"><strong>日期：</strong></td>
  <td>&nbsp;</td>
  <td align="left"></td>
   <td>&nbsp;</td>
  <td align="left"></td>
   <td>&nbsp;</td>
  <td align="left"><strong>日期：</strong></td>
   <td>&nbsp;</td>
 </tr>
</table>
 <br/>

<%
//正常件加紧急件数据的总页数如果为奇数需要加二
if((pagecount%2)==1){
	count=count+2;
	%>
	<div class="PageNext"></div>
	<%
}else{
	count++;//当前页加1
}

	break;
}
 }}%>

 


</body>
</t:html>