<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<% 
LoginUser loginU = AuthorityUtils.getSecurityUser();
String usernameI = loginU.getUsername();
%>
<t:html title="title.index" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
		<script type="text/javascript">
			function   Trim(m){   
			  while((m.length>0)&&(m.charAt(0)==' '))   
			  m   =   m.substring(1, m.length);   
			  while((m.length>0)&&(m.charAt(m.length-1)==' '))   
			  m = m.substring(0, m.length-1);   
			  return m;   
			}
			$.sdcui.serverConfig.convertArray['biaos']={'1':'是','0':'否'};
			
			function initPage(){
				getGridHeight();
			}
			function func_grid_authorize(){
			    var users = $('#grid_user').grid('getSelectedRecords')[0];
				var value = users.id;
				$("#ucPosts_tree .treeNode .treeNode").find('ul').attr('style','display:none;');
				var hasExp = $("#ucPosts_tree .treeNode").children().find('li');
				for(var j = 0;j<hasExp.length;j++){
					var nextExp = hasExp[j];
					var expandName = nextExp.className;
					if(expandName.indexOf("expanded") > 0){
						var nestId = nextExp.id;
						$('#'+nestId).removeClass('expanded');
					}
		        }
				var treeRoot = $("#ucPosts_tree").children().find("li.treeNode.post");
				var length = treeRoot.length;
				for(var i=0;i<length;i++){
					var treeNode = treeRoot[i];
					var id = treeNode.id;
					$('#'+id).removeClass('selected');
					$('#'+id).removeClass('radio-checked');
					$('#'+id).find('a').removeClass('selected');
				}		
				$('#ucPosts_tree').removeClass("radio-checked");
				var checks = new   Array() ;
				$.sdcui.ajaxUtil.ajax({
					url:'listUserPost.ajax?id='+value,
					success:function(result){
						//
						$.each(result.result, function(i, item) {
							var postCode = item.POST_CODE;
							$('#ucPosts_tree #'+postCode).addClass("radio-checked");
						});
						$('#form_authorize').form('open');
					}
				});
	
			}
			function ucPosts_tree_change(){
				var treeNode = $(this);
				var treeNodeParent = treeNode.parent().parent().attr('id');
				if(treeNodeParent=='WULGYY'){
					var treeNodeJIHUAY = $("#JIHUAY").children().find("li.treeNode.post");
					var length = treeNodeJIHUAY.length;
					for(var i=0;i<length;i++){
						var treeNodeChildren = treeNodeJIHUAY[i]
						var id = treeNodeChildren.id;
						if($('#ucPosts_tree #'+id).hasClass('radio-checked')){
							alert("计划员与物流工艺员只能选择一个,请重新选择!");
							treeNode.removeClass('selected');
							treeNode.find('a').removeClass('selected');
							return false;
						}
					}
				}
				if(treeNodeParent=='JIHUAY'){
					var treeNodeJIHUAY = $("#WULGYY").children().find("li.treeNode.post");
					var length = treeNodeJIHUAY.length;
					for(var i=0;i<length;i++){
						var treeNodeChildren = treeNodeJIHUAY[i];
						var id = treeNodeChildren.id;
						if($('#ucPosts_tree #'+id).hasClass('radio-checked')){
							alert("计划员与物流工艺员只能选择一个,请重新选择!");
							treeNode.removeClass('selected');
							treeNode.find('a').removeClass('selected');
							return false;
						}
					}
				}
				if(treeNode.hasClass('post')){
					var checkStyle = 'radio-checked';
					treeNode.parent().children().removeClass(checkStyle);
					treeNode.addClass(checkStyle);
				}
			}
			function func_grid_resetPassword(){
			    var loginnameGrid = $('#grid_user').grid('getSelectedRecords');
			    if(loginnameGrid.length == 0){
			   	 	alert("选择的数据为空!");
			   	 	return false;
			    }
			    var params = [];
			    for(var i=0;i<loginnameGrid.length;i++){
			    	if("ROOT" == loginnameGrid[i].loginname){
			    		alert("ROOT用户不允许重置密码!");
			    		return false;
			    	}
			        params.push($.sdcui.parameterUtils.propertyParameter("userIds["+i+"]",loginnameGrid[i].id));
			    }
			    $.sdcui.ajaxUtil.ajax({
					url:'resetPassword.ajax',
					data:params.join('&'),
					success:function(result){
						//
						alert("重置密码成功!");
					}
				});
			}
			
			function form_authorize_beforeSubmit(){
			    var users = $('#grid_user').grid('getSelectedRecords')[0];
				var value = users.id;
				var htmls =[];
				var treeNode = $("#ucPosts_tree .treeNode .treeNode.radio-checked");
				for(var i=0;i<treeNode.length;i++){
					var node = treeNode[i];
					var id = node.id;
					htmls.push('<input type="hidden" name="sysPosts['+i+']" class="extra-field" value="'+id+'"/>');
				}
			    htmls.push('<input type="hidden" name="userId" class="extra-field" value="'+value+'"/>');
			    $('#post_selectedValues').empty().html(htmls.join(''));
			   
			    return true;
			}
			function form_authorize_afterSubmit(result){
				alert(result.result.msg);
			    $('#grid_user').grid("reload");
			    $('#form_authorize').form("close");
			    return true;
			}
			function form_user_beforeSubmit(){
			    var loginname = $('#record_loginname').fieldValue();
				var name = $('#record_name').fieldValue();
				loginname = Trim(loginname);
				name = Trim(name);
				if(loginname==''||name==''){
					alert("登录名、用户名不能为空格!");
					return false;
				}
				return true;
			}
			/**
			*全部停用
			*/
			function func_grid_toggleActive(){
				var user = $('#grid_user').grid('getSelectedRecords');
				var biaos = "";
				var username = "<%=usernameI%>";
				if("ROOT" == user[0].loginname && username != "ROOT"){
					alert("您没有权限停用ROOT账户!");
					return false;
				}
				if(user[0].biaos!=null){
					biaos = user[0].biaos;
				}else{
					biaos = "";
				}
				if(biaos!=null&&biaos!=""){
					var params = [];
				    params.push($.sdcui.parameterUtils.propertyParameter("userIds[0]",user[0].id));
				    params.push($.sdcui.parameterUtils.propertyParameter("actives[0]",biaos));
				    if(confirm("确认启/停用户?")){
				    	$.sdcui.ajaxUtil.ajax({
						url:'changeUserActive.ajax',
						data:params.join('&'),
						success:function(result){
							//
							if(biaos==null||biaos=='0'){
								alert("用户启用成功!");
							}else{
								alert("用户停用成功!");
							}
							$('#grid_user').grid('reload');
						}
						});
				    }
				}else{
					alert("该数据无效，请与管理员联系!");
				}
			}
			//置空单选按钮
			function zk(id){
				var treeRoot = $("#"+id).children().find("li.treeNode.post");
				var length = treeRoot.length;
				for(var i=0;i<length;i++){
					var treeNode = treeRoot[i];
					var id = treeNode.id;
					$(treeNode).removeClass('radio-checked');
					$(treeNode).removeClass('selected');
					$(treeNode).find('a').removeClass('selected');
				}		
			}
		</script>
		<style>
			#ucPosts_tree.youi-tree ul li.treeNode.post span{
				background-image:url('../styles/default/images/grid/radio.gif');
				background-position: 5px 3px;
			}
			#ucPosts_tree.youi-tree ul li.treeNode.post span a{
				background:white;
			}
			#ucPosts_tree.youi-tree ul li.treeNode.post.radio-checked span{
				background-position: 5px -11px;
			}
			.qc{
				background: url("../styles/icon/remove.gif") no-repeat scroll 0 0 transparent;
				cursor: pointer;
			    height: 16px;
			    line-height: 16px;
			    padding: 1px 0 0 18px;
			    vertical-align: bottom;
			}
		</style>
	</head>
	<t:page i18n="i18n.authority.user">
		<t:grid id="grid_user" 
			idKeys="id" showCheckbox="true"
			dataFormId="form_user"
			caption="用户列表" add="增加"  remove="NOT"
			src="queryUser.ajax"
			editSrc="getUser.ajax" showNum="true" load="false" back="NOT">
			<t:fieldLayout columns="3" >
				<t:fieldSelect width="100" property="usercenter" caption="${i18n.usercenter}" src="getRoleucByPostCode.ajax"  code="USERCENTER" show="USERCENTER" />
				<t:fieldText width="100" property="loginname" caption="${i18n.loginname}"/>
				<t:fieldText width="100"  property="name" caption="${i18n.name}"/>
				<t:fieldSelect width="100"  property="biaos" caption="是否启用" convert="biaos"></t:fieldSelect>
				<t:fieldSelect width="100" property="deptid" caption="部门" convert="queryAllDept" />
				<t:fieldText width="100"  property="userpost" caption="所属用户组"/>
			</t:fieldLayout>
			
			<t:button name="resetPassword" caption="重置密码"></t:button>
			<t:button name="authorize" active="1" caption="用户组分配"/>
			<t:button name="toggleActive" active="1" caption="启/停"/>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap"></t:gridCol>
			<t:gridCol orderBy="asc" property="loginname" caption="${i18n.loginname}"></t:gridCol>
			<t:gridCol property="name" caption="${i18n.name}"/>
			<t:gridCol property="cellphone" caption="${i18n.cellphone}"/>
			<t:gridCol property="officephone" caption="${i18n.officephone}"/>
			<t:gridCol property="deptid" caption="部门" convert="queryAllDept" width="150"/>
			<t:gridCol property="biaos" width="80"  caption="是否可用" convert="biaos"/>
			<t:gridCol property="userpost" caption="所属用户组"/>
		</t:grid>
		<!-- 用户添加弹出窗口 -->
		<t:form dialog="true" id="form_user" caption="用户" action="saveUser.ajax" reset="NOT" idKeys="usercenter,loginname">
			<t:fieldLayout prefix="record">
				<t:fieldHidden property="id"/>
				<t:fieldHidden property="flag" defaultValue="1"/>
				<t:fieldHidden property="active"  defaultValue="1"/>
				<t:fieldHidden property="isAdmin"  defaultValue="0"/>
				<t:fieldHidden property="validateFlag"  defaultValue="1"/>
				
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" src="getRoleucByPostCode.ajax"  code="USERCENTER" show="USERCENTER"  notNull="true"/>
				<t:fieldText  property="loginname" caption="${i18n.loginname}" notNull="true" expression="^[A-Za-z0-9]+$"  expressionMessage="登录名只能为数字或字母" minLength="3"  maxLength="16"/>
				<t:fieldText property="name" caption="${i18n.name}" notNull="true" expression="^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$"  expressionMessage="用户名不能含有特殊字符" minLength="2" maxLength="20"/>
				<t:fieldText property="cellphone" caption="${i18n.cellphone}" expression="^[0-9]+$" expressionMessage="手机号码只能为数字" minLength="11" maxLength="11"/>
				<t:fieldText property="officephone" caption="${i18n.officephone}" expression="^[0-9]+$" expressionMessage="电话号码只能为数字" minLength="4" maxLength="20"/>
				<t:fieldSelect property="deptid" caption="部门" convert="queryAllDept" />
			</t:fieldLayout>
		</t:form>
		
		<!-- 岗位分配窗口  -->
		<t:form reset="NOT" dialog="true" id="form_authorize" caption="用户组分配"
			action="saveRPostUser.ajax">
			<fieldset>
				<legend>用户组分配</legend>
				<div style="width:500px;height:300px;overflow:auto;">
					<t:tree id="ucPosts_tree" tree="${postTree}" />
				</div>
			</fieldset>
			<div id="post_selectedValues">
			 	
			 </div>
		</t:form>
		
	</t:page>
</t:html>
