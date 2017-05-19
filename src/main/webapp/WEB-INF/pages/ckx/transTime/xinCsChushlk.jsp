<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<% 
String path = request.getContextPath();
LoginUser loginUser1 = AuthorityUtils.getSecurityUser();
String usernameInfo1 = loginUser1.getUsername();
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.cschushcx}">

<!-- 
	  CS初始化拉空
	 @author xss
	 @date 2014-9-05
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.transTime.i18n_cschushlk">
	<t:grid id="grid_cschushlk" caption="${i18n.cschushlk}" idKeys="usercenter,chanx" src="/transTime/xinQueryCkxCsChushlk.ajax" 
		add="NOT" edit="NOT" back="NOT" scrollHeight="335" pageSize="15"
		editable="true"  saveRowsSrcs="/transTime/xinLakongCkxCsChushlk.ajax" 
		load="false"  showNum="true"  afterSaveRowsEvent="afterSaveRows"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" 
		>
		
        <t:fieldLayout id="fl_kuwdj" prefix="cschushlk" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${loginUsercenter}"  convert="queryUserCenterMap"  readonly="true" width="110"/>
			<t:fieldText property="shengcxbh" caption="${i18n.chanx}" notNull="true" dataType="text" maxLength="5" width="110"/>
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" width="110"/>
			</t:fieldLayout>

        <t:button caption="${i18n.lakong}" name="lakong" active="1"></t:button>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"/>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"/>
		<t:gridCol property="xiaohcbh" caption="${i18n.xiaohcbh}" width="120"/>
		<t:gridCol property="xiaohcmc" caption="${i18n.xiaohcmc}" width="120"/>	
		<t:gridCol property="dangqtc" caption="当前趟次" width="120"/>
		<t:gridCol property="jieslsh" caption="结束流水号" width="120" editor="fieldText"/>
	
		<t:gridCol property="pianycws" caption="偏移车位数" width="120"/>
		<t:gridCol property="xunhcss" caption="循环车身数" width="120"/>
		<t:gridCol property="beihtqcss" caption="备货提前车身数" width="120"/>
		<t:gridCol property="shangxtqcss" caption="上线提前车身数" width="120"/>
		
		<t:gridCol property="jianglcssxr" caption="将来参数生效日期" width="120"/>
		<t:gridCol property="jianglpycws" caption="将来偏移车位数" width="120"/>
		<t:gridCol property="jianglxhcss" caption="将来循环车身数" width="120"/>
		<t:gridCol property="jianglbhtqcss" caption="将来备货提前车身数" width="120"/>
		<t:gridCol property="jianglsxtqcss" caption="将来上线提前车身数" width="120"/>
	</t:grid>

		<div class="youi-dialog-container"  style="z-index: 1000; height:280px; width: 400px; top: 140px; left: 300px; display: none;" id="youi-dialog-form_updPwd2">
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
            <table width="100%" height="280px">
              <tbody>
                <tr height="40px">
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">用户名：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;">
                      <input type="text" class="textInput" style="width:184px;" name="yonghu" id="yonghu" >
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>
                <tr height="40px">
                  <td class="field-label notNull"><label for="fieldText-formPost_postCode">密码：</label></td>
                  <td class="field-content"><div class="youi-field fieldText" style="width:200px;" >
                      <input type="password" class="textInput" style="width:184px;" name="mima" id="mima">
                      <div class="field-invalid"></div>
                    </div></td>
                </tr>  
                <tr height="210px"></tr>              
 

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
	$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'0' : '${i18n.one}',
		'1' : '${i18n.two}',
		'2' : '${i18n.three}',
		'3' : '${i18n.four}',
		'4' : '${i18n.five}'
	};

	/*空格查询
	function grid_cschushlk_beforeSubmit() {

		$("#kuwdj_cangkbh").fieldValue(trim($("#kuwdj_cangkbh").fieldValue()));
		$("#kuwdj_kuwdjbh").fieldValue(trim($("#kuwdj_kuwdjbh").fieldValue()));
		
	}
	*/

	//保存按钮
	function func_button_save() {
		$('#grid_cschushlk').grid('saveRows');
	}

	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			alert(result.result);
			return false;
		}
		$('#grid_cschushlk').grid('reload');	
		alert("拉空重算成功");	
		return true;	
	}
	
	function preSaveEvent(){		
		$('#form_kuwdjbz').form('submit');
		return false;
	}
	
	/*
	function func_button_submit_kwdj(){

		if($("#kwdjbz").grid("isEditedCell")){
			$("#kwdjbz").grid("saveRows");
		}else{			
			$('#form_kuwdjbz').form('submit');
		}
	}
	*/
	
	
	function func_button_lakong(){
	  if(confirm("此操作不可逆，请谨慎！")){
	    $('#cschushlk_chanx').addClass("disabled").find(".textInput").attr("readonly","true");
        $('#cschushlk_chanx').addClass("disabled").addClass('readonly');	
	    $('#youi-dialog-form_updPwd2').css('display','block');
		$('#mima').val("");
		$('#yonghu').val("");
	  }
	}
	
	
	
	function submitUpdpwd(){
	var params = [];
	var yonghu = $('#yonghu').val().toUpperCase();;
	var mima = $('#mima').val();
	
	var lname="<%=usernameInfo1 %>";
	
	params.push("username="+yonghu);	//用户名称
	params.push("Password="+mima);	//用户密码
	if(mima==''||yonghu==''){
		alert("用户名和密码不能为空,请重新输入!");
		return false;
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
				    	    func_button_save();
				    		//$('#form_cschushlk').form('submit');
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