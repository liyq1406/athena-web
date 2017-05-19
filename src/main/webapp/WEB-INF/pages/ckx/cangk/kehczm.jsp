<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.kehczm}-${i18n.danjdy}">

<!-- 
	  客户操作码-单据打印
	 @author denggq
	 @date 2012-1-30
2015-04-16		gswang		0011297: 客户操作码不能维护*号，导致授权困难。	 
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 60px; } </style>

</head>

<t:page i18n="i18n.ckx.cangk.i18n_kehczm">
	<t:grid id="grid_kehczm" caption="${i18n.kehczm}" idKeys="usercenter,kehbh" dataFormId="form_kehczm" 
		remove="NOT" showNum="true" scrollHeight="110" pageSize="10" back="NOT"
		src="/cangk/queryKehczm.ajax" removeSrc="/cangk/removeKehczm.ajax" 
		clickRowEvent="grid_kehczm_click" load="false"> 
		<t:fieldLayout id="fl_kehczm" prefix="kehczm" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="kehbh" caption="${i18n.kehbh}" maxLength="10" expression="^[A-Za-z0-9_*]+$"  expressionMessage="登录名只能为数字,字母,下划线,*" width="150"/>
			<t:fieldSelect property="kehlx" caption="${i18n.kehlx}" convert="kehlx"  width="150"/>
			<t:fieldText property="zhangh" caption="${i18n.zhangh}" maxLength="11" width="150"/>
			<t:fieldSelect property="caozm" caption="${i18n.caozm}" convert="caozm"  width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="150"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.invalidate}" name="del" active="1"/>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"/>
		<t:gridCol property="kehbh" caption="${i18n.kehbh}"/>
		<t:gridCol property="kehlx" caption="${i18n.kehlx}" convert="kehlx"/>
		<t:gridCol property="zhangh" caption="${i18n.zhangh}" />
		<t:gridCol property="caozm" caption="${i18n.caozm}" convert="caozm"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos"/>
		<t:gridCol property="" caption=" " />
	</t:grid>

	<t:grid id="grid_danjdy" caption="${i18n.danjdy}" idKeys="usercenter,kehbh,cangkbh,danjlx" 
		submit="NOT" scrollHeight="120" pageSize="10" back="NOT"
		reset="NOT" load="false" src="/cangk/queryDanjdy.ajax" 
		add="NOT" edit="NOT" remove="NOT"  showNum="true">
		<t:fieldLayout id="fl_dangjdy" prefix="danjdy">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"></t:fieldHidden>
			<t:fieldHidden property="kehbh" caption="${i18n.kehbh}"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="kehbh" caption="${i18n.kehbh}"/>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" width="120"/>
		<t:gridCol property="danjlx" caption="${i18n.danjlx}" convert="queryDjlx" width="110"/>
		<t:gridCol property="shifdy" caption="${i18n.shifdy}" convert="shifdy" width="110"/>
		<t:gridCol property="dayls" caption="${i18n.dayls}" width="110"/>
		<t:gridCol property="dayfs" caption="${i18n.dayfs}" width="110"/>
		<t:gridCol property="" caption=" " />
	</t:grid>

	<t:form dialog="true" id="form_kehczm" action="/cangk/saveDanjdys.ajax" width="700" 
		idKeys="usercenter,kehbh,cangkbh,danjlx" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="r1" columns="3">
			<t:grid id="kehczm" caption="${i18n.kehczm}" idKeys="usercenter,kehbh" 
				submit="NOT" reset="NOT" add="NOT" edit="NOT" 
				remove="NOT" load="false" save="NOT"  back="NOT">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" notNull="true" width="150"/>
				<t:fieldText property="kehbh" caption="${i18n.kehbh}" notNull="true" maxLength="6" expression="^[A-Za-z0-9_*]+$"  expressionMessage="登录名只能为数字,字母,下划线,*"  width="150"/>
				<t:fieldSelect property="kehlx" caption="${i18n.kehlx}" convert="kehlx" notNull="true" width="150"/>
				<t:fieldText property="zhangh" caption="${i18n.zhangh}" maxLength="11" width="150" />
				<t:fieldSelect property="caozm" caption="${i18n.caozm}" convert="caozm" notNull="true" width="150"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" notNull="true" width="150"/>
			</t:grid>
		</t:fieldLayout>
		<t:fieldLayout prefix="r2" showLabel="false" columns="1">
			<t:fieldGrid width="700" property="danjdys">
				<t:grid id="danjdy" idKeys="cangkbh,danjlx" src="/cangk/queryDanjdy.ajax"  
					caption="${i18n.danjdy}" showNum="true" back="NOT"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" 
					editable="true" preSaveRowsEvent="preSaveEvent">
					<t:fieldLayout prefix="r2">
						<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"  defaultValue="${usercenter}"/>
						<t:fieldHidden property="kehbh" caption="${i18n.kehbh}" />
					</t:fieldLayout>
					<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" width="120" editor="fieldText" 
						editorOptions="{'expression':'^([A-Za-z0-9]{5}(B|D|S))$','expressionMessage':'${i18n.cangkbh_ex_mes}','notNull':true}"/>
					<t:gridCol property="danjlx" caption="${i18n.danjlx}" width="160" convert="queryDjlx" 
						editor="fieldSelect" editorOptions="{'notNull':true}"/>
					<t:gridCol property="shifdy" caption="${i18n.shifdy}" width="100" convert="shifdy" 
						editor="fieldSelect" editorOptions="{'notNull':true}"/>
					<t:gridCol property="dayls" caption="${i18n.dayls}" width="100" editor="fieldText" defaultValue="1"
						editorOptions="{'expression':'^[0-9]$','expressionMessage':'${i18n.dayfs_ex_mes}'}"/>
					<t:gridCol property="dayfs" caption="${i18n.dayfs}"width="100"  editor="fieldText" defaultValue="1"
						editorOptions="{'expression':'^[0-9]$','expressionMessage':'${i18n.dayfs_ex_mes}'}" />
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy}" name="submit_zdy"></t:button>
	</t:form>
	
