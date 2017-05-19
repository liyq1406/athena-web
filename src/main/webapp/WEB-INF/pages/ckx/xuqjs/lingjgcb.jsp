<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.lingjckgysbz}">

<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>
<t:page i18n="i18n.ckx.xuqjs.i18n_lingjgcb">
	
	<t:grid id="grid_lingjgys" idKeys="usercenter,lingjbh,gongysbh" caption="${i18n.lingj_gongys_baoz}" scrollHeight="88" back="NOT"
		src="/xuqjs/queryLingjgys-baoz.ajax" saveRowsSrcs="/xuqjs/saveLingjgb.ajax" showNum="true"
		add="NOT" edit="NOT" remove="NOT" load="false" editAlias="edits" 
		editable="false" save="NOT" afterSaveRowsEvent="afterSaveRows" exportXls="true">
		<t:fieldLayout id="fl_gys" prefix="lingjgb" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}"  width="150"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10"  dataType="text" defaultValue="${lingjbh}" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="模板下载" name="mobxz" active="0" />
		<t:button caption="${i18n.copy}" name="copy" active="1" />
		<t:button caption="${i18n.save_all}" name="save_all"></t:button>
		
		<t:gridCol editable="${edit_usercenter}" property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" width="70"/>
		<t:gridCol editable="${edit_lingjbh}" property="lingjbh" caption="${i18n.lingjbh}" />
		<t:gridCol editable="${edit_gongysbh}" property="gongysbh" caption="${i18n.gongysbh}" />
		<t:gridCol editable="${edit_ucbzlx}" property="ucbzlx" caption="${i18n.guclx}" editor="fieldText" width="140" 
			editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
		<t:gridCol editable="${edit_ucrl_gys}" property="ucrl" caption="${i18n.gucrl}" editor="fieldText" width="115" 
			editorOptions="{'expression':'^[0-9]{1,6}$|^[0-9]{1,6}[.][0-9]{1,3}$|^0$','maxLength':'9','expressionMessage':'${i18n.ucrl_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_uabzlx}" property="uabzlx" caption="${i18n.uabzlx}" editor="fieldText" width="145" 
			editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
		<t:gridCol editable="${edit_uaucgs}" property="uaucgs" caption="${i18n.uaucgs}" editor="fieldText" width="145" 
			editorOptions="{'expression':'^[0-9]{0,5}$|^0$','expressionMessage':'${i18n.uaucgs_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_uarl}" property="uarl" caption="${i18n.uarl}" editor="fieldText"width="110" 
		editorOptions="{'expression':'^[0-9]{1,6}$|^[0-9]{1,6}[.][0-9]{1,3}$|^0$','expressionMessage':'${i18n.ucrl_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_gaib}" property="gaib" caption="${i18n.gaib}" width="50" editor="fieldText" 
			editorOptions="{'expression':'^[0-9]$','expressionMessage':'${i18n.gaib_ex_mes}'}"/>
		<t:gridCol editable="${edit_neic}" property="neic" caption="${i18n.neic}" width="50" editor="fieldText" 
			editorOptions="{'expression':'^[0-9]$','expressionMessage':'${i18n.neic_ex_mes}'}"/>
		<t:gridCol editable="${edit_shifczlsbz}" property="shifczlsbz" caption="${i18n.shifczlsbz}" 
			editor="fieldSelect" convert="shifczlsbz" type="link" width="130"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" width="50"/>
		<t:gridCol property="" caption="" width="25"/>
	</t:grid>
	
	<t:grid id="grid_lingjck" idKeys="usercenter,lingjbh,cangkbh" caption="${i18n.lingj_cangk_baoz}" scrollHeight="148" back="NOT"
		src="/xuqjs/queryLingjck-baoz.ajax" saveRowsSrcs="/xuqjs/saveLingjcb.ajax" showNum="true"
		add="NOT" edit="NOT" remove="NOT" load="false" submit="NOT" reset="NOT" editable="false" save="NOT">
		<t:fieldLayout id="fl_ck" prefix="lingjcb">
			<t:fieldHidden property="usercenter" caption="${i18n.usercenter}" />
			<t:fieldHidden property="lingjbh" caption="${i18n.lingjbh}"/>
		</t:fieldLayout>
		<t:gridCol editable="${edit_usercenter}"  property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" />
		<t:gridCol editable="${edit_lingjbh}"  property="lingjbh" caption="${i18n.lingjbh}" />
		<t:gridCol editable="${edit_cangkbh}"  property="cangkbh" caption="${i18n.cangkbh}" />
		<t:gridCol editable="${edit_usbzlx}" property="usbzlx" caption="${i18n.usbzlx}" editor="fieldText" width="150" 
			editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
		<t:gridCol editable="${edit_usbzrl}" property="usbzrl" caption="${i18n.usbzrl}" editor="fieldText" width="120" 
			editorOptions="{'expression':'^[0-9]{1,6}$|^[0-9]{1,6}[.][0-9]{1,3}$|^0$','maxLength':'9','expressionMessage':'${i18n.usbzrl_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_uclx}" property="uclx" caption="${i18n.uclx}" editor="fieldText" width="110" 
			editorOptions="{'maxLength':'5','minLength':'5','dataType':'text'}"/>
		<t:gridCol editable="${edit_ucrl_ck}" property="ucrl" caption="${i18n.ucrl}" editor="fieldText" width="120" 
			editorOptions="{'expression':'^[0-9]{1,6}$|^[0-9]{1,6}[.][0-9]{1,3}$|^0$','expressionMessage':'${i18n.ucrl_ex_mes}'}"/>
		<t:gridCol property="" caption="" width="5"/>
	</t:grid>
		<t:file action="/xuqjs/importAth_uploadLingjgysb.do" size="50">
			<t:fileparam sheet="ckxlingjgcb" keys="USERCENTER,LINGJBH,GONGYSBH" table="{dbSchemal3}CKX_LINGJGYS" datasourceId="1"/>
		</t:file>
	<t:form id="from_linsbz" dialog="true" action="/xuqjs/saveLingjgyslsbz.ajax" idKeys="usercenter,lingjbh,gongysbh,xuh" 
		caption="${i18n.linsbz}" width="1200" reset="NOT">
		<t:fieldLayout prefix="layout" columns="1" showLabel="false">
			<t:fieldGrid property="list" width="1200" parents="usercenter,lingjbh,gongysbh">
				<t:grid id="linsbz" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" 
				showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"	
					save="NOT" editable="true" back="NOT" editModel="true" panel="false" width="1024" beforeAddRow="func_set_defaultvalue"
					src="/xuqjs/queryLingjgyslsbz.ajax" idKeys="usercenter,lingjbh,gongysbh,xuh" showNum="true">
					<t:fieldLayout id="ly" prefix="record" >
						<t:fieldHidden property="usercenter" caption="${i18n.usercenter}" />
						<t:fieldHidden property="lingjbh" caption="${i18n.lingjbh}" />
						<t:fieldHidden property="gongysbh" caption="${i18n.gongysbh}" />
					</t:fieldLayout>
					<t:gridCol editable="${edit_usercenter}" property="usercenter" caption="${i18n.usercenter}" width="70" convert="queryUserCenterMap" defaultValue="${usercenter}"/>
					<t:gridCol editable="${edit_lingjbh}" property="lingjbh" caption="${i18n.lingjbh}" />
					<t:gridCol editable="${edit_gongysbh}" property="gongysbh" caption="${i18n.gongysbh}" />
					<t:gridCol editable="${edit_xuh}" property="xuh" caption="${i18n.xuh}" editor="fieldText"  width="50" 
						editorOptions="{'expression':'^[1-9]{0,1}[0-9]{1}$','expressionMessage':'${i18n.xuh_ex_mes}','notNull':true}"/>
					<t:gridCol editable="${edit_shengxsj}" property="shengxsj" caption="${i18n.shengxsj}" editor="fieldCalendar" width="80" 
						editorOptions="{'format':'yyyy-MM-dd',closeEvent:func_set_shengxsj,'notNull':true}" />
					<t:gridCol editable="${edit_shixsj}" property="shixsj" caption="${i18n.shixsj}" editor="fieldCalendar" width="80" 
						editorOptions="{'format':'yyyy-MM-dd',closeEvent:func_set_shixsj,'notNull':true}" defaultValue="9999-12-31" />
					<t:gridCol editable="${edit_ucbzlx}" property="ucbzlx" caption="${i18n.guclx}" editor="fieldText" width="145" 
						editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
					<t:gridCol editable="${edit_ucrl}" property="ucrl" caption="${i18n.gucrl}" editor="fieldText" width="120" 
						editorOptions="{'expression':'^[0-9]{1,6}$|^[0-9]{1,6}[.][0-9]{1,3}$|^0$','maxLength':'9','expressionMessage':'${i18n.ucrl_ex_mes}','notNull':true}"/>
					<t:gridCol editable="${edit_uabzlx}" property="uabzlx" caption="${i18n.uabzlx}" editor="fieldText" width="145" 
						editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
					<t:gridCol editable="${edit_uaucgs}" property="uaucgs" caption="${i18n.uaucgs}" editor="fieldText" width="160" 
						editorOptions="{'expression':'^[0-9]{0,5}$|^0$','expressionMessage':'${i18n.uaucgs_ex_mes}','notNull':true}"/>
					<t:gridCol editable="${edit_gaib}" property="gaib" caption="${i18n.gaib}" editor="fieldText" width="60" 
						editorOptions="{'expression':'^[0-9]$','expressionMessage':'${i18n.gaib_ex_mes}'}"/>
					<t:gridCol editable="${edit_neic}" property="neic" caption="${i18n.neic}" editor="fieldText"  width="60"
						editorOptions="{'expression':'^[0-9]$','expressionMessage':'${i18n.neic_ex_mes}'}"/>
					<t:gridCol property="" caption="" width="25"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
					
