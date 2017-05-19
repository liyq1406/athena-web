<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.title}">

<!-- 
	取货运输费用参考系
	 @author denggq
	 @date 2012-4-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_quhys">
	<t:grid id="grid_quhyuns" caption="${i18n.title}" 
	idKeys="usercenter,quhid,gongysdm" 
	editable="true"  
	back="NOT" 
	scrollHeight="290" 
	pageSize="15"
	src="/xuqjs/queryQuhYuns.ajax" 
	load="false" 
	saveRowsSrcs="/xuqjs/savesquhyuns.ajax"
	removeSrc="/xuqjs/removequhyuns.ajax" 
	showNum="true" 
	afterSaveRowsEvent="afterSaveRows"
	showEditorAddName="editorAdd" 
	showEditorRemoveName="editorRemove" >
		
		<t:fieldLayout id="layout1" prefix="quhyuns" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="gongysdm" caption="供应商代码" maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码" maxLength="10" minLength="10" width="110"/>
		<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
	    <t:fieldCalendar property="youxsj" caption="有效时间" format="yyyy-MM-dd" width="110"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.mobxz}" name="mobxz" active="0"/>
		
	
		<t:gridCol   property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol  property="chengysdm" caption="${i18n.chengysdm}" editor="fieldText" width="90" editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'只能输入大写字母或数字,固定长度10位,7,8位能输入空格','notNull':true}"></t:gridCol>
		<t:gridCol property="gongysdm" caption="${i18n.gongysdm}" editor="fieldText" width="90"  editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'只能输入大写字母或数字,固定长度10位,7,8位能输入空格','notNull':true}"></t:gridCol>	
		<t:gridCol   property="shengxsj" caption="${i18n.shengxsj}" editor="fieldCalendar" width="120" editorOptions="{'format':'yyyy-MM-dd','notNull':true,closeEvent:func_set_shengxsj}"></t:gridCol>
		<t:gridCol property="shixsj" caption="${i18n.shixsj}" editor="fieldCalendar" width="120" editorOptions="{'format':'yyyy-MM-dd','notNull':true,closeEvent:func_set_shixsj}"></t:gridCol>
		<t:gridCol  property="zhixqhdj" caption="${i18n.zhixqhdj}" editor="fieldText" width="100" editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.zuixqdl_ex_mes }','notNull':true}"></t:gridCol>
		<t:gridCol  property="quyjpdj" caption="${i18n.quyjpdj}" editor="fieldText" width="100" editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.zuixqdl_ex_mes }','notNull':true}"></t:gridCol>
		<t:gridCol  property="ganxysdj" caption="${i18n.ganxysdj}" editor="fieldText" width="100" editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.zuixqdl_ex_mes }','notNull':true}"></t:gridCol>
		<t:gridCol  property="cangcpsdj" caption="${i18n.cangcpsdj}" editor="fieldText" width="100" editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.zuixqdl_ex_mes }','notNull':true}"></t:gridCol>
		<t:gridCol  property="fankdj" caption="${i18n.fankdj}" editor="fieldText" width="100" editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'返空单价只能输入0-9999999999.999的整数或小数','notNull':true}"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/>
		<t:gridCol  property="creator" caption="创建人"  width="70" ></t:gridCol>	
		<t:gridCol property="create_time" caption="创建时间" width="130"/>
		<t:gridCol  property="editor" caption="修改人"  width="70" ></t:gridCol>	
		<t:gridCol property="edit_time" caption="修改时间" width="130"/>
		<t:gridCol hidden="true" property="quhid" caption=""  width="0"/>
					<t:gridCol property="" caption=""/>
	</t:grid>
		<t:file action="/xuqjs/importAth_uploadquhyuns.do" size="100">
		<t:fileparam sheet="quhyunsMob" keys="usercenter,gongysdm,chengysdm" table="{dbSchemal3}CKX_QUHYSFY" datasourceId="1" />
	</t:file>		
</t:page>



<script type="text/javascript">

var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';

//标识
$.sdcui.serverConfig.convertArray['biaos'] = {
	'1' : '${i18n.youx}',
	'0' : '${i18n.wux}'
};



//失效时间必须大于生效时间    denggq 
function func_set_shixsj(){
	var cell = this.col.cell;
	var rowElement = cell.parent("tr:first");

	var shixsjIndex = $('td.shixsj:first').prevAll().length;
	var shixsj = trim(rowElement.find('td:eq(' + shixsjIndex + ')').text());
	
	var shengxsjIndex = $('td.shengxsj:first').prevAll().length;
	var shengxsj = trim(rowElement.find('td:eq(' + shengxsjIndex + ')').text());
	
	if(!compareDate(shengxsj,shixsj)){
		if(shengxsj!=shixsj){
			alert("${i18n.shixd}");
			return false;
		}

	}
	return true;
}

// 生效时间必须小于失效时间  denggq  
function func_set_shengxsj(){

	var cell = this.col.cell;
	var rowElement = cell.parent("tr:first");

	var shixsjIndex = $('td.shixsj:first').prevAll().length;
	var shixsj = trim(rowElement.find('td:eq(' + shixsjIndex + ')').text());
	
	var shengxsjIndex = $('td.shengxsj:first').prevAll().length;
	var shengxsj = trim(rowElement.find('td:eq(' + shengxsjIndex + ')').text());

	if(!compareDate(shengxsj,shixsj)){
		if(shengxsj!=shixsj){
			alert("${i18n.shengxx}");
			return false;
		}
	}
	return true;
}

	//空格查询
	function grid_quhyuns_beforeSubmit() {
		$("#quhyuns_xiaohcbh").fieldValue(trim($("#quhyuns_gongysdm").fieldValue()));
		$("#quhyuns_shengcxbh").fieldValue(trim($("#quhyuns_chengysdm").fieldValue()));
	}

	function func_button_save(){
		$('#grid_quhyuns').grid('saveRows');
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		$('#grid_quhyuns').grid('reload');
		return true;
	}
	
	//导出模板
	function func_button_mobxz(){
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadquhyunsMob.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>

</t:html>