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
				var record = $('#grid_lingjdinghcx').grid('getRecord',rowDoc);//获取当前行对应的记录
				//var usercenter = $('#select_usercenter').fieldValue(); hzg 注释
				var  usercenter = record.usercenter; //获取所在行的用户中心 by hzg 2015.9.30
				var lingjbh = $('#select_lingjbh').fieldValue();
				var wuld = record.wuld;
				var dingdh = record.dingdh;
				window.open ('selectTCLingjByDingdh.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&wuld='+wuld+"&dingdh="+dingdh,'TC列表','height=500,width=750,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				return false;
				/**
				 * form跳转模式提交
				 */
				/**$.sdcui.pageUtils.goPage({
					url:'selectTCLingjByDingdh.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&wuld='+wuld+"&dingdh="+dingdh,//url
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
	<t:page  i18n="i18n.xqjs.lingjcx.lingjdinghcx">
		<t:grid id="grid_lingjdinghcx" 
			idKeys="lingjh,usercenter"
			caption="${i18n.title_index}" 
			src="selectlingjDingdhcx.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" exportXls="true"  back="NOT"  showNum="true">
			<t:fieldLayout columns="3" prefix="select">
				<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"   convert="queryUserCenterMap"></t:fieldSelect>
				<t:fieldText property="lingjbh" width="150" caption="${i18n.lingjbh}" notNull="true"></t:fieldText>
				<t:fieldText property="dingdh" width="150" caption="${i18n.dingdh}"></t:fieldText>
			</t:fieldLayout>
			<t:gridCol property="lingjbh" width="150" caption="${i18n.lingjbh}"/>
			<t:gridCol property="dingdh" width="150" caption="${i18n.dingdh}"/>
			<t:gridCol property="wuld" width="150" caption="${i18n.wuld}"  type="link"/>
			<t:gridCol property="lingjzl" width="150" caption="${i18n.lingjzl}" />
		</t:grid>
		<t:fieldLayout>
	</t:fieldLayout>
	</t:page>
</t:html>