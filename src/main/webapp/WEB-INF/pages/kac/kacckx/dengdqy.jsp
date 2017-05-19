<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="区域-大站台">

<!-- 
	 等待区域-大站台
	 @author chenpeng
	 @date 2015-1-7
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_dengdqy" caption="等待区域" idKeys="usercenter,quybh" 
	load="false" showNum="true" back="NOT" dataFormId="form_dengdqy"
	clickRowEvent="grid_Dengdqy_click"
	 src="/kac/queryDengdqy.ajax"  remove="NOT"  
	 scrollHeight="160">
		<t:fieldLayout  prefix="dengdqy" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心"  defaultValue="${usercenter}" convert="queryUserCenterMap" width="110" notNull="true"/>
			<t:fieldText property="quybh" caption="区域编号"  maxLength="10" dataType="text" width="110"/>
			<t:fieldText property="daztbh" caption="大站台编号"  maxLength="10"  dataType="text" width="110"/>
			<t:fieldSelect property="biaos" caption="标识"  convert="biaos" defaultValue="1" width="110"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="用户中心"convert="queryUserCenterMap" width="90"/>
		<t:gridCol property="quybh" caption="区域编号" width="90"/>
		<t:gridCol property="quymc" caption="区域名称" width="90"/>
		<t:gridCol property="dapzrxssj" caption="大屏准入显示时间（分钟）" width="170"/>
		<t:gridCol property="shuaxsj" caption="大站台刷新时间（分钟）" width="160"/>
		<t:gridCol property="biaos" caption="标识" convert="biaos" width="60"/>
		<t:gridCol property="" caption=""></t:gridCol>
		<t:button caption="失效" name="del" active="1"/>
	</t:grid>
	
	<t:grid id="grid_shijdzt" caption="大站台" idKeys="usercenter,quybh,daztbh" submit="NOT" reset="NOT" back="NOT"
		load="false" src="/kac/queryShijdzt.ajax" add="NOT" edit="NOT" remove="NOT" showNum="true" scrollHeight="145">
		<t:fieldLayout id="layout2" prefix="shijdzt">
			<t:fieldHidden property="usercenter" caption="用户中心"/>
			<t:fieldHidden property="quybh" caption="区域编号"/>
			<t:fieldHidden property="daztbh" caption="大站台编号"/>
			<t:fieldHidden property="biaos" caption="标识" defaultValue="1" />
		</t:fieldLayout>
		<t:gridCol property="daztbh" caption="大站台编号" width="100"/>
		<t:gridCol property="daztmc" caption="大站台名称" width="100"/>
		<t:gridCol property="paidtqqsx" caption="排队提前期上限(分钟)" width="140"/>
		<t:gridCol property="paidtqqxx" caption="排队提前期下限(分钟)" width="140"/>
		<t:gridCol property="duiycmqy" caption="出厂编号" width="90"/>
		<t:gridCol property="kacwdbjsj" caption="卡车未到车位报警时间(分钟)" width="170"/>
		<t:gridCol property="fangkbzsj" caption="车位放空报警时间(分钟)" width="150"/>
		<t:gridCol property="shenbtqsj" caption="申报提前时间(分钟)" width="150"/>
		<t:gridCol property="biaos" caption="标识" convert="biaos" width="60"/>
		<t:gridCol property="" caption=""></t:gridCol>
	</t:grid>
	
	
