<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.usercenter}">

<!-- 
	  生产线
	 @author denggq
	 @date 2012-3-21
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
.youi-fieldLayout table td.contral.label-col {
    width: 120px;
}
#form_fenzx>.youi-fieldLayout table td.contral.label-col {
    width: 160px;
}
 </style>
</head>
<script type="text/javascript">


</script>
<t:page i18n="i18n.ckx.xuqjs.i18n_shengcx">
	<t:grid id="grid_shengcx" caption="${i18n.shengcx}" idKeys="usercenter,shengcxbh" load="false" showNum="true" dataFormId="form_shengcx" back="NOT"
		 src="/xuqjs/queryShengcx.ajax"  remove="NOT" clickRowEvent="grid_shengcx_click" scrollHeight="110" pageSize="10">
		<t:fieldLayout  prefix="shengcx" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"  defaultValue="${usercenter}" convert="queryUserCenterMap" width="140"/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}"  maxLength="5" minLength="5" dataType="text" width="140"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}"  convert="biaos" defaultValue="1" width="140"/>
			<c:if test="${zbczxc == true}" >
				<t:fieldSelect property="chanxlx" caption="${i18n.chanxlx}"  convert="chanxlx" width="140"/>
				<%-- <t:fieldText property="duiydx" caption="${i18n.duiydx}"  maxLength="5" minLength="5" dataType="text" width="140"/> --%>
				<t:fieldSelect property="duiydx" caption="${i18n.duiydx}"  src="/xuqjs/listHanzdx.ajax" show="daxxh" code="daxxh" width="140" parents="usercenter"/>
			</c:if>
		</t:fieldLayout>
		
		<t:button caption="${i18n.export}" name="download"></t:button>
		<t:button caption="${i18n.invalidate}" name="del" active="1"/>
		<t:button caption="${i18n.shengcpt}" name="pingt" active="1"/>
		<c:if test="${zbczxc == true}" >
			<t:button caption="${i18n.shezdx}" name="shezdx" active="1"/>
			<t:button caption="${i18n.shezfzx}" name="shezfzx" active="1"/>
		</c:if>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"convert="queryUserCenterMap" width="60"/>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}" width="80"/>
		<t:gridCol hidden="${!zbczxc}" property="chanxlx" caption="${i18n.chanxlx}"  convert="chanxlx" width="100"/>
		<t:gridCol hidden="${!zbczxc}" property="duiydx" caption="${i18n.duiydx}" width="100"/>
		<t:gridCol property="shengcjp" caption="${i18n.shengcjp}" width="90"/>
		<t:gridCol property="weilscjp" caption="${i18n.weilscjp}" width="110"/>
		<t:gridCol property="qiehsj" caption="${i18n.qiehsj}" width="120"/>
		<t:gridCol property="chults" caption="${i18n.chults}" width="120"/>
		<t:gridCol property="anqkctsmrz" caption="${i18n.anqkctsmrz}" width="100"/>
		<t:gridCol hidden="${zbczxc}" property="chews" caption="车位数" width="100"/>
		<t:gridCol hidden="${zbczxc}" property="kongcss" caption="空车身数" width="100"/>
	
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" width="53"/>
		<t:gridCol property="" caption="" width="5"/>
	</t:grid>
	
	<t:grid id="grid_fenpq" caption="${i18n.fenpq}" idKeys="usercenter,shengcxbh,fenpqh" submit="NOT" reset="NOT" back="NOT"
		load="false" src="/xuqjs/queryFenpq.ajax" add="NOT" edit="NOT" remove="NOT" showNum="true" scrollHeight="145"  pageSize="10">
		<t:fieldLayout id="layout2" prefix="fenpq">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"/>
			<t:fieldHidden property="shengcxbh" caption="${i18n.shengcxbh}"/>
			<t:fieldHidden property="biaos" caption="${i18n.biaos}" defaultValue="1" />
		</t:fieldLayout>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}" />
		<t:gridCol property="fenpqh" caption="${i18n.fenpqh}" width="120"/>
		<t:gridCol property="fenpqmc" caption="${i18n.fenpqmc}" width="150"/>
		<t:gridCol property="wulgyyz" caption="${i18n.wulgyyz}" width="150"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos"/>
		<t:gridCol property="" caption="" />
	</t:grid>
	
	
	<t:form dialog="true" id="form_shengcx" action="/xuqjs/saveFenpqs.ajax" width="550" idKeys="usercenter,shengcxbh" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="record1">
			<t:grid id="shengcx" caption="${i18n.shengcx}" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  back="NOT">
				<t:fieldSelect width="140" property="usercenter" caption="${i18n.usercenter}"  defaultValue="${usercenter}" convert="queryUserCenterMap"  notNull="true"/>
				<t:fieldText width="140" property="shengcxbh" caption="${i18n.shengcxbh}"  maxLength="5" minLength="5" dataType="text"  notNull="true"/>
				<t:fieldText width="140" property="shengcjp" caption="${i18n.shengcjp}"  expression="^([1-9][0-9]{0,2})$" expressionMessage="${i18n.shengcjp_ex_mes}"/>
				<t:fieldText width="140" property="weilscjp" caption="${i18n.weilscjp}"  expression="^([1-9][0-9]{0,2})$" expressionMessage="${i18n.weilscjp_ex_mes}"/>
				<t:fieldCalendar width="140" property="qiehsj" caption="${i18n.qiehsj}"  format="yyyy-MM-dd"/>
				<t:fieldText width="140" property="chults" caption="${i18n.chults}"  expression="^([1-9][0-9]?)$" expressionMessage="${i18n.chults_ex_mes}"/>
				<t:fieldText width="140" property="anqkctsmrz" caption="${i18n.anqkctsmrz}" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
					expressionMessage="只能输入0-999.99之间的值" />
				<c:if test="${zbczxc == false}" >
				<t:fieldText notNull="true"  width="140" property="chews" caption="车位数" expression="^[1-9][0-9]{0,4}$|^0$"
					defaultValue="0"	expressionMessage="只能输入0- 99999之间的值" />
				<t:fieldText notNull="true" width="140" property="kongcss" caption="空车身数" expression="^[1-9][0-9]{0,4}$|^0$"
				defaultValue="0"	expressionMessage="只能输入0-99999之间的值" />
				</c:if>
				<t:fieldSelect width="140" property="biaos" caption="${i18n.biaos}"  convert="biaos" defaultValue="1" notNull="true"/>
			</t:grid>
		</t:fieldLayout>
		<t:fieldLayout prefix="record2" showLabel="false" columns="1">
			<t:fieldGrid parents="usercenter,shengcxbh" width="550" property="fenpqs" caption="${i18n.fenpq}" >
			<t:grid id="fenpq" idKeys="fenpqh" src="/xuqjs/queryFenpq.ajax"  caption="${i18n.fenpq}" showNum="true" back="NOT"
				submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" editable="true" preSaveRowsEvent="preSaveEvent" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
				<t:fieldLayout>
					<t:fieldHidden property="usercenter" caption="${i18n.usercenter}"  />
					<t:fieldHidden property="shengcxbh" caption="${i18n.shengcxbh}" />
				</t:fieldLayout>
				<t:gridCol property="fenpqh" caption="${i18n.fenpqh}" editor="fieldText" width="90"
					editorOptions="{'dataType':'text','maxLength':'5','notNull':true}"/>
				<t:gridCol property="fenpqmc" caption="${i18n.fenpqmc}" editor="fieldText" width="120" 
					editorOptions="{closeEvent:func_set_fenpqmc,'maxLength':'40'}"/>
				<t:gridCol property="wulgyyz" caption="${i18n.wulgyyz}" editor="fieldSelect" width="120" 
					editorOptions="{openEvent:func_wulgyyz,'src':'../xuqjs/getZudmByAthority.ajax?role=WULGYY',
					'parents':['usercenter'],
					'show':'KEY','code':'KEY','dataType':'text','maxLength':'10','notNull':true}" />
				<t:gridCol property="biaos" caption="${i18n.biaos}" editor="fieldSelect" width="80" convert="biaos" defaultValue="1" 
					editorOptions="{'notNull':true}"/>
				<t:gridCol property="" caption="" width="5"/>
			</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy}" name="submit_zdy"></t:button>
	</t:form>
	
	<t:form  dialog="true" id="form_shengcpt" idKeys="usercenter,shengcxbh,shengcptbh" action="/xuqjs/saveShengcpt.ajax" width="760" caption="${i18n.shengcpt}" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="record" columns="1" showLabel="false">
		<t:fieldGrid property="list" width="840">
			<t:grid id="grid_shengcpt" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" 
				save="NOT" editable="true" panel="false"  back="NOT" beforeAddRow="func_set_defaultvalue"
				src="/xuqjs/queryShengcpt.ajax" idKeys="usercenter,shengcxbh,shengcptbh" showNum="true" 
				preSaveRowsEvent="preSaveEventScpt" showEditorAddName="ptEditorAdd" showEditorRemoveName="ptEditorRemove">
				<t:fieldLayout id="ly" prefix="shengcpt">
					<t:fieldHidden property="usercenter" caption="${i18n.usercenter}" />
					<t:fieldHidden property="shengcxbh" caption="${i18n.shengcxbh}" />
				</t:fieldLayout>
				<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="80" defaultValue="${usercenter}"/>
				<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}" width="90" />
				<t:gridCol property="shengcptbh" caption="${i18n.shengcptbh}" width="100" editor="fieldText"
					editorOptions="{'dataType':'text','maxLength':'6','notNull':true}"/>
				<t:gridCol property="shengcjp" caption="${i18n.shengcjp}" width="100" editor="fieldText" 
					editorOptions="{'expression':'^([1-9][0-9]{0,2})$','expressionMessage':'${i18n.shengcjp_ex_mes}','notNull':true}"/>
				<t:gridCol property="weilscjp" caption="${i18n.weilscjp}" width="130" editor="fieldText" 
					editorOptions="{'expression':'^([1-9][0-9]{0,2})$','expressionMessage':'${i18n.weilscjp_ex_mes}'}"/>
				<t:gridCol property="qiehsj" caption="${i18n.qiehsj}" width="130" editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd'}"/>
				<t:gridCol property="biaos" caption="${i18n.biaos}" editor="fieldSelect" convert="biaos" defaultValue="1" 
					editorOptions="{'notNull':true}"/>
				<t:gridCol property="" caption=""/>
			</t:grid>
		</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_scpt}" name="submit_scpt"></t:button>
	</t:form>
	
	<t:form dialog="true" id="form_dax" action="/xuqjs/saveHanzdx.ajax" width="550" idKeys="usercenter,daxxh" 
		reset="NOT" caption="${i18n.dax}" >
		<t:fieldLayout prefix="dax" columns="2">
			<t:fieldSelect width="140" property="usercenter" caption="${i18n.usercenter}"  defaultValue="${usercenter}" convert="queryUserCenterMap"  notNull="true"/>
			<t:fieldText width="140" property="daxxh" caption="${i18n.daxxh}" dataType="text"  notNull="true"/>
			<t:fieldText width="140" property="paicfbq" caption="${i18n.paicfbq}" maxLength="2"  expression="^([1-9][0-9]{0,1})$" expressionMessage="${i18n.chults_ex_mes}" notNull="true"/>
			<t:fieldText width="140" property="chaifts" caption="${i18n.chaifts}" maxLength="2" expression="^([1-9][0-9]{0,1})$" expressionMessage="${i18n.chults_ex_mes}" notNull="true"/>
			<t:fieldSelect width="140" property="biaos" caption="${i18n.biaos}"  convert="biaos" defaultValue="1" notNull="true"/>
		</t:fieldLayout>
		<t:fieldLayout prefix="dax" columns="1">
			<t:fieldArea property="beiz" caption="${i18n.beiz}" width="420"/>
		</t:fieldLayout>
	</t:form>
	
	<t:form dialog="true" id="form_fenzx" action="/xuqjs/saveHanzfzx.ajax" width="650" idKeys="usercenter,fenzxh" 
		reset="NOT" caption="${i18n.fenzx}" >
		<t:fieldLayout prefix="fenzx" columns="2">
			<t:fieldSelect width="150" property="usercenter" caption="${i18n.usercenter}"  defaultValue="${usercenter}" convert="queryUserCenterMap"  notNull="true"/>
			<t:fieldText width="150" property="fenzxh" caption="${i18n.fenzxh}" dataType="text"  notNull="true"/>
			<t:fieldSelect width="150" property="daxxh" caption="${i18n.daxxh}"  src="/xuqjs/listHanzdx.ajax" show="daxxh" code="daxxh" notNull="true" parents="usercenter"/>
			<t:fieldText width="150" property="xiaohdbh" caption="${i18n.xiaohdbh}"  maxLength="9" minLength="9" notNull="true"/>
			<%-- <t:fieldText width="150" property="fenzxxs" caption="${i18n.fenzxxs}" maxLength="1" expression="^([1-9])$" expressionMessage="${i18n.fenzxxs_ex_mes}" notNull="true"/> --%>
			<t:fieldSelect width="150" property="fenzxxs" caption="${i18n.fenzxxs}"  convert="fenzxxs" defaultValue="1" notNull="true"/>
			<t:fieldText width="150" property="fenzxddxxlzcs" caption="${i18n.fenzxddxxlzcs}" maxLength="3"  expression="^[1-9][0-9]{0,2}$|^0$" expressionMessage="${i18n.fenzxddxxlzcs_ex_mes}" notNull="true"/>
			<%-- <t:fieldText width="150" property="beijwxpzjzzdz" caption="${i18n.beijwxpzjzzdz}" maxLength="4" expression="^([1-9][0-9]{0,3})$" expressionMessage="${i18n.beijwxpzjzzdz_ex_mes}" notNull="true"/> --%>
			<t:fieldSelect width="150" property="beijwxpxfs" caption="${i18n.beijwxpxfs}"  convert="beijwxpxfs" defaultValue="2" notNull="true"/>
			<t:fieldSelect width="150" property="biaos" caption="${i18n.biaos}"  convert="biaos" defaultValue="1" notNull="true"/>
		</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">
