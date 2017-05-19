<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="盘点修正历史">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	function initPage(){
		var pageHeight = document.body.clientHeight;
		var gridHeight = pageHeight - 435;
		$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
			 return gridHeight;
		});
		$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
			 return gridHeight;
		});
	}
	
</script>
</head>

<t:page>

	<t:form id="emergency" reset="NOT" submit="NOT">
		<t:grid id="emergencys" idKeys="id"  caption=""  src="/anxorder/queryEmergency.ajax" usePager="true" edit="NOT" showCheckbox="true" 
			load="false"  remove="NOT" scrollHeight="130" add="NOT"   showNum="true" exportXls="true" >
			<t:button name="unoperating" active="0" caption="批量不处理" ></t:button>
			<t:button name="operating" active="0" caption="批量处理" ></t:button>
			<t:button name="reset" active="0" caption="批量重置" ></t:button>
			<t:fieldLayout id="emergencyselect" prefix="emergencysl" columns="4">
				<t:fieldSelect property="usercenter" width="100" caption="用户中心" convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldSelect property="zhuangt" width="100" caption="处理状态" convert="zhuangt" ></t:fieldSelect>
				<t:fieldSelect property="pandzt" width="100" caption="盘点情况" convert="pandzt" ></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="零件编号" width="100"></t:fieldText>
				<t:fieldText property="gongysbh" caption="供应商编号" width="100"></t:fieldText>
				<t:fieldText property="chengysbh" caption="承运商编号" width="100"></t:fieldText>
				<t:fieldText property="jihy" caption="计划员" width="100"></t:fieldText>
				<t:fieldText property="xiaohd" caption="消耗点" width="100"></t:fieldText>
				<t:fieldText property="creator" caption="盘点人" width="100"></t:fieldText>
				<t:fieldText property="editor" caption="操作人" width="100"></t:fieldText>
				<t:fieldCalendar property="createtimeFrom" caption="盘点时间" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="createtimeTo" caption="至" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="edittimeFrom" caption="操作时间" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="edittimeTo" caption="至" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="id" hidden="true" caption="id"></t:gridCol>
			<t:gridCol property="usercenter" type="text" caption="用户中心"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件编号" ></t:gridCol>
			<t:gridCol property="lingjmc" type="text" caption="零件名称" ></t:gridCol>
			<t:gridCol property="gongysbh" type="text" caption="供应商编号" editor="fieldText"  editorOptions="{'notNull':true,'maxLength':'10','minLength':'10',closeEvent:func_set_gongys}" ></t:gridCol>
			<t:gridCol property="gongysmc" type="text" caption="供应商名称" ></t:gridCol>
			<t:gridCol property="chengysbh" type="text" caption="承运商编号" ></t:gridCol>
			<t:gridCol property="chengysmc" type="text" caption="承运商名称" ></t:gridCol>
			<t:gridCol property="gongysfe" type="text" caption="供应商份额" ></t:gridCol>
			<t:gridCol property="xiaohd" caption="消耗点" type="text" ></t:gridCol>
			<t:gridCol property="chay" type="text" caption="盘点差异量" ></t:gridCol>
			<t:gridCol property="xianbllkc" type="text" caption="盘点时线边理论库存" ></t:gridCol>
			<t:gridCol property="pandsjsl" type="text" caption="盘点实际数量" ></t:gridCol>
			<t:gridCol property="pandzt" type="text" caption="盘点状态" convert="pandzt"></t:gridCol>
			<t:gridCol property="jihy" type="text" caption="计划员" ></t:gridCol>
			<t:gridCol property="uarl" type="text" caption="UA容量" ></t:gridCol>
			<t:gridCol property="baozgs" type="text" caption="包装个数"  editor="fieldText"  editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位',closeEvent:func_set_baozgs}"></t:gridCol>
			<t:gridCol property="yaohsl" type="text" caption="要货数量" ></t:gridCol>
			<t:gridCol property="anqkc" type="text" caption="盘点时安全库存" ></t:gridCol>
			<t:gridCol property="zhuangt" type="text" caption="处理状态" convert="zhuangt"></t:gridCol>
			<t:gridCol property="dingdh" type="text" caption="对应订单号" ></t:gridCol>
			<t:gridCol property="xiaoh_time" type="text" caption="消耗时间" editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd_HH:mm:ss','notNull':true}"></t:gridCol>
			<t:gridCol property="creator" type="text" caption="盘点人" ></t:gridCol>
			<t:gridCol property="create_time" type="text" caption="盘点时间" ></t:gridCol>
			<t:gridCol property="editor" type="text" caption="操作人" ></t:gridCol>
			<t:gridCol property="edit_time" type="text" caption="操作时间" ></t:gridCol>
			<t:gridCol property="beiz" type="text" caption="备注" ></t:gridCol>
			<t:gridCol property="jilaqkcs" type="text" caption="最新安全库存数" ></t:gridCol>
			<t:gridCol property="jildjfl" type="text" caption="最新带交付量" ></t:gridCol>
			<t:gridCol property="jilxbllkc" type="text" caption="最新线边理论库存" ></t:gridCol>
			<t:gridCol property="j0" type="text" caption="最新j0数量" ></t:gridCol>
			<t:gridCol property="j1" type="text" caption="最新j1数量" ></t:gridCol>
			<t:gridCol property="j2" type="text" caption="最新j2数量" ></t:gridCol>
			<t:gridCol property="jilddl" type="text" caption="最新订单量" ></t:gridCol>
			<t:gridCol property="ziycy" type="text" caption="最新资源差异量" ></t:gridCol>
			<t:gridCol property="ziyqk" type="text" caption="最新资源情况" ></t:gridCol>
			<t:gridCol property="jilrq" type="text" caption="最新记录时间" ></t:gridCol>
		</t:grid>
	</t:form>
</t:page>


<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
</style>
<script>
$.sdcui.serverConfig.convertArray['pandzt'] = {
		'0' : '盘亏',
		'1' : '盘盈',
		'2' : '不盘不盈'
};

$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'0' : '待处理',
		'1' : '已处理',
		'2' :  '不处理',
		'3' : '处理时出错'
};




function func_set_gongys()
{
	var cell = this.col.cell;
	var row = cell.parent('tr:first');
	
	var idIndex = $('td.id:first').prevAll().length;
	var usercenterIndex = $('td.usercenter:first').prevAll().length;
	var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
	var gongysbhIndex = $('td.gongysbh:first').prevAll().length;
	var gongysmcIndex = $('td.gongysmc:first').prevAll().length;
	var chengysbhIndex = $('td.chengysbh:first').prevAll().length;
	var chengysmcIndex = $('td.chengysmc:first').prevAll().length;
	var gongysfeIndex = $('td.gongysfe:first').prevAll().length;
	var zhuangtIndex = $('td.zhuangt:first').prevAll().length;
	
	var idStr = row.find('td:eq('+idIndex+')').text();
	var usercenterStr = row.find('td:eq('+usercenterIndex+')').text();
	var lingjbhStr = row.find('td:eq('+lingjbhIndex+')').text();
	var gongysbhStr = row.find('td:eq('+gongysbhIndex+')').text();
	var zhuangtStr = row.find('td:eq('+zhuangtIndex+')').text();
	
	if(zhuangtStr == "已处理" ||  zhuangtStr == "不处理")
	{
		alert("只能操作状态待处理和处理时出错的紧急件信息");
	}
	else
	{
	 	var params = [];
	    params.push('lingjbh='+lingjbhStr);
	    params.push('usercenter='+usercenterStr);
	    params.push('id='+idStr);
	    gongysbhStr = gongysbhStr.replaceAll(/\W/g,","); 
	    params.push('gongysbh='+gongysbhStr);
	    var date = params.join('&');
	   	$.sdcui.ajaxUtil.ajax({
		  url:"${ctx}/anxorder/validateEmergencyGongys.ajax",
		  data:encodeURI(date),
	      success:function (result){
		       if(result.result.result != null)
		       {
		            $(cell).removeAttr("title",result.flag).removeClass("validate-error");
		       		var  obj = result.result.result;
		       		row.find('td:eq('+gongysfeIndex+')').text(obj.gongysfe);
		       		row.find('td:eq('+gongysmcIndex+')').text(obj.gongysmc);
		       		row.find('td:eq('+chengysbhIndex+')').text(obj.chengysbh);
		       		row.find('td:eq('+chengysmcIndex+')').text(obj.chengysmc);
		       }
		  }
	   });
	}
}


function func_set_baozgs()
{
	var cell = this.col.cell;
	var row = cell.parent('tr:first');
	
	var baozgsIndex = $('td.baozgs:first').prevAll().length;
	var uarlIndex = $('td.uarl:first').prevAll().length;
	var yaohslIndex = $('td.yaohsl:first').prevAll().length;
	var zhuangtIndex = $('td.zhuangt:first').prevAll().length;
	var baozgsStr = row.find('td:eq('+baozgsIndex+')').text();
	var uarlStr = row.find('td:eq('+uarlIndex+')').text();
	var zhuangtStr = row.find('td:eq('+zhuangtIndex+')').text();
	if(zhuangtStr == "已处理" ||  zhuangtStr == "不处理")
	{
		alert("只能操作状态待处理和处理时出错的紧急件信息");
	}
	else
	{
		row.find('td:eq('+yaohslIndex+')').text(baozgsStr * uarlStr);
	}
}

//批量不处理
function func_button_unoperating()
{
	var params = [];
	var rows = $('#emergencys').grid('getSelectedRecords');
	if(rows && rows.length >= 1)
	{
		if (confirm("确认对选取的数据进行不处理操作?")) {
			for ( var i = 0, len = rows.length; i < len; i++) {
				var zt = rows[i].zhuangt;
				if (zt != 0 && zt != 3){
					alert('不能处理非待处理状态或处理时出错状态的数据！');
                    return false;				
				}
				params.push('rows[' + i + '].id=' + rows[i].id);
			}

			$.sdcui.ajaxUtil.ajax({
				url : '${ctx}/anxorder/unoperating.ajax',
				data : params.join('&'),
				success : function(result) {
					alert(result.result);
					$('#emergencys').grid('reload');
				}
			});
		}
	}
	else
	{
		alert("请选择一条数据!");
	}
	
}


//批量处理
function func_button_operating()
{
	var params = [];
	var rows = $('#emergencys').grid('getSelectedRecords');
	if(rows && rows.length >= 1)
	{
		if (confirm("确认对选取的数据进行处理操作?")) {
			var time = new Date();
			for ( var i = 0, len = rows.length; i < len; i++) 
			{
				var zt = rows[i].zhuangt;
				if (zt != 0 && zt != 3)
				{
					alert('不能处理非待处理状态或处理时出错状态的数据！');
                    return false;				
				}
			}
			var data = "data="+JSON.stringify(rows);
			$.sdcui.ajaxUtil.ajax({
				url : '${ctx}/anxorder/operating.ajax',
				data : data,
				success : function(result)
				{
					if(result.result != null)
						alert(result.result);
					if(result.errorMsg != null)
						alert(result.errorMsg);
					$('#emergencys').grid('reload');
				}
			});
		}
	}
	else
	{
		alert("请选择一条数据!");
	}
}


//批量处理
function func_button_reset()
{
	var params = [];
	var rows = $('#emergencys').grid('getSelectedRecords');
	if(rows && rows.length >= 1)
	{
		if (confirm("确认对选取的数据进行重置操作?")) {
			var idIndex = $('td.id:first').prevAll().length;
			var gongysbhIndex = $('td.gongysbh:first').prevAll().length;
			var gongysmcIndex = $('td.gongysmc:first').prevAll().length;
			var chengysbhIndex = $('td.chengysbh:first').prevAll().length;
			var chengysmcIndex = $('td.chengysmc:first').prevAll().length;
			var gongysfeIndex = $('td.gongysfe:first').prevAll().length;
			for ( var i = 0, len = rows.length; i < len; i++) {
				params.push('rows[' + i + '].id=' + rows[i].id);
			}
			$.sdcui.ajaxUtil.ajax({
				url : '${ctx}/anxorder/reset.ajax',
				data : params.join('&'),
				success : function(result) 
				{
					   if(result.result != null)
				       {
				       		var  obj = result.result;
				       		var allRecords = $("#emergencys").grid("getRecords");
				       		for(var i=0;i<obj.length;i++)
			       			{
			       				for(var j=0;j<allRecords.length ;j++)
			       				{
			       					if(allRecords[j].id == obj[i].id)
		       						{
			       						allRecords[j].gongysfe = obj[i].gongysfe;
			       						allRecords[j].gongysbh = obj[i].gongysbh;
			       						allRecords[j].gongysmc = obj[i].gongysmc;
			       						allRecords[j].chengysbh = obj[i].chengysbh;
			       						allRecords[j].chengysmc = obj[i].chengysmc;
		       						}
			       				}
			       			}
				       		$('#emergencys').grid('parseRecords', allRecords);
				       }
				}
			});
		}
	}
	else
	{
		alert("请选择一条数据!");
	}
}

</script>
</t:html>