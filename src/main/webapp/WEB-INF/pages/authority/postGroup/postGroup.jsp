<%@ page language="java" pageEncoding="UTF-8" import="com.toft.ui.tags.UiConstants,java.util.Map,java.util.List" %>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<t:html title="角色管理">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<link type="text/css" rel="stylesheet" 
href="<c:url value="/styles/authority/role.css"/>"/>
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
		//所有的
		$("div.tree-trigger").click(function(){
			//获取当前节点的上级节点的ID
			var id = $($(this).parent()).attr("id");
			func_grid_selectChildNode(id);
		});
	}
	/**
	 * 功能授权
	 */
	/**function func_grid_authorize(){
		var postGroupData = $('#grid_postGroup').grid('getSelectedRecords')[0];
		if(postGroupData){
			$('#authorized_postGroupId').fieldValue(postGroupData.postGroupId);
			$.sdcui.ajaxUtil.ajax({
			url:'getRoleMenuAndButtonIds.ajax?postGroupId='+postGroupData.postGroupId,
			success:function(result){
				//
				var ids = new Array();
				//ids.push("tree_root_menu");
				$.each(result.result, function(i, item) {
					ids.push(item.FUNC_ID+'menu');
				});
				$("#tree_menu_result").tree("checkedTreeNodes",ids);
				document.getElementById("tree_root_menu").className ="treeNode tree_root_menu check last expandable lastExpandable expanded partchecked";
				document.getElementById("tree_root_menu").childNodes[1].className ="tree-span treeNode tree_root_menu check last expandable lastExpandable expanded partchecked";
				
				//不展开结点
				$("li.treeNode").removeClass("expanded");
				$("li.treeNode").children('span').removeClass("expanded");
				$("li.treeNode").find('ul:first').hide();
				$('#form_authorize').form('open');
			}
		});
		}
	}
	*/
	
	
	/*******ajax展开事件*****/
	function func_grid_selectChildNode(id){
			//如果ID号为空,则返回
			if(id==null||id.length==0){
				return ;
			}
			
		_node = $("#tree_menu_result").tree("getNodeById",id);
			//如果存在子结点,则直接返回
			if(_node.find('li.treeNode').length>0){
				return ;
			}
		//如果是收缩操作，则不做任何事
		if(_node.hasClass('expanded')){
		     return ;
		}
		id = id.substring(0,id.length-4);
		  //加载子结点 
	 $.sdcui.ajaxUtil.ajax({
			url:'postGroupExpandByparentId.ajax?id='+id+"&parentId="+id,
			success:function(result){
			//如果没有子结点，则直接返回
			if(result.result==null||result.result.length==0){
				_node.removeClass("expandable");
				_node.removeClass("lastExpandable");
				_node.children('span').removeClass("expandable");
				_node.children('span').removeClass("lastExpandable");
				return;
			}
			//新增子结点
			$.each(result.result, function(i, item) {
			         $("#tree_menu_result").tree("addNode",_node,item.id,item.text);
			         var _tmp  = $("#tree_menu_result").tree("getNodeById",item.id);
			         //alert("hello");
			         // tmp.addClass('expandable check  last expandable');
			         //可展开 expanded    可选择 checked
			         _tmp.addClass('expandable check  last treeNode lastExpandable');
			         //显示+号
			         _tmp.children('span').addClass('tree-span expandable check  last lastExpandable treeNode');
					 //绑定事件啦	
					 $("li#"+item.id+" div.tree-trigger").click(function(){
						var id = $($(this).parent()).attr("id");
						func_grid_selectChildNode(id);
					  });
				
				});
				var postGroupId = $('#authorized_postGroupId').fieldValue();
				$.sdcui.ajaxUtil.ajax({
						url:'getChildMenuByparentid.ajax?postGroupId='+postGroupId+'&parentId='+id,
						success:function(result){
							//
							var ids =  $("#tree_menu_result").tree("getCurrentCheckedIds");
							$.each(result.result, function(i, item) {
								ids.push(item.FUNC_ID+'menu');
							});
							$("#tree_menu_result").tree("checkedTreeNodes",ids);
							document.getElementById("tree_root_menu").className ="treeNode tree_root_menu check last expandable lastExpandable  partchecked expanded";
							document.getElementById("tree_root_menu").childNodes[1].className ="tree-span treeNode tree_root_menu check last expandable lastExpandable  partchecked expanded";
						}
					});
			}
			
			});
	
	}

	/**
	*自定义删除
	*/
	function func_grid_removeSelected(){
		var postGroupData = $('#grid_postGroup').grid('getSelectedRecords');
		var value = postGroupData[0].postGroupId;
		var usercenter = postGroupData[0].usercenter;
		if(confirm("只能删除未使用的角色，确认删除?")){
			 $.sdcui.ajaxUtil.ajax({
				url:'delPostGroup.ajax?postGroupId='+value+'&usercenter='+usercenter,
				success:function(result){
					//
					if(result.result=='-1'){
						alert("请确认该角色未被使用");
					}else{
						alert("删除成功");
						$('#grid_postGroup').grid("reload");
					}
				}
			});
		}
	}

	function form_postGroup_beforeSubmit(){
		//var id = $('#record_id').fieldValue();
		var postGroupId = $('#record_postGroupId').fieldValue();
		var postGroupName = $('#record_postGroupName').fieldValue();
		var postGroupId = Trim(postGroupId);
		postGroupName = Trim(postGroupName);
		if(postGroupId==''||postGroupName==''){
			alert("角色代码、角色名称不能为空格!");
			return false;
		}
		return true;
	}
	function form_authorize_beforeSubmit(){
		var postGroupId  = $('#authorized_postGroupId').fieldValue();
		var treeNodeChecked = $('#tree_menu_result').tree("getCurrentCheckedIds");
		var htmls =[];
		for(var i=0;i<treeNodeChecked.length;i++){
			var node = treeNodeChecked[i];
			var value = "";
			if($('#'+node).hasClass('partchecked')){
				if(node!='tree_root_menu'){
					value = node.substring(0,node.length-4)+"-0";
				}else{
					value = node+"-0";
				}
				
			}else if($('#'+node).hasClass('checked')){
				if(node!='tree_root_menu'){
					value = node.substring(0,node.length-4)+"-1";	
				}else{
					value = node+"-1";
				}
			}
			htmls.push('<input type="hidden" name="menuAndButtonIds['+i+']" class="extra-field" value="'+node.substring(0,node.length-4)+'"/>');
			htmls.push('<input type="hidden" name="menuAndButtonIdsType['+i+']" class="extra-field" value="'+value+'"/>');
		}
		htmls.push('<input type="hidden" name="postGroupId" class="extra-field" value="'+postGroupId+'"/>');
		$('#post_menuAndButtonIds').empty().html(htmls.join(''));
		return true;
	}
	function form_authorize_afterSubmit(result){
		$('#grid_postGroup').grid('reload');
		$('#form_authorize').form('close');
	} 
	
	
	function func_button_addPostGroup(){
		$('#form_postGroup').form('clear');
	}
	
	//begin by gswang
	var createChkbox= function (v){
		var value = "";
		if(1==v){
			return '<input type="checkbox" id="chkboxname" name="chkboxname" value=\''+v+'\'  checked />';
		}else{
			return '<input type="checkbox" id="chkboxname" name="chkboxname" value=\''+v+'\'  />';
		}
	}
	
	/**
	*选定一条记录
	*/
	function selectRow(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		var fun = this.element[0].id;
        if(checkbox.type == 'checkbox'){
        	var ischeck = "0";
        	var isButton = "0";
			if(checkbox.checked){
				ischeck = "1";
			}
			if(fun != "grid_auth_but"){
				isButton = "1";
			}
			checkUpper(selectedrecord,ischeck,isButton);
			$.sdcui.ajaxUtil.ajax({
				url:'updateMenuAuth.ajax?postGroupId='+$("#authorized_postGroupId").fieldValue()+'&ischeck='+ischeck+'&treeId='+selectedrecord.treeId+'&flag='+isButton,
				success:function(result){
					selectFun(fun,selectedrecord,"");
					
				}
			});
		}else{
			selectFun(fun,selectedrecord,"");
		}
		return true;
   }
	
	/**
	*更新上级菜单的勾选状态
	*/
	function checkUpper(selectedrecord,ischeck,isButton){
		if(ischeck=="1"){
			var treeids = selectedrecord.treeId;
			var strs= new Array();
			strs=treeids.split("_");
			strs.pop();
			for(var i = strs.length-1;i>=0;i--){
				strs=treeids.split("_");
				strs.pop();
				treeids = strs.join("_");
				$('#box').find( 'tr[id="'+treeids+'"]').find('input').attr('checked','checked');
				var tt = 11;
			}
		}	
	}
	
	/**
	*判断对哪级菜单做操作
	*/
	function selectFun(fun,selectedrecord,rowIndex){
		if(fun == "grid_auth_01"){
			grid_auth_01_ch(fun,selectedrecord, rowIndex);
		}else if(fun == "grid_auth_02"){
			grid_auth_02_ch(fun,selectedrecord, rowIndex);
		}else if(fun == "grid_auth_03"){
			grid_auth_03_ch(fun,selectedrecord, rowIndex);
		}else if(fun == "grid_auth_04"){
			grid_auth_04_ch(fun,selectedrecord, rowIndex);
		}else if(fun == "grid_auth_05"){
			grid_auth_05_ch(fun,selectedrecord, rowIndex);
		}else if(fun == "grid_auth_06"){
			grid_auth_06_ch(fun,selectedrecord, rowIndex);
		}
	}
	
	function initPage(){
		//查询页面子表隐藏
		$('#grid_auth_02').parent().parent().hide();
		$('#grid_auth_03').parent().parent().hide();
		$('#grid_auth_04').parent().parent().hide();
		$('#grid_auth_05').parent().parent().hide();		
		$('#grid_auth_06').parent().parent().hide();
		$('#grid_auth_but').parent().parent().hide();		
	}

	function func_grid_authorize(){
		var postGroupData = $('#grid_postGroup').grid('getSelectedRecords')[0];
		if(postGroupData){
			$('#authorized_postGroupId').fieldValue(postGroupData.postGroupId);
			$('#field_auth_01_postGroupId').fieldValue(postGroupData.postGroupId);
			$("#form_authorize").form("open");
			initPage();
			$("#grid_auth_01").grid("reload");
		}
	}
	
	function grid_auth_01_ch(fun,record, rowIndex) {
		$("#field_auth_02_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_02_treeId").fieldValue(trim(record.treeId));
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_but_treeId").fieldValue(trim(record.treeId));		
		$('#grid_auth_03').parent().parent().hide();
		$('#grid_auth_04').parent().parent().hide();	
		$('#grid_auth_05').parent().parent().hide();
		$('#grid_auth_06').parent().parent().hide();	
		$('#grid_auth_but').parent().parent().hide();
		
		$('#grid_auth_02').grid('reload',false,[],true);
		$('#grid_auth_02').parent().parent().show();
		$('#grid_auth_but').grid('reload',false,[],true);
		$('#grid_auth_but').parent().parent().show();	

	}
	
	function grid_auth_02_ch(fun,record, rowIndex) {
		$("#field_auth_03_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_03_treeId").fieldValue(trim(record.treeId));
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_but_treeId").fieldValue(trim(record.treeId));

		
		$('#grid_auth_03').grid('reload',false,[],true);
		$('#grid_auth_03').parent().parent().show();
		$('#grid_auth_but').grid('reload',false,[],true);
		$('#grid_auth_but').parent().parent().show();
		
		$('#grid_auth_04').parent().parent().hide();
		$('#grid_auth_05').parent().parent().hide();
		$('#grid_auth_06').parent().parent().hide();		
	}
	
	function grid_auth_03_ch(fun,record, rowIndex) {
		$("#field_auth_04_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_04_treeId").fieldValue(trim(record.treeId));
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_but_treeId").fieldValue(trim(record.treeId));
		
		$('#grid_auth_04').grid('reload',false,[],true);
		$('#grid_auth_04').parent().parent().show();	
		$('#grid_auth_but').grid('reload',false,[],true);
		$('#grid_auth_but').parent().parent().show();
		
		$('#grid_auth_05').parent().parent().hide();
		$('#grid_auth_06').parent().parent().hide();	
	}
	
	function grid_auth_04_ch(fun,record, rowIndex) {
		$("#field_auth_05_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_05_treeId").fieldValue(trim(record.treeId));
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_but_treeId").fieldValue(trim(record.treeId));
				
		$('#grid_auth_05').grid('reload',false,[],true);
		$('#grid_auth_05').parent().parent().show();	
		$('#grid_auth_but').grid('reload',false,[],true);
		$('#grid_auth_but').parent().parent().show();
				
		$('#grid_auth_06').parent().parent().hide();	
	}
	
	function grid_auth_05_ch(fun,record, rowIndex) {
		$("#field_auth_06_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_06_treeId").fieldValue(trim(record.treeId));
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_but_treeId").fieldValue(trim(record.treeId));
				
		$('#grid_auth_06').grid('reload',false,[],true);
		$('#grid_auth_06').parent().parent().show();	
		$('#grid_auth_but').grid('reload',false,[],true);
		$('#grid_auth_but').parent().parent().show();
				
	}
	
	function grid_auth_06_ch(fun,record, rowIndex) {
		$("#field_auth_06_treeId").fieldValue(trim(record.treeId));
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());	
		$("#field_auth_but_postGroupId").fieldValue($("#authorized_postGroupId").fieldValue());
		$("#field_auth_but_treeId").fieldValue(trim(record.treeId));
		
		$('#grid_auth_but').grid('reload',false,[],true);
		$('#grid_auth_but').parent().parent().show();
	}
</script>
<style type="text/css">
	#grid_postGroup  .youi-fieldLayout table td.contral.label-col.col-0{
		    width: 100px;
	}
	#tree_menu_part  li.treeNode.hide,#tree_menu_result li.treeNode{
		display:block;
	}
#auth_main {
 float: left;
 height: auto;
 width: auto;
 
}	
#authorized_01 {
 float: left;
 height: 50%;
 width:250;
}
#authorized_02 {
 float: left;
 height: 50%;
 width:250;
}
#authorized_03 {
 float: left;
 height: 50%;
 width:250;
}
#authorized_04 {
 float: left;
 height: 50%;
 width:250;
}
#authorized_05 {
 float: left;
 height: 50%;
 width:250;
}
#authorized_06 {
 float: left;
 height: 50%;
 width:250;
}

#main{/*position:relative;*/width:800px; height:300px; border:1px solid #ccc; overflow-x:scroll;overflow-y:hidden;}
#box{/*position:absolute;*/ width:1600px;}
.con{width:250px; height:220px; float:left; margin-left:10px;  }


#mainbut{/*position:relative;*/width:800px; height:230px; border:1px solid #ccc; overflow-x:scroll;overflow-y:hidden;}
#boxbut{/*position:absolute;*/ width:800px;}
.conbut{width:200px; height:150px; float:center; margin-left: auto; margin-right: auto;  }

</style>
</head>
	<t:page  i18n="i18n.authority.post_group">
		<table width="100%">
			<tr>
				<td valign="top">
					<!-- 用户组分类列表 -->
					<t:grid id="grid_postGroup" 
						idKeys="postGroupId,usercenter" 
						dataFormId="form_postGroup" 
						caption="角色列表"
						src="queryPostGroup.ajax" editSrc="getPostGroup.ajax" remove="NOT" showNum="true" load="false" back="NOT">
						<t:button name="authorize" active="1" caption="功能授权"></t:button>
						<t:button name="removeSelected" active="1" caption="删除" icon="removeRecord"></t:button>
						<t:fieldLayout columns="2" prefix="select">
							<t:fieldText  property="postGroupName" caption="${i18n.postGroupName} " width="100"/>
						</t:fieldLayout>
						<t:gridCol property="postGroupId" width="100" caption="角色标识"/>
						<t:gridCol property="postGroupName" caption="${i18n.postGroupName}"/>
						<t:gridCol property="postAttrName"  width="200"   caption="备注"/>
					</t:grid>
				</td>
			</tr>
		</table>
		
		<t:form action="saveAuthorized.ajax" dialog="true" id="form_authorize" submit="NOT" reset="NOT" width="800" 
		 caption="功能授权">
			<t:fieldLayout prefix="authorized">
				<t:fieldHidden property="postGroupId"></t:fieldHidden>
			</t:fieldLayout>
			<div id="main">
				<div id="box">
					<div id="div_auth_01" class="con">
						<t:grid id="grid_auth_01" idKeys="treeId" src="queryPostGroupAuth.ajax" 
							submit="NOT" reset="NOT" width="250" scrollHeight="220" selectRowEvent="selectRow" 
							load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
							<t:fieldLayout prefix="field_auth_01">
								<t:fieldHidden property="postGroupId"></t:fieldHidden>
								<t:fieldHidden property="treeId" defaultValue=""></t:fieldHidden>
								<t:fieldHidden property="flag" defaultValue="1"></t:fieldHidden>
							</t:fieldLayout>
							<t:gridCol property="chkbox"  align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
							<t:gridCol property="dirName" caption="名称" ></t:gridCol>
						</t:grid>
					</div>
					<div id="div_auth_02" class="con">
						<t:grid id="grid_auth_02" idKeys="treeId"  src="queryPostGroupAuth.ajax" 
						    submit="NOT" reset="NOT" width="250" scrollHeight="220" selectRowEvent="selectRow" 
							load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
							<t:fieldLayout prefix="field_auth_02">
								<t:fieldHidden property="postGroupId"></t:fieldHidden>
								<t:fieldHidden property="treeId"></t:fieldHidden>
								<t:fieldHidden property="parentId" defaultValue=""></t:fieldHidden>
								<t:fieldHidden property="flag" defaultValue="2"></t:fieldHidden>
							</t:fieldLayout>
							<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
							<t:gridCol property="dirName" caption="名称" ></t:gridCol>
						</t:grid>
					</div>
					<div id="div_auth_03" class="con">
						<t:grid id="grid_auth_03" idKeys="treeId"  src="queryPostGroupAuth.ajax" selectRowEvent="selectRow"
							submit="NOT" reset="NOT" width="250" scrollHeight="220"
							load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
							<t:fieldLayout prefix="field_auth_03">
								<t:fieldHidden property="postGroupId"></t:fieldHidden>
								<t:fieldHidden property="treeId"></t:fieldHidden>
								<t:fieldHidden property="parentId" defaultValue=""></t:fieldHidden>
								<t:fieldHidden property="flag" defaultValue="3"></t:fieldHidden>
							</t:fieldLayout>
							<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
							<t:gridCol property="dirName" caption="名称" ></t:gridCol>
						</t:grid>
					</div>
					<div id="div_auth_04" class="con">
						<t:grid id="grid_auth_04" idKeys="treeId"  src="queryPostGroupAuth.ajax"  selectRowEvent="selectRow"
						submit="NOT" reset="NOT" width="250" scrollHeight="220"
							load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
							<t:fieldLayout prefix="field_auth_04">
								<t:fieldHidden property="postGroupId"></t:fieldHidden>
								<t:fieldHidden property="treeId"></t:fieldHidden>
								<t:fieldHidden property="parentId" defaultValue=""></t:fieldHidden>
								<t:fieldHidden property="flag" defaultValue="4"></t:fieldHidden>
							</t:fieldLayout>
							<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
							<t:gridCol property="dirName" caption="名称" ></t:gridCol>
						</t:grid>
					</div>
					<div id="div_auth_05" class="con">
						<t:grid id="grid_auth_05" idKeys="treeId"  src="queryPostGroupAuth.ajax" selectRowEvent="selectRow"
						submit="NOT" reset="NOT" width="250" scrollHeight="220"
							load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
							<t:fieldLayout prefix="field_auth_05">
								<t:fieldHidden property="postGroupId"></t:fieldHidden>
								<t:fieldHidden property="treeId"></t:fieldHidden>
								<t:fieldHidden property="parentId" defaultValue=""></t:fieldHidden>
								<t:fieldHidden property="flag" defaultValue="5"></t:fieldHidden>
							</t:fieldLayout>
							<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
							<t:gridCol property="dirName" caption="名称" ></t:gridCol>
						</t:grid>
					</div>
					<div id="div_auth_06" class="con">
						<t:grid id="grid_auth_06" idKeys="treeId"  src="queryPostGroupAuth.ajax" selectRowEvent="selectRow"
						  submit="NOT" reset="NOT" width="250" scrollHeight="220"
							load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
							<t:fieldLayout prefix="field_auth_06">
								<t:fieldHidden property="postGroupId"></t:fieldHidden>
								<t:fieldHidden property="treeId"></t:fieldHidden>
								<t:fieldHidden property="parentId" defaultValue=""></t:fieldHidden>
								<t:fieldHidden property="flag" defaultValue="6"></t:fieldHidden>
							</t:fieldLayout>	
							<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
							<t:gridCol property="dirName" caption="名称" ></t:gridCol>
						</t:grid>
					</div>
				</div>
			</div>
			<div id="mainbut">
				<div id="boxbut">
					<div id="div_auth_but" class="conbut">
							<t:grid id="grid_auth_but" idKeys="treeId"  src="queryPostGroupAuth.ajax" selectRowEvent="selectRow"
								submit="NOT" reset="NOT" width="300" scrollHeight="150"
								load="false" add="NOT" edit="NOT" remove="NOT" usePager="false">
								<t:fieldLayout prefix="field_auth_but">
										<t:fieldHidden property="postGroupId"></t:fieldHidden>
										<t:fieldHidden property="treeId"></t:fieldHidden>
										<t:fieldHidden property="parentId" defaultValue=""></t:fieldHidden>
										<t:fieldHidden property="flag" defaultValue="0"></t:fieldHidden>
									</t:fieldLayout>
								<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="选择" width="50"></t:gridCol>
								<t:gridCol property="dirName" caption="名称" ></t:gridCol>
							</t:grid>
					</div>
				</div>
			</div>
		</t:form>
		
		
		<!-- 用户添加弹出窗口 -->
		<t:form dialog="true" id="form_postGroup" idKeys="usercenter,postGroupId" 
			caption="角色" action="savePostGroup.ajax" reset="NOT">
			<t:fieldLayout prefix="record">
				<t:fieldHidden property="biaos"  defaultValue="1"/>
				<t:fieldHidden property="flag"  defaultValue="1"/>
				<t:fieldText property="postGroupId" caption="角色标识"  notNull="true"  minLength="3"  maxLength="10" expression="^[a-zA-Z0-9]*$" expressionMessage="角色标识只能为字母或数字"/>
				<t:fieldText  property="postGroupName" caption="${i18n.postGroupName}" notNull="true"  minLength="3" maxLength="10" expression="^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$" expressionMessage="角色名称不能含有特殊字符"/>
				<t:fieldText column="2" property="postAttrName" caption="备注" maxLength="30" width="496"/>
			</t:fieldLayout>
		</t:form>
		<!-- 查看用户组 -->
		<t:form dialog="true" id="form_list_post" caption="查看用户组" reset="NOT" submit="NOT">
			<t:grid id="grid_post" 
				idKeys="id" width="590"
				dataFormId="form_post"
				caption="用户组列表" 
				submit="NOT"
				src="listAllPost.ajax" 
				edit="NOT" remove="NOT" add="NOT" reset="NOT" 
				load="false" usePager="false">
				<t:button name="failed" active="0" caption="全部停用"></t:button>
				<t:button name="enabled" active="0" caption="全部启用"></t:button>
				<t:fieldLayout columns="1">
					<t:fieldHidden property="groupId"  />
					<t:fieldHidden property="usercenter"  />
				</t:fieldLayout>
				<t:gridCol property="postCode" width="200" caption="组代码"/>
				<t:gridCol property="postName" width="200" caption="组名称 "/>
				<t:gridCol property="attr"   caption="扩展属性值"/>
				<t:gridCol property="biaos"   caption="是否启用" convert="biaos"/>
			</t:grid>
		</t:form>
	</t:page>
</t:html>