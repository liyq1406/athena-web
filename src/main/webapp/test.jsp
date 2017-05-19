<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>

<%@ page import="org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory,org.apache.cxf.endpoint.Client"%>
<%request.setAttribute("pageId","125");%>
<%
String ip = request.getRemoteHost();
if (request.getParameter("ip") != null){
	ip = request.getParameter("ip").toString();
}
if (request.getParameter("post") != null){
	ip += ":"+request.getParameter("post").toString();
}
 String path = request.getContextPath();
 %>
 <%
JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance(); 
String ss = "http://"+ip+"/"+path+"/services/kdysService?wsdl";
Client client = dcf.createClient(ss); 
Object[] objects=client.invoke("executeKdysService", "");    
out.print("KDYS更新结束");
 %>