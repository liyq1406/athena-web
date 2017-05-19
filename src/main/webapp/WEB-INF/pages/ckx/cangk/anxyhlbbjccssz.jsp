<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.anxyhlbbcssz}">
<!-- huxy_V4_041 -->
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>
<t:page i18n="i18n.ckx.cangk.i18n_yhlbb" >
	<t:grid id="grid_yaohlbb" caption="${i18n.anxyhlbbcssz}" idKeys="usercenter,gongc,chanx" load="false" 
		editable="false"
		dataFormId="form_yaohlbb" back="NOT"
		src="/cangk/queryAnxtjbbsel.ajax" 
		showNum="true"  showCheckbox="false"
		pageSize="15" scrollHeight="390" afterSaveRowsEvent="afterSaveRows" >
		
		<t:fieldLayout id="form_select" prefix="cangk" columns="3">
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" width="140" />
			<t:fieldText property="gongc" caption="${i18n.gongc}" maxLength="20" width="150" />
			<t:fieldText property="chanx" caption="${i18n.shengcxbh}"  dataType="text" maxLength="5" minLength="5" width="140"/>
		</t:fieldLayout>
				



		<t:gridCol property="usercenter" caption="${i18n.usercenter}" width="60"/>
		<t:gridCol property="gongc" caption="${i18n.gongc}"  width="160" />
		<t:gridCol property="chanx" caption="${i18n.shengcxbh}" />
		
		<t:gridCol property="jihsl" caption="${i18n.jihjzzsl}"  width="110" 
			editorOptions="{'expression':'^\d+$','expressionMessage':'${i18n.jihjzzsl_ex_mes}'}"/>
			
		<t:gridCol property="yaohllx" caption="${i18n.yaohllx}" width="180" 
			editorOptions="{'expression':'^\w{2}(\,\w{2})*$','expressionMessage':'${i18n.yaohllx_ex_mes}'}"/>
			
		<t:gridCol property="creator" caption="${i18n.creator}" width="100"/>
		<t:gridCol property="create_time" caption="${i18n.create_time}" width="200"/>
		<t:gridCol property="editor" caption="${i18n.editor}" width="100"/>
		<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="200"/>
		
		<t:gridCol property="" caption="" width="15"></t:gridCol>

	</t:grid>
	
	<!-- 增加设置  huxy_13161-->
	<t:form dialog="true" id="add_yaohlbb" caption="${i18n.anxyhlbbcsszadd}" action="/cangk/addAnxyhlbbSz.ajax" width="860" 
		idKeys="usercenter,gongc,chanx,jihsl,yaohllx" reset="NOT">
		
		<t:fieldLayout id="szAdd" prefix="add" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" width="120"/>
			
			<t:fieldText property="gongc" caption="${i18n.gongc}"   maxLength="20" width="150" />
 			<t:fieldText property="chanx" caption="${i18n.shengcxbh}"  dataType="text" notNull="true" maxLength="5" minLength="5" width="140"/>
 			
			<t:fieldText property="jihsl" caption="${i18n.jihjzzsl}" dataType="text" width="120" notNull="true"
				expression="^\d+$" expressionMessage="${i18n.jihjzzsl_ex_mes}" />
			<t:fieldHidden property="yaohllx"></t:fieldHidden>
			<t:fieldCheckboxGroup property="yaohllx1" caption="要货令类型" width="200" src="/cangk/queryAnyhllx.ajax" show="yaohllx" code="yaohllx"></t:fieldCheckboxGroup>
		</t:fieldLayout>
	</t:form>
	
	<t:form dialog="true" id="edit_yaohlbb" caption="修改参数" action="/cangk/eidtAnxyhlbbSz.ajax" width="860" 
		idKeys="usercenter,gongc,chanx,jihsl,yaohllx" reset="NOT">
		
		<t:fieldLayout id="szEdit" prefix="edit" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" width="120"/>
			
			<t:fieldText property="gongc" caption="${i18n.gongc}"  notNull="true"  width="150" />
 			<t:fieldText property="chanx" caption="${i18n.shengcxbh}"  dataType="text" notNull="true" maxLength="5" minLength="5" width="140"/>
 			
			<t:fieldText property="jihsl" caption="${i18n.jihjzzsl}" dataType="text" width="120" 
				expression="^\d+$" expressionMessage="${i18n.jihjzzsl_ex_mes}" />
			
			<t:fieldHidden property="yaohllx"></t:fieldHidden>
			<t:fieldCheckboxGroup property="yaohllx2" caption="要货令类型" width="200" src="/cangk/queryAnyhllx.ajax" show="yaohllx" code="yaohllx"></t:fieldCheckboxGroup>
		
		</t:fieldLayout>
		
	</t:form>

</t:page>


