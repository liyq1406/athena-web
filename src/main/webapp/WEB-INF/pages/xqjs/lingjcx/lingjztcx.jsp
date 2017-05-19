<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
		<script type="text/javascript">
			function initPage(){
		    	getGridHeight();
		    }
			/**
			*链接点击事件
			*/
			function link_wuld(event){
				var event = event||window.event;//原生态的事件处理 
				var element = event.srcElement || event.target;
				var rowDoc = $(element).parents('tr:first')[0];
				var record = $('#grid_lingjztcx').grid('getRecord',rowDoc);//获取当前行对应的记录
				//var usercenter = $('#select_usercenter').fieldValue();
				//var lingjbh = $('#select_lingjbh').fieldValue();
				var wuld = record.wuld;
				var usercenter = record.usercenter;
				var lingjbh = record.lingjbh;
				window.open('selectTCLingjByWuld.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&wuld='+wuld,'零件列表','height=500,width=750,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				return false;
				/**
				 * form跳转模式提交
				 */
				/**$.sdcui.pageUtils.goPage({
					url:'selectTCLingjByWuld.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&wuld='+wuld,//url
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
	<t:page  i18n="i18n.xqjs.lingjcx.lingjztcx">
		<t:grid id="grid_lingjztcx" 
			idKeys="lingjbh,usercenter"
			caption="${i18n.title_index}" 
			src="queryLingjztcx.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" exportXls="true"  back="NOT"  showNum="true">
			<t:fieldLayout columns="3" prefix="select">
				<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"   convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldText maxLength="10" width="150" property="lingjbh" caption="${i18n.lingjbh}" notNull="true"></t:fieldText>
			</t:fieldLayout>
			
			<t:gridCol property="lingjbh" width="200" caption="${i18n.lingjbh}"/>
			<t:gridCol property="dingdh" width="100" caption="订单号"/>
			<t:gridCol property="blh" width="100" caption="发货通知号"/>
			<t:gridCol property="tcNo" width="100" caption="集装箱号"/>
			<t:gridCol property="qiysj" width="100" caption="启运时间"/>
			<t:gridCol property="guanxsj" width="100" caption="关箱时间"/>
			<t:gridCol property="qiyd" width="100" caption="启运点"/>
			<t:gridCol property="wuld" width="100" caption="${i18n.wuld}"  type="link"/>
			<t:gridCol property="mudd" width="100" caption="目的地"/>
			<t:gridCol property="lingjzl" width="100" caption="${i18n.lingjzl}"/>
		</t:grid>
	</t:page>
</t:html>