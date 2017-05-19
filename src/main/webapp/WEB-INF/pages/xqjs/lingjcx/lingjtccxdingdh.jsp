<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<script type="text/javascript">
			function initPage(){
		    	var pageHeight = document.body.clientHeight;
				var gridHeight = pageHeight - 186;
				$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
				  return gridHeight;
				});
				$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
					  return gridHeight;
				});
		    }
			$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
			/**
			*链接点击事件
			*/
			function link_tcNo(event){
				var event = event||window.event;//原生态的事件处理 
				var element = event.srcElement || event.target;
				var rowDoc = $(element).parents('tr:first')[0];
				var record = $('#grid_lingjtccx').grid('getRecord',rowDoc);//获取当前行对应的记录
				var usercenter = $('#select_usercenter').fieldValue();
				var lingjbh = $('#select_lingjbh').fieldValue();
				var tcNo = record.tcNo;
				window.open ('selectYaohlBytcNo.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&tcNo='+tcNo,'要货令列表','height=500,width=750,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				return false;
				/**
				 * form跳转模式提交
				 */
				/**$.sdcui.pageUtils.goPage({
					url:'selectYaohlBytcNo.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&tcNo='+tcNo,//url
					record:record,//
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
				event.stopPropagation();//阻止事件冒泡
				return false;*/
		
			}
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.lingjcx.lingjtccx">
		<t:grid id="grid_lingjtccx" 
			idKeys="tcNo"
			caption="${i18n.title_index}" 
			src="selectTCLingjByDingdhcx.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" exportXls="true"  back="NOT"  showNum="true"> 
			<t:fieldLayout columns="4" prefix="select">
				<t:fieldSelect property="usercenter" width="100" caption="${i18n.usercenter}" defaultValue="${usercenter }" notNull="true" convert="queryUserCenterMap" readonly="true"></t:fieldSelect>
				<t:fieldText property="lingjbh" width="100" caption="${i18n.lingjbh}" defaultValue="${lingjbh }"  readonly="true"></t:fieldText>
				<t:fieldText property="wuld" width="100" caption="${i18n.wuld}" defaultValue="${wuld }"  readonly="true"></t:fieldText>
				<t:fieldText property="tcNo" width="100" caption="${i18n.tcNo}" maxLength="17"></t:fieldText>
				<t:fieldHidden property="dingdh"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="tcNo" width="100" caption="${i18n.tcNo}" type="link"/>
			<t:gridCol property="qiysj" width="100" caption="${i18n.qiysj}"/>
			<t:gridCol property="wuld" width="100" caption="${i18n.wuld}"/>
			<t:gridCol property="daodwldsj" width="100" caption="${i18n.daodwldsj}"/>
			<t:gridCol property="lingjmc" width="100" caption="${i18n.lingjmc}" />
			<t:gridCol property="lingjzl" width="100" caption="${i18n.lingjzl}"/>
		</t:grid>
	</t:page>
</t:html>