var src='';
//用户中心下拉框事件
function record1_usercenter_change(){
	//$('#field-pop-field_e_wulgyyz').removeClass('loaded'); 
	$('#record2_fenpqs').find('div.grid-content .grid-scroll table tr:first').nextAll().each(function(i,tr){
		$(tr).find('td').each(function(j, node){
			//if (j == 2) $(node).attr('class','').attr('show','').attr('code','').attr('title','').attr('value','').text('');
			if (j == 2){ 
				$(node).removeAttr('class').removeAttr('value').attr('title','').text('');
				$("#editorPanel_fieldSelect_e_wulgyyz").remove();
				$("#field-pop-field_e_wulgyyz").remove();
				$("#youi_loading").remove();
				$("#youi-pop-background").remove();
			}
		});
	});
	//alert(u);
}
//物流工艺员组下拉事件
function func_wulgyyz(a,b,opt){
	var usercenter=$("#record1_usercenter").fieldValue();
	$("#field_usercenter input[name='usercenter']").val(usercenter);
	return true;
}



function setDisabledChanx(params,zbczxc){
	$.each(params,function(i,n){		
			if( n.zbczxc == zbczxc){
				$('#'+n.name).addClass("disabled").find(".textInput").attr("disabled","disabled");
				$('#'+n.name).addClass("disabled").addClass('readonly');
			}
	});
}






	$(document).ready(function() {
		//弹出页面标识不可编辑
		$('#record1_biaos').addClass("disabled");
		var zbczxc = '${zbczxc}'
		var params = [{'name':'record1_shengcjp',	'zbczxc':'false'},
		       		  {'name':'record1_weilscjp',	'zbczxc':'false'},
			       	  {'name':'record1_qiehsj',     'zbczxc':'false'},
			       	  {'name':'record1_chults',		'zbczxc':'false'},
			       	  {'name':'record1_anqkctsmrz',	'zbczxc':'false'},
			       	  {'name':'record1_biaos',	    'zbczxc':'false'}
		       		  ];
		setDisabledChanx(params,zbczxc);
	});
	
	//分装线系数
	$.sdcui.serverConfig.convertArray['fenzxxs'] = {
		'1' : '1',
		'2' : '2'
	};

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	//产线类型
	$.sdcui.serverConfig.convertArray['chanxlx'] = {
		'1' : '${i18n.dax}',
		'2' : '${i18n.fenzx}',
		'3' : '${i18n.other}'
	};
	
	//备件外销排序方式
	$.sdcui.serverConfig.convertArray['beijwxpxfs'] = {
		'1' : '由小到大',
		'2' : '由大到小'
	};
	
	
	//空格查询
	function grid_shengcx_beforeSubmit() {
		$("#shengcx_shengcxbh").fieldValue(trim($("#shengcx_shengcxbh").fieldValue()));
	}
	
	function func_button_submit_zdy(){

		if($("#fenpq").grid("isEditedCell")){
			$("#fenpq").grid("saveRows");
		}else{			
			$('#form_shengcx').form('submit');
		}		
	}	
	function preSaveEvent(){		
		$('#form_shengcx').form('submit');
		return false;
	}
	//关闭生产平台
	function form_shengcx_afterSubmit() {
		$("#form_shengcx").form("close");
	}
	
	//修改按钮
	function func_button_edit() {
		
		$('#form_shengcx').form("clear");//清除弹出窗口的数据
		
		$('#form_shengcx').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_shengcx").grid("getSelectedRecords")[0];//选中的行的数据
		//如果车位数为空，则默认值为0
		if(record.chews == null){
			record.chews= 0;
		}
		//如果空车身数为空，则默认值为0
		if(record.kongcss == null){
			record.kongcss= 0;
		}
			
		$('#form_shengcx').form('fillRecord', $.extend({}, record));
		
		$('#fenpq').grid('clearBatchData');
		
		$('#fenpq').grid('reload',false,[],true);
		
		$("#form_shengcx").form("open","${i18n.update}");
		
		
	}
	
	//新增按钮
	/* function func_button_add() {
		$('#form_shengcx').form("clear");//清除弹出窗口的数据
		$('#form_shengcx').addClass('operant-add');
		$('#record1_usercenter').removeClass("disabled");
		$('#record1_shengcxbh').removeClass("disabled");
		$('#record1_shengcxbh input:first').removeAttr("disabled");
		$('#record1_biaos').fieldValue("1");
		$("#form_shengcx").form("open","增加");
	} */
	
	//生产线列表行改变事件
	function grid_shengcx_click(record, rowIndex) {
		$("#fenpq_usercenter").fieldValue(record.usercenter); //用户中心
		$("#fenpq_shengcxbh").fieldValue(record.shengcxbh);	//生产线编号
		$("#fenpq_biaos").fieldValue("1");	//标识
		$('#grid_fenpq').grid('reload',false,[],true);
	}
	
	
	//失效按钮
	function func_button_del() {
		if(confirm("${i18n.quersx}")){
			var record = $("#grid_shengcx").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("shengcxbh="+record[0].shengcxbh);		//生产线编号
			params.push("biaos=0");		//标识
			
			if ( '1' == record[0].biaos ) {
				$.sdcui.ajaxUtil.ajax({
					url : "../xuqjs/removeShengcx.ajax",
					data:params.join('&'),
					success : function(result) {
						if("" == result.result){
			 	    		alert("${i18n.bunsx}");
			 	    	}else{
			 	    		$("#grid_shengcx").grid("reload");
			 	    		alert("${i18n.shixcg}");
			 	    	}
					}
				});
			} else {
				alert("${i18n.shujysx}");
			}
		}
	}
	
	//分配区名称长度为40
	function func_set_fenpqmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");
		var fenpqmcIndex = $('td.fenpqmc:last').prevAll().length;
		var fenpqmc = trim(rowElement.find('td:eq(' + fenpqmcIndex + ')').text());
		
		if(undefined != fenpqmc && null != fenpqmc){
			if (!checkCH(40, fenpqmc)) {
				rowElement.find('td:eq(' + fenpqmcIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.fenpqmccd}");
				return false;
			}
		}
	}
	
	//监听标识
	function record1_biaos_change() {
		var biaos = $('#record1_biaos').fieldValue();
		//无效可以改为有效
		if('0' == biaos){
			$('#record1_biaos').removeClass("disabled");
			$('#record1_biaos input:first').removeAttr("disabled");
// 			$('#record1_biaos').fieldEnabled();
		}else{
			$('#record1_biaos').addClass("disabled");
			$('#record1_biaos input:first').attr("disabled",true);
// 			$('#record1_biaos').fieldDisabled();
		}
		return true;	
	}
	
	
	//生产平台
	function func_button_pingt() {
		var record = $("#grid_shengcx").grid("getSelectedRecords")[0];//选中的行的数据
		$('#form_shengcpt').form('fillRecord', $.extend({}, record));
		$('#grid_shengcpt').grid('clearBatchData');
		$('#grid_shengcpt').grid('reload');
		$("#form_shengcpt").form("open");
	}
	
	//设置大线
	function func_button_shezdx() {
		var record = $("#grid_shengcx").grid("getSelectedRecords")[0];//选中的行的数据
		//大线线号不可编辑
		$('#dax_daxxh').addClass("disabled").find(".textInput").attr("disabled","disabled");
		$('#dax_daxxh').addClass("disabled").addClass('readonly');
		//获取大线信息，并填充会话框数据
		var params = [];
		params.push("usercenter="+record.usercenter);	//用户中心
		params.push("daxxh="+record.shengcxbh);		//生产线编号
		$.sdcui.ajaxUtil.ajax({
			url : "../xuqjs/getDaxInfo.ajax",
			data:params.join('&'),
			success : function(result) {
				$('#form_dax').form("clear");
				var fillDate = result.result;
				if(!fillDate){		//没有对应的焊装大线数据，则只带出用户中心、大线线号、标识
					fillDate = {};
					fillDate.usercenter = record.usercenter;
					fillDate.daxxh = record.shengcxbh;
					fillDate.biaos = '1';
					$('#form_dax').addClass('operant-add');//增加的operant为1，修改的operant为2
				}else{
					$('#form_dax').removeClass('operant-add');//增加的operant为1，修改的operant为2
				}
				$('#form_dax').form('fillRecord', $.extend({}, fillDate));
				$("#form_dax").form("open");
			}
		});
	}
	
	//提交完成后，关闭焊装大线消息框
	function form_dax_afterSubmit(result) {
		if(false != result.success){
			$("#form_dax").form("close");
			$("#grid_shengcx").grid("reload");
		}
	}
	
	//设置分装线
	function func_button_shezfzx() {
		var record = $("#grid_shengcx").grid("getSelectedRecords")[0];//选中的行的数据
		//分装线号不可编辑
		$('#fenzx_fenzxh').addClass("disabled").find(".textInput").attr("disabled","disabled");
		$('#fenzx_fenzxh').addClass("disabled").addClass('readonly');
		//获取分装线信息，并填充会话框数据
		var params = [];
		params.push("usercenter="+record.usercenter);	//用户中心
		params.push("fenzxh="+record.shengcxbh);		//生产线编号
		$.sdcui.ajaxUtil.ajax({
			url : "../xuqjs/getFenzxInfo.ajax",
			data:params.join('&'),
			success : function(result) {
				$('#form_fenzx').form("clear");
				var fillDate = result.result;
				if(!fillDate){		//没有对应的焊装分装线数据，则只带出用户中心、分装线线号、标识
					fillDate = {};
					fillDate.usercenter = record.usercenter;
					fillDate.fenzxh = record.shengcxbh;
					fillDate.biaos = '1';
					fillDate.beijwxpxfs = '2';
					$('#form_fenzx').addClass('operant-add');//增加的operant为1，修改的operant为2
				}else{
					$('#form_fenzx').removeClass('operant-add');//增加的operant为1，修改的operant为2
				}
				$('#form_fenzx').form('fillRecord', $.extend({}, fillDate));
				$("#form_fenzx").form("open");
			}
		});
	}
	
	//提交完成后，关闭焊装大线消息框
	function form_fenzx_afterSubmit(result) {
		if(false != result.success){
			$("#form_fenzx").form("close");
			$("#grid_shengcx").grid("reload");
		}
	}
	
	
	function func_button_submit_scpt(){

		if($("#grid_shengcpt").grid("isEditedCell")){
			$("#grid_shengcpt").grid("saveRows");
		}else{			
			$('#form_shengcpt').form('submit');
		}		
	}	
	function preSaveEventScpt(){		
		$('#form_shengcpt').form('submit');
		return false;
	}
	
	//关闭生产平台
	function form_shengcpt_afterSubmit(result) {
		if(false != result.success){
			$("#form_shengcpt").form("close");
		}
		
	}
	
	/*
	*@description 生产平台初始值
	*@param shengcxbh 生产线编号
	*@date 2012-5-28
	*@author denggq
	*/
	function func_set_defaultvalue(defaultValue){
		defaultValue.usercenter=$('#shengcpt_usercenter').fieldValue();
		defaultValue.shengcxbh=$('#shengcpt_shengcxbh').fieldValue();
	}
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#shengcx_usercenter').fieldValue());
		var shengcxbh = trim($('#shengcx_shengcxbh').fieldValue());
		var biaos = $('#shengcx_biaos').fieldValue();
		
		var record = {'usercenter':usercenter,'shengcxbh':shengcxbh,'biaos':biaos};
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadShengcx.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>

</t:html>