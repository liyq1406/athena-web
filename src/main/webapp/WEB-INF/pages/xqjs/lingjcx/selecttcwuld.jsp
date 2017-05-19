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
				var record = $('#grid_selecttcwuld').grid('getRecord',rowDoc);//获取当前行对应的记录
				//var usercenter = $('#select_usercenter').fieldValue(); 
				var  usercenter = record.usercenter; //获取所在行的用户中心 by hzg 2015.9.30
				var lingjbh = record.lingjbh;
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
		<style type="text/css">
			#ljcx   td.contral.label-col.col-4{ width: 100px;		}
	
		</style>
	</head>
	<t:page  i18n="i18n.xqjs.lingjcx.selecttcwuld">
		<t:grid id="grid_selecttcwuld" 
			idKeys="tcNo,usercenter"
			caption="${i18n.title_index}" 
			src="selectTcBywuldcx.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" exportXls="true"  back="NOT"  showNum="true">
			<t:fieldLayout columns="4" prefix="select" id="ljcx">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"   width="110"></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}"  width="110" maxLength="10"></t:fieldText>
				<t:fieldText property="startwuldfw" caption="${i18n.startwuldfw}" width="110" maxLength="3"></t:fieldText>
				<t:fieldText property="endwuldfw" caption="${i18n.endwuldfw}" width="110" maxLength="3"></t:fieldText>
				<t:fieldText property="tcNo" caption="TC号"  width="110"></t:fieldText>
				<t:fieldText property="kdys_sheet_id" caption="提单号" width="110" maxLength="20"></t:fieldText>
<%-- 				<t:fieldSelect property="startwuldlx" caption="${i18n.startwuldlx}" convert="queryWuldlx" width="110"/> --%>
<%-- 				<t:fieldSelect property="startwuld" caption="${i18n.startwuld}" parents="startwuldlx" src="getYunswuld.ajax" code="WULDBH" show="WULDMC" width="120"/> --%>
<%-- 				<t:fieldSelect property="endwuldlx" caption="${i18n.endwuldlx}" convert="queryWuldlx" width="110"/> --%>
<%-- 				<t:fieldSelect property="endwuld" caption="${i18n.endwuld}"  parents="endwuldlx" src="getYunswuld.ajax" code="WULDBH" show="WULDMC" width="120"/> --%>
			</t:fieldLayout>
			<t:gridCol property="tcNo" caption="${i18n.tcNo}" type="link"/>
			<t:gridCol property="qiysj" caption="启运时间"/>
			<t:gridCol property="guanxsj" caption="关箱时间"/>
			<t:gridCol property="qiyd" caption="启运点"/>
			<t:gridCol property="wuld" caption="${i18n.wuld}"/>
			<t:gridCol property="daodwldsj" caption="${i18n.daodwldsj}"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" />
			<t:gridCol property="dingdh" caption="订单号" />
			<t:gridCol property="blh" caption="发货通知号" />
			<t:gridCol property="xiangx" caption="箱型" />
			<t:gridCol property="blscsj" width="100" caption="发货通知时间" />
<%-- 			<t:gridCol property="lingjmc" caption="${i18n.lingjmc}" /> --%>
			<t:gridCol property="lingjzl" caption="${i18n.lingjzl}"/>
			<t:gridCol property="kdys_sheet_id" caption="提单号"/>
		</t:grid>
	</t:page>
</t:html>