<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.jiaofmzd}">

<!-- 
	 交付码字典
	 @author denggq
	 @date 2012-4-5
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_jiaofmzd" >
	<t:grid id="grid_jiaofmzd" caption="${i18n.jiaofmzd}" 
		idKeys="usercenter,jiaofm"
		src="/xuqjs/queryJiaofmzd.ajax" 
		saveRowsSrcs="/xuqjs/saveJiaofmzd.ajax"
		load="false" 
		editable="true"
		showNum="true"
		back="NOT"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="15"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		>
		<t:fieldLayout id="fl_jiaofmzd" prefix="jiaofmzd" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldText property="jiaofm" caption="${i18n.jiaofm}" maxLength="3" minLength="3" dataType="text" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.removeRecord}" name="del" active="1" />
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"/>
		<t:gridCol property="jiaofm" caption="${i18n.jiaofm}" editor="fieldText" editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}" width="90"/>
		<t:gridCol property="shuom" caption="${i18n.shuom}" editor="fieldText" editorOptions="{'maxLength':'50'}" width="120"/>
		<t:gridCol property="beiz" caption="${i18n.beiz}" editor="fieldText" editorOptions="{'maxLength':'100'}" width="120"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" editor="fieldSelect" editorOptions="{'notNull':true}" convert="biaos" defaultValue="1"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};

	//空格查询
	function grid_jiaofmzd_beforeSubmit() {
		$("#jiaofmzd_jiaofm").fieldValue(trim($("#jiaofmzd_jiaofm").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_jiaofmzd').grid('saveRows');
	}
	
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//删除记录
	function func_button_del() {
		var record = $("#grid_jiaofmzd").grid("getSelectedRecords");
		
		var params = [];
		params.push("usercenter="+record[0].usercenter);	//用户中心
		params.push("jiaofm="+record[0].jiaofm);		//交付码
		
		if('0' == record[0].biaos){
			if(confirm("你确定删除?")) //0005623
			 $.sdcui.ajaxUtil.ajax({
		 	 	   data:params.join('&'),
		 	 	   url:"../xuqjs/removeJiaofmzd.ajax",
		 	       success:function (result){
		 	    	  $("#grid_jiaofmzd").grid("reload");
		 	       }
		     });
		}else{
			alert("${i18n.bunsc}");
		}		
	}
</script>

</t:html>