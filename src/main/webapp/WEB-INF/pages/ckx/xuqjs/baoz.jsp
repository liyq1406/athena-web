<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>
<t:html title="${i18n.baoz}">

<!-- 
	  包装
	 @author denggq
	 @date 2012-1-16
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_baoz" >
	<t:grid id="grid_baoz" caption="${i18n.baoz}" idKeys="baozlx" load="" editable="true" showNum="true" back="NOT"  afterSaveRowsEvent="afterSaveRows"
		 src="/xuqjs/queryBaoz.ajax"  removeSrc="/xuqjs/removeBaoz.ajax" saveRowsSrcs="/xuqjs/savesBaoz.ajax" 
		 showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" scrollHeight="290" pageSize="15">
		<t:fieldLayout id="fl_baoz" prefix="baoz" columns="3">
			<t:fieldText property="baozlx" caption="${i18n.baozlx}" dataType="text" maxLength="5" minLength="5" width="150"/>
			<t:fieldSelect property="leib" caption="${i18n.leib}" convert="queryBzlb" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		<!-- 如果当前人员为准备层，则不显示此按钮 mantis  5525 -->
		<c:if test="${ 'ZBCPOA' != role&& 'WULGYY' != role&&'JIHUAY'!=role && 'QUHYFJHY' != role}">
				<t:button caption="库位等级与包装" name="kuwdj" active="1"></t:button>
		</c:if>
		<t:button caption="${i18n.export}" name="download"></t:button>
		<t:button caption="${i18n.mobxz}" name="mobxz" active="0"/>
		
		<t:gridCol editable="${edit_baozlx}" property="baozlx" caption="${i18n.baozlx}" editor="fieldText" editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
		<t:gridCol editable="${edit_baozmc}" property="baozmc" caption="${i18n.baozmc}" width="280" editor="fieldText" editorOptions="{closeEvent:func_set_baozmc}"/>
		<t:gridCol editable="${edit_changd}" property="changd" caption="${i18n.changd}" width="70" editor="fieldText" 
			editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.changd_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_kuand}" property="kuand" caption="${i18n.kuand}" width="70" editor="fieldText" 
			editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.kuand_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_gaod}" property="gaod" caption="${i18n.gaod}" width="70" editor="fieldText" 
			editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.gaod_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_baozzl}" property="baozzl" caption="${i18n.baozzl}" width="85" editor="fieldText" 
			editorOptions="{'expression':'^[1-9][0-9]{0,4}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$','expressionMessage':'${i18n.baozzl_ex_mes }'}"/>
		<t:gridCol editable="${edit_leib}" property="leib" caption="${i18n.leib}" width="50" convert="queryBzlb" editor="fieldSelect" editorOptions="{'notNull':true}"/>
		<t:gridCol editable="${edit_caiz}" property="caiz" caption="${i18n.caiz}" width="70" convert="queryCzlx" editor="fieldSelect"/>
		<t:gridCol editable="${edit_shifhs}" property="shifhs" caption="${i18n.shifhs}" width="60" convert="shifhs" editor="fieldSelect" editorOptions="{'notNull':true}"/>
		<t:gridCol editable="${edit_zhedgd}" property="zhedgd" caption="${i18n.zhedgd}" width="95" editor="fieldText" 
			editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.zhedgd_ex_mes}','notNull':true}"/>
		<t:gridCol editable="${edit_duidcs}" property="duidcs" caption="${i18n.duidcs}" editor="fieldText" 
			editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.duidcs_ex_mes}'}"/>
		<t:gridCol editable="${edit_baiffx}" property="baiffx" caption="${i18n.baiffx}" convert="queryBffx" editor="fieldSelect"/>
		<t:gridCol editable="${edit_biaos}" property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/>
	</t:grid>
	 
	<t:file action="/xuqjs/importAth_uploadBaoz.do" size="100">
		<t:fileparam sheet="baoz" keys="BAOZLX" table="{dbSchemal3}CKX_BAOZ" datasourceId="1" />
	</t:file>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	
	//是否回收
	$.sdcui.serverConfig.convertArray['shifhs'] = {
		'1' : '${i18n.shi}',
		'0' : '${i18n.fou}'
	};

	
	//空格查询
	function grid_baoz_beforeSubmit() {
		$("#baoz_baozlx").fieldValue(trim($("#baoz_baozlx").fieldValue()));
	}
	
	
	//修改按钮
	function func_button_edit(){
		$("#form_baoz").form('clear');
		$('#form_baoz').removeClass('operant-add');
		var record = $("#grid_baoz").grid("getSelectedRecords")[0];
		$("#form_baoz").form('fillRecord', $.extend({}, record));
		$("#form_baoz").form("open","${i18n.update}");
	}
	
	
	/*改为按钮跳转模式。因为准备层不需要跳转，按钮可以控制权限function link_baozlx(event){
		
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		
		var record = $('#grid_baoz').grid('getRecord',rowDoc);//获取当前行对应的记录
		
		
		$.sdcui.pageUtils.goPage({
			url:'/cangk/kuwdjBaoz.do',//url
			record:{'baozlx':record.baozlx},
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
	} */
	//保存按钮
	function func_button_save() {
		
		$('#grid_baoz').grid('saveRows');
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//包裝名称长度为40
	function func_set_baozmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var baozmcIndex = $('td.baozmc:first').prevAll().length;
		var baozmcTemp = rowElement.find('td:eq(' + baozmcIndex + ')').text();
		
		var baozmc=trim(baozmcTemp);
		
		if(undefined != baozmc && null != baozmc){
			if (!checkCH(40, baozmc)) {
				rowElement.find('td:eq(' + baozmcIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.baozmccd}");
				return false;
			}
		}
	}
	
	//导出模板
	function func_button_mobxz(){
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadBaozMob.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	//导出数据
	function func_button_download(){
		
		var baozlx = trim($('#baoz_baozlx').fieldValue());
		var leib = trim($("#baoz_leib").fieldValue());
		var biaos = $('#baoz_biaos').fieldValue();
		
		var record = {'baozlx':baozlx,'leib':leib,'biaos':biaos};
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadBaoz.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	/* 跳转到库位等级与包装页面 （执行层使用）  mantis 0005525
	* kong  2012-11-15
	*/
	function func_button_kuwdj(){
		var record = $("#grid_baoz").grid("getSelectedRecords")[0];//选中的行的数据
		//alert(record.baozlx);
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/cangk/kuwdjBaozBybaoz.do',//url
			record:{'baozlx':record.baozlx},
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
	}
</script>

</t:html>