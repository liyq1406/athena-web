<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="零件US">

 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_lingjus" caption="零件US" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT" 
		 src="/baob/querylingjus.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="lingjus" prefix="layout" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件号"  width="150" dataType="text" maxLength="10"  />
			<t:fieldText property="elh" caption="EL号"  width="150" dataType="text" maxLength="9"/>
			<t:fieldSelect property="zhuangtsx" caption="状态" width="150"  src="/baob/queryztsx.ajax" show="value" code="key"/>
			<t:fieldText property="cangkbh" caption="仓库" width="150" />
			<t:fieldSelect property="zhizlx" caption="制造路线" width="150" defaultValue="97X" convert="queryZhizlx"/>
 			<t:fieldCalendar property="startrukrq" caption="入库时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endrukrq" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件编号" width="85" 	/>
		<t:gridCol  property="zhuangtsx" caption="状态" width="70"  />
		<t:gridCol  property="lingjsl" caption="零件数量" width="50" />
		<t:gridCol  property="usxh" caption="US代码" width="70" />
		<t:gridCol  property="usrl" caption="US容量" width="95" />
		<t:gridCol  property="cangkbh" caption="仓库代码" width="95" />
		<t:gridCol  property="zickbh" caption="子仓库代码" width="95" />
		<t:gridCol  property="cangklx" caption="仓库类型" width="95"/>
		<t:gridCol  property="ush" caption="US编码" width="95" />
		<t:gridCol  property="elh" caption="EL号" width="95" />
		<t:gridCol  property="rukrq" caption="入库时间" width="95" />
	
		<t:gridCol  property="" caption="" />
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

	//空格查询
	function grid_lingjus_beforeSubmit() {
		var beginTime = $("#layout_startrukrq").fieldValue();
		var endTime = $("#layout_endrukrq").fieldValue();
		var beginTimes = beginTime.substring(0, 10).split('-');
	    var endTimes = endTime.substring(0, 10).split('-');

	    beginTime = beginTimes[1] + '-' + beginTimes[2] + '-' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
	    endTime = endTimes[1] + '-' + endTimes[2] + '-' + endTimes[0] + ' ' + endTime.substring(10, 19);

	    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
	    if (beginTime|endTime|a < 0) {
	        alert("时间输入错误，入库起始时间大于入库截至时间!");
	        return false;
	    } else {
	        return true;
	    }
		
	}
	
	$(function(){
		var htmls =[];
		htmls.push($('#ck_dataItems_selectedValues').html());
		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
		 $('#ck_dataItems_selectedValues').empty();
		$('#button_expxls').click(func_grid_expxls);
	});
	
	
	function func_grid_expxls(event) { 
		var records = $('#grid_lingjus').grid('getSelectedRecords');
		var usercenter="";
		var lingjbh="";
		var elh = "";
		var zhuangtsx = "";
		var cangkbh="";
		var zhizlx = "";
		var startrukrq = "";
		var endrukrq = "";
		
		 usercenter = $('#layout_usercenter').fieldValue();
		 lingjbh = $('#layout_lingjbh').fieldValue();
		 elh = $('#layout_elh').fieldValue();
		 zhuangtsx = $('#layout_zhuangtsx').fieldValue();
		 cangkbh = $('#layout_cangkbh').fieldValue();
		 zhizlx = $('#layout_zhizlx').fieldValue();
		 startrukrq = $('#layout_startrukrq').fieldValue();
		 endrukrq = $('#layout_endrukrq').fieldValue();
		 
		$.sdcui.pageUtils.goPage({
			url : '/baob/expLingus.ajax?usercenter=' + usercenter
					+ '&lingjbh=' + lingjbh + '&elh=' + elh + '&zhuangtsx='
					+ zhuangtsx + '&cangkbh=' + cangkbh +'&zhizlx='+zhizlx+'&startrukrq='+startrukrq+'&endrukrq='+endrukrq,//url
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

</t:html>