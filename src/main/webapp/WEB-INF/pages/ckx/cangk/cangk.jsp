<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="${i18n.cangk}-${i18n.zick}">

<!-- 
	  仓库-子仓库
	 @author denggq
	 @date 2012-1-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 120px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_cangk">
	<t:grid id="grid_cangk" caption="${i18n.cangk}" idKeys="usercenter,cangkbh" 
		dataFormId="form_cangk" remove="NOT" scrollHeight="113" back="NOT"
		src="/cangk/queryCangk.ajax" removeSrc="/cangk/removeCangk.ajax" 
		load="false" clickRowEvent="grid_cangk_click"  showNum="true" pageSize="10">
		<t:fieldLayout id="fl_cangk" prefix="cangk" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="140"/>
			<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" dataType="text" maxLength="3" minLength="3" width="140"/>
			<t:fieldText property="rongqcbh" caption="${i18n.rongqcbh}" maxLength="10" dataType="text" width="140"/>
			<t:fieldSelect property="cangklx" caption="${i18n.cangklx}" convert="queryCklx"  width="140"/>
			<!-- 如果角色为 ZBCPOA 则选择物流工艺员组查询-->
			<c:if test="${ 'ZBCPOA' == role || 'root' == role}">
				<t:fieldSelect property="wulgyyz" caption="${i18n.wulgyyz}" src="/xuqjs/getZudmByAthority.ajax?role=WULGYY" parents="usercenter"
					show="VALUE" code="KEY" defaultValue="${WULGYY}" width="140" />
			</c:if>
			<!-- 如果当前用户业务角色为 WULGYY 则默认查询对应的的数据-->
			<c:if test="${ 'WULGYY' == role }">
				<t:fieldHidden property="wulgyyz" caption="${i18n.wulgyyz}" defaultValue="${WULGYY}" />
			</c:if>
			
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="140"/>
		</t:fieldLayout>
		
		<t:button caption="导出" name="download"></t:button>
		<t:button caption="${i18n.danjlr}" name="danjlr" active="1"></t:button>
		<t:button caption="${i18n.invalidate}" name="del" active="1"/>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="70"/>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" width="75"/>
		<t:gridCol property="cangklx" caption="${i18n.cangklx}" convert="queryCklx" width="100"/>		
		<t:gridCol property="rongqcbh" caption="${i18n.rongqcbh}" width="90"/>
		<t:gridCol property="daoctqq" caption="仓库备货提前期" width="135" />
		<t:gridCol property="zhantlx" caption="${i18n.zhantlx}" convert="zhantlx"/>
		<t:gridCol property="anqkctsmrz" caption="${i18n.anqkctsmrz}" width="135" />
		<t:gridCol property="zuidkctsmrz" caption="${i18n.zuidkctsmrz}" width="135" />
		
		<t:gridCol hidden="true" property="wulgyyz"  caption="${i18n.wulgyyz}" width="120"/>
		<t:gridCol property="wulgyyzmc"  caption="${i18n.wulgyyzmc}" width="120"/>
		<t:gridCol property="xiehztbz" caption="${i18n.xiehztbz}" width="135" />
		<t:gridCol hidden="${hidden_chukms }" property="chukms" convert="chukms"  caption="出库模式" width="120"/>
		<t:gridCol property="gongc" caption="${i18n.gongc}" convert="queryGC"  width="70"/>
		<t:gridCol property="xianh" caption="${i18n.xianh}"  width="70"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" width="60"/>
		<t:gridCol property="" caption=" " />
	</t:grid>
				
	<t:grid id="grid_zick" caption="${i18n.zick}" idKeys="usercenter,cangkbh,zickbh" 
		submit="NOT" reset="NOT" scrollHeight="100" pageSize="10" back="NOT" 
		load="false" src="/cangk/queryZick.ajax" add="NOT" edit="NOT" remove="NOT" showNum="true">
		<t:fieldLayout id="fl_zick" prefix="zick">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"></t:fieldHidden>
			<t:fieldHidden property="cangkbh" caption="${i18n.cangkbh}"></t:fieldHidden>
			<t:fieldHidden property="biaos" caption="${i18n.biaos}" defaultValue="1" />
		</t:fieldLayout>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"/>
		<t:gridCol property="zickbh" caption="${i18n.zickbh}" width="100"/>
		<t:gridCol property="baohd" caption="${i18n.baohd}" width="100"/>
		<t:gridCol property="shifelgl" caption="${i18n.shifelgl}" convert="shifelgl" width="100"/>
		<t:gridCol property="guanlyzbh" caption="${i18n.guanlyzbh}" width="100"/>
		<t:gridCol property="zhantbh" caption="${i18n.zhantbh}" width="90"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" />
		<t:gridCol property="" caption="" width="5"/>
	</t:grid>

	<t:form dialog="true" id="form_cangk" action="/cangk/saveZicks.ajax?role=${role}" width="600" idKeys="usercenter,cangkbh" reset="NOT" submit="NOT">
		
			<t:grid id="cangk" caption="${i18n.cangk}" submit="NOT" reset="NOT" 
				add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  back="NOT">
				<t:fieldLayout prefix="record">
					<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" 
						defaultValue="${usercenter}" notNull="true" width="150" />
					<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" notNull="true" dataType="text" maxLength="3" minLength="3" width="150" />
					<t:fieldSelect property="cangklx" caption="${i18n.cangklx}" convert="queryCklx" notNull="true" width="150" />
					<t:fieldText property="rongqcbh" caption="${i18n.rongqcbh}" dataType="text" maxLength="10" width="150" />
					<t:fieldText property="daoctqq" caption="仓库备货提前期" defaultValue="0" expression="^(([1-9][0-9]{0,4})|0)$" 
						expressionMessage="${i18n.daoctqq_ex_mes }" width="150" />
					<t:fieldSelect property="zhantlx" caption="${i18n.zhantlx}" convert="zhantlx" notNull="true" width="150"/>
					<t:fieldText property="anqkctsmrz" caption="${i18n.anqkctsmrz}" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,2}$|^0$"
						expressionMessage="${i18n.anqkctsmrz_ex_mes }"  width="150" />
					<t:fieldText property="zuidkctsmrz" caption="${i18n.zuidkctsmrz}" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,2}$|^0$"
						expressionMessage="${i18n.zuidkctsmrz_ex_mes}"  width="150" />
					<t:fieldText property="xiehztbz" caption="${i18n.xiehztbz}" maxLength="4" minLength="4" dataType="text"  width="150" />
					<t:fieldSelect property="wulgyyz" caption="${i18n.wulgyyz}" src="/xuqjs/getZudmByAthority.ajax?role=WULGYY" 
						parents="usercenter"	show="VALUE" code="KEY"  width="150" />
					<c:if test="${ 'ZXCPOA' == role || 'root' == role}">
						<t:fieldSelect  property="chukms" caption="出库模式" convert="chukms"  width="150" />
					</c:if>
					<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  notNull="true"  width="150" />
					<t:fieldSelect property="gongc" caption="${i18n.gongc}" src="/cangk/queryGongc.ajax" 
						parents="usercenter" code="KEY" show="VALUE" width="150"/>
					<t:fieldText property="xianh" caption="${i18n.xianh}" maxLength="5"  dataType="text" expression="^[0-9a-zA-Z]{0,5}$"
						expressionMessage="${i18n.shuzzm_ex_mes}"  width="150" />
					<t:fieldHidden property="role"  defaultValue="${role}" />
				</t:fieldLayout>
			</t:grid>
		<t:fieldLayout prefix="record" showLabel="false" columns="1">
			<t:fieldGrid width="600" property="zicks" >
				<t:grid id="zick" idKeys="usercenter,cangkbh,zickbh" src="/cangk/queryZick.ajax" caption="${i18n.zick}" 
					save="NOT"  back="NOT" preSaveRowsEvent="preSaveEvent"
					submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" 
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					editable="true" load="false" showNum="true">
					<t:fieldLayout prefix="r2">
						<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"  />
						<t:fieldHidden property="cangkbh" caption="${i18n.cangkbh}" />
					</t:fieldLayout>
					<t:gridCol editable="${edit_zickbh}" property="zickbh" caption="${i18n.zickbh}" editor="fieldText" width="90"
						editorOptions="{closeEvent:func_set_zickbh,'maxLength':'3','minLength':'3','dataType':'text','expressionMessage':'[A-Z0-9]','notNull':true}"/>
					<t:gridCol editable="${edit_baohd}" property="baohd" caption="${i18n.baohd}" editor="fieldText" defaultValue="80" width="100"
						editorOptions="{openEvent:qickcEditAble,'expression':'^(0|100|[1-9][0-9]?)$','expressionMessage':'${i18n.baohd_ex_mes}'}"/>
					<t:gridCol editable="${edit_shifelgl}" property="shifelgl" caption="${i18n.shifelgl}" convert="shifelgl" editor="fieldSelect" width="100"
						editorOptions="{openEvent:qickcEditAble}"/>
					<t:gridCol editable="${edit_guanlyzbh}" property="guanlyzbh" caption="${i18n.guanlyzbh}" editor="fieldText" width="100"
						editorOptions="{'dataType':'text','minLength':'3','maxLength':'3'}"/>
					<t:gridCol editable="${edit_zhantbh}" property="zhantbh" caption="${i18n.zhantbh}" editor="fieldText"
						editorOptions="{closeEvent:func_set_zhantbh,openEvent:zhantbhEditAble,'dataType':'text','maxLength':'6'}"/>
					<t:gridCol editable="${edit_biaos}" property="biaos" caption="${i18n.biaos}" editor="fieldSelect" convert="biaos" defaultValue="1" editorOptions="{'notNull':true}" width="82"/>
					<t:gridCol property="" caption=" " width="5"/>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy}" name="submit_zdy"></t:button>
	</t:form>
	
	<t:form dialog="true" caption="${i18n.cangk_danj}" idKeys="usercenter,cangkbh" id="form_printStrogdict" 
		action="/cangk/savesPrintStrogdict.ajax" width="700" reset="NOT" >
		<t:fieldLayout prefix="record" showLabel="false" columns="1">
		<t:fieldGrid property="ckx_strogdict" parents="usercenter,cangkbh" column="2" width="700">
				<t:grid id="form_ckx_printStrogdict" src="/cangk/printStrogdict.ajax" idKeys="usercenter,cangkbh,zidbm,zidmc"  back="NOT"
					reset="NOT" add="NOT" edit="NOT" remove="NOT" save="NOT" panel="false" editable="false" load="false">
					<t:fieldLayout prefix="strogdict" columns="2">
						    <t:fieldHidden property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}"/>
							<t:fieldHidden property="cangkbh" caption="${i18n.cangkbh}"/>
							<t:fieldText property="danjzbh" caption="单据组编号" maxLength="20" dataType="text"/>
