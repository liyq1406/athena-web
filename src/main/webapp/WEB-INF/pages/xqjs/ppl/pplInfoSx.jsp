<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.ygcxjfs}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	           
	       });
	/*
	*导出文本
	*/
	function func_button_exportTxt(){
		var params = [];
		params.push('usercenter='+$('#search_usercenter').fieldValue());
		params.push('jihydm='+$('#search_jihydm').fieldValue());
		params.push('lingjbh='+$('#search_lingjbh').fieldValue());
		params.push('maoxqbc='+$('#search_maoxqbc').fieldValue());
		params.push('xuqcfsj='+$('#search_xuqcfsj').fieldValue());
		params.push('zhizlx='+$('#search_zhizlx').fieldValue());
		params.push('gongysdm='+$('#search_gongysdm').fieldValue());
		params.push('pplbc='+$('#pplbc').val());
		
						var time = new Date();
		 $.sdcui.ajaxUtil.ajax({
             url:"exportTxt.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            	var fn = result.result;
            	    //回调函数后续操作
            	    window.location = "${ctx}/ppl/downLoadTxt.ajax?fileName="+fn+"&num="+time;
						//document.getElementById("bytesRead").textContent = file.size;
						// 构造 XMLHttpRequest 对象，发送文件 Binary 数据
					
				}
           });
		 	 
	}
	
	function createReqeust() {
		var req;
		if (window.ActiveXObject) {

			req = new ActiveXObject("Microsoft.XMLHTTP");
		} else {

			req = new XMLHttpRequest();
		}
		return req;
	}
	
	</script>
	</head>
	<t:page i18n="i18n.xqjs.ppl.pplbjjs">
	<t:grid id="grid_niandppl" caption="${i18n.niandpplyg}"  showNum="true"   exportTitle="${i18n.niandygmx}" back="NOT" scrollHeight="265"
	src="/ppl/searchNdPplMx.ajax"  idKeys="id,pplbc,editor,edit_time,p0xqzq" save="NOT" edit="NOT" add="NOT" remove="NOT">
	<t:button caption="${i18n.export}txt" name="exportTxt" />
	<t:button caption="${i18n.export}Xls" name="exportXls" />
	<t:fieldLayout columns="3" prefix="search">
				<t:fieldSelect  property="usercenter" caption="${i18n.yhzx}" width="150" convert="queryUserCenterMap"></t:fieldSelect>
				<t:fieldSelect  property="jihydm" caption="${i18n.jhyz}"  width="150" convert="getJihz"></t:fieldSelect>
				<t:fieldText  property="lingjbh" caption="${i18n.ljbh}" width="150" maxLength="10"></t:fieldText>
				<t:fieldSelect  property="maoxqbc" caption="${i18n.xqbc}" src="/ppl/selectXuqbc.ajax" show="xuqbc" code="xuqbc" width="150"></t:fieldSelect>
				<t:fieldCalendar  property="xuqcfsj" caption="${i18n.cfsj}" format="yyyy-MM-dd" width="150"></t:fieldCalendar>
				<t:fieldSelect  property="zhizlx"  caption="${i18n.zzlx}" convert="queryZhizlx" width="150"></t:fieldSelect>
				<t:fieldText property="gongysdm" caption="${i18n.gys}" width="150" maxLength="10"></t:fieldText>
				<t:fieldHidden property="pplbc"></t:fieldHidden>
	</t:fieldLayout>

	<t:gridCol  property="usercenter" caption="${i18n.yhzx}" convert="queryUserCenterMap" editorOptions="{'defaultValue':'UW','notNull':true}"></t:gridCol>
	<t:gridCol  property="zhizlx" caption="${i18n.zzlx}"></t:gridCol>
	<t:gridCol   property="lingjbh" caption="${i18n.ljbh}"></t:gridCol>
	<t:gridCol  property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol  property="fawmc" caption="${i18n.fawljmc}"></t:gridCol>
	<t:gridCol  property="gongysdm" caption="${i18n.gys}"></t:gridCol>
	<t:gridCol  property="lingjdw" caption="${i18n.ljdw}"></t:gridCol>
	<t:gridCol  property="p0sl" caption="${i18n.yy}"></t:gridCol>
	<t:gridCol  property="p1sl" caption="${i18n.ey}"></t:gridCol>
	<t:gridCol   property="p2sl" caption="${i18n.sy}"></t:gridCol>
	<t:gridCol   property="p3sl" caption="${i18n.siy}"></t:gridCol>
	<t:gridCol   property="p4sl" caption="${i18n.wuy}"></t:gridCol>
	<t:gridCol   property="p5sl" caption="${i18n.liuy}"></t:gridCol>
	<t:gridCol   property="p6sl" caption="${i18n.qiy}"></t:gridCol>
	<t:gridCol   property="p7sl" caption="${i18n.bay}"></t:gridCol>
	<t:gridCol   property="p8sl" caption="${i18n.jiuy}"></t:gridCol>
	<t:gridCol   property="p9sl" caption="${i18n.shiy}"></t:gridCol>
	<t:gridCol   property="p10sl" caption="${i18n.shiyy}"></t:gridCol>
	<t:gridCol  property="p11sl" caption="${i18n.shiey}"></t:gridCol>
	<t:gridCol property="zhuangt" convert="zhuangt" caption="${i18n.zhuangt}"></t:gridCol>
	</t:grid>
	

	
    <input id="removeId" value="${removeId}" type="hidden"/>  
    
	<input type="hidden" id="zhuangt" name="zhuangt" value="${zhuangt}"/>
	<input type="hidden" id="pplbc" name="pplbc" value="${pplbc}"/>
	<input type="hidden" id="p0xqzq" name="p0xqzq" value="${p0xqzq}"/>
	</t:page>
	<script type="text/javascript">
	//$.sdcui.serverConfig.convertArray['zhizlx'] = {'97W':'97W','97D':'97D','97X':'97X'};  //给fieldselect添加值
	$.sdcui.serverConfig.convertArray['zhuangt'] = {'1':'${i18n.yfs}','0':'${i18n.wfs}'};

	/*
	*保存方法
	function func_button_save(){
		var info = $('#grid_niandppl').grid('getBatchRecords');
		var zhuangt = $('#zhuangt').val();
		if(zhuangt == 1){
			alert('已发送的PPL不可修改');
			return false;
		}
		$('#grid_niandppl').grid('ssaveRows');
	}	*/

	function func_grid_exportXls(){
				var usercenter = $('#search_usercenter').fieldValue();
				var jihydm =  $('#search_jihydm').fieldValue();
				var lingjbh = $('#search_lingjbh').fieldValue();
				var maoxqbc = $('#search_maoxqbc').fieldValue();
				var xuqcfsj = $('#search_xuqcfsj').fieldValue();
				var zhizlx = $('#search_zhizlx').fieldValue(); 
				var gongysdm = $('#search_gongysdm').fieldValue(); 
				var pplbc = $('#search_pplbc').fieldValue(); 
				var record = {};
				record.usercenter=usercenter;
				record.jihydm=jihydm;
				record.lingjbh=lingjbh;
				record.zhizlx=zhizlx;
				record.maoxqbc=maoxqbc;
				record.xuqcfsj=xuqcfsj;
				record.gongysdm=gongysdm;
				record.pplbc=pplbc;
				$.sdcui.pageUtils.goPage({
					url:'/ppl/downLoadFilePpl.do',//url
					record : record,//
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
			}
	
	
	/*
	*查询零件名称
	*/
	function searchLjmc(){
		var  cell = this.col.cell;//获取当前列
		var rowElement = cell.parent('tr:first');
		var usercenterIndex = $('td.usercenter:first').prevAll().length;//遍历用户中心下标
		var luxIndex = $('td.zhizlx:first').prevAll().length;//遍历路线下标
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;//遍历零件编号下标
		var lingjmcIndex = $('td.lingjmc:first').prevAll().length;//遍历零件名称下标
		
		var lux = rowElement.find('td:eq('+luxIndex+')').text();//获取制造路线输入值
		var lingjbh = rowElement.find('td:eq('+lingjbhIndex+')').text();//获取零件编号输入值
		var usercenter = rowElement.find('td:eq('+usercenterIndex+')').val();//获取用户中心输入值
		//拼接数据
		var params = [];
		//params.push('lux='+lux);
		params.push('lingjbh='+lingjbh);
		params.push('usercenter='+usercenter);
		//请求后台
		$.sdcui.ajaxUtil.ajax({ 
             url:"${ctx}/diaobl/getlingjmc.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            	    var  obj = result.lingj;
	 	        	rowElement.find('td:eq('+luxIndex+')').text(obj.lux);
	 	        	rowElement.find('td:eq('+lingjmcIndex+')').text(obj.lingjmc);
            		rowElement.find('td:eq('+lingjmcIndex+')').text(result.lingjmc);//为零件名称赋值
            		
             }
     	});
	}
	
	
		//返回
		function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		}
	</script>
	<style type="text/css"></style>
</t:html>