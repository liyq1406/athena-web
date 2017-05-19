<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.athena.authority.entity.LoginUser,com.athena.authority.util.AuthorityUtils,java.util.List " pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% 
String path = request.getContextPath();
LoginUser loginUser = AuthorityUtils.getSecurityUser();
String usernameInfo = loginUser.getUsername();
String welcome = (String)request.getSession().getAttribute("zbcZxc");
%>

<link href="<%=request.getContextPath()%>/decorators/athena/main.css" type="text/css" rel="stylesheet"></link>
<script type="text/javascript">
<!--
function updatePwd(){
	$('#youi-dialog-form_updPwd').css('display','block');
	$('#newPassword').val("");
}
function shiwtx(){
	$.sdcui.pageUtils.goPage({
		url:'/denglswtx/initWelcome.do',//url
		mode:'form',
		beforeSubmit:function(){
			return true;
		}
	});
}
function submitUpdpwd(){
	var username = $('#usernameInfo').val();
	var oldPassword = $('#oldPassword').val();
	var newPassword = $('#newPassword').val();
	var confirmNewPassword = $('#confirmNewPassword').val();
	if(oldPassword==''){
		alert("旧密码不能为空,请重新输入!");
		return false;
	}	
	if(newPassword==''){
		alert("新密码不能为空,请重新输入!");
		return false;
	}
	if(confirmNewPassword==''){
		alert("确认密码不能为空,请重新输入!");
		return false;
	}
	if(oldPassword==newPassword){
		alert("旧密码与新密码相同,请重新输入新密码!");
	}else{
		if(newPassword==confirmNewPassword){
			$.ajax({ 
			    url: "<%=path %>/authority/updateUserPassword.ajax?username="+username+"&password="+newPassword+"&oldpassword="+oldPassword,
			    type:'post', //数据发送方式 
			    dataType:'json', //接受数据格式 
			    data: false , 
			    success: function(data){ 
			    	alert(data.result);
			    	if(data.flag==1){
				    	$('#oldPassword').val("");
				    	$('#newPassword').val("");
				    	$('#confirmNewPassword').val("");
				    	$('#youi-dialog-form_updPwd').css('display','none');
			    	}else{
			    		$('#oldPassword').val("");
			    	}
			    }
			  });
		}else{
			alert("新密码与确认密码不一致,请重新输入!");
		}
	}

}
function closeDivUpd(){
	$('#oldPassword').val("");
	$('#newPassword').val("");
	$('#confirmNewPassword').val("");
	$('#youi-dialog-form_updPwd').css('display','none');
}
//-->
</script>
 <table  class="header-logo-bg" cellspacing="0" cellpadding="0"> 
 	<tr> 
 		<td class="header-inner-left"> 
 			<div class="header-div"></div> 
 		</td> 
 		<td class="header-content"> 
			
 		</td> 
 		<td class="header-inner-right" style="text-align:center;"> 
	 		<div class="header-div" > </div>   
 		</td> 
 	</tr> 
 </table> 

 <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
 	<tr class="header-bottom"> 
 		<td height="27" class="header-welcome"> 
 		</td> 
 		<td colspan="2" >
 			<%
 			String headMenu = "";
 			List ucList = loginUser.getUcList();
 			String username = loginUser.getUsername();
 			String usercenter = loginUser.getUsercenter();
 			if(username.equals("ROOT")||ucList.contains(usercenter)){
 				if(request.getSession().getAttribute("SYS_LOGIN_H_MENUHTML")!=null){
 	 				headMenu = (String)request.getSession().getAttribute("SYS_LOGIN_H_MENUHTML");
 	 			}else{
 	 				headMenu = "对不起,该用户没有权限,请授权!";
 	 			}  
 			}else{
 				headMenu = "对不起,该用户没有授权该用户中心,请授权!";
 			}
 			
 			%>
 			<%=headMenu %>
 		</td>
 		<td align="right"> 
		<span class="header-btn">您好：<shiro:principal ></shiro:principal> </span>
		<!--帮助平台在新建窗口打开  10685-->
		<a href="http://10.26.218.196/mediawiki/index.php" target="_blank">帮助平台</a>	
		<%
			if(welcome != null && "ZBC".equals(welcome)){
		%>	
				<a href="#" onclick="shiwtx()">事务提醒</a>	
		<%	
			}
		%>
		<a href="#" onclick="updatePwd()">修改密码</a>
		<span class="header-btn logout"><a href="<c:url value='/login.jsp'></c:url>">安全退出</a></span>
 			&nbsp;&nbsp; 
 		</td> 
 	</tr> 
 	<tr class="header-h-split"> 
 		<td width="15%" height="4"></td> 
 		<td width="25%"></td> 
 		<td width="35%"></td> 
 		<td width="100px"></td> 
 	</tr> 
 </table>
 
 <div class="youi-dialog-container"  style="z-index: 1000; width: 628px; top: 281px; left: 300px; display: none;" id="youi-dialog-form_updPwd">
  <div class="youi-dialog-titlebar">
    <div>
      <div><a>修改密码</a></div>
    </div>
    <a class="youi-dialog-titlebar-close" title="关闭" onclick="closeDivUpd()"></a></div>
  <div class="youi-dialog-ml">
    <div class="youi-dialog-mr">
      <div class="youi-dialog-content">
        <form method="POST" action="savePost.ajax" class="youi-form youi-dialog operant-update" style="display: block;" id="form_updPwd">
          <div class="youi-fieldLayout" style="" id="gen_46">
            <table width="100%">
              <tbody>
                <tr>
                  <td class="contral label-col col-0"></td>
                  <td class="contral"></td>
                  <td class="contral label-col col-2"></td>
                  <td class="contral"></td>
                </tr>
                <tr>
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">用户名：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;">
                      <input type="text" class="textInput" style="width:184px;" name="usernameInfo" id="usernameInfo" value="<%=usernameInfo %>" disabled="true">
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>
                <tr>
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">旧密码：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;" >
                      <input type="password" class="textInput" style="width:184px;" name="oldPassword" id="oldPassword">
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>                
                <tr>
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">新密码：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;" >
                      <input type="password" class="textInput" style="width:184px;" name="newPassword" id="newPassword">
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>
                <tr>
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">确认密码：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;">
                      <input type="password" class="textInput value" style="width:184px;" name="confirmNewPassword" id="confirmNewPassword">
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div align="center" class="form-buttons">
            <table>
              <tbody>
                <tr>
                  <td><div class="youi-button active-0" id="button_submit_s">
                      <div class="right">
                        <div class="center"><a class="submit" href="#" ><span onclick="submitUpdpwd()">提 交</span></a></div>
                      </div>
                    </div></td>
                  <td><div class="youi-button active-0" id="button_close">
                      <div class="right">
                        <div class="center"><a class="close" href="#"><span onclick="closeDivUpd()">关闭</span></a></div>
                      </div>
                    </div></td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="youi-dialog-bl">
    <div class="youi-dialog-br">
      <div class="youi-dialog-buttonpane"></div>
    </div>
  </div>
  <div class="dragging-dialog-helper"></div>
</div>