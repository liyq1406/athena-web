<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>

<% 
	String sysDirName = "";
    if(request.getSession().getAttribute("sysDirName")!=null&&!"".equals(request.getSession().getAttribute("sysDirName"))){
    	sysDirName = (String)request.getSession().getAttribute("sysDirName");
    }
%>

<t:html title="权限不足">
	<head>
		<title>神龙零件流系统</title>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			$(function() {
				var w = document.body.scrollWidth; 
				var h = document.body.scrollHeight; 
				var userW = window.screen.availWidth;
				var userH = window.screen.availHeight;
				var sysDirName = '<%=sysDirName %>功能';
				var htmls =[];
//				if((userW-24)>w){
//				   $('body div.layout-panel.panel-north').remove();
//		           $('body td.td-west').remove();
//		           $('body div.layout-panel.panel-south').remove(); 
//			   	 	htmls.push('您无权访问'+sysDirName+'!&nbsp;&nbsp;&nbsp;<button name="btnClose" id="btnClose" onclick="btnClose();">关闭</button>');
//			    
//				}else{
//			    	htmls.push('您无权访问'+sysDirName+'!&nbsp;&nbsp;&nbsp;<button name="btnBack" id="btnBack" onclick="btnBack();">返回</button>');
//				}
				htmls.push('您无权访问'+sysDirName+'!&nbsp;&nbsp;&nbsp;<button name="btnBack" id="btnBack" onclick="btnBack();">返回</button>');
				$('#auth_selectedValues').empty().html(htmls.join(''));
			});
			
				   //自定义返回按钮
		function btnBack(){
			window.history.back();
		}
		function btnClose(){
			window.close();
		}
		</script>
	</head>
	<t:page>
		<div id="auth_selectedValues">
		 	
		</div>
	</t:page>

</t:html>
