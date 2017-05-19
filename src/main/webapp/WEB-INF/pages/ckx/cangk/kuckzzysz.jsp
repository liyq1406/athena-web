<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="库存快照资源设置">

<!-- 
	  库存快照资源设置
	 @author wangyu
	 @date 2013-07-30
 -->
 
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 95px; } 
	
	#grid_gongyxhd  .grid-footer   .pRemoveRow{
				display: none;
			}
	</style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_Kuckzzysz" >
	<t:grid id="grid_kuckzzysz" caption="库存快照资源设置" 
		idKeys="usercenter,baozz1,zhuangts1,shengxb1"
		src="/cangk/queryKuckzzysz.ajax" removeSrc="/cangk/removeKuckzzysz.ajax" saveRowsSrcs="/cangk/saveKuckzzysz.ajax"
		load="false" editable="true" showNum="true" scrollHeight="335" pageSize="15" 
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
		<t:fieldLayout id="layout" prefix="kuckzzysz" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150" />
			<t:fieldSelect property="baozzt" caption="包装状态" convert="baozzt" show="" width="150"/>
			<t:fieldSelect property="zhuangtsx" caption="状态属性" convert="zhuangtsx" width="150" />
			<t:fieldSelect property="shengxbs" caption="生效标识" convert="shengxbs" width="150" />	
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="用户中心"   editor="fieldSelect"  convert="queryUserCenterMap" defaultValue="${usercenter}" width="100"/>
		<t:gridCol property="baozzt" caption="包装状态"  editor="fieldSelect"   convert="baozzt"  width="200" editorOptions="{'notNull':true}"/>
		<t:gridCol property="zhuangtsx" caption="状态属性"  editor="fieldSelect" convert="zhuangtsx"  width="200" editorOptions="{'notNull':true}"/>
		<t:gridCol property="shengxbs" caption="生效标识" editor="fieldSelect"  convert="shengxbs" defaultValue="1" width="100" editorOptions="{'notNull':true}"/>
		<t:gridCol property="baozz1" caption="包装状态"  editor="fieldSelect"   convert="baozzt" hidden="true" width="200" />
		<t:gridCol property="zhuangts1" caption="状态属性"  editor="fieldSelect" convert="zhuangtsx"  hidden="true" width="200"/>
		<t:gridCol property="shengxb1" caption="生效标识" editor="fieldSelect"  convert="shengxbs"  hidden="true" defaultValue="1" width="100"/>
		<t:gridCol property="" caption=""/>	
	</t:grid>
</t:page>

<script type="text/javascript">

	//包装状态
	$.sdcui.serverConfig.convertArray['baozzt'] = {
		'4' : '7:库存',	
		'5' : '5:收货改包装',
		'6' : '11:等待交付',	
		'8' : '15:不合格品',
		'9' : '14:转不合格品',	
		'10' : '10:退供应商',
		'11' : '16:退供应商维修',	
		'12' : '17:待销毁',
		'13' : '6:质检'	
// 		'14' : '14  首次收货'
	};
	
	//状态属性
	$.sdcui.serverConfig.convertArray['zhuangtsx'] = {
		'1' : '正常',	
		'2' : '冻结',
		'3' : '收货质检',	
		'4' : '库内质检',
		'5' : '挑选返修',	
		'6' : '工废',
		'7' : '随废',	
		'8' : '料废',
		'9' : '移库备货',	
		'10' : '返修',
		'11' : '仓库-仓库'
	};
	
	
	//生效标识
	$.sdcui.serverConfig.convertArray['shengxbs'] = {
		'1' : '生效',	
		'0' : '未生效'
	};
	
	//空格查询
	function grid_kuckzzysz_beforeSubmit() {
		$("#kuckzzysz_baozzt").fieldValue(trim($("#kuckzzysz_baozzt").fieldValue()));
		$("#kuckzzysz_zhuangtsx").fieldValue(trim($("#kuckzzysz_zhuangtsx").fieldValue()));
		$("#kuckzzysz_shengxbs").fieldValue(trim($("#kuckzzysz_shengxbs").fieldValue()));
	}
	
	
	
</script>

</t:html>