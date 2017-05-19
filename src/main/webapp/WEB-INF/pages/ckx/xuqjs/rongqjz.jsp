<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.rongqjz}">

<!-- 
	   用户中心|容器记账
	 @author xss
	 @date 2015-2-3
	 0010495
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_rongqjz">
	<t:grid id="grid_rongqjz" 
		caption="${i18n.rongqjz}" 
		src="/xuqjs/queryRongqjz.ajax"
		idKeys="usercenter,rongqjz"  
		load="false" 
		back="NOT"
		showNum="true"
		removeSrc="/xuqjs/deleteRongqjz.ajax"
		dataFormId="form_rongqjz"
		editSrc="/xuqjs/selectRongqjz.ajax" 
		scrollHeight="300" 
		pageSize="8"					
		>
		<t:fieldLayout prefix="record" columns="2">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldSelect property="shifgys" caption="${i18n.biaos}" convert="shifgys" defaultValue="" width="100"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  editor="fieldText" width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="shifgys" caption="${i18n.biaos}" convert="shifgys"  width="100" />
		<t:gridCol property="" caption=""></t:gridCol>
		
	</t:grid>
	<t:form dialog="true" caption="用户中心|容器记账" idKeys="usercenter"  id="form_rongqjz" action="/xuqjs/saveRongqjz.ajax" width="720"  reset="NOT">
		<t:fieldLayout prefix="rongqjz" columns="2">		  
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" width="150" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"/>							
			<t:fieldSelect property="shifgys" caption="${i18n.biaos}" notNull="true" convert="shifgys" width="110" />		
		</t:fieldLayout>
	</t:form>
</t:page>



<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['shifgys'] = {
		'1' : '供应商',
		'0' : '承运商'
	};
	

	
	/*
		$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.gongys}',
		'0' : '${i18n.chengys}'
	};
	
	空格查询
	function grid_usercenter_beforeSubmit() {
		$("#usercenter_usercenter").fieldValue(trim($("#usercenter_usercenter").fieldValue()));
		$("#usercenter_centername").fieldValue(trim($("#usercenter_centername").fieldValue()));
	}
	
	function func_button_edit(){
			$('#form_lingjck').form("clear");//清除弹出窗口的数据
			$('#form_lingjck').removeClass('operant-add');
			//增加用户中心锁
// 			$("#record_usercenter").addClass('youi-field fieldSelect readonly');
			
			var currentRole = "${role}"; 
			var td = $("label#fieldText-record_dingzkw").parent("td:first");
			$(td).removeClass("notNull");
			$('#record_dingzkw').removeClass("disabled").removeClass('readonly');
			$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
			$('#form_lingjck').removeClass('operant-add');//增加的operant为1，修改的operant为2
			
			var record = $("#grid_lingjck").grid("getSelectedRecords")[0];//选中的行的数据
			$('#form_lingjck').form('fillRecord', $.extend({}, record));
			
			$("#form_lingjck").form("open","${i18n.edit}");
			//var zickbh = $('#record_zickbh').fieldValue();
			var zickbhStr = record.zickbh.substr(2,1);
			//子仓库为B 的时候  不能设置定置库位
			if ("ZXCPOA"==currentRole&&"B"==zickbhStr) {
				$(td).removeClass("notNull");
				$('#record_dingzkw').fieldValue("");
				//$('#record_dingzkw').removeAttr("class","youi-field fieldText validate-error");
				$('#record_dingzkw').addClass("disabled").find(".textInput").attr("readonly","true");
				$('#record_dingzkw').addClass("disabled").addClass('readonly');
			}
			//子仓库为S 的时候  必须设置定置库位
			if("ZXCPOA"==currentRole&&"S"==zickbhStr){
		        $(td).addClass("notNull");
		        $('#record_dingzkw').removeClass("disabled").removeClass('readonly');
				$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
		        if($(td).hasClass("notNull")&&$("#record_dingzkw").fieldValue()==""){
			        	$('#record_dingzkw').attr("class","youi-field fieldText validate-error");
						alert("【定置库位】不能为空");
						return false;
			  		}	
		      }
			
		}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_usercenter').grid('saveRows');
	}
	
	//用户中心名称长度为40
	function func_set_centername() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var centernameIndex = $('td.centername:first').prevAll().length;
		var centernameTemp = rowElement.find('td:eq(' + centernameIndex + ')').text();
		
		var centername=trim(centernameTemp);
		
		if(undefined != centername && null != centername){
			if (!checkCH(40, centername)) {				
				rowElement.find('td:eq(' + centernameIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.zuidcd}");
				return false;
			}
		}
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	*/
</script>

</t:html>