<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.zhizlxzh}">

<!-- 
	制造路线转换
	 @author qizhongtao
	 @date 2012-4-17
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_zhizlxzh">
		<t:grid id="grid_zhizlxzh" caption="${i18n.zhizlxzh}" idKeys="usercenter,zhizlxy" load="false" remove="NOT" back="NOT" scrollHeight="305" pageSize="15"
			src="/xuqjs/queryZhizlxzh.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveZhizlxzh.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows">
			<t:fieldLayout id="fl_zhizlxzh" prefix="zhizlxzh" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150"/>
				<t:fieldText property="zhizlxy" caption="${i18n.zhizlxy}" dataType="text" maxLength="3" minLength="3" width="150"/>
				<t:fieldSelect property="zhizlxx" caption="${i18n.zhizlxx}" convert="queryZZLX" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="usercenter"  caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"/>
			<t:gridCol property="zhizlxy"  caption="${i18n.zhizlxy}" editor="fieldText" editorOptions="{'notNull':true,'maxLength':'3','minLength':'3','dataType':'text'}" width="150"/>
			<t:gridCol property="zhizlxx"  caption="${i18n.zhizlxx}" editor="fieldSelect" convert="queryZZLX"  width="150"/>
			<t:gridCol property="" caption=""/>
			<t:button caption="${i18n.mobxz}" name="mobxz" active="0" />
		</t:grid>
		<t:file action="../xuqjs/importAth_zhizlxzh_upload.do" size="100">
			<t:fileparam sheet="zhizlxzh" keys="USERCENTER,ZHIZLXY"
				table="{dbSchemal3}CKX_ZHIZLXZH"  datasourceId="1"></t:fileparam>
		</t:file>
	</t:page>
	

	<script type="text/javascript">
	
		//空格查询
		function grid_zhizlxzh_beforeSubmit() {
			$("#zhizlxzh_zhizlxy").fieldValue(trim($("#zhizlxzh_zhizlxy").fieldValue()));
		}
		//导出模板
		function func_button_mobxz(){	
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/zhizlxzhDown.do',
				mode : 'form',
// 				record : record,
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
	</script>
</t:html>











