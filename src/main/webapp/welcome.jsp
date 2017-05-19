<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="首页">
	<head>
		<title>神龙零件流系统</title>
	<link rel="shortcut icon" href= "favicon.ico"  />
	<link rel="Bookmark"      href= "favicon.ico"  />
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page>
		<t:grid id="grid_ckxswtx" caption="参考系事务提醒" showCheckbox="true" exportXls="true" idKeys="usercenter,guanjz1,guanjz2,id" add="NOT" remove="NOT" edit="NOT" src="/denglswtx/queryCkxShiwtx.ajax">
			<t:fieldLayout columns="3" prefix="layout">
				<t:fieldSelect width="150" property="usercenter" convert="queryUserCenterMap" caption="用户中心"></t:fieldSelect>
				<t:fieldSelect width="150" property="zhuangt" convert="shiwtxZt" caption="状态" defaultValue="0"></t:fieldSelect>
				<t:fieldSelect width="150" property="tixlx" convert="shiwtxLx" caption="提醒类型"></t:fieldSelect>
				<t:fieldText width="150" property="guanjz1" maxLength="10" caption="关键字1"></t:fieldText>
				<t:fieldText width="150" property="guanjz2" maxLength="10" caption="关键字2"></t:fieldText>
				<t:button caption="解决" name="jiej"></t:button>
			</t:fieldLayout>
		    <t:gridCol width="90" property="usercenter" convert="queryUserCenterMap" caption="用户中心"></t:gridCol>
			<t:gridCol width="100" type="link" property="guanjz1" caption="关键字1"></t:gridCol> 
			<t:gridCol width="100" property="guanjz2" caption="关键字2"></t:gridCol>
			<t:gridCol width="150" property="tixlx" convert="shiwtxLx" caption="提醒类型"></t:gridCol>
			<t:gridCol width="300" property="tixnr" caption="提醒内容"></t:gridCol>
			<t:gridCol width="70" property="yonghz" renderer="yonghzRenderer" caption="用户组"></t:gridCol>
			<t:gridCol width="80" property="zhuangt" convert="shiwtxZt" caption="状态"></t:gridCol>
			<t:gridCol width="100" property="baojsj" caption="提醒时间"></t:gridCol>
			<t:gridCol property="jiejsj" caption="解决时间"></t:gridCol>
			<t:gridCol property="chulsj" caption="处理时间"></t:gridCol>
		</t:grid>
		<br><br><br>
		<t:grid id="grid_yicbj" caption="异常报警事务提醒" add="NOT" remove="NOT" edit="NOT" usePager="false">
		<t:fieldLayout columns="3" showBorder="true">
		<font style="font-size: 25px;">最近一次按需计算产生${anxNum}条异常报警</font> <a href="${ctx}/ycbj/ycbj.do?jismk=33" style="text-decoration: underline;">查看更多</a>
		<br>
		<font style="font-size: 25px">最近一次看板计算产生${kanBNum}条异常报警</font> <a href="${ctx}/ycbj/ycbj.do?jismk=42" style="text-decoration: underline;">查看更多</a>
		</t:fieldLayout></t:grid>
	</t:page>
	<script type="text/javascript">
			$.sdcui.serverConfig.convertArray['shiwtxZt']={'0':'待解决','1':'已解决'};
			
			//用户组渲染事件
			function yonghzRenderer(col,
					value,  
					rowIndex,
					colIndex){
				var yonghz = value.yonghz;//用户组
				if(yonghz == 'alljhy'){//所有计划员
					return "所有计划员";
				}else if(yonghz == 'allwlgyy'){//所有物流工艺员
					return "所有物流工艺员";
				}else if(yonghz == 'all'){
					return "所有用户";
				}else{//正常显示
					return yonghz;
				}
			}
			
			/**
			*链接跳转事件
			**/
			function link_guanjz1(event){
				var event = event||window.event;//原生态的事件处理 
				var element = event.srcElement || event.target;
				var rowDoc = $(element).parents('tr:first')[0];
				var record = $('#grid_ckxswtx').grid('getRecord',rowDoc);//获取当前行对应的记录
				var url = "";
				record.biaos = '2';
				if(record.tixlx == 1){
					url = "/xuqjs/lingjs.do?biaos=2&dirName=通用零件-基础参数-参考系-准备层";
				}else if(record.tixlx == 2){
					url = "/xuqjs/gongyss.do?biaos=2&dirName=供应商|承运商|运输商-基础参数-参考系-准备层";
				}else if(record.tixlx == 3){
					url = "/xuqjs/lingjgcbs.do?biaos=2&dirName=零件(供应商)/仓库(包装)-基础参数-参考系-准备层";
				}else if(record.tixlx == 4){
					url = "/xuqjs/gongyxhds.do?biaos=2&dirName=工艺消耗点-基础参数-参考系-准备层";
				}else if(record.tixlx == 5){
					url = "/xuqjs/lingjxhds.do?biaos=2&dirName=消耗点(零件)-基础参数-参考系-准备层";
				}else if(record.tixlx == 6){
					url = "/xuqjs/lingjgys.do?biaos=2&dirName=零件(供应商)-基础参数-参考系-准备层";
				}else if(record.tixlx == 7){
					url = "/xuqjs/lingjxhds.do?biaos=1&dirName=消耗点(零件)-基础参数-参考系-准备层";
				}
				$.sdcui.pageUtils.goPage({
					url:url,//url
					record:record,//
					mode:'form',
					beforeSubmit:function(){
						return true;
					}
				});
			}
			
			/**
			*解决按钮
			*/
			function func_button_jiej(){
				var record = $('#grid_ckxswtx').grid('getSelectedRecords');//获取选中的数据
				var length = record.length;//判断长度
				if(length < 1){//判断是否选择数据
					alert('请选择一条数据');
					return false;
				}
				//拼接参数
				var params = [];
				for(var i = 0;i < length;i++){
					var id = record[i].id;//ID
					params.push('edit['+i+'].id='+id);
				}
				$.sdcui.ajaxUtil.ajax({
		            url:"jiejCkxShiwtx.ajax",//请求url
		            data:params.join('&'),
		           	success:function (result){
		           		alert(result.result);
		           		$('#grid_ckxswtx').grid('reload');
		            }
		    	});
			}
		</script>
</t:html>