<%-- 							<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"/> --%>
<%-- 							<t:fieldHidden property="cangkbh" caption="${i18n.cangkbh}"/> --%>
					</t:fieldLayout>
					<t:gridCol property="usercenter" caption="${i18n.usercenter}" />
					<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" />
					<t:gridCol property="zidbm" caption="${i18n.zidbm}" width="100"/>
					<t:gridCol property="zidmc" caption="${i18n.zidmc}"  width="160"/>
					<t:gridCol property="danjzbh" caption="${i18n.danjzbh}" editor="fieldText"  width="100"/>
					<t:gridCol property="printnumber" caption="${i18n.printnumber}" editor="fieldText" />
					<t:gridCol property="biaos" caption="${i18n.qity}"  convert="qity" editor="fieldSelect" editorOptions="{'notNull':true}"/>
					<t:gridCol property="" caption=" " />
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
</t:page>

<script type="text/javascript">
	//0005458 mantis
// 	function record_cangklx_change(){
// 		var currentRole = "${role}";
// 		var cangklx = $("#record_cangklx").fieldValue();
// 		if("4"==cangklx&&"ZBCPOA"==currentRole){
// 			$("#record_zhantlx").fieldValue("1")
// 		}else{
// 			$("#record_zhantlx").fieldValue("0")
// 		}
// 	}
	
	//mantis  0005458 在准备层 如果 站台类型为 发货站台 则站台编号 清空 、同时清空 卸货站台编组  执行层则不清空站台编号，只清空卸货站台编组
	function record_zhantlx_change(){
		var zhantlx = $("#record_zhantlx").fieldValue();
		var currentRole = "${role}";
		if("1"==zhantlx){
			$("#record_xiehztbz").fieldValue("");
			$('#record_xiehztbz').addClass("disabled").find(".textInput").attr("readonly","true");
			$('#record_xiehztbz').addClass("disabled").addClass('readonly');
		}else{
			$('#record_xiehztbz').removeClass("disabled").removeClass('readonly');
			$('#record_xiehztbz').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
		}
		if("ZBCPOA"==currentRole||"JIHUAY"==currentRole||"WULGYY"==currentRole){
			$('#record_zicks').find('div.grid-content .grid-scroll table tr:first').nextAll().each(function(i,tr){
				$(tr).find('td').each(function(j, node){
					if (j == 4) $(node).attr('title','').attr('value','').text('');
				});
			});
		}
		return true;
	}
	

	function qickcEditAble(){
		var zickbhIndex = $('td.zickbh:first').prevAll().length;
		var baohdIndex = $('td.baohd:first').prevAll().length;
		var shifelglIndex = $('td.shifelgl:first').prevAll().length;
		var event = window.event || arguments.callee.caller.arguments[2];
		var td = event.srcElement || event;
		var newzickbhIndex = zickbhIndex-1;
		var newbaohdIndex = baohdIndex-1;
		var newshifelglIndex = shifelglIndex-1;
		//编辑单元格所在TD的tr
		var tr;
		if (event.srcElement) {
			tr = $(td).parent('tr:first');
		} else {
			tr = $(td.cell).parent('tr:first');
		}
		var zickbhStr = $(tr).find('td:eq('+newzickbhIndex+')').text();
		var splitzicangku = zickbhStr.substr(2,1);
		if("D"==splitzicangku||"P"==splitzicangku){
			$(tr).find('td:eq('+newbaohdIndex+')').text("");
			$(tr).find('td:eq('+newshifelglIndex+')').text("");
			return false;
		}
		return true;
	}
	
	//0005458 mantis
	function zhantbhEditAble(){
		var currentRole = "${role}";
		var zhantlx = $("#record_zhantlx").fieldValue();
 		var zhantbhIndex = $('td.zhantbh:first').prevAll().length;
		var event = window.event || arguments.callee.caller.arguments[2];
		var td = event.srcElement || event;
 		var newzhantbhIndex = zhantbhIndex-1;
		//编辑单元格所在TD的tr
		var tr;
		if (event.srcElement) {
			tr = $(td).parent('tr:first');
		} else {
			tr = $(td.cell).parent('tr:first');
		}
// 		var zickbhStr = $(tr).find('td:eq('+newzickbhIndex+')').text();
// 		var splitzicangku = zickbhStr.substr(2,1);
		if("ZBCPOA"==currentRole&&"1"==zhantlx){
			$(tr).find('td:eq('+newzhantbhIndex+')').text("").attr('value','');
			return false;
		}
		return true;
	}
	
	function func_set_baohd(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var zickbhIndex = $('td.zickbh:first').prevAll().length;
		var baohdIndex = $('td.baohd:first').prevAll().length;
		//var shifelglIndex = $('td.shifelgl:first').prevAll().length;
		
		var newzickbhIndex = zickbhIndex-1;
		var newbaohdIndex = baohdIndex-1;
		//var newshifelglIndex = shifelglIndex-1;
		
		var zickbhStr = rowElement.find('td:eq('+newzickbhIndex+')').text();
		var baohdStr = rowElement.find('td:eq('+newbaohdIndex+')').text();
		var splitzicangku = zickbhStr.substr(2,1);
		if("B"==splitzicangku&&""==baohdStr){
			alert("饱和度不能为空");
			return false;
		}
		if("S"==splitzicangku&&""==baohdStr){
			alert("饱和度不能为空");
			return false;
		}
		
	}
	
	//标识位
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	//启用
	$.sdcui.serverConfig.convertArray['qity'] = {
		'1' : '${i18n.qiy}',
		'0' : '${i18n.tingy}'
	};
	
	//标识位
	$.sdcui.serverConfig.convertArray['zhantlx'] = {
		'1' : '${i18n.fahzt}',
		'0' : '${i18n.xiehzt}'
	};
	//出库模式'H，A，B，C，D，E，F，G、BH，YK，SY'
	$.sdcui.serverConfig.convertArray['chukms'] = {
		'H' : 'H模式',
		'A' : '其它模式',
		
	};
	
	//是否按EL管理
	$.sdcui.serverConfig.convertArray['shifelgl'] = {
			'1' : '${i18n.shi}',
			'0' : '${i18n.fou}'
	};
	
	//子仓库文本框失去光标触发事件
 	function func_set_zickbh(){
 		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		
		var zickbhIndex = $('td.zickbh:first').prevAll().length;
		var baohdIndex = $('td.baohd:first').prevAll().length;
		var shifelglIndex = $('td.shifelgl:first').prevAll().length;
		var zhantbhIndex = $('td.zhantbh:first').prevAll().length;
		var zickbhStr = rowElement.find('td:eq(0)').text();
		var newzhantbhIndex = zhantbhIndex -1;
		var zhantbhStr = rowElement.find('td:eq('+newzhantbhIndex+')').text();
		var splitzicangku = zickbhStr.substr(2,1);
		if("D"==splitzicangku||"P"==splitzicangku){
			rowElement.find('td:eq(1)').text("");
			rowElement.find('td:eq(2)').text("");
		}
		// mantis编号 0005243 子仓库新增时，P类型的不用输入卸货站台。
		if("P"==splitzicangku&&""!=zhantbhStr){
			rowElement.find('td:eq(1)').text("");
			rowElement.find('td:eq(2)').text("");
			rowElement.find('td:eq('+newzhantbhIndex+')').text("").attr('value','').attr('title','');
			alert("子仓库为P类型的不用填写站台编号");
		}
		
	}
	
 	//站台编号去光标触发事件
 	function func_set_zhantbh(){
 		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var zickbhIndex = $('td.zickbh:first').prevAll().length;
		var zhantbhIndex = $('td.zhantbh:first').prevAll().length;
		var zickbhStr = rowElement.find('td:eq(0)').text();
		var newzhantbhIndex = zhantbhIndex -1;
		var zhantbhStr = rowElement.find('td:eq('+newzhantbhIndex+')').text();
		var splitzicangku = zickbhStr.substr(2,1);
		//子仓库修改时，P类型的不用输入卸货站台。
		if("P"==splitzicangku&&""!=zhantbhStr){
			rowElement.find('td:eq('+newzhantbhIndex+')').text("").attr('value','').attr('title','');
			alert("子仓库为P类型的不用填写站台编号");
		}
		
	}
	
	function func_button_submit_zdy(){
		
		
		if($("#zick").grid("isEditedCell")){
			$("#zick").grid("saveRows");
		}else{			
			$('#form_cangk').form('submit');
		}		
	}	
	function preSaveEvent(){		
		$('#form_cangk').form('submit');
		return false;
	}
	
	function form_cangk_afterSubmit() {
		$('#form_cangk').grid('close'); 
	}

	//空格查询
	function grid_cangk_beforeSubmit() {
		$("#cangk_rongqcbh").fieldValue(trim($("#cangk_rongqcbh").fieldValue()));
		$("#cangk_cangkbh").fieldValue(trim($("#cangk_cangkbh").fieldValue()));
	}
	

	/**仓库列表行改变事件*/
	function grid_cangk_click(record, rowIndex) {//grid标签里加clickRowEvent="grid_cangk_click" 
		$("#zick_usercenter").fieldValue(record.usercenter);//用户中心
		$("#zick_cangkbh").fieldValue(record.cangkbh);		//仓库编号
		$('#grid_zick').grid('reload',false,[],true); 
	}

	//修改按钮
	function func_button_edit() {
		
		$('#form_cangk').form("clear");//清除弹出窗口的数据
		
		$('#form_cangk').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_cangk").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_cangk').form('fillRecord', $.extend({}, record));
		
		$('#zick').grid('clearBatchData');
		
		$('#zick').grid('reload',false,[],true); 
		
		$("#form_cangk").form("open");
		
	}

	
	//监听标识
	function record_biaos_change() {
	
		var biaos = $('#record_biaos').fieldValue();
		
		//无效可以改为有效
		
		//MANTIS  0004993 

	/* 	if('0' == biaos){
			$('#record_biaos').removeClass("disabled");
			$('#record_biaos input:first').removeAttr("disabled");
		}else{
			$('#record_biaos').addClass("disabled");
			$('#record_biaos input:first').attr("disabled",true);
		}  */
	return true;
}
	
	//失效按钮
	function func_button_del(){
		if(confirm("${i18n.quersx}")){
			var record = $("#grid_cangk").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("cangkbh="+record[0].cangkbh);		//仓库编号
			params.push("biaos=0");		//标识
			
			if('1' == record[0].biaos){
				 $.sdcui.ajaxUtil.ajax({
			 	 	   url:"../cangk/removeCangk.ajax",
			 	 	   data:params.join('&'),
			 	       success:function (result){
			 	    	  if("" == result.result){
				 	    		alert("${i18n.bunsx}");
				 	    	}else{
				 	    		$("#grid_cangk").grid("reload");
				 	    	}
			 	       	}
			     	});
			}else{
				alert("${i18n.shijysx}");
			}
		}
 	}
	
	
	//单据入录按钮
	function func_button_danjlr(){
		$('#form_printStrogdict').form("clear");//清除弹出窗口的数据
		var record = $("#grid_cangk").grid("getSelectedRecords")[0];
		$("#strogdict_usercenter").fieldValue(record.usercenter);
		$("#strogdict_cangkbh").fieldValue(record.cangkbh);
		$("#form_ckx_printStrogdict").grid("reload");
		$("#form_printStrogdict").form("open");
	}
	
	function form_printStrogdict_afterSubmit(){
		$("#form_printStrogdict").form("close");
	}
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#cangk_usercenter').fieldValue());
		var cangkbh = trim($('#cangk_cangkbh').fieldValue());
		var rongqcbh = trim($('#cangk_rongqcbh').fieldValue());
		var cangklx = trim($('#cangk_cangklx').fieldValue());
		var wulgyyz = trim($('#cangk_wulgyyz').fieldValue());
		var biaos = $('#cangk_biaos').fieldValue();
		
		var record = {'usercenter':usercenter,'cangkbh':cangkbh,'rongqcbh':rongqcbh,'cangklx':cangklx,'wulgyyz':wulgyyz,'biaos':biaos};
		
		$.sdcui.pageUtils.goPage({
			url : '../cangk/downloadCangk.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	
	  //初始化页面
	function initPage(){
		
		//控制权限
		var currentRole = "${role}";
		
		var params = [{'name':'record_usercenter',	'roles':'JIHUAY,WULGYY'},
		       		  {'name':'record_cangkbh',		'roles':'JIHUAY,WULGYY'},
			       	  {'name':'record_cangklx',		'roles':'JIHUAY'},
			       	  {'name':'record_rongqcbh',	'roles':'JIHUAY,ZBCPOA,WULGYY'},
			       	  {'name':'record_daoctqq',		'roles':'JIHUAY,ZBCPOA,WULGYY'},
			       	  {'name':'record_zhantlx',		'roles':'JIHUAY'},
			       	  {'name':'record_anqkctsmrz',	'roles':'ZXCPOA'},
			       	  {'name':'record_zuidkctsmrz',	'roles':'ZXCPOA'},
			       	  {'name':'record_biaos',	'roles':'JIHUAY'},
			      
			       	  {'name':'record_xiehztbz',	'roles':'WULGYY'},
			       	 {'name':'record_wulgyyz',	'roles':'ZXCPOA,JIHUAY,WULGYY'}
			       	
			       	
		       		  ];
		setDisabled(params,currentRole);
		
		//查询页面子表隐藏
// 		$('#grid_zick').parent().parent().hide();
		//弹出页面标识不可编辑
		//$('#record_biaos').addClass("disabled");
// 		if('ZBCPOA' == currentRole || 'WULGYY' == currentRole || 'JIHUAY' == currentRole){
// 			$('#record_zhantlx').addClass("disabled");
// 		}		
	}
</script>

</t:html>