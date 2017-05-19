<%@ page language="java" contentType="text/html; charset=utf-8"
    import="org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory,org.apache.cxf.endpoint.Client" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 String ip = request.getRemoteHost();
 String path = request.getContextPath();
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<%
JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance(); 
Client client = dcf.createClient("http://"+ip+":8085/"+path+"/services/kdysService?wsdl"); 
Object[] objects=client.invoke("getKdysInfo", "");    
out.print("KDYS更新结束");
JaxWsDynamicClientFactory dcf1 = JaxWsDynamicClientFactory.newInstance(); 
Client client1 = dcf1.createClient("http://"+ip+":8085/"+path+"/services/ziykz?wsdl"); 
Object[] objects1=client1.invoke("ziyhqrqManage", "");    
out.print("资源快照删除结束");
 %>
</body>
</html>