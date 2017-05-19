<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="卡车司机信息">

<!-- 
	 卡车司机信息
	 @author CSY
	 @date 2016-9-8
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_chengyskc" caption="承运商-卡车" idKeys="chengys,kach" 
	load="false" showNum="true" back="NOT" dataFormId="form_chengyskc"
	clickRowEvent="grid_chengyskc_click"
	 src="/kcApp/querychengyskc.ajax"  remove="NOT"  
	 scrollHeight="160">
		<t:fieldLayout  prefix="chengyskc" columns="3">
			<t:fieldText property="chengys" caption="承运商"  maxLength="10" dataType="text" width="110"/>
			<t:fieldText property="kach" caption="卡车号"  maxLength="10"  dataType="text" width="110"/>
			<t:fieldSelect property="biaos" caption="标识"  convert="biaos" defaultValue="1" width="110"/>
		</t:fieldLayout>
		<t:gridCol property="chengys" caption="承运商" width="200"/>
		<t:gridCol property="chengysmc" caption="承运商名称" width="300"/>
		<t:gridCol property="kach" caption="卡车号" width="200"/>
		<t:gridCol property="biaos" caption="标识" convert="biaos" width="60"/>
		<t:gridCol property="" caption=""></t:gridCol>
		<t:button caption="失效" name="del" active="1"/>
	</t:grid>
	
	<t:grid id="grid_kacsj" caption="卡车-司机" idKeys="kach,shoujh" submit="NOT" reset="NOT" back="NOT"
		load="false" src="/kcApp/querykacsj.ajax" add="NOT" edit="NOT" remove="NOT" showNum="true" scrollHeight="145">
		<t:fieldLayout id="layout2" prefix="kacsj">
			<t:fieldHidden property="chengys" caption="承运商"/>
			<t:fieldHidden property="kach" caption="卡车号"/>
			<t:fieldHidden property="biaos" caption="标识" defaultValue="1" />
		</t:fieldLayout>
		<t:gridCol property="shoujh" caption="手机号" width="200"/>
		<t:gridCol property="sijxm" caption="司机姓名" width="200"/>
		<t:gridCol property="biaos" caption="标识" convert="biaos" width="60"/>
		<t:gridCol property="" caption=""></t:gridCol>
	</t:grid>
	
	
<t:form dialog="true" id="form_chengyskc" action="/kcApp/savekacsjs.ajax" idKeys="chengys,kach" reset="NOT" submit="NOT" width="800">
	<t:grid id="chengyskc" caption="承运商-卡车" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  back="NOT">
		<t:fieldLayout prefix="record1">
			<t:fieldText width="140" property="chengys" caption="承运商"  maxLength="20"  dataType="text"  notNull="true"/>
			<t:fieldText width="140" property="kach" caption="卡车号"  maxLength="8"  dataType="text"  notNull="true"/>
			<t:fieldSelect width="140" property="biaos" caption="标识"  convert="biaos" defaultValue="1" notNull="true"/>
		</t:fieldLayout>
	</t:grid>
		<t:fieldLayout prefix="record2" showLabel="false" columns="1">
			<t:fieldGrid width="800" property="kacsj" caption="卡车-司机" >
			<t:grid id="kacsj" idKeys="kach,chengys,oldsjh" src="/kcApp/querykacsj.ajax"  caption="卡车-司机" showNum="true" back="NOT" 
				submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" editable="true" preSaveRowsEvent="preSaveEvent" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
				<t:fieldLayout>
					<t:fieldHidden property="chengys" caption="承运商" />
					<t:fieldHidden property="kach" caption="卡车号" />
					<t:fieldHidden property="biaos" caption="标识" defaultValue="1" />
				</t:fieldLayout>
				<t:gridCol property="shoujh" caption="手机号" editor="fieldText" width="300"
					editorOptions="{'expression':'^[1][3|4|5|7|8][0-9]{9}$','expressionMessage':'请输入正确的手机号','maxLength':'11','notNull':true}"/>
				<t:gridCol property="sijxm" caption="司机姓名" editor="fieldText" width="300" 
					editorOptions="{'maxLength':'50','notNull':true}"/>
				<t:gridCol property="biaos" caption="标识" editor="fieldSelect" width="50" convert="biaos" defaultValue="1" editorOptions="{'notNull':true}"/>
				<t:gridCol property="oldsjh" caption="原手机号" hidden="true"/>
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
	
	//承运商卡车列表行改变事件
	function grid_chengyskc_click(record, rowIndex) {
		$("#kacsj_kach").fieldValue(record.kach); //卡车号
		$("#kacsj_biaos").fieldValue("1");	//标识
		$('#grid_kacsj').grid('reload',false,[],true);
	}
	
	//失效按钮
	function func_button_del() {
		if(confirm("确认失效")){
			var record = $("#grid_chengyskc").grid("getSelectedRecords");
			
			var params = [];
			params.push("chengys="+record[0].chengys);	//承运商
			params.push("kach="+record[0].kach);		//卡车号
			params.push("biaos=0");		//标识
			
			if ( '1' == record[0].biaos ) {
				$.sdcui.ajaxUtil.ajax({
					url : "../kcApp/removeChengyskc.ajax",
					data:params.join('&'),
					success : function(result) {
						if("" == result.result){
			 	    		alert("承运商-卡车下有卡车司机信息,不能失效!");
			 	    	}else{
			 	    		alert(result.result);
			 	    		$("#grid_chengyskc").grid("reload");
			 	    	}
					}
				});
			}
		}
	}
	
	//修改按钮
	function func_button_edit() {
		
		$('#form_chengyskc').form("clear");//清除弹出窗口的数据
		
		$('#form_chengyskc').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_chengyskc").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_chengyskc').form('fillRecord', $.extend({}, record));
			
		$('#kacsj').grid('clearBatchData');
			
		$('#kacsj').grid('reload',false,[],true);
			
		$("#form_chengyskc").form("open","修改");
	
	}
	
	//空格查询
	function grid_chengyskc_beforeSubmit() {
		$("#chengyskc_chengys").fieldValue(trim($("#chengyskc_chengys").fieldValue()));
		$("#chengyskc_kach").fieldValue(trim($("#chengyskc_kach").fieldValue()));
	}
	
	function func_button_submit_zdy(){
		$("#record1_kach").fieldValue(trim($("#record1_kach").fieldValue()));
		$("#record2_shoujh").fieldValue(trim($("#record2_shoujh").fieldValue()));
		if($("#kacsj").grid("isEditedCell")){
			$("#kacsj").grid("saveRows");
		}else{	
			$('#form_chengyskc').form('submit');
		}	
	}	
	
	function preSaveEvent(){		
		$('#form_chengyskc').form('submit');
		return false;
	}
	
	function form_chengyskc_afterSubmit() {
		$('#form_chengyskc').grid('close'); 
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
