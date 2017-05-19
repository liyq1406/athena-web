<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.rongqc}">

<!-- 
	  空容器场
	 @author denggq
	 @date 2012-2-2
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_rongqc">
	<t:grid id="grid_rongqc" caption="${i18n.rongqc}" idKeys="usercenter,rongqcbh" load="false"  
		showNum="true" back="NOT"  afterSaveRowsEvent="afterSaveRows"
		src="/cangk/queryRongqc.ajax"  removeSrc="/cangk/removeRongqcs.ajax"
		showEditorRemove="false"  showEditorAdd="false"
		add="NOT" editable="false" scrollHeight="335" pageSize="15">
		<t:fieldLayout id="fl_rongqc" prefix="rongqc" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" readonly="" width="150"/>
			<t:fieldText property="rongqcbh" caption="${i18n.rongqcbh}" maxLength="10" dataType="text" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="150"/>
		</t:fieldLayout>
		
		<t:button caption="增加" name="addrongqc" active="0" icon="addRecord"></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}"></t:gridCol>
		<t:gridCol property="rongqcbh" caption="${i18n.rongqcbh}" editor="fieldText" width="150"></t:gridCol>
		<t:gridCol property="shiffk" caption="容器场类型" convert="shiffk"></t:gridCol>
		<t:gridCol property="jizqbh" caption="记账区编号" width="150"></t:gridCol>
		<t:gridCol property="miaos" caption="${i18n.miaos}" width="200"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos"></t:gridCol>
		<t:gridCol property="ycshiffk" caption="隐藏容器场类型" convert="shiffk" hidden="true" width="10"/>
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
	
	<t:form dialog="true" caption="增加容器场" id="form_rongqc" action="/cangk/addRqc.ajax" width="500" reset="NOT">
				<t:fieldLayout prefix="groups1" columns="2">
					<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" 
						defaultValue="${usercenter}" width="150" />
					<t:fieldText property="rongqcbh" caption="${i18n.rongqcbh}" maxLength="10"  dataType="text" width="150" notNull="true"/>
					<t:fieldSelect property="shiffk" caption="容器场类型" convert="shiffk" defaultValue="R" width="150" notNull="true"/>
					<t:fieldText property="jizqbh" caption="记账区编号" dataType="text" maxLength="10" width="150"/>
					<t:fieldText property="miaos" caption="${i18n.miaos}" width="150"/>
					<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
				</t:fieldLayout>
	</t:form>
	<t:form dialog="true" caption="修改容器场" id="form_rongqc1" action="/cangk/saveRongqc.ajax" width="500" reset="NOT" idKeys="rongqcbh,usercenter">
				<t:fieldLayout prefix="groups" columns="2">
					<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" 
						defaultValue="${usercenter}" width="150" />
					<t:fieldText property="rongqcbh" caption="${i18n.rongqcbh}" dataType="text" width="150" notNull="true"/>
					<t:fieldSelect property="shiffk" caption="容器场类型" convert="shiffks" width="150" notNull="true"/>
					<t:fieldText property="jizqbh" caption="记账区编号" dataType="text" maxLength="10" width="150"/>
					<t:fieldText property="miaos" caption="${i18n.miaos}" width="150"/>
					<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
					<t:fieldHidden property="ycshiffk" caption="隐藏容器场类型"/>
					
				</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};
	
	//是否返空区
	$.sdcui.serverConfig.convertArray['shiffk'] = {
		'J' : '记账区',	
		'F' : '返空区',
		'R' : '容器区'
	};
	
	//是否返空区
	$.sdcui.serverConfig.convertArray['shiffks'] = {
		'J' : '记账区',	
		'F' : '返空区',
		'R' : '容器区'
	};
	
	//空格查询
	function grid_rongqc_beforeSubmit() {
		$("#rongqc_rongqcbh").fieldValue(trim($("#rongqc_rongqcbh").fieldValue()));
	}
	
	//保存按钮
// 	function func_button_save() {
// 		$('#grid_rongqc').grid('saveRows');
// 	}

	//增加窗口
	function func_button_addrongqc(){
		var user = $("#groups1_usercenter").fieldValue();
		var shiffk= $("#groups1_shiffk").fieldValue();
		var biaos= $("#groups1_biaos").fieldValue();
		$("#form_rongqc").form("clear");//清除弹出窗口的数据
		$("#groups1_usercenter").fieldValue(user);
		$("#groups1_shiffk").fieldValue(shiffk);
		$("#groups1_biaos").fieldValue(biaos);
		$("#form_rongqc").form("open");
	}
	
	function form_rongqc_afterSubmit(result){
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_rongqc").form("close");
			$('#grid_rongqc').grid("reload");
		}
		
	}
	
	//修改容器场弹出窗口
	function func_button_edit(){
		$("#form_rongqc1").form("clear");
		//$("#groups_jizqbh").fieldValue("");
		$('#groups_shiffk').removeClass("disabled").removeClass('readonly');
		$('#groups_shiffk').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
		 var record=$("#grid_rongqc").grid("getSelectedRecords")[0];
		
		 if("J"==record.shiffk){
			//$("#groups_shiffk").fieldValue("J");
			$('#groups_shiffk').addClass("disabled").find(".textInput").attr("readonly","true");
			$('#groups_shiffk').addClass("disabled").addClass('readonly');
		 }
		$('#form_rongqc1').form('fillRecord',$.extend(record));
		 if(undefined==record.jizqbh){
			 $("#groups_jizqbh").fieldValue("");
		 }
		$("#form_rongqc1").form("open");
	}
	
	function form_rongqc1_afterSubmit(result){
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_rongqc1").form("close");
			$('#grid_rongqc').grid("reload");
		}
		
	}
	
	//描述长度为40
	function func_set_miaos() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var miaosIndex = $('td.miaos:first').prevAll().length;
		var miaos = trim(rowElement.find('td:eq(' + miaosIndex + ')').text());
		
		if(undefined != miaos && null != miaos && "" !== miaos){
			if (!checkCH(40, miaos)) {
				alert("${i18n.miaoscd}");
				return false;
			}
		}
		return true;
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
</script>

</t:html>