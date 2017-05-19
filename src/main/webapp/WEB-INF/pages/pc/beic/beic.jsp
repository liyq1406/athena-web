<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.pc_beic_title }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>
</head>
<t:page i18n="i18n.pc.pc">
	 <!-- 备储主表记录  hzg-->
		<t:grid id="grid_pc_beic" src="/pc/queryBeic.ajax" scrollHeight="95" caption="${i18n.pc_beic_title}" idKeys="beicjhh,usercenter" 
			  remove="NOT"  load="false" >
			<t:fieldLayout id="beic" prefix="bc">
				<t:fieldText property="beicjhh"  caption="${i18n.beicjhh }" maxLength="9" />	
				<t:fieldHidden property="bcjhh"></t:fieldHidden>	
				<t:fieldHidden property="usercenter"></t:fieldHidden>		
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap"></t:gridCol>
			<t:gridCol property="beicjhh" caption="${i18n.beicjhh }"></t:gridCol>
			<t:gridCol property=" " caption=""></t:gridCol>
			<t:button  name="btnDel" active="1" caption="${i18n.delete }" ></t:button>
		</t:grid>
		
	<!-- 备储明细表记录 hzg-->	
		<t:grid id="grid_pc_beic_beicmx"  src="/pc/queryBeicmx.ajax" scrollHeight="140" submit="NOT" reset="NOT"
				add="NOT" edit="NOT" remove="NOT" load="false" idKeys="beicjhh" >
				<t:fieldLayout prefix="bcmxpc" id="bcmxpc"  >
					<t:fieldHidden property="usercenter" caption="${i18n.usercenter }"></t:fieldHidden>
					<t:fieldHidden property="beicjhh" caption="${i18n.beicjhh }"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="beicjhmxh" caption="${i18n.beicjhmxh }" width="120"></t:gridCol>
				<t:gridCol property="lingjbh" caption="${i18n.lingjbh }"></t:gridCol>
				<t:gridCol property="kaissj" caption="${i18n.kaissj }"></t:gridCol>
				<t:gridCol property="jiessj" caption="${i18n.jiessj }"></t:gridCol>
				<t:gridCol property="lingjsl" caption="${i18n.lingjsl }"></t:gridCol>
				<t:gridCol property=" " caption=""></t:gridCol>
		</t:grid>
	 
 
<!-- 备储明细编辑表单页面 hzg-->	
	<t:form  id="form_beic" dialog="true"  caption="${i18n.beicjh }" action="/pc/saveBeic.ajax"  idKeys="beicjhh" >
		<t:fieldLayout prefix="beicmx" columns="2" showLabel="true">
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }" defaultValue="${usercenter }" />
			<t:fieldText property="beicjhh" caption="${i18n.beicjhh }" maxLength="9" notNull="true" />
			<t:fieldGrid property="f_pc" parents="beicjhh,usercenter" 
				mode="reload" column="2" width="490" caption="${i18n.beicjhmx}" >
				<t:grid id="form_pc_beic_beicmx" idKeys="beicjhmxh,lingjbh" src="/pc/queryBeicmx.ajax" submit="NOT" reset="NOT"
					editable="true" load="false" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
					<t:gridCol property="beicjhmxh" caption="${i18n.beicjhmxh }" 
					  width="120"></t:gridCol>
					<t:gridCol property="lingjbh" caption="${i18n.lingjbh }" editor="fieldText"
						editorOptions="{'maxLength':'10','notNull':true}" width="120"></t:gridCol>
					<t:gridCol property="kaissj" caption="${i18n.kaissj }" 	editor="fieldCalendar"
						editorOptions="{'format':'yyyy-MM-dd','notNull':true}"></t:gridCol>
					<t:gridCol property="jiessj" caption="${i18n.jiessj }" editor="fieldCalendar"
						editorOptions="{'format':'yyyy-MM-dd','notNull':true}" ></t:gridCol>
					<t:gridCol property="lingjsl" caption="${i18n.lingjsl }" editor="fieldText"
						editorOptions="{'maxLength':'9','dataType':'integer',allowNegative:false,isZero:true,'notNull':true}"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
<script type="text/javascript">
 
	//查询前执行方法
	function grid_pc_beic_beforeSubmit() {
		//去掉查询条件产线组编号的空格
		$("#bc_beicjhh").fieldValue(trim($("#bc_beicjhh").fieldValue()));
	}
	
	//选中主表行的chang事件
	function grid_pc_beic_change(record, rowIndex) {
		$("#bcmxpc_usercenter").fieldValue(trim(record.usercenter));
		$("#bcmxpc_beicjhh").fieldValue(trim(record.beicjhh));
		$("#grid_pc_beic_beicmx").grid("reload");
	}
	
	function func_button_add() {
		var params = [];
		var bcjhh = $("#bc_bcjhh").fieldValue();
		var usercenter = $("#bc_usercenter").fieldValue();
		params.push("bcjhh="+bcjhh+"&usercenter="+usercenter);  
        $.sdcui.ajaxUtil.ajax({
			 url:"${ctx}/pc/queryBeicjhh.ajax",
			 data:params.join("&"), 
         	 success:function (result){
         		 if(result.sxCount==0){
         			$('#form_beic').form('fillRecord', $.extend({f_pc : '--'}, result));
					$("#form_beic").form("open");
         			$('#form_beic').addClass('operant-add');
					$("#beic_beicjhh input").attr("disabled",true);
				}else{
					alert("${i18n.beic_message_a }"+bcjhh+"${i18n.beic_message_b }"+bcjhh+"${i18n.beic_message_c }");
				}	
       		 }
		 }); 

	}
	
	// 点击修改，则弹出页面
	function func_button_edit() {
		$("#form_beic").form('clear');
		$('#form_beic').removeClass('operant-add');
		var record = $("#grid_pc_beic").grid("getSelectedRecords")[0];
		$('#form_beic').form('fillRecord', $.extend({f_pc : '--'}, record));
		$("#form_beic").form("open");
		$("#beic_beicjhh input").attr("disabled",true);
	}
	//删除操作
	function func_button_btnDel(){
		var row = $("#grid_pc_beic").grid("getSelectedRecords")[0];
		var params = [];
		params.push("usercenter="+row.usercenter+"&beicjhh="+row.beicjhh);
		if(confirm("${i18n.beic_whether_delete }")){
			$.sdcui.ajaxUtil.ajax({
				url: "${ctx}/pc/deleteBeic.ajax",
				data:params.join("&"), 
				success:function(){
					$("#grid_pc_beic").grid("reload");
					$("#grid_pc_beic_beicmx").grid("reload");
				}
			});
		}
	}


</script>
</t:page>
</t:html>

