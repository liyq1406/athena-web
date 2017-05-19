<%@ page language="java" pageEncoding="UTF-8" import="com.athena.authority.entity.LoginUser,com.athena.authority.util.AuthorityUtils" %>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<% 
String path = request.getContextPath();
LoginUser loginUser1 = AuthorityUtils.getSecurityUser();
String usernameInfo1 = loginUser1.getUsername();
%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.cschushcx}">

<!-- 
	  CS初始化计算
	 @author xss
	 @date 2014-9-05
 -->

<head>
<meta http-equiv="pragma" content="no-cache">    
<meta http-equiv="cache-control" content="no-cache">    
<meta http-equiv="expires" content="0">
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.transTime.i18n_cschushjs">

	<t:form id="form_cschushjs" action="/transTime/jisuanCkxCsChushjs.ajax" submit="NOT" dialog="false">
	<t:fieldLayout prefix="cschushjs">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${loginUsercenter}"  convert="queryUserCenterMap"  readonly="true" width="110">
			</t:fieldSelect>
			<t:fieldText property="chanx" caption="${i18n.chanx}" notNull="true" dataType="text" maxLength="5" width="110">
			</t:fieldText>
     <t:fieldSelect property="flag" caption="${i18n.flag}"  convert="flag"  width="110">
			</t:fieldSelect>
			<t:button caption="${i18n.jisuan}" name="jisuan"></t:button>
	</t:fieldLayout>
	</t:form>
	
	
	
		<div class="youi-dialog-container"  style="z-index: 1000; width: 628px; top: 281px; left: 300px; display: none;" id="youi-dialog-form_updPwd2">
  <div class="youi-dialog-titlebar">
    <div>
      <div><a>请输入用户名和密码</a></div>
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
                      <input type="text" class="textInput" style="width:184px;" name="yonghu" id="yonghu" >
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>
              
              
                <tr>
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">密码：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;" >
                      <input type="Password" class="textInput" style="width:184px;" name="mima" id="mima">
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
		
		
	
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['flag'] = {
		'0' : '${i18n.lakong}',
		'1' : '${i18n.tingchan}'
	};


	
	/*提交前事件
	function cschushjs_beforeSubmit(){
	    var params = [];
			
	    var usercenter = trim($('#cschushjs_usercenter').fieldValue());
		var chanx = trim($('#cschushjs_chanx').fieldValue());
			
		params.push("usercenter="+usercenter);	//用户中心
		params.push("chanx="+chanx);	//用户中心
		
				 $.sdcui.ajaxUtil.ajax({
				 url:"../transTime/queryCkxCsChushjs.ajax",
			    data:params.join('&'),
			    success: function(data){ 
			    //alert(data);
			      alert("已盘数量："+data.result.l1+"应盘数量："+data.result.l5);	
			      
			    }
			  });
	     return true;
	}
	*/
	
	
		function form_cschushjs_afterSubmit(result) {
		   var m =  result.result.response;	 
			 if(m=="0000"){
		      alert("操作成功!");			 	
			}
	     }
	     
	
		function func_button_jisuan(){
		var params = [];
			
	    var usercenter = trim($('#cschushjs_usercenter').fieldValue());
		var chanx = trim($('#cschushjs_chanx').fieldValue());		
							    			
		params.push("usercenter="+usercenter);	//用户中心
		params.push("chanx="+chanx);	//用户产线

		var caozuo = trim($('#cschushjs_flag').fieldValue());
		var cx = trim($('#cschushjs_chanx').fieldValue());
		    if(!caozuo){
			  alert("操作不能为空");
			  return false;
		    }
		    if(!cx){
			  alert("产线不能为空");
			  return false;
		    }
	    		
				 $.sdcui.ajaxUtil.ajax({
				 url:"../transTime/queryCkxCsChushjs.ajax",
			    data:params.join('&'),
			    success: function(data){ 
			    //alert(data);
			     //alert("已盘数量："+data.result.l1+"应盘数量："+data.result.l5);	
		    if(caozuo==0){//拉空
		    		if(confirm("当前产线:"+chanx+"\n实盘数量："+data.result.l1+"应盘数量："+data.result.l5+"\n此操作不可逆，请谨慎！请确认已做过拉空操作！")){
		    		 $('#cschushjs_chanx').addClass("disabled").find(".textInput").attr("readonly","true");
                     $('#cschushjs_chanx').addClass("disabled").addClass('readonly');		    
	                 $('#youi-dialog-form_updPwd2').css('display','block');	                 
		             $('#mima').val("");
		             $('#yonghu').val("");
	                 }
		    }else{
		    
		    		if(confirm("当前产线:"+chanx+"\n实盘数量："+data.result.l1+"应盘数量："+data.result.l5+"\n此操作不可逆，请谨慎！")){
		    		$('#cschushjs_chanx').addClass("disabled").find(".textInput").attr("readonly","true");
                    $('#cschushjs_chanx').addClass("disabled").addClass('readonly');
	                $('#youi-dialog-form_updPwd2').css('display','block');	
	                $('#mima').val("");
		            $('#yonghu').val("");
	                 }
		    }    
      
			    }
			  });		  
		    
	}
	
	
	function submitUpdpwd(){
	var params = [];
	var yonghu = $('#yonghu').val().toUpperCase();
	var mima = $('#mima').val();
	
	//alert(${loginUsercenter});
	//alert(<%=usernameInfo1 %>);
		
	var lname="<%=usernameInfo1 %>";
	
	
	
	params.push("username="+yonghu);	//用户名称
	params.push("Password="+mima);	//用户密码
	if(mima==''||yonghu==''){
		alert("用户名和密码不能为空,请重新输入!");
		
	}
	
	if(yonghu!=lname){
	    alert("输入的用户名和当前登录用户名不符,请重新输入!");
	    return false;
	}else{
			 $.sdcui.ajaxUtil.ajax({
			    url: "../transTime/authuserCkxCsChushjs.ajax?username="+yonghu+"&Password="+mima,
			    data:params.join('&'),
			    type:'post', //数据发送方式 
			    dataType:'json', //接受数据格式 
			    data: false , 
			    success: function(data){ 
			    	if(data.flag==1){
                        //alert("验证成功");                    
				    	$('#youi-dialog-form_updPwd2').css('display','none');	
				    	$('#form_cschushjs').form('submit');
			    	}else{
			    		alert("验证失败");
			    		return false;
			    	}
			    }
			  });
		}
	}
	
	function closeDivUpd(){
	$('#Password').val("");
	$('#youi-dialog-form_updPwd2').css('display','none');
}
	
	
	

	
</script>

</t:html>