</t:page>


<script type="text/javascript">

	//页面初始化
	function initPage(){
		
		//$('#grid_danjdy').parent().parent().hide();//隐藏单据信息
		$('#r1_biaos').addClass("disabled");//弹出页面标识字段不可修改
		
		$("#r1_kehbh input").blur(function() {
			var kehbh = trim($("#r1_kehbh").fieldValue());
			//alert(kehbh);
			if("" == kehbh || undefined == kehbh || null == kehbh){
				$("#r1_kehlx").fieldValue("");
			}else if(3 == kehbh.length){
				$("#r1_kehlx").fieldValue("2");
			}else if(5 == kehbh.length){
				$("#r1_kehlx").fieldValue("1");
			}else{
				$("#r1_kehlx").fieldValue("3");
			}
			return true;
		});
	}

	
	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = { '1' : '${i18n.youx}', '0' : '${i18n.wux}' };
	
	//操作码
	$.sdcui.serverConfig.convertArray['caozm'] = { 'A35':'${i18n.A35}', 'A36':'${i18n.A36}','A70':'${i18n.A70}' };
	
	//是否打印
	$.sdcui.serverConfig.convertArray['shifdy'] = { '1' : '${i18n.shi}', '0' : '${i18n.fou}' };
	//是否打印
	$.sdcui.serverConfig.convertArray['kehlx'] = { '1' : '${i18n.fenpxh}' ,'2' : '${i18n.cangk}','3':'${i18n.qitkh}' };

	
	function func_button_submit_zdy(){

		if($("#danjdy").grid("isEditedCell")){
			$("#danjdy").grid("saveRows");
		}else{			
			$('#form_kehczm').form('submit');
		}		
	}	
	function preSaveEvent(){		
		$('#form_kehczm').form('submit');
		return false;
	}
	
	function form_kehczm_afterSubmit() {
		$('#form_kehczm').grid('close'); 
		$('#grid_danjdy').grid('reload',false,[],true);
	}
	
	//空格查詢
	function grid_kehczm_beforeSubmit() {
		$("#kehczm_kehbh").fieldValue(trim($("#kehczm_kehbh").fieldValue()));
		$("#kehczm_zhangh").fieldValue(trim($("#kehczm_zhangh").fieldValue()));
	}
	
	//把查询条件的数据 带入新增的弹出就页面,点击增加按钮事件前 赋值
	function func_button_add(){
		$('#form_kehczm').form('clear');
		
		var usercenterStr = $('#kehczm_usercenter').fieldValue();
		$('#r1_usercenter').fieldValue(trim(usercenterStr));
		$('#r1_usercenter').fieldValue();
		
		var kehbhStr = $('#kehczm_kehbh').fieldValue();
		$('#r1_kehbh').fieldValue(trim(kehbhStr));
		$('#r1_kehbh').fieldValue();
		
		
		var kehlxStr = $('#kehczm_kehlx').fieldValue();
		$('#r1_kehlx').fieldValue(trim(kehlxStr));
		$('#r1_kehlx').fieldValue();
		
		var zhanghStr = $('#kehczm_zhangh').fieldValue();
		$('#r1_zhangh').fieldValue(trim(zhanghStr));
		$('#r1_zhangh').fieldValue();
		
		var caozmStr = $('#kehczm_caozm').fieldValue();
		$('#r1_caozm').fieldValue(trim(caozmStr));
		$('#r1_caozm').fieldValue();
		
		var biaosStr = $('#kehczm_biaos').fieldValue();
		$('#r1_biaos').fieldValue(trim(biaosStr));
		$('#r1_biaos').fieldValue();
		
		$('#form_kehczm').addClass('operant-add');//增加的operant为1，修改的operant为2
		
		//$('#r1_kehbh').removeClass("disabled");
		$('#r1_kehbh input:first').removeAttr("disabled");
		$("#form_kehczm").form("open");
		
	}
	
	//新增保存后自动关闭该窗口
	function form_kehczm_afterSubmit(){
		$("#form_kehczm").form("close");
	}
	
	//增加页面提交前触发的函数
	function form_kehczm_beforeSubmit(){
		var zhanghStr =$("#r1_zhangh").fieldValue();
		var s=/^[0-9a-zA-Z\s?]+$/g;
		if(""==zhanghStr){
			//return true;
		}else{
			if(zhanghStr.match(s)==null)
			{
      			alert("账户只能为数字、字母");
      			return false;
			}
		}
		return true;
	} 
	
	
	//客户操作码列表行改变事件
	function grid_kehczm_click(record, rowIndex) {
		$("#danjdy_usercenter").fieldValue(record.usercenter);//用户中心
		$("#danjdy_kehbh").fieldValue(record.kehbh);	//客户编号
		$('#grid_danjdy').grid('reload',false,[],true);
	}

	//修改按钮--若在grid中editSrc则主表的数据能传过去，子表的数据不能传过去
	function func_button_edit() {
		
		$('#form_kehczm').form("clear");//清除弹出窗口的数据
		
		$('#form_kehczm').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_kehczm").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_kehczm').form('fillRecord', $.extend({}, record));
		
		$('#danjdy').grid('clearBatchData');
		
		$('#danjdy').grid('reload',false,[],true);
		
		$("#form_kehczm").form("open");
	}
	
	//监听标识
	function r1_biaos_change() {
		var biaos = $('#r1_biaos').fieldValue();
		//无效可以改为有效
		if('0' == biaos){
			$('#r1_biaos').removeClass("disabled");
			$('#r1_biaos input:first').removeAttr("disabled");
		}else{
			$('#r1_biaos').addClass("disabled");
			$('#r1_biaos input:first').attr("disabled",true);
		}
		return true;	
	}
	
	function kehczm_kehlx_change() {
		var kehlx = $('#kehczm_kehlx').fieldValue();		
		if('1' == kehlx){
			$('#kehczm_caozm').fieldValue("A35");
			$('#kehczm_caozm').addClass("disabled");
			$('#kehczm_caozm input:first').attr("disabled",true);
		}else if('2' == kehlx){	
			var caozm = $('#kehczm_caozm').fieldValue();
			$('#kehczm_caozm').fieldValue("A70");
			$('#kehczm_caozm').removeClass("disabled");
			$('#kehczm_caozm input:first').removeAttr("disabled");
		}else{
			$('#kehczm_caozm').fieldValue("A35");
			$('#kehczm_caozm').removeClass("disabled");
			$('#kehczm_caozm input:first').removeAttr("disabled");
		}
	}
	function kehczm_caozm_change() {
		var caozm = $('#kehczm_caozm').fieldValue();
		var kehlx = $('#kehczm_kehlx').fieldValue();
		if('A70' == caozm&&'3' == kehlx){
				alert("${i18n.bunyk}");
				$('#kehczm_caozm').fieldValue("A35");
		}
	}
	function r1_kehlx_change() {
		var kehlx = $('#r1_kehlx').fieldValue();		
		if('1' == kehlx){
			$('#r1_caozm').fieldValue("A35");
			$('#r1_caozm').addClass("disabled");
			$('#r1_caozm input:first').attr("disabled",true);
		}else if('2' == kehlx){	
			var caozm = $('#r1_caozm').fieldValue();
			$('#r1_caozm').fieldValue("A70");
			$('#r1_caozm').removeClass("disabled");
			$('#r1_caozm input:first').removeAttr("disabled");
		}else{
			$('#r1_caozm').fieldValue("A35");
			$('#r1_caozm').removeClass("disabled");
			$('#r1_caozm input:first').removeAttr("disabled");
		}
	}
	function r1_caozm_change() {
		var caozm = $('#r1_caozm').fieldValue();
		var kehlx = $('#r1_kehlx').fieldValue();
		if('A70' == caozm&&'3' == kehlx){
				alert("${i18n.bunyk}");
				$('#r1_caozm').fieldValue("A35");
		}
	}
	

	//失效按钮
	function func_button_del() {
		if(confirm("${i18n.quersx}")){
			var record = $("#grid_kehczm").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("kehbh="+record[0].kehbh);		//客户编号
			
			if (record[0].biaos == '1') {
				$.sdcui.ajaxUtil.ajax({
					url : "../cangk/removeKehczm.ajax",
					data:params.join('&'),
					success : function(result) {
						if("" == result.result){
			 	    		alert("${i18n.bunsx}");
			 	    	}else{
			 	    		alert("${i18n.shixcg}");
			 	    		$("#grid_kehczm").grid("reload");
			 	    	}
					}
				});
			} else {
				alert("${i18n.shijysx}");
			}
		}
	}
	
</script>

</t:html>