</t:page>
</t:html>


<script type="text/javascript">
	
	
		//是否存在零时包裝
		$.sdcui.serverConfig.convertArray['shifczlsbz'] = {
			'1' : '${i18n.shi}',
			'0' : '${i18n.fou}'
		};
		
		//标识
		$.sdcui.serverConfig.convertArray['biaos'] = {
				'1' : '${i18n.youx}',
				'0' : '${i18n.wux}'
		};
		
		
		//查询前
		function grid_lingjgys_beforeSubmit(){
			$('#lingjcb_usercenter').fieldValue($('#lingjgb_usercenter').fieldValue());
			$('#lingjcb_lingjbh').fieldValue($('#lingjgb_lingjbh').fieldValue());
			$('#grid_lingjck').grid('reload',false,[],true); 
		}
		
		//保存
		function func_button_save_all(){
			$('#grid_lingjgys').grid('saveRows');
			$('#grid_lingjck').grid('saveRows');
		} 
		
		
		//是否存在临时包装连接
		function link_shifczlsbz(event){
			var event = event||window.event;//原生态的事件处理 
			var element = event.srcElement || event.target;
			var rowDoc = $(element).parents('tr:first')[0];
			var record = $('#grid_lingjgys').grid('getRecord',rowDoc);//获取当前行对应的记录
			
			$('#from_linsbz').form('fillRecord', $.extend({}, record));//填充数据
			
			$('#linsbz').grid('clearBatchData');
			
			$('#linsbz').grid('reload');
			
			$('#from_linsbz').form("open");
			
		}
		
		//关闭临时包装窗口
		function from_linsbz_afterSubmit(result) {
			if(false != result.success){
				$("#from_linsbz").form("close");
			}
			
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
		*@description 复制功能
		*@date 2012-4-17
		*@author denggq
		*/
		function func_button_copy(){
			
			var record = $("#grid_lingjgys").grid("getSelectedRecords")[0];//选中的行的数据
			
			if("" == record.ucbzlx || undefined == record.ucbzlx || null == record.ucbzlx){
				alert("${i18n.ucbzlx_notnull}");
				return false;
			}
			
			if("" == record.ucrl || undefined == record.ucrl || null == record.ucrl){
				alert("${i18n.ucrl_notnull}");
				return false;
			}
			
			if("" == record.uabzlx || undefined == record.uabzlx || null == record.uabzlx){
				alert("${i18n.uabzlx_notnull}");
				return false;
			}
			
			if("" == record.uaucgs || undefined == record.uaucgs || null == record.uaucgs){
				alert("${i18n.uaucgs_notnull}");
				return false;
			}

			
			var params = [];
			params.push("usercenter="+record.usercenter);	//用户中心
			params.push("lingjbh="+record.lingjbh);	//零件编号
			params.push("ucbzlx="+record.ucbzlx);	//供应商UC包装类型
			params.push("ucrl="+record.ucrl);	//供应商UC容量
			params.push("uabzlx="+record.uabzlx);	//供应商UA包装类型
			params.push("uaucgs="+record.uaucgs);	//供应商UA里的UC个数
			
			$.sdcui.ajaxUtil.ajax({
		 	 	   data:params.join('&'),
		 	 	   url:"../xuqjs/copyLingjgcb.ajax",
		 	       success:function (result){
		 	    	  $("#grid_lingjgys").grid("reload");
		 	    	  $("#grid_lingjck").grid("reload");
		 	       }
		     });
		}
		
		/*
		*@description 临时包装初始值
		*@param lingjbh 零件编号
		*@param shengcxbh 供应商编号
		*@date 2012-5-28
		*@author denggq
		*/
		function func_set_defaultvalue(defaultValue){
			defaultValue.usercenter=$('#record_usercenter').fieldValue();
			defaultValue.gongysbh=$('#record_gongysbh').fieldValue();
			defaultValue.lingjbh=$('#record_lingjbh').fieldValue();
		}
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
		//导出模板
		function func_button_mobxz(){
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjgcbMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
</script>