<t:form dialog="true" id="form_dengdqy" action="/kac/saveShijdzts.ajax" idKeys="usercenter,quybh" reset="NOT" submit="NOT" width="920">
	<t:grid id="dengdqy" caption="等待区域" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  back="NOT">
		<t:fieldLayout prefix="record1">
			<t:fieldSelect width="140" property="usercenter" caption="用户中心"  defaultValue="${usercenter }" convert="queryUserCenterMap"  notNull="true"/>
				<t:fieldText width="140" property="quybh" caption="区域编号"  maxLength="10"  dataType="text"  notNull="true"/>
				<t:fieldText width="140" property="quymc" caption="区域名称"  maxLength="32" notNull="true"/>
				<t:fieldText width="140" property="dapzrxssj" caption="大屏准入时间"  maxLength="3"  notNull="true"
				 expression="^([1-9][0-9]{0,2})$" expressionMessage="只能输入1- 999之间的整数值"/>
				<t:fieldText width="140" property="shuaxsj" caption="大站台刷新时间"  maxLength="3" />
				<t:fieldSelect width="140" property="biaos" caption="标识"  convert="biaos" defaultValue="1" notNull="true"/>
		</t:fieldLayout>
	</t:grid>
		<t:fieldLayout prefix="record2" showLabel="false" columns="1">
			<t:fieldGrid width="920" property="shijdzts" caption="大站台" >
			<t:grid id="shijdzt" idKeys="daztbh" src="/kac/queryShijdzt.ajax"  caption="大站台" showNum="true" back="NOT" 
				submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" editable="true" preSaveRowsEvent="preSaveEvent" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
				<t:fieldLayout>
					<t:fieldHidden property="usercenter" caption="用户中心"  />
					<t:fieldHidden property="quybh" caption="区域编号" />
				</t:fieldLayout>
				<t:gridCol property="daztbh" caption="大站台编号" editor="fieldText" width="70"
					editorOptions="{'dataType':'text','maxLength':'10','notNull':true}"/>
				<t:gridCol property="daztmc" caption="大站台名称" editor="fieldText" width="80" 
					editorOptions="{'maxLength':'32','notNull':true}"/>
				<t:gridCol property="paidtqqsx" caption="排队提前期上限(分钟)" editor="fieldText" width="100"
					editorOptions="{'expression':'^([1-9][0-9]{0,3})$','expressionMessage':'只能输入整数数字,首位不能为零','maxLength':'4','notNull':true}"/>
				<t:gridCol property="paidtqqxx" caption="排队提前期下限(分钟)" editor="fieldText" width="100" 
					editorOptions="{'expression':'^([1-9][0-9]{0,3})$','expressionMessage':'只能输入整数数字,首位不能为零','maxLength':'4','notNull':true}"/>
				<t:gridCol property="duiycmqy" caption="出厂编号" editor="fieldText" width="70"
					editorOptions="{'maxLength':'32'}"/>
				<t:gridCol property="kacwdbjsj" caption="卡车未到车位报警时间(分钟)" editor="fieldText" width="100"
					editorOptions="{'expression':'^([1-9][0-9]{0,2})$','expressionMessage':'只能输入整数数字,首位不能为零','maxLength':'3','notNull':true}"/>
				<t:gridCol property="fangkbzsj" caption="车位放空报警时间(分钟)" editor="fieldText" width="110"
					editorOptions="{'expression':'^([1-9][0-9]{0,2})$','expressionMessage':'只能输入整数数字,首位不能为零','maxLength':'3','notNull':true}"/>	
				<t:gridCol property="shenbtqsj" caption="申报提前时间(分钟)" editor="fieldText" width="110"
					editorOptions="{'expression':'^([1-9][0-9]{0,2})$','expressionMessage':'只能输入整数数字,首位不能为零','maxLength':'3','notNull':false}"/>	
				<t:gridCol property="biaos" caption="标识" editor="fieldSelect" width="50" convert="biaos" defaultValue="1" editorOptions="{'notNull':true}"/>
				<t:gridCol property="yuanbiaos" hidden="true"  caption="原标识"></t:gridCol>
				<t:gridCol property="" caption=" "></t:gridCol>
			</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="提交" name="submit_zdy"></t:button>
	</t:form>
	
	
