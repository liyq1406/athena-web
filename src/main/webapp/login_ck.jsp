<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/pages/include.jsp" %>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
<head>
	<title>${i18n.title}${i18n.zhuy}</title>
	<jsp:include page="/WEB-INF/pages/common/js.jsp" />
	 <%
   		org.apache.shiro.SecurityUtils.getSubject().logout();
	%>
    <script type="text/javascript">
    
    	$(function(){
			$('#form_user_index').form({
				fields:[
						{fieldType:'fieldText',property:'username',caption:'${i18n.username}',notNull:true},
						{fieldType:'fieldText',property:'password',type:'password',caption:'${i18n.password}',notNull:true},
						{fieldType:'fieldSelect',property:'agencyId',caption:'${i18n.usercenter}',notNull:true}
					]
			 });

			$('#btn_ok').bind('click',function(){
				//设置用户中心值
				var text = $("#agencyId input").val();
				var realValue = $("#agencyId input").attr("realValue");
				$("#agencyId input").val(realValue)
	    		document.loginform.submit();
				$("#agencyId input").val(text)
	    	});
			
			$(document).bind('enter',function(){
				 $('#btn_ok').click();
			});
			
			$("#agencyId").bind("keydown", function (domEven) {
		   		 var eCode = domEven.keyCode ? domEven.keyCode : domEven.which;
		   		 if(eCode == 13){
		   			$('#btn_ok').click();
		   		 }
	   		});
			
			$(document).keyboardsupport({});
		});
    	
	    $(document).ready(function(){
	    	<%-- var url = "<%=request.getContextPath()%>/common/userCenter.do";
	    	ajaxRequestNoParams(url, function(results){
	    		if (results.result && results.result.length > 0){
	    			$.each(results.result,function(idx,item){
						$("#agencyId").append("<option value='"+item.id+"'>"+item.name+"</option>");
					}); 
	    		}
			});  --%>
			//设置默认数据
			var dataSource =[];
			dataSource.push("{name:'abc',value:'abc'}")
			dataSource.push("{name:'一厂、二厂',value:'UW'}")
			dataSource.push("{name:'三厂',value:'UL'}")
			dataSource.push("{name:'襄阳',value:'UX'}")
			dataSource.push("{name:'wh1',value:'wh1'}")
			$("#username input").val('ck')
	    	$("#password input").val('123456')
	    	$("#agencyId input").val('abc')
	    	$("#agencyId input").attr("realValue","abc");
			$("#agencyId input").attr("dataSource",dataSource);
	    	$("#username input").focus();
	    });
    </script>
</head>
<body>
<div style="margin:0 auto;width:100%;position:absolute; left:35%; top:30%">
		<form id="loginform" class="login-form" name="loginform" action="" method="post" style="width:300px;" >
			<div id="form_user_index" class="ui-fieldLayout">
			   <table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.username}:</td>
							<td><div class="ui-field" id="username"></div></td>
						</tr>
						<tr>
							<td>${i18n.password}:</td>
							<td><div class="ui-field" id="password"></div></td>
						</tr>
						<tr>
							 <td>${i18n.usercenter}:</td>
							<td><div class="ui-field" id="agencyId"></div></td>
						</tr>
 							<tr>
			        	<td colspan="2" align="center">
			        		<%=com.athena.authority.util.AuthorityUtils.convertLoginErrorMessage(request)%>
			        	</td>
				        </tr>
				        <tr>
				            <td colspan="2" align="center"><span id="btn_ok" class="ui-button">${i18n.dengl}[Enter]</span></td>
				        </tr>
					</tbody>
				</table> 
			</div>
		</form>
		</div>
</body>
</t:html>
