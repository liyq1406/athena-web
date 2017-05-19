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
			function link_tcNo(event){
				var event = event||window.event;//原生态的事件处理 
				var element = event.srcElement || event.target;
				var rowDoc = $(element).parents('tr:first')[0];
				var record = $('#grid_selecttcqiysj').grid('getRecord',rowDoc);//获取当前行对应的记录
				//var usercenter = $('#select_usercenter').fieldValue(); hzg 注释
				var  usercenter = record.usercenter; //获取所在行的用户中心 by hzg 2015.9.30
				var tcNo = record.tcNo;
				window.open ('selectTcByQiysj.do?usercenter='+usercenter+'&tcNo='+tcNo,'TC列表','height=500,width=750,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				return false;
				/**
				 * form跳转模式提交
				 */
				/**$.sdcui.pageUtils.goPage({
					url:'selectTc.do?usercenter='+usercenter+'&tcNo='+tcNo,//url
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
	<t:page  i18n="i18n.xqjs.lingjcx.selecttcqiysj">
		<t:grid id="grid_selecttcqiysj" 
			idKeys="tcNo,usercenter"
			caption="${i18n.title_index}" 
			src="selectTcByQysjcx.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" exportXls="true"  back="NOT"  showNum="true">
			<t:fieldLayout columns="3" prefix="select">
				<t:fieldSelect property="usercenter" width="100" caption="${i18n.usercenter}"  convert="queryUserCenterMap"></t:fieldSelect>
				<t:fieldCalendar property="startQiysj" width="100"  caption="关箱时间 从" notNull="true" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldCalendar property="endQiysj" width="100"  caption="到" notNull="true" format="yyyy-MM-dd"></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="tcNo"  caption="${i18n.tcNo}" type="link"/>
			<t:gridCol property="dinghcj"  caption="${i18n.dinghcj}"/>
			<t:gridCol property="qiysj" caption="关箱时间" />
			<t:gridCol property="zuiswld" caption="${i18n.zuiswld}" />
		</t:grid>
	</t:page>
</t:html>