<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="IL件周期订单计算" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.ilOrder" >
<script type="text/javascript">
/*function initPage(){
   	var pageHeight = document.body.clientHeight;
	var gridHeight = pageHeight - 531;
	$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
	  return gridHeight;
	});
	$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
		  return gridHeight;
	});
  }	*/
//生成选择radio
function radioXuqbc(){
	return "<input name='selectXuqbcs' onclick='radioClick(this)' type='radio'/>";
}
//生成基准radio
function radioJizhun(){
	return "<input name='selectJizhun' onclick='radioJizhunClick(this)' type='radio'/>";
}
//radio点击事件
function radioClick(obj){
	var rowElemt = $(obj).parent('td:first').parent('tr:first');
	var xuqbc = rowElemt.find('td:eq(1)').text();
	var xuqly = rowElemt.find('td:eq(3)').text();
	//选中的版次,来源放到隐藏域
	$('#layout_selectXuqbc').fieldValue(xuqbc);
	$('#layout_selectXuqly').fieldValue(xuqly);
}
//基准radio点击事件
function radioJizhunClick(obj) {
	var rowElemt = $(obj).parent('td:first').parent('tr:first');
	var jizhunValue = rowElemt.find('td:eq(2)').text();
	//选中的基准版次或者订单号放到隐藏域
	$('#layout_selectJizhun').fieldValue(jizhunValue);
	if(jizhunValue.indexOf(":")>0){
		$('#layout_flag').fieldValue(2);
	}else{
		$('#layout_flag').fieldValue(1);
	}
}
//表单验证
function vali() {
	var recordMaoxq = $('#maoxqGrid').grid('getSelectedRecords');
	var recordDingd = $('#dingdGrid').grid('getSelectedRecords');
	var selectXuqbc = $('#layout_selectXuqbc').fieldValue();
	var selectJizhun = $('#layout_selectJizhun').fieldValue();
	var selectXuqly = $('#layout_selectXuqly').fieldValue();
	//var maoxqLength = recordMaoxq.length;
	var maoxqLength = bancClickArray.length;
	var flag = $('#layout_flag').fieldValue();
	var chooseNum = maoxqLength + recordDingd.length;
	
	if(chooseNum < 2) {
		alert("请选择2条数据进行比较!");
		return false;
	}
	else if(recordDingd.length == 0) {
		alert("请选择订单进行比较!");
		return false;
	} else {
		//判断是否在选中的数据中选择的基准
		if(selectJizhun != null && selectJizhun != "") {
			if(flag==1){
				var flagC = true;
				for(var i=0;i<bancClickArray.length;i++)
				{
					if(bancClickArray[i] == selectJizhun) {
						flagC = false;
					}
				}
				if(flagC)
				{
					alert("请在选择的单据中选择基准！");
					return false;	
				}
			}
			if(flag==2){
				var jizhun = selectJizhun;
				if(jizhun == '') {
					alert("请在选择的单据中选择基准！");
					return false;
				}
			}
		}else {
			alert("请选择基准！");
			return false;
		}
	}
	return true;
}
//比较按妞事件
function func_button_bijiao() {
	if(vali()) {
		//var recordMaoxq = $('#maoxqGrid').grid('getSelectedRecords');
		var recordDingd = $('#dingdGrid').grid('getSelectedRecords');
		var xuqbc = "";
		var flag = "";
		var jizhunValue = $('#layout_selectJizhun').fieldValue();
		//if(recordMaoxq.length > 0) {
		if(bancClickArray.length > 0) {
			for(var i=0;i<bancClickArray.length;i ++)
			{
				xuqbc += bancClickArray[i];
				if(i != (bancClickArray.length - 1))
				{
					xuqbc += ",";
				}
			}
			flag = "1";
		}
		if(recordDingd.length>1){
			flag = "2";
		}
		var dingdjssj = recordDingd[0].dingdjssj;
		
		var dingdjssj1 = "";
		var dingdjssj2 = "";
		for (var i=0;i < recordDingd.length;i++) {
			if(i==0) {
				dingdjssj1 = recordDingd[i].dingdjssj;
			}
			else if(i==1) {
				dingdjssj2 = recordDingd[i].dingdjssj;
			}
		}
		var datasJson = {
			"xuqbc":xuqbc,
			"flag":flag
		};
		
		$.sdcui.pageUtils.goPage({
				url:'/ilorder/toBijiaoResult.do?dingdjssj='+dingdjssj+'&dingdjssj1='+dingdjssj+'&dingdjssj2='+dingdjssj2+'&jizhunValue='+jizhunValue,//url
				record:datasJson,
				mode:'form',
				beforeSubmit:function(){
					//
					return true;
				}
			});
	}
}

