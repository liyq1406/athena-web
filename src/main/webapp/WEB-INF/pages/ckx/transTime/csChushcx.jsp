<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.cschushcx}">

<!-- 
	  CS初始化历史查询
	 @author xss
	 @date 2014-9-05
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.transTime.i18n_cschushcx">
	<t:grid id="grid_cschushcx" caption="${i18n.cschushcx}" idKeys="usercenter,chanx" src="/transTime/queryCkxCsChushcx.ajax" 
		add="NOT" edit="NOT" back="NOT" scrollHeight="335" pageSize="15"
		editable="true" removeSrc="/cangk/removeKuwdj.ajax" saveRowsSrcs="/cangk/saveKuwdj.ajax" 
		load="false"  showNum="true"  afterSaveRowsEvent="afterSaveRows"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" 
		>
		
        <t:fieldLayout id="fl_kuwdj" prefix="cschushcx" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${loginUsercenter}"  convert="queryUserCenterMap" readonly="true"  width="110"/>
			<t:fieldText property="fenpqh" caption="${i18n.fenpq}" dataType="text" maxLength="10" minLength="3" width="110"/>
			<t:fieldText property="chanx" caption="${i18n.chanx}" notNull="true" dataType="text" maxLength="5" width="110"/>
			<t:fieldText property="xiaohd" caption="${i18n.xiaohd}" dataType="text" maxLength="25" width="110"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjh}" dataType="text" maxLength="10" width="110"/>
			<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt}" convert="zhuangt2" width="110"/>
		    <t:fieldCalendar property="qissj" caption="${i18n.pandkssj}"  format="yyyy-MM-dd"></t:fieldCalendar>
		    <t:fieldCalendar property="zhongzsj" caption="${i18n.pandjssj}" format="yyyy-MM-dd"></t:fieldCalendar>
		</t:fieldLayout>

        <t:gridCol property="chanx" caption="${i18n.chanx}"></t:gridCol>
		<t:gridCol property="xiaohd" caption="${i18n.xiaohd}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
		<t:gridCol property="pandr" caption="${i18n.pandr}"></t:gridCol>
		<t:gridCol property="zhengclsh" caption="${i18n.zhengclsh}" ></t:gridCol>		
		<t:gridCol property="pandsl" caption="${i18n.pandsl}"></t:gridCol>
		<t:gridCol property="pandsj" caption="${i18n.pandsj}"></t:gridCol>			
		<t:gridCol property="zhuangt" caption="${i18n.zhuangt}" convert="zhuangt" />

	</t:grid>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'C_CSCSHZT0' : '${i18n.C_CSCSHZT0}',
		'C_CSCSHZT1' : '${i18n.C_CSCSHZT1}',
		'C_CSCSHZT2' : '${i18n.C_CSCSHZT2}',
		'C_CSCSHZT3' : '${i18n.C_CSCSHZT3}',
		'C_CSCSHZT4' : '${i18n.C_CSCSHZT4}'
	};
	
		//标识
	$.sdcui.serverConfig.convertArray['zhuangt2'] = {
		'0' : '${i18n.one}',
		'1' : '${i18n.two}',
		'2' : '${i18n.three}',
		'3' : '${i18n.four}',
		'4' : '${i18n.five}'
	};

	
/*	
	function grid_cschushcx_beforeSubmit() {
		//$("#kuwdj_cangkbh").fieldValue(trim($("#kuwdj_cangkbh").fieldValue()));
		//$("#kuwdj_kuwdjbh").fieldValue(trim($("#kuwdj_kuwdjbh").fieldValue()));
		
	    var beginTime = $("#cschushcx_qissj").fieldValue();
		var endTime = $("#cschushcx_zhongzsj").fieldValue();
		
		var beginTimes = beginTime.substring(0, 10).split('-');
	    var endTimes = endTime.substring(0, 10).split('-');
			
	    var day = (Date.parse(endTimes) - Date.parse(beginTimes)) / (24 * 60 * 60 * 1000);
	    if (day > 7) {
	        alert("时间输入错误，时间范围不能大于7天!");
	        return false;
	    } else {
	        return true;
	    }    
	}
*/
	

	//保存按钮
	function func_button_save() {
		$('#grid_cschush').grid('saveRows');
	}

	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	function preSaveEvent(){		
		$('#form_kuwdjbz').form('submit');
		return false;
	}
	
	function grid_cschushcx_afterSubmit(result){
	
	/*alert(result);
		var m =  result.response.message;
		
		if(m!='0000'){
			alert(m);
		}
		*/
		
		

	}
	
	
	
	
</script>

</t:html>