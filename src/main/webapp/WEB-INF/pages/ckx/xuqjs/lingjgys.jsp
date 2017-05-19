<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.lingjgys}">

<!-- 
	 零件供应商
	 @author qizhongtao
	 @date 2012-3-29
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 70px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_lingjgys">
		<t:grid id="grid_lingjgys" caption="${i18n.lingjgys}" idKeys="gongysbh,usercenter,lingjbh" load="false" back="NOT" scrollHeight="315" pageSize="15"
			src="/xuqjs/queryLingjgys.ajax" saveRowsSrcs="/xuqjs/saveLingjgys.ajax" editable="true"  showNum="true" afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" exportXls="true">
			<t:fieldLayout id="fl_lingjgys" prefix="lingjgys" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="110" />
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" dataType="text" width="110"/>
				<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" maxLength="10"  width="110"/>
				<t:fieldSelect property="dinghlx" caption="订货路线"  convert="queryDinghlx"  width="110"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}"  convert="biaos" defaultValue="1" width="110"/>
			</t:fieldLayout>
			
<%-- 			<t:button caption="${i18n.export}" name="download"></t:button> --%>
			<t:button caption="${i18n.baoz}" name="baoz" active="0" />
			
			<t:gridCol editable="${edit_usercenter}" property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" 
				defaultValue="${usercenter}" editorOptions="{'notNull':true}"/>
			<t:gridCol editable="${edit_lingjbh}" property="lingjbh" caption="${i18n.lingjbh}" editor="fieldText" 
				editorOptions="{'maxLength':'10','minLength':'10','dataType':'text','notNull':true}"/>
			<t:gridCol editable="${edit_gongysbh}" property="gongysbh" caption="${i18n.gongysbh}" editor="fieldText" 
				editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'${i18n.gongysbh_ex_mes}','notNull':true}"/>
			<t:gridCol editable="${edit_gongyhth}" property="gongyhth" caption="${i18n.gongyhth}" editor="fieldText" width="120" 
				editorOptions="{'maxLength':'8','dataType':'text'}"/>
			<t:gridCol editable="${edit_gongyfe}" property="gongyfe" caption="${i18n.gongyfe}" editor="fieldText" 
				editorOptions="{'expression':'^(0|(100|[1-9][0-9]?))$','expressionMessage':'${i18n.gongyfe_ex_mes}','notNull':true}" width="100"/>
			<t:gridCol editable="${edit_youxq}" property="youxq" caption="${i18n.youxq}" editor="fieldText" 
				editorOptions="{'expression':'^(0|([1-9][0-9]{0,3}))$','expressionMessage':'${i18n.youxq_ex_mes }'}" width="100"/>
			<t:gridCol editable="${edit_shengxsj}" property="shengxsj" caption="${i18n.shengxsj}" editor="fieldCalendar" 
				editorOptions="{'format':'yyyy-MM-dd','notNull':true,closeEvent:func_set_shengxsj}" width="130"/>
			<t:gridCol editable="${edit_shixsj}" property="shixsj" caption="${i18n.shixsj}" editor="fieldCalendar" 
				editorOptions="{'format':'yyyy-MM-dd','notNull':true,closeEvent:func_set_shixsj}" width="130"/>
			<t:gridCol editable="${edit_zuixqdl}" property="zuixqdl" caption="${i18n.zuixqdl}" editor="fieldText" width="90" 
				editorOptions="{'expression':'^[1-9][0-9]{0,9}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.zuixqdl_ex_mes }'}"/>
			<t:gridCol editable="${edit_fayd}" property="fayd" caption="${i18n.fayd}" />
			
			<t:gridCol editable="${edit_cankfz}" property="cankfz" caption="${i18n.cankfz}" editor="fieldText" width="90" 
				editorOptions="{'expression':'^(0|100|[1-9][0-9]?)$','expressionMessage':'${i18n.cankfz_ex_mes}'}"/>
			
			<t:gridCol editable="${edit_zhijcjbl}" property="zhijcjbl" caption="${i18n.zhijcjbl}" editor="fieldText" 
				editorOptions="{'expression':'^(0|100|([1-9][0-9]?))$','expressionMessage':'${i18n.zhijcjbl_ex_mes}'}" width="130"/>
			<t:gridCol editable="${edit_shifyzpch}" property="shifyzpch" caption="${i18n.shifyzpch}" editor="fieldSelect" width="120" convert="shifyzpch" />
			<t:gridCol editable="${edit_shifsxgl}" property="shifsxgl" caption="${i18n.shifsxgl}" editor="fieldSelect" width="120" convert="shifsxgl" />
			<t:gridCol  property="dinghlx" caption="订货路线"  convert="queryDinghlx" />
			<t:gridCol editable="${edit_biaos}" property="biaos" caption="${i18n.biaos}" editor="fieldSelect" convert="biaos" defaultValue="1"/>
			<t:gridCol property="" caption="" width="5"/>
		</t:grid>
	</t:page>

	<script type="text/javascript">
	
	 var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';
		//是否失效管理
		$.sdcui.serverConfig.convertArray['shifsxgl'] = {
			'1' : '${i18n.shi}',
			'0' : '${i18n.fou}'
		};
		//是否验证批次号
		$.sdcui.serverConfig.convertArray['shifyzpch'] = {
			'1' : '${i18n.shi}',
			'0' : '${i18n.fou}'
		};
		
		$.sdcui.serverConfig.convertArray['biaos'] = {
				'1' : '${i18n.youx}',
				'0' : '${i18n.wux}'
		};
		
		
		//空格查询
		function grid_lingjgys_beforeSubmit() {
			$("#lingjgys_gongysbh").fieldValue(trim($("#lingjgys_gongysbh").fieldValue()));
			$("#lingjgys_lingjbh").fieldValue(trim($("#lingjgys_lingjbh").fieldValue()));
		}
		
		// 失效时间必须大于生效时间    denggq 
		function func_set_shixsj(){
			var cell = this.col.cell;
			var rowElement = cell.parent("tr:first");

			var shixsjIndex = $('td.shixsj:first').prevAll().length;
			var shixsj = trim(rowElement.find('td:eq(' + shixsjIndex + ')').text());
			
			var shengxsjIndex = $('td.shengxsj:first').prevAll().length;
			var shengxsj = trim(rowElement.find('td:eq(' + shengxsjIndex + ')').text());
			
			if(!compareDate(shengxsj,shixsj)){
				alert("${i18n.shixd}");
				return false;
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
				alert("${i18n.shengxx}");
				return false;
			}
			return true;
		}
		
		/*
		*@description 设置包装
		*@date 2012-4-16
		*@author denggq
		*/
		function func_button_baoz(){
			
			var record = $("#grid_lingjgys").grid("getSelectedRecords")[0];//选中的行的数据
			
			if(undefined == record){
				$.sdcui.pageUtils.goPage({
					url:'/xuqjs/lingjgcb.do',//url
					mode:'form',
					beforeSubmit:function(){
						return true;
					}
				});
			}else{
				$.sdcui.pageUtils.goPage({
					url:'/xuqjs/lingjgcb.do',//url
					record : {'lingjbh':record.lingjbh},
					mode:'form',
					beforeSubmit:function(){
						return true;
					}
				});
			}
		}
		
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
		
		//导出数据
		function func_button_download(){
			
			var usercenter = trim($('#lingjgys_usercenter').fieldValue());
			var lingjbh = trim($("#lingjgys_lingjbh").fieldValue());
			var gongysbh = trim($('#lingjgys_gongysbh').fieldValue());
			var biaos = $('#lingjgys_biaos').fieldValue();
			
			var record = {'usercenter':usercenter,'lingjbh':lingjbh,'gongysbh':gongysbh,'biaos':biaos};
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjgys.do',
				record : record,
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
	</script>
</t:html>











