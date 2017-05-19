<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%
String welcome = (String)request.getSession().getAttribute("zbcZxc");
%>
<c:set var="wel"><%=welcome %></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xiehzt}">

<!-- 
	  卸货站台
	 @author denggq
	 @date 2012-1-16
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<style type="text/css">
  .youi-fieldLayout table td.contral.label-col { width: 100px; }
</style>
<t:page i18n="i18n.ckx.cangk.i18n_xiehzt">
 <t:grid id="grid_xiehztbz" caption="${i18n.xiehztbz}" idKeys="xiehztbzh" src="/cangk/queryZsd.ajax"  back="NOT" 
		 editable="false" load="false"  showNum="true" scrollHeight="150" 
		 clickRowEvent="grid_xiehztbz_click" dataFormId="form_xiehztbz" remove="NOT"
		 >
		<t:fieldLayout id="fl_xiehztzsd" prefix="xiehztbz" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter }"  width="150" />
				<t:fieldText property="xiehztbzh" caption="${i18n.xiehztbzh}" maxLength="4" dataType="text" width="150"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="150" />
				<t:fieldText property="xiehztbh" caption="${i18n.xiehztbh}" maxLength="6" dataType="text" width="150"/>
			<c:if test="${wel == 'ZXC' }">	
				<t:fieldText property="daztbh" caption="${i18n.daztbh}" maxLength="10" dataType="text" width="150"/>
			</c:if>	
				<t:fieldSelect property="biaoss" caption="${i18n.biaos}" convert="biaos" defaultValue=""  width="150" />
		</t:fieldLayout>
		
		<t:button caption="${i18n.invalidate }" name="invalidate" active="1" />
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap"  />
		<t:gridCol property="xiehztbzh" caption="${i18n.xiehztbzh}"  width="120" />
		<t:gridCol property="tongsjdcs" caption="${i18n.tongsjdcs }"  width="120" />
		<t:gridCol property="chulsj" caption="${i18n.chulsj}"  width="130" />
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" />
		<t:gridCol property="wulgyyz" caption="${i18n.wulgyyz }" hidden="true"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
		
	</t:grid>
	
	
	<t:grid id="grid_xiehzt" scrollHeight="150" caption="${i18n.xiehzt}" idKeys="usercenter,xiehztbh" src="/cangk/queryXiehzt.ajax" 
		add="NOT" edit="NOT" submit="NOT" reset="NOT" save="NOT" back="NOT"  afterSaveRowsEvent="afterSaveRows"
		editable="false" remove="NOT" load="false"  showNum="true">
		<t:fieldLayout id="fl_xiehzt" prefix="xiehzt_g" columns="4">
			<t:fieldHidden property="xiehztbh" caption="${i18n.xiehztbh}" />
			<t:fieldHidden property="daztbh" caption="${i18n.daztbh}" />
			<t:fieldHidden property="xiehztbzh" caption="${i18n.xiehztbzh}" />
			<t:fieldHidden property="biaos" caption="${i18n.biaos}" />
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap"  />
		<t:gridCol property="xiehztbhq" caption="${i18n.xiehztbh}"  width="120"/>
		<t:gridCol property="xiehztmc" caption="${i18n.xiehztmc}"  width="120"/>
	
		<c:if test="${wel == 'ZXC' }">
			<t:gridCol  property="daztbh" caption="${i18n.daztbh}"  width="150" />
		</c:if>
		<t:gridCol property="yunxtqdhsj" caption="${i18n.yunxtqdhsj}"  width="130" />
		<t:gridCol property="shjgsj" caption="${i18n.shjgsj}" width="130"/>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"/>
		<t:gridCol property="gongcbm" caption="${i18n.gongcbm}" />
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos"  />
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
	
	<t:form id="form_xiehztbz" caption="${i18n.xiehztbz}" dialog="true" reset="NOT" submit="NOT"
		width="870" action="saveXiehzt.ajax" idKeys="xiehztbzh,usercenter">
		<t:fieldLayout columns="3" prefix="xiehztbzFROM" showLabel="true">
			<t:fieldSelect property="usercenter" notNull="true" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter }"  width="110" />
			<t:fieldText property="xiehztbzh" caption="${i18n.xiehztbzh}" maxLength="4" minLength="4" notNull="true" dataType="text" width="110"/>
			<t:fieldText property="tongsjdcs"  notNull="true" maxLength="2" caption="${i18n.tongsjdcs}" expression="^([1-9][0-9]?)$" 
				expressionMessage="${i18n.tongsjdcs_ex_mes }" width="110"/>
			<t:fieldText property="chulsj" caption="${i18n.chulsj}" expression="^([1-9][0-9]{0,3})$" expressionMessage="${i18n.chulsj_ex_mes }"
				notNull="true" maxLength="4"  width="110"/>
			<c:if test="${ 'ZBCPOA' == role }">
				<t:fieldSelect property="wulgyyz" caption="${i18n.wulgyyz }" notNull="true" width="110" src="../xuqjs/getZudmByAthority.ajax?role=WULGYY" parents="usercenter" show="VALUE" code="KEY"  />
			</c:if>
			<c:if test="${ 'WULGYY' == role }">
				<t:fieldSelect property="wulgyyz" caption="${i18n.wulgyyz }" notNull="true" width="110" src="../xuqjs/getZudmByAthority.ajax?role=WULGYY" parents="usercenter" show="VALUE" code="KEY"  />
			</c:if>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="110"  />
			<t:fieldGrid property="xiehzt" parents="xiehztbzh" mode="reload" width="750" column="4" caption="${i18n.xiehzt}">
				<t:grid id="from_grid_xiehzt" caption="${i18n.xiehzt}" idKeys="usercenter,xiehztbh"
					src="/cangk/queryXiehzt.ajax" add="NOT" edit="NOT" submit="NOT" reset="NOT" save="NOT" back="NOT"  
			 		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			 		editable="true" load="false"  showNum="true" preSaveRowsEvent="preSaveEvent">
					<t:gridCol property="usercenter" hidden="true" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" 
						defaultValue="${usercenter}" editorOptions="{'notNull':true}" width="70"/>
					<t:gridCol property="xiehztbh" caption="${i18n.xiehztbh}" editor="fieldText" width="90"
						editorOptions="{'dataType':'text','notNull':true,'maxLength':'2','minLength':'2'}"/>
					<t:gridCol property="xiehztmc" caption="${i18n.xiehztmc}" editor="fieldText" width="95"
						editorOptions="{closeEvent:func_set_xiehztmc,'maxLength':'15'}"/>
				<c:if test="${wel == 'ZXC' }">	
					<t:gridCol property="daztbh" caption="${i18n.daztbh}" editor="fieldText" width="90"
						editorOptions="{closeEvent:func_validate_daztbh,'dataType':'text','maxLength':'10','minLength':'2'}"/>
				</c:if>	
					<t:gridCol property="yunxtqdhsj" caption="${i18n.yunxtqdhsj}" editor="fieldText" width="125" 
						editorOptions="{'expression':'^(0|[1-9][0-9]{0,2})$','expressionMessage':'${i18n.yunxtqdhsj_ex_mes}'}"/>
					<t:gridCol property="shjgsj" caption="${i18n.shjgsj}" width="90"
						editor="fieldText" editorOptions="{'expression':'^(0|[1-9][0-9]{0,2})$','expressionMessage':'${i18n.shjgsj_ex_mes }'}"/>
