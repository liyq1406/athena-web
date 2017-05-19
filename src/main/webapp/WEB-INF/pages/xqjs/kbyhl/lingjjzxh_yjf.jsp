<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kbxhgl}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	           
	       });
</script>
</head>
<t:page i18n="i18n.xqjs.kanbyhl.kanbjs" >
	<t:grid id="kbxh" caption="${i18n.search_condition}"  showNum="true" pageSize="20" editAlias="kb" src="/kanbyhl/queryLingjjzxhYjf.ajax" add="NOT" edit="NOT" remove="NOT" load="false"
		idKeys="weihr,weihsj" scrollHeight="468"  >
		<t:fieldLayout id="kbxhgm" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="90"></t:fieldSelect>
			<t:fieldText property="jihydm" caption="${i18n.jihyz}" width="90" maxLength="3" minLength="3" ></t:fieldText>
			<t:fieldSelect property="chanx" caption="${i18n.cx}" src="/kanbyhl/selectChanx.ajax" code="shengcxbh" show="shengcxbh" parents="usercenter" parentsAlias="usercenter" width="90"></t:fieldSelect>
			<t:fieldText property="xunhbm" maxLength="8" minLength="8" caption="${i18n.xhbm}" defaultValue="${xunhbm }"  width="90"></t:fieldText>
			<t:fieldText property="lingjbh" maxLength="10" caption="${i18n.lingjbh}"  width="90"></t:fieldText>
			<t:fieldText property="kehd" maxLength="9" caption="${i18n.kh}"  width="90"></t:fieldText>
			<t:fieldSelect property="gonghms" caption="${i18n.ghms}" convert="ghms" width="90" ></t:fieldSelect>
			<t:fieldHidden property="nwb" defaultValue="w"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="xunhbm" caption="${i18n.xhbm}" width="65"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="80"></t:gridCol>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" width="45"></t:gridCol>
		<t:gridCol property="kehd" caption="${i18n.kh}" width="80"></t:gridCol>
		<t:gridCol property="chanx" caption="${i18n.cx}" width="45"></t:gridCol>
		<t:gridCol property="gonghms" caption="${i18n.ghms}" width="25"></t:gridCol>
		<t:gridCol property="umljsl" caption="${i18n.bzrl}" width="75"></t:gridCol>
		<t:gridCol property="jihydm" caption="${i18n.glydm}" width="25"></t:gridCol>
		<t:gridCol property="dangqxhgm" caption="${i18n.xsxhgm}" width="65"></t:gridCol>
		<t:gridCol type="text" property="shengxzt" caption="${i18n.sxzt}" width="45" convert="sxzt"></t:gridCol>
		<t:gridCol property="dongjjdzt" caption="${i18n.zt}" convert="djzt" width="35"></t:gridCol>
		<t:gridCol property="zuidyhl" caption="${i18n.zdyhl}"></t:gridCol>
		<t:gridCol property="yjfzl" caption="已交付总量"></t:gridCol>
	</t:grid>
	
</t:page>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['sffs'] = {
		'1' : '${i18n.s}',
		'0' : '${i18n.f}'
	};
	$.sdcui.serverConfig.convertArray['sxzt'] = {
		'1' : '${i18n.ysx}',
		'0' : '${i18n.wsx}'
	};
	$.sdcui.serverConfig.convertArray['djzt'] = {
		'0' : '${i18n.dj}',
		'1' : '${i18n.zc}'
	};
	$.sdcui.serverConfig.convertArray['ghms'] = {
		'R1' : 'R1',
		'R2' : 'R2'
	};
	$.sdcui.serverConfig.convertArray['gmbh'] = {
		'01' : '${i18n.jseqxs}',
		'02' : '${i18n.jsxyxs}',
		'03' : '${i18n.jsdyxs}'
	};
	
// 	$(function(){
// 		var htmls = [
// 			'<div class="youi-button active-3" id="button_expxls">'
// 			,'<div class="right">'
// 			,'<div class="center">'
// 			,'<a class="expxls" href="#">${i18n.exldaoc}</a>'
// 			,'</div></div></div>'
// 		] 
// 		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
// 		$('#button_expxls').click(func_grid_expxls);
// 	});
	
	function initPage(){
		var xunhbm = $("#layout_xunhbm").fieldValue();
		if(xunhbm != ''){
			$("#kbxh").grid("reload");
		}
	}
</script>
<style type="text/css">
#kbxhgm td.contral.label-col.col-6 {
	width: 80px;
}

#kbxhgm td.contral.label-col.col-0 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-2 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-4 {
	width: 60px;
}
</style>
</t:html>
