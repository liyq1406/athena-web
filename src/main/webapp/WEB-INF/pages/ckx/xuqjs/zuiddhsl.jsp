<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.zuiddhsl}">

<!-- 
	最大订货数量
	 @author qizhongtao
	 @date 2012-4-07
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_zuiddhsl">
		<t:grid id="grid_zuiddhsl" caption="${i18n.zuiddhsl}" idKeys="usercenter,lingjbh,gongysbh,nianzq" load="false" remove="NOT" back="NOT" scrollHeight="305" pageSize="15"
			src="/xuqjs/queryZuiddhsl.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveZuiddhsl.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows">
			<div id="div_record0">
			<t:fieldLayout id="fl_zuiddhsl" prefix="zuiddhsl" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150"/>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="150"/>
				<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" maxLength="10" minLength="10" expression="(^[0-9A-Z]{6}[\s0-9A-Z]{2}[0-9A-Z]{2}$)" expressionMessage="${i18n.gongysbh_ex_mes}" width="150"/>
			</t:fieldLayout>
			</div>
			
			<t:button name="exports"  caption="${i18n.mobxz}"></t:button>
			
			<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" 
				editorOptions="{'notNull':true}"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text'}" width="100"/>
			<t:gridCol property="gongysbh" caption="${i18n.gongysbh}" editor="fieldText" 
				editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'${i18n.gongysbh_ex_mes}','notNull':true}" width="100"/>
			<t:gridCol property="nianzq" caption="${i18n.nianzq}" editor="fieldText" 
				editorOptions="{'notNull':true,'expression':'^[1-9][0-9]{3}(0[0-9]|(1(0|1|2)))$','expressionMessage':'${i18n.nianzq_ex_mes }'}" width="90"/>
			<t:gridCol property="zuiddhsl" caption="${i18n.zuiddhsl}" editor="fieldText" 
				editorOptions="{'expression':'^[1-9][0-9]{0,6}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.zuiddhsl_ex_mes }'}" width="120"/>
			<t:gridCol property="" caption=""/>
		</t:grid>
		
		<t:file action="importAth_zuiddhsl_upload.do" size="100">
			<t:fileparam sheet="zuiddhsl" keys="USERCENTER,LINGJBH,GONGYSBH,NIANZQ" table="{dbSchemal3}ckx_zuiddhsl" datasourceId="1" ></t:fileparam>
		</t:file>
	</t:page>
	

	<script type="text/javascript">
	 var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';
		//空格查询
		function grid_zuiddhsl_beforeSubmit() {
			$("#zuiddhsl_lingjbh").fieldValue(trim($("#zuiddhsl_lingjbh").fieldValue()));
			$("#zuiddhsl_gongysbh").fieldValue(trim($("#zuiddhsl_gongysbh").fieldValue()));
		}
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
		//模板导出
		function func_button_exports(){	
			 $.sdcui.pageUtils.goPage({
				url : 'exports.do',
				mode : 'form',
				//record : record,
				beforeSubmit : function(){
					return true;
				}
			}); 
		}
	</script>
</t:html>