</t:page>
<script type="text/javascript">
	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '有效',
		'0' : '无效'
	};
	
	//等待区域列表行改变事件
	function grid_Dengdqy_click(record, rowIndex) {
		$("#shijdzt_usercenter").fieldValue(record.usercenter); //用户中心
		$("#shijdzt_quybh").fieldValue(record.quybh);	//区域编号
		$("#shijdzt_daztbh").fieldValue("");
		$("#shijdzt_biaos").fieldValue("1");	//标识
		$('#grid_shijdzt').grid('reload',false,[],true);
	}
	
	//失效按钮
	function func_button_del() {
		if(confirm("确认失效")){
			var record = $("#grid_dengdqy").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("quybh="+record[0].quybh);		//区域编号
			params.push("biaos=0");		//标识
			
			if ( '1' == record[0].biaos ) {
				$.sdcui.ajaxUtil.ajax({
					url : "../kac/removeDengdqy.ajax",
					data:params.join('&'),
					success : function(result) {
						if("" == result.result){
			 	    		alert("等待区域下有大站台,不能失效!");
			 	    	}else{
			 	    		$("#grid_dengdqy").grid("reload");
			 	    	}
					}
				});
			} else {
				alert("数据已失效");
			}
		}
	}
	
	//修改按钮
	function func_button_edit() {
		
		$('#form_dengdqy').form("clear");//清除弹出窗口的数据
		
		$('#form_dengdqy').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_dengdqy").grid("getSelectedRecords")[0];//选中的行的数据
		
		if('DEF'==record.quybh){
			alert("此区域是默认DEF区域不可修改！");
		}else{
			
			$('#form_dengdqy').form('fillRecord', $.extend({}, record));
			
			$('#shijdzt').grid('clearBatchData');
			
			$('#shijdzt').grid('reload',false,[],true);
			
			$("#form_dengdqy").form("open","修改");
		}
	
	}
	
	//空格查询
	function grid_dengdqy_beforeSubmit() {
		$("#dengdqy_quybh").fieldValue(trim($("#dengdqy_quybh").fieldValue()));
		$('#dengdqy_daztbh').fieldValue(trim($('#dengdqy_daztbh').fieldValue()));
		if(""==$('#dengdqy_quybh').fieldValue()&&""==$('#dengdqy_daztbh').fieldValue()){
		}
		else{
		$('#grid_Shijdzt').grid('clear');

		$("#shijdzt_usercenter").fieldValue($("#dengdqy_usercenter").fieldValue());	//用户中心
		$("#shijdzt_quybh").fieldValue($("#dengdqy_quybh").fieldValue());		//区域编号
		$("#shijdzt_daztbh").fieldValue($("#dengdqy_daztbh").fieldValue());		//大站台编号
		$("#shijdzt_biaos").fieldValue($("#dengdqy_biaos").fieldValue());		//标识
		$('#grid_shijdzt').grid('reload');
		
		}
	}
	
	function func_button_submit_zdy(){
		$("#record1_quybh").fieldValue(trim($("#record1_quybh").fieldValue()));
		$("#record2_daztbh").fieldValue(trim($("#record2_daztbh").fieldValue()));
		if($("#shijdzt").grid("isEditedCell")){
			$("#shijdzt").grid("saveRows");
		}else{	
			$('#form_dengdqy').form('submit');
		}	
	}	
	
	function preSaveEvent(){		
		$('#form_dengdqy').form('submit');
		return false;
	}
	
	function form_dengdqy_afterSubmit() {
		$('#form_dengdqy').grid('close'); 
	}


	//监听标识
	function record1_biaos_change() {
		var biaos = $('#record1_biaos').fieldValue();
		//无效可以改为有效
		if('0' == biaos){
			$('#record1_biaos').removeClass("disabled");
			$('#record1_biaos input:first').removeAttr("disabled");
		}else{
			$('#record1_biaos').addClass("disabled");
			$('#record1_biaos input:first').attr("disabled",true);
		}
		return true;	
	}
	
</script>

</t:html>
