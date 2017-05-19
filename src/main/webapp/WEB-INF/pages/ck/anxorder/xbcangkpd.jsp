<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.xbkcpd}" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.xqjs.anx.xbpd">
<style>
 #yl{
	width:100%;
	position:absolute;
	left:-1px;
	top:-1px;
	margin-left:-10px;
	margin-top:-10px;
	opacity: 0.1;
	filter:Alpha(Opacity=10)/*{opacityOverlay}*/; 
	background:url('../styles/default/images/ajax-loader.gif') no-repeat center 150px ;	
	text-align:center;
	font-weight:bold;
	z-index:9999;
};
body.show-loading{
	overflow-y:hidden;
}     
</style>
<!--主体内容开始-->
<t:form id="form_chushzy" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="chushzyGridQuery" caption="${i18n.pdcx}" idKeys="lingjbh,usercenter,shengcxbh,xiaohd,anxscjssj,mos" showNum="true" 
	src="/xianbkc/queryxbkpd.ajax"  edit="NOT" load="false" remove="NOT"  add="NOT"  showCheckbox="true" scrollHeight="135">
	<t:fieldLayout prefix="layout" columns="4">
	    <t:fieldSelect property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}" width="150" ></t:fieldSelect>
		<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10"  width="150"></t:fieldText>
		<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" maxLength="5"   width="150"></t:fieldText>
		<t:fieldText property="xiaohd" caption="${i18n.xiaohdbh}" maxLength="9"   width="150"></t:fieldText>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"></t:gridCol>
	<t:gridCol property="xiaohd" caption="${i18n.xiaohdbh}"></t:gridCol>
	<t:gridCol property="xianbllkc" caption="${i18n.xianbllkc}"></t:gridCol>
	<t:gridCol property="mos" caption="模式" ></t:gridCol>
	<t:gridCol property="anxscjssj" caption="上次计算时间" ></t:gridCol>
	</t:grid>
	<t:buttons id="buttons_form">
			<t:button caption="${i18n.qued}" name="qued"></t:button>
	</t:buttons>
	 <t:grid id="chushzyGrid" caption="${i18n.xbpdbj}" idKeys="lingjbh,usercenter,xiaohd,pandtime" showNum="true" 
	  edit="NOT" load="false" remove="NOT"  add="NOT"   submit="NOT" reset="NOT" showCheckbox="true" scrollHeight="160">
	<t:button name="removeSelected" active="0" caption="${i18n.remove}" icon="removeRecord"></t:button>
	<t:button caption="保存" name="save"></t:button>
	<t:button caption="${i18n.dcxls}" name="expxls" active="3"></t:button>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}" ></t:gridCol>
	<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"></t:gridCol>
	<t:gridCol property="xiaohd" caption="${i18n.xiaohdbh}"></t:gridCol>
	<t:gridCol property="xianbllkc" caption="${i18n.xianbllkc}" ></t:gridCol>
	<t:gridCol property="zhengclsh" caption="${i18n.zhongzlxh}" editorOptions="{'notNull':true,closeEvent:jsdxh,'expression':'^[A-Za-z0-9]{9}$','expressionMessage':'9位的数字或字母'}" editor="fieldText" ></t:gridCol>
	<t:gridCol property="daixh" caption="${i18n.kucsldxh}"></t:gridCol>
	<t:gridCol property="chukl" caption="出库量"></t:gridCol>
	<t:gridCol property="yicdxh" caption="异常待消耗"></t:gridCol>
	<t:gridCol property="daijf" caption="待交付"></t:gridCol>
	<t:gridCol property="xiaohl" caption="消耗量"></t:gridCol>
	<t:gridCol property="yingyl" caption="盈余量"></t:gridCol>
	<t:gridCol editor="fieldText"  property="pandljsl" caption="${i18n.pdsjkc}" editorOptions="{'notNull':true,closeEvent:jscy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"></t:gridCol>
	<t:gridCol property="chay" caption="${i18n.cy}" ></t:gridCol>
	<t:gridCol property="anxscjssj" caption="上次计算时间" ></t:gridCol>
	<t:gridCol property="mos" caption="模式" ></t:gridCol>
	<t:gridCol property="pandtime" caption="盘点时间" ></t:gridCol>
	</t:grid>