/** 
		 *链接点击事件
		 */
		function link_xuqbc(event) {
			var event = event || window.event;//原生态的事件处理 
			var element = event.srcElement || event.target;
			var rowDoc = $(element).parents('tr:first')[0];
			var record = $('#grid_kanbxhjs').grid('getRecord', rowDoc);//获取当前行对应的记录
			/**
			 * form跳转模式提交
			 */
			$.sdcui.pageUtils.goPage({
				url : '/kanbyhl/queryMX.do',//url
				record : record,//
				mode : 'form',
				beforeSubmit : function() {
					//
					return true;
				}
			});
			event.stopPropagation();//阻止事件冒泡
			return false;

		}
		
		$.sdcui.serverConfig.convertArray['chullx'] = {
		'PP' : '周期',
		'PS' : '周',
		'PJ' : '日',
		'C' : '按需'
	};
	
	function selectRow(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		//var chk = $(rowTr).find("input[type='checkbox']");
		//var red = $(rowTr).find("input[type='radio']");
        if(checkbox.type == 'checkbox'){
			return true;
		}
		return false;
   }
   
   var createCheckBoxBanc = function (banc)
   {
	   var i = 0;
	   for(;i<bancClickArray.length;i++)
	   {
	   		if(banc == bancClickArray[i])
   			{
				return "<input  name='choices' type='CheckBox' checked='checked' onclick='bancClick(this)' />";
   			}
	   }
	   return "<input  name='choices' type='CheckBox'  onclick='bancClick(this)' />";
	}
   
   function createCheckBoxDingd()
   {
	   return "<input  name='choices' type='CheckBox' value='0' />";
   }
   
   function bancClick(obj)
   {
	   var rowElemt = $(obj).parent('td:first').parent('tr:first');
	   rowElemt.removeClass("hasTitle");
	   var xuqbc = rowElemt.attr("id");
	   if(!$(obj).attr("checked"))
	   {
		   var i = 0;
		   for(;i<bancClickArray.length;i++)
		   {
		   		if(xuqbc == bancClickArray[i])
	   			{
		   			bancClickArray.splice(i,1);
	   			}
		   }
	   }
	   else
	   {
		   bancClickArray.push(xuqbc);
	   }
   }
   
   var bancClickArray = new Array();
   
   function fuck()
   {
	  var array = $("input[type='CheckBox']");
	  var i = 0;
	  for(;i<array.length;i++)
	  {
		  if($(array[i]).attr("checked"))
		  {
			  $(array[i]).parent().parent().addClass("selected hasTitle");
		  }
	  }
   }
   
</script>
<!--主体内容开始-->
<t:form id="bijiaoForm" submit="NOT" reset="NOT">
<!-- 毛需求列表 -->
<t:grid id="maoxqGrid" caption="毛需求列表" idKeys="xuqbc"    afterParse="fuck"
	src="/ilorder/queryListMaoxq.ajax" add="NOT" submit="NOT"  edit="NOT" remove="NOT"  reset="NOT" load="true" scrollHeight="140"  selectRowEvent="selectRow" multiple="true"  showNum="false">
	<t:fieldLayout prefix="layout">
		<t:fieldHidden property="selectXuqbc"></t:fieldHidden>
		<t:fieldHidden property="selectXuqly"></t:fieldHidden>
		<t:fieldHidden property="selectJizhun"></t:fieldHidden>
		<t:fieldHidden property="flag"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="xuqbc" width="40" caption="选择"  renderer="createCheckBoxBanc"  />
	<t:gridCol property="sz" renderer="radioJizhun" align="center" caption="基准"></t:gridCol>
	<t:gridCol property="xuqbc" caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100" convert="convertXqlyForChn"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="需求来源说明" width="100" ></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
</t:grid>
<!-- 订单列表 -->
<t:grid id="dingdGrid" caption="Il件周期订单列表"  idKeys="maoxqbc"
	src="/ilorder/querySumDingd.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="true"  selectRowEvent="selectRow" multiple="true" scrollHeight="140"  showNum="false">
	<t:gridCol property="checkBox" width="40" caption="选择" renderer="createCheckBoxDingd" />
	<t:gridCol property="sz" renderer="radioJizhun" align="center" caption="基准"></t:gridCol>
	<t:gridCol property="dingdjssj" caption="订单计算时间" width="200"></t:gridCol>
	<t:gridCol property="maoxqbc" caption="需求版次" width="100"></t:gridCol>
</t:grid>
	
<t:buttons id="button_form">
  <t:button name="bijiao" caption="比较"></t:button>
</t:buttons>
</t:form>
<p>
</p>
</t:page>
</t:html>