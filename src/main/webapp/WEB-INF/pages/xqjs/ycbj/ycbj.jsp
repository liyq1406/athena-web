<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.ycbjcx}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.ycbj.ycbjcx">
	<t:grid id="grid_ycbj" caption="${i18n.cxtj}"  showNum="true" save="NOT" idKeys="usercenter,lingjbh"
	src="/ycbj/searchYicbj.ajax" add="NOT" edit="NOT" remove="NOT" load="false" scrollHeight="320">
	<t:fieldLayout id="yicbj" prefix="layout" columns="4">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="120" notNull="true"></t:fieldSelect>
				<t:fieldText  property="lingjbh"  maxLength="10" minLength="10"  caption="${i18n.lingjbh}" width="120"></t:fieldText>
				<t:fieldText property="jihyz"     caption="${i18n.jihyz}"  width="120"  maxLength="3"></t:fieldText>
				<t:fieldText property="jihydm"     caption="${i18n.jihydm}"  width="120" maxLength="32"></t:fieldText>
				<t:fieldSelect property="jismk" defaultValue="35" notNull="true"  caption="${i18n.jismk}" convert="queryJsmk" width="120"></t:fieldSelect>
				<t:fieldSelect property="cuowlx" caption="${i18n.cuowlx}" convert="queryYclx"  width="120"></t:fieldSelect>
				<t:fieldCalendar notNull="true" property="create_time" caption="${i18n.create_time}" width="120" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
				<t:fieldCalendar notNull="true" property="create_timeTo" caption="${i18n.createtimeTo}" width="120" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
				
	</t:fieldLayout>
	<t:gridCol property="usercenter"  caption="${i18n.usercenter}" type="text"></t:gridCol>
	<t:gridCol property="lingjbh"     caption="${i18n.lingjbh}"      type="text"></t:gridCol>
	<t:gridCol property="jismk"       caption="${i18n.jismk}"      type="text"></t:gridCol>
	<t:gridCol property="cuowlx"      caption="${i18n.cuowlx}"     type="text"></t:gridCol>
	<t:gridCol property="cuowxxxx"    caption="${i18n.cuowxxxx}" type="text"></t:gridCol>
	<t:gridCol property="jihydm"      caption="${i18n.jihydm}"     type="text"></t:gridCol>
	<t:gridCol property="jihyz"       caption="${i18n.jihyz}"        type="text"></t:gridCol>
	<t:gridCol property="create_time"  caption="${i18n.create_time}" type="text"></t:gridCol>
	</t:grid>
	  <div id="ck_dataItems_selectedValues" style="display: none;">
		        <div class="youi-button active-3" id="button_expxls">
					<div class="right">
					<div class="center">
					  <a class="expxls" href="#">导出</a>
			       </div>
			       </div>
			    </div>
	    </div>
	</t:page>
	<script type="text/javascript">
	$(function(){
		var htmls =[];
		htmls.push($('#ck_dataItems_selectedValues').html());
		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
		 $('#ck_dataItems_selectedValues').empty();
		//$('#button_expxls').click(func_grid_expxls);
	});
	
	//导出 	
	function func_button_expxls() {
		
		 var usercenter = $('#layout_usercenter').fieldValue();
		 var lingjbh = $('#layout_lingjbh').fieldValue();
		 var jihyz = $('#layout_jihyz').fieldValue();
		 var jihydm = $('#layout_jihydm').fieldValue();
		 var jismk = $('#layout_jismk').fieldValue();
		 var cuowlx = $('#layout_cuowlx').fieldValue();
		 var create_time = $('#layout_create_time').fieldValue();
		 var create_timeTo = $('#layout_create_timeTo').fieldValue();
		$.sdcui.pageUtils.goPage({
			url : '/ycbj/yicbjDownLoad.do?usercenter=' + usercenter
					+ '&jihyz=' + jihyz + '&lingjbh=' + lingjbh + '&jihydm='
					+ jihydm + '&jismk=' + jismk +'&cuowlx='+cuowlx+'&create_time='+create_time+'&create_timeTo='+create_timeTo,//url
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;
	}
	</script>
	<style type="text/css"></style>
</t:html>