<%-- 					<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" width="80" /> --%>
					<t:gridCol property="gongcbm" caption="${i18n.gongcbm}" width="70" editor="fieldText" editorOptions="{'dataType':'text','maxLength':'10'}"/>
					<t:gridCol property="biaos" caption="${i18n.biaos}" width="50" convert="biaos" defaultValue="1" editor="fieldSelect" 
						editorOptions="{'notNull':true}" />
					<t:gridCol property="" caption=" " width="5"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy }" name="submit_zdy"></t:button>
	</t:form>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};
	function func_button_edit() {
		$("#form_xiehztbz").form('clear');
		$('#form_xiehztbz').removeClass('operant-add');
		var record = $("#grid_xiehztbz").grid("getSelectedRecords")[0];
		$("#form_xiehztbz").form('fillRecord', $.extend({
			xiehzt : '--'
		}, record));
		$("#form_xiehztbz").form("open", "${i18n.update }");
	}
	//空格查询
	function grid_xiehztbz_beforeSubmit() {
		$("#xiehztbz_xiehztbh").fieldValue(trim($("#xiehztbz_xiehztbh").fieldValue()));
		var welcomePage = '<%=welcome %>';
		if("ZXC"==welcomePage){
		$("#xiehztbz_daztbh").fieldValue(trim($("#xiehztbz_daztbh").fieldValue())); //hzg add 2015.1.27
		if ("" != $("#xiehztbz_xiehztbh").fieldValue()||"" != $("#xiehztbz_daztbh").fieldValue()||"" != $("#xiehztbz_biaoss").fieldValue()) {
			$("#xiehzt_g_xiehztbzh").fieldValue("");
			$("#xiehzt_g_xiehztbh").fieldValue($("#xiehztbz_xiehztbh").fieldValue());
			$("#xiehzt_g_daztbh").fieldValue($("#xiehztbz_daztbh").fieldValue());//hzg add 2015.1.27
			$("#xiehztbz_xiehztbzh").fieldValue("");
			$("#xiehztbz_biaos").fieldValue("");
			$("#xiehzt_g_biaos").fieldValue($("#xiehztbz_biaos").fieldValue());
			$('#grid_xiehzt').grid('reload');
			$('#grid_xiehzt').parent().parent().show();			
		} else {
			$("#xiehztbz_xiehztbzh").fieldValue(trim($("#xiehztbz_xiehztbzh").fieldValue()));			
		}		
	  }else{
	  	if ("" != $("#xiehztbz_xiehztbh").fieldValue()||"" != $("#xiehztbz_biaoss").fieldValue()) {
			$("#xiehzt_g_xiehztbzh").fieldValue("");
			$("#xiehzt_g_xiehztbh").fieldValue($("#xiehztbz_xiehztbh").fieldValue());
			$("#xiehztbz_xiehztbzh").fieldValue("");
			$("#xiehztbz_biaos").fieldValue("");
			$("#xiehzt_g_biaos").fieldValue($("#xiehztbz_biaos").fieldValue());
			$('#grid_xiehzt').grid('reload');
			$('#grid_xiehzt').parent().parent().show();			
		} else {
			$("#xiehztbz_xiehztbzh").fieldValue(trim($("#xiehztbz_xiehztbzh").fieldValue()));			
		}		
	  }
	}
	function func_button_invalidate() {
		var row = $("#grid_xiehztbz").grid("getSelectedRecords");		
		if ('1' == row[0].biaos) {
			$.sdcui.ajaxUtil.ajax({
				url : "listXiehzt.ajax?xiehztbzh="+row[0].xiehztbzh+"&biaos=1",
				success : function(result) {
					if(0 ==  result.result.length  ){
						if(confirm("${i18n.quedsx}")){
							$.sdcui.ajaxUtil.ajax({
								url : "removeXiehzt.ajax?xiehztbzh="+row[0].xiehztbzh,// 									
								success : function() {
									$("#grid_xiehztbz").grid("reload");
								}
							});
						}
					} else {
						alert("${i18n.bunsx}");
					}
				}
			});
		} else {
			alert("${i18n.shijysx}");
		}		
	}
	function xiehztbzFROM_biaos_change(){
		if('0'== $("#xiehztbzFROM_biaos").fieldValue()){
			$("#xiehztbzFROM_biaos").removeClass('disabled');
			$("#xiehztbzFROM_biaos input").attr("disabled",false);
		}else{
			$("#xiehztbzFROM_biaos").addClass('disabled');
			$("#xiehztbzFROM_biaos input").attr("disabled",true);
		}
	}
	//卸货站台名称长度为30
	function func_set_xiehztmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var xiehztmcIndex = $('td.xiehztmc:first').prevAll().length;
		var xiehztmc = trim(rowElement.find('td:eq(' + xiehztmcIndex + ')').text());
		
		if(undefined != xiehztmc && null != xiehztmc && "" !== xiehztmc){
			if (!checkCH(30, xiehztmc)) {
				alert("${i18n.xiehztmccd}");
				return false;
			}
		}
		return true;
	}
	
	//验证大站台编号是否存在  hzg 2015.1.31
	function func_validate_daztbh(){
		var daztbh = $("#field_e_daztbh input").val();
		var uc = $("#xiehztbzFROM_usercenter").fieldValue();
		if(""==daztbh||null==daztbh){
			return false;
		}else{
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/cangk/getDaztbhCount.ajax?usercenter="+uc+"&daztbh="+daztbh,
				success : function(result) {
					if(result.result==0){
					   alert("大站台编号系统未定义或已失效");
					   return false;
					}
				}
			});
		}
		return true;
	}
	
	function grid_xiehztbz_click(record, rowIndex){
		$("#xiehzt_g_xiehztbzh").fieldValue(trim(record.xiehztbzh));
		$("#xiehzt_g_xiehztbh").fieldValue("");
		$("#xiehzt_g_daztbh").fieldValue(""); //hzg add 2015.1.27
		$("#xiehzt_g_biaos").fieldValue($("#xiehztbz_biaos").fieldValue());
		$('#grid_xiehzt').grid('reload',false,[],true);
// 		$('#grid_xiehzt').parent().parent().show();
	}
	function initPage(){
// 		$('#grid_xiehzt').parent().parent().hide();
	}
	function func_button_submit_zdy() {	
		if($("#from_grid_xiehzt").grid("isEditedCell")){
			$("#from_grid_xiehzt").grid("saveRows");
		}else{			
			$('#form_xiehztbz').form('submit');
		}	
	}
	
	
	
	
	function preSaveEvent(){		
		$('#form_xiehztbz').form('submit');
		return false;
	}
	
</script>

</t:html>