<script type="text/javascript">

	$.sdcui.serverConfig.convertArray['fac']={}; 

	<c:forEach items="${fac}" var="item">
	$.sdcui.serverConfig.convertArray['fac']['${item.KEY}'] = '${item.VALUE}';
	</c:forEach>
		//增加按钮
		function func_button_add() {
            $('#add_yaohlbb').form("clear");//清除弹出窗口的数据
			$('#add_yaohlbb').addClass('operant-add');//增加的operant为1，修改的operant为2
				
			//-1表示未设置计划进总装数量
			var record = {} ;
			record.usercenter = $('#cangk_usercenter').fieldValue();   
			record.gongc = "" ;
			record.chanx = "" ;
			record.jihsl = "0" ;

			
			$('#add_yaohlbb').form('fillRecord', $.extend({}, record));
			$("#add_yaohlbb").form("open","增加");
			
			$('#add_usercenter').attr("disabled",true);
			$('#add_usercenter').addClass('readonly');
						
			$('#add_jihsl').removeClass("disabled").find(".textInput").removeAttr("readonly","false").removeAttr('disabled');
		}
		
		function add_yaohlbb_beforeSubmit() {
			var yaohllx="";
	   		$('#content_add_yaohllx1 input[type="checkbox"]').each(function(){
	   	 		 if($(this).attr("checked"))
	   	 		 {
	   	  			yaohllx +=$(this).val()+",";
	   	  		}
	  		 });
	   
	   		yaohllx=yaohllx.substr(0,yaohllx.length-1);
	   		if(yaohllx.length < 1)
	   		{
	   	 	 alert("至少选中一个要货令类型");
	   	 	 return false;
	  	   }
	   		$("#add_yaohlbb input[name='yaohllx']").val(yaohllx);
	   		return true;
		}
		
		function add_yaohlbb_afterSubmit(result){
			if(typeof result.success=="undefined"||result.success!==false){
				$("#add_yaohlbb").form("close");
				$('#grid_yaohlbb').grid("reload");
			}
		}
		
		function edit_yaohlbb_beforeSubmit() {
			var yaohllx="";
	   		$('#content_edit_yaohllx2 input[type="checkbox"]').each(function(){
	   	 		 if($(this).attr("checked"))
	   	 		 {
	   	  			yaohllx +=$(this).val()+",";
	   	  		}
	  		 });
	   
	   		yaohllx=yaohllx.substr(0,yaohllx.length-1);
	   		if(yaohllx.length < 1)
	   		{
	   	 	 alert("至少选中一个要货令类型");
	   	 	 return false;
	  	   }
	   		$("#edit_yaohlbb input[name='yaohllx']").val(yaohllx);
	   		return true;
		}
		
		
		function func_button_edit() {
            $('#edit_yaohlbb').form("clear");//清除弹出窗口的数据
			$('#edit_yaohlbb').addClass('operant-edit');//增加的operant为1，修改的operant为2
				
			//-1表示未设置计划进总装数量
			var record  = $('#grid_yaohlbb').grid("getSelectedRecords")[0];
			if(null !=record.yaohllx){
				var lx =  record.yaohllx.split(",");
				for(i=0;i< lx.length;i++){
				$('#content_edit_yaohllx2 input[type="checkbox"]').each(function(){
	   	 		 	if($(this).val()== lx[i].substr(0,2))
	   	 			{
	   	  				$(this).attr("checked",true);
	   	  			}
	  		 	});
				}	
			}
			
			
			var list = {};
			list.usercenter = record.usercenter;   
			list.gongc = record.gongc ;
			list.chanx = record.chanx ;
			list.jihsl = record.jihsl ;
			list.yaohllx = "";
			
			$('#edit_yaohlbb').form('fillRecord', $.extend({}, list));

		

			$('#edit_usercenter').addClass("disabled").find(".textInput").attr("readonly","true");
			
			$('#edit_gongc').addClass("disabled").find(".textInput").attr("readonly","true");
	
			$('#edit_chanx').addClass("disabled").find(".textInput").attr("readonly","true");

			
			$('#edit_jihsl').removeClass("disabled").find(".textInput").removeAttr("readonly","false").removeAttr('disabled');
			
			$("#edit_yaohlbb").form("open");
		}
		
		function edit_yaohlbb_afterSubmit(result){
			if(typeof result.success=="undefined"||result.success!==false){
				$("#edit_yaohlbb").form("close");
				$('#grid_yaohlbb').grid("reload");
			}
		}
		
		//删除按钮
		//
		function func_button_remove() {
			var params  = $('#grid_yaohlbb').grid("getSelectedRecords");
			if(params.length > 1){
				alter("请选择一行删除");
				return false;
			}else{
				var record = params[0];
				var param=[];
				param.push("usercenter="+record.usercenter);
				param.push("gongc="+record.gongc);
				param.push("chanx="+record.chanx);
				$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/cangk/deleteAnxyhlbbSz.ajax",
				data : param.join('&'),
				success : function(result) {
					$('#grid_yaohlbb').grid("reload");
			  	}
				});
		 	 }
			}
	</script>
</t:html>