<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
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
	<t:page i18n="i18n.xqjs.shouhdcl.shouhdcl">
	<t:grid id="grid_zhidyhl" caption="${i18n.zhidyhl}" showNum="true" idKeys="lingjbh,dingdh" 
	src="/shouhdcl/queryYaohl.ajax" add="NOT" edit="NOT" remove="NOT" scrollHeight="450" pageSize="20">
	<t:fieldLayout prefix="gridLayout" columns="4">
		<t:fieldHidden property="usercenter"></t:fieldHidden>
		<t:fieldHidden property="lingjbh"></t:fieldHidden>
		<t:fieldHidden property="jusgzdh"></t:fieldHidden>
		<t:fieldHidden property="zhuangt"></t:fieldHidden>
		<t:fieldHidden property="jusljs"></t:fieldHidden>
		<t:fieldText property="yaohlh" width="150" caption="${i18n.yaohl}" maxLength="10"></t:fieldText>
	</t:fieldLayout>
	<t:gridCol property="yaohlh" caption="${i18n.yaohl}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="yaohsl" caption="${i18n.lingjsl}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="baozxh" caption="UA${i18n.leix}"></t:gridCol>
	<t:gridCol property="usxh" caption="UA${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucxh" caption="UC${i18n.leix}"></t:gridCol>
	<t:gridCol property="ucrl" caption="UC${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucgs"  caption="UC${i18n.ges}"></t:gridCol>
	<t:gridCol property="fahd"  caption="${i18n.fahd}"></t:gridCol>
	<t:gridCol property="xiehd"  caption="卸货点"></t:gridCol>
	<t:gridCol property="xinxhd"  caption="新卸货点"></t:gridCol>
	<t:gridCol property="zhongzsj" caption="${i18n.daohsj}"></t:gridCol>
	<t:gridCol property="danw" caption="${i18n.danw}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_forms">
		<t:button caption="${i18n.qued}" name="qued"></t:button>
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	/*
	*审核按钮点击事件
	*/
	function func_button_qued(){
		var record = $('#grid_zhidyhl').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length != 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		var yaohlh = record[0].yaohlh;
		var dingdh = record[0].dingdh;
		var yaohsl = record[0].yaohsl;
		var usercenter = $('#gridLayout_usercenter').fieldValue();
		var lingjbh = $('#gridLayout_lingjbh').fieldValue();
		var jusgzdh = $('#gridLayout_jusgzdh').fieldValue();
		var zhuangt = $('#gridLayout_zhuangt').fieldValue();
		var jusljs  = $('#gridLayout_jusljs').fieldValue();
		//var param = {"yaohlh":yaohlh,"dingdh":dingdh,"usercenter":usercenter,"lingjbh":lingjbh,"jusgzdh":jusgzdh,"zhuangt":zhuangt}
      	if(yaohsl != jusljs){
      	   if(confirm("要货令数量和拒收数量不一致，是否指定?")){
      	   		$.sdcui.ajaxUtil.ajax({
	            url:"zhiDyhl.ajax?yaohlh="+yaohlh+"&dingdh="+dingdh+"&usercenter="+usercenter+"&lingjbh="+lingjbh+"&jusgzdh="+jusgzdh+"&zhuangt="+zhuangt,//请求url
	           // data:params.join('&'),
	           	success:function (result){
	           		window.opener.gridReload();
					window.close();
		            }
		    	});
      	   }
      	}else{
      			$.sdcui.ajaxUtil.ajax({
	            url:"zhiDyhl.ajax?yaohlh="+yaohlh+"&dingdh="+dingdh+"&usercenter="+usercenter+"&lingjbh="+lingjbh+"&jusgzdh="+jusgzdh+"&zhuangt="+zhuangt,//请求url
	           	success:function (result){
	           		window.opener.gridReload();
					window.close();
		            }
		    	});
      	}

		/*$.sdcui.pageUtils.goPage({
			url:'zhiDyhl.do?yaohlh='+yaohlh+'&dingdh='+dingdh+'&usercenter='+usercenter+'&lingjbh='+lingjbh+'&jusgzdh='+jusgzdh+'&zhuangt='+zhuangt,//url
			record:param,
			mode:'form'
		});*/
		//window.opener.gridReload();
		//window.close();
	}
	
	</script>
	<style type="text/css"></style>
</t:html>