</t:form>
	<form id="exp" name="exp" action="${ctx}/xianbkc/downLoadFilePd.do" method="post" style="background-color: white;" target="hiddenUp">
		<div style="display: none;">
			<t:fieldLayout prefix="dto">
				<t:fieldHidden property="param"></t:fieldHidden>
			</t:fieldLayout>
		</div>
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
</t:page>
<script type="text/javascript">
//保存按钮
function func_button_save(){
	 var records = $("#chushzyGrid").grid("getSelectedRecords");
	 var length = records.length;//判断长度
	 if(length < 1){
		 alert("请选择一条数据!");
		 return false;
	 }
		     
		 for (var i =0;i < records.length;i++)
		 {
		 	if(records[i].zhengclsh == null){
		 		alert('总装流水号为空');
		 		return false;
		 	}
		 	if(records[i].pandljsl == null){
		 		alert('实际盘点库存为空');
		 		return false;
		 	}
		 	if(records[i].usercenter == null){
		 		alert('用户中心为空');
		 		return false;
		 	}
		 	if(records[i].lingjbh == null){
		 		alert('零件编号为空');
		 		return false;
		 	}
			if(records[i].xiaohd == null){
		 		alert('消耗点为空');
		 		return false;
		 	}
		 	if(records[i].xianbllkc == null){
		 		alert('线边理论库存为空');
		 		return false;
		 	}
		 	
			if(records[i].daixh == null){
		 		alert('待消耗为空');
		 		return false;
		 	}
		 	if(records[i].chukl == null){
		 		alert('出库量为空');
		 		return false;
		 	}
		 	
			if(records[i].yicdxh == null){
		 		alert('异常待消耗为空');
		 		return false;
		 	}
			
			if(records[i].daijf == null){
		 		alert('待交付为空');
		 		return false;
		 	}
			
			if(records[i].xiaohl == null){
		 		alert('消耗量为空');
		 		return false;
		 	}
			
			if(records[i].yingyl == null){
		 		alert('盈余量为空');
		 		return false;
		 	}
			
			if(records[i].chay == null){
		 		alert('差异量为空');
		 		return false;
		 	}
			
		}
		var data = "data="+JSON.stringify(records);
		 down_showLoading1();
     $.sdcui.ajaxUtil.ajax({
            url:"saveC0kc.ajax",//请求url
            data: data,
           	success:function (result){
           		alert(result.result);
           		down_hideLoading1();
           	    $('#chushzyGridQuery').grid('reload');
    			func_grid_removeSelected();	
            }
    	});
	}
	


	 //copy 数据
     function func_button_qued()
     {
         var allRecords = $("#chushzyGrid").grid("getRecords");
         if(allRecords && allRecords.length >= 50)
       	 {
       	 	alert("一次处理盘点的数据最多50行!");
       	 	return false;
       	 }
         var records = $("#chushzyGridQuery").grid("getSelectedRecords");
         $('#chushzyGrid').grid('parseRecords', allRecords.concat(records));
     }

     function jscy(){
    	//判断验证数据是否通过
      	var rowElement = this.col.cell.parent('tr:first');　
      	var usercenterIndex = $('td.usercenter:last').prevAll().length;
      	var lingjbhIndex = $('td.lingjbh:last').prevAll().length;
      	var shengcxbhIndex = $('td.shengcxbh:last').prevAll().length;
      	var xiaohdIndex = $('td.xiaohd:last').prevAll().length;
      	var xianbllkcIndex = $('td.xianbllkc:last').prevAll().length;
      	var zhengclshIndex = $('td.zhengclsh:last').prevAll().length;
      	var daixhIndex = $('td.daixh:last').prevAll().length;
      	var chuklIndex = $('td.chukl:last').prevAll().length;
      	var yicdxhIndex = $('td.yicdxh:last').prevAll().length;
    	var daijfIndex = $('td.daijf:last').prevAll().length;
     	var xiaohlIndex = $('td.xiaohl:last').prevAll().length;
     	var yingylIndex = $('td.yingyl:last').prevAll().length;
      	var pandljslIndex = $('td.pandljsl:last').prevAll().length;
      	var chayIndex = $('td.chay:last').prevAll().length;
      	var anxscjssjIndex = $('td.anxscjssj:last').prevAll().length;
      	var mosIndex = $('td.mos:last').prevAll().length;
      	var pandtimeIndex = $('td.pandtime:last').prevAll().length;
     	//验证　
     	if (rowElement.find('td:eq(' + pandljslIndex + ')').hasClass('validate-error')){
     		rowElement.find('td:eq(' + chayIndex + ')').text("");
     		return false;
     	}
     	//获取值
		var usercenter = rowElement.find('td:eq(' + usercenterIndex + ')').text();
		var lingjbh = rowElement.find('td:eq(' + lingjbhIndex + ')').text();
		var shengcxbh = rowElement.find('td:eq(' + shengcxbhIndex + ')').text();
		var xiaohd = rowElement.find('td:eq(' + xiaohdIndex + ')').text();
		var xianbllkc = rowElement.find('td:eq(' + xianbllkcIndex + ')').text();
		var zhengclsh = rowElement.find('td:eq(' + zhengclshIndex + ')').text();
		var daixh = rowElement.find('td:eq(' + daixhIndex + ')').text();
		var chukl = rowElement.find('td:eq(' + chuklIndex + ')').text();
		var yicdxh = rowElement.find('td:eq(' + yicdxhIndex + ')').text();
		var daijf = rowElement.find('td:eq(' + daijfIndex + ')').text();
		var xiaohl = rowElement.find('td:eq(' + xiaohlIndex + ')').text();
		var yingyl = rowElement.find('td:eq(' + yingylIndex + ')').text();
		var pandljsl = rowElement.find('td:eq(' + pandljslIndex + ')').text();
		var chay = rowElement.find('td:eq(' + chayIndex + ')').text();
		var anxscjssj = rowElement.find('td:eq(' + anxscjssjIndex + ')').text();
		var mos = rowElement.find('td:eq(' + mosIndex + ')').text();
		var pandtime = rowElement.find('td:eq(' + pandtimeIndex + ')').text();
     	if (daixh == "" || chukl == "" || yicdxh == "" || xianbllkc == "" || daijf == "" || xiaohl == "" || yingyl == "")
     	{
     		rowElement.find('td:eq(' + chayIndex + ')').text("");
     		alert('${i18n.jslshbc}');
     	} 
     	else 
     	{
     		var flagXianbllkc = parseFloat(xianbllkc);
     		var flagPandljsl = parseFloat(pandljsl);
     		var flagDaixh = parseFloat(daixh);
     		var flagChukl = parseFloat(chukl);
     		var flagYicdxh = parseFloat(yicdxh);
     		var flagDaijf = parseFloat(daijf);
     		var flagXiaohl = parseFloat(xiaohl);
     		var flagYingyl = parseFloat(yingyl);
     		rowElement.find('td:eq(' + chayIndex + ')').text(flagXianbllkc + flagDaixh + flagChukl + flagXiaohl + flagYingyl - flagYicdxh - flagPandljsl - flagDaijf);
     	}
     }
     
     function jsdxh(){
     	//判断验证数据是否通过
     	var rowElement = this.col.cell.parent('tr:first');　
     	var usercenterIndex = $('td.usercenter:last').prevAll().length;
     	var lingjbhIndex = $('td.lingjbh:last').prevAll().length;
     	var shengcxbhIndex = $('td.shengcxbh:last').prevAll().length;
     	var xiaohdIndex = $('td.xiaohd:last').prevAll().length;
     	var xianbllkcIndex = $('td.xianbllkc:last').prevAll().length;
     	var zhengclshIndex = $('td.zhengclsh:last').prevAll().length;
     	var daixhIndex = $('td.daixh:last').prevAll().length;
     	var chuklIndex = $('td.chukl:last').prevAll().length;
     	var yicdxhIndex = $('td.yicdxh:last').prevAll().length;
     	var daijfIndex = $('td.daijf:last').prevAll().length;
     	var xiaohlIndex = $('td.xiaohl:last').prevAll().length;
     	var yingylIndex = $('td.yingyl:last').prevAll().length;
     	var pandljslIndex = $('td.pandljsl:last').prevAll().length;
     	var chayIndex = $('td.chay:last').prevAll().length;
     	var anxscjssjIndex = $('td.anxscjssj:last').prevAll().length;
     	var mosIndex = $('td.mos:last').prevAll().length;
     	var pandtimeIndex = $('td.pandtime:last').prevAll().length;
     	
     	
     	rowElement.find('td:eq(' + daixhIndex + ')').text("");
 		rowElement.find('td:eq(' + chuklIndex + ')').text("");
 		rowElement.find('td:eq(' + yicdxhIndex + ')').text("");
 		rowElement.find('td:eq(' + daijfIndex + ')').text("");
 		rowElement.find('td:eq(' + xiaohlIndex + ')').text("");
 		rowElement.find('td:eq(' + yingylIndex + ')').text("");
 		rowElement.find('td:eq(' + pandtimeIndex + ')').text("");
 		rowElement.find('td:eq(' + chayIndex + ')').text("");
 		rowElement.find('td:eq(' + pandljslIndex + ')').text("");
     	//验证　
     	if (rowElement.find('td:eq(' + zhengclshIndex + ')').hasClass('validate-error')){
     		return false;
     	}
     	//获取值
		var usercenter = rowElement.find('td:eq(' + usercenterIndex + ')').text();
		var lingjbh = rowElement.find('td:eq(' + lingjbhIndex + ')').text();
		var shengcxbh = rowElement.find('td:eq(' + shengcxbhIndex + ')').text();
		var xiaohd = rowElement.find('td:eq(' + xiaohdIndex + ')').text();
		var xianbllkc = rowElement.find('td:eq(' + xianbllkcIndex + ')').text();
		var zhengclsh = rowElement.find('td:eq(' + zhengclshIndex + ')').text();
		var daixh = rowElement.find('td:eq(' + daixhIndex + ')').text();
		var chukl = rowElement.find('td:eq(' + chuklIndex + ')').text();
		var yicdxh = rowElement.find('td:eq(' + yicdxhIndex + ')').text();
		var daijf = rowElement.find('td:eq(' + daijfIndex + ')').text();
		var xiaohl = rowElement.find('td:eq(' + xiaohlIndex + ')').text();
		var yingyl = rowElement.find('td:eq(' + yingylIndex + ')').text();
		var pandljsl = rowElement.find('td:eq(' + pandljslIndex + ')').text();
		var chay = rowElement.find('td:eq(' + chayIndex + ')').text();
		var anxscjssj = rowElement.find('td:eq(' + anxscjssjIndex + ')').text();
		var mos = rowElement.find('td:eq(' + mosIndex + ')').text();
		var pandtime = rowElement.find('td:eq(' + pandtimeIndex + ')').text();
		
		//调用交易
     	if (zhengclsh !=　""){
	     	var param = [];
			param.push('usercenter='+usercenter);
			param.push('lingjbh='+lingjbh);
			param.push('shengcxbh='+shengcxbh);
			param.push('xiaohd='+xiaohd);
			param.push('zhengclsh='+zhengclsh);
			param.push('anxscjssj='+anxscjssj);
			param.push('mos='+mos);
     		$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/xianbkc/checkLsh.ajax",
				data : param.join('&'),
				success : function(result) {
					if (result.result.message && result.result.message != "")
					{
						rowElement.find('td:eq(' + daixhIndex + ')').text("");
			     		rowElement.find('td:eq(' + chuklIndex + ')').text("");
			     		rowElement.find('td:eq(' + yicdxhIndex + ')').text("");
			     		rowElement.find('td:eq(' + pandljslIndex + ')').text("");
			     		rowElement.find('td:eq(' + pandtimeIndex + ')').text("");
			     		rowElement.find('td:eq(' + chayIndex + ')').text("");
			     		rowElement.find('td:eq(' + daijfIndex + ')').text("");
			     		rowElement.find('td:eq(' + yingylIndex + ')').text("");
			     		rowElement.find('td:eq(' + xiaohlIndex + ')').text("");
					}
					else if(result.result.result && result.result.result != "")
					{
						rowElement.find('td:eq(' + daixhIndex + ')').text(result.result.result.daixh);
						rowElement.find('td:eq(' + yicdxhIndex + ')').text(result.result.result.yicdxh);
						rowElement.find('td:eq(' + chuklIndex + ')').text(result.result.result.chukl);
						rowElement.find('td:eq(' + pandtimeIndex + ')').text(result.result.result.pandtime);
						rowElement.find('td:eq(' + daijfIndex + ')').text(result.result.result.daijf);
						rowElement.find('td:eq(' + yingylIndex + ')').text(result.result.result.yingyl);
						rowElement.find('td:eq(' + xiaohlIndex + ')').text(result.result.result.xiaohl);
					}
				}
			});
     	}
     }
     
    //删除选中行数据
    function func_grid_removeSelected(){
    	var records = [];
    	var allRecords = $("#chushzyGrid").grid("getRecords");
    	var selRecords = $("#chushzyGrid").grid("getSelectedRecords");
    	if (selRecords.length<1){
    		return false;
    	}
    	var selList = $("[id='chushzyGrid']").find("td.checkbox")
    	//数据比对
   		for(var i=0;i<allRecords.length;i++){
   			var isExist = false ;
   			for(var j=0;j<selList.length;j++){
   				var currentCellValue = $($(selList[j]).parent()[0]).text();
   				if (currentCellValue !="" && $(selList[j]).parent().hasClass("selected")){
   					if (parseInt(i+1) == parseInt(currentCellValue)){
   						isExist = true;
   						continue;
   					}
   				}
   			}
   			if (isExist == false){
   				records.push(allRecords[i]);
   			}
   		}
    	//加载数据
    	$('#chushzyGrid').grid('parseRecords', records);
    	return false;
    }
     
    
    
     function func_button_expxls(){
        $("#chushzyGrid").grid("triggerCloseEdited");
        var records = $("#chushzyGrid").grid("getRecords");
        if(records.length > 0)
       	{
	        $('#dto_param').fieldValue(JSON.stringify(records));
			var fm = document.getElementById("exp");
			fm.submit();
       	}
        else
       	{
       		alert("请选择导出的数据!");
       	}
     }
     /**
	 * 功能：调用loading 显示
	 * 作者：gswang
	 * 日期：2013-09-13
	 */
	function down_showLoading1(){
		var id = 'yl';
		var loading = $('#'+id);
		if(!loading.length){
			loading = $('<div class="yl" id="'+id+'"/>').appendTo($('body',document));
		}
		title =$.sdcui.resourceUtils.get('loading');
		$('body',document).addClass('show-loading');
		loading.show().text(title).css({
			height:Math.max($(window).height(),$('body',document).height())
		});
	}

	/**
	 * 功能：调用loading 隐藏
	 * 作者：gswang
	 * 日期：2013-09-13
	 */
	function down_hideLoading1(){
		var id = 'yl';
		$('#'+id).hide('slow');
		$('body',document).removeClass('show-loading');
	}
     
</script>
</t:html>