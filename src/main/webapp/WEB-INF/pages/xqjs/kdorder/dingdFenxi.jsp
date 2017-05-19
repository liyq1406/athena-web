<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.dingdfenx}" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.kdorder" >
<script type="text/javascript">
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
}
//表单验证
function vali() {
	var recordMaoxq = $('#maoxqGrid').grid('getSelectedRecords');
	var recordDingd = $('#dingdGrid').grid('getSelectedRecords');
	var selectXuqbc = $('#layout_selectXuqbc').fieldValue();
	var selectJizhun = $('#layout_selectJizhun').fieldValue();
	var selectXuqly = $('#layout_selectXuqly').fieldValue();
	
	var maoxqLength = recordMaoxq.length;
	
	var chooseNum = maoxqLength + recordDingd.length;
	if(maoxqLength > 1) {
		alert("${i18n.tiaosjiaoyduo}");
		return false;
	}
	if(chooseNum < 2) {
		alert("${i18n.tiaosjiaoyshao}");
		return false;
	}
	else if(chooseNum > 2) {
		alert("${i18n.maoxuqduo}");
		return false;
	} else {
		//判断毛需求和订单的类型
		if(maoxqLength > 0) {
		} else {
			if(recordDingd[0].chullx != recordDingd[1].chullx) {
				alert("${i18n.neixbut}");
				return false;
			}
		}
		
		//判断是否在选中的数据中选择的基准
		if(selectJizhun != null && selectJizhun != "") {
			if(maoxqLength > 0) {
				if(recordMaoxq[0].pplbc != selectJizhun && recordDingd[0].dingdh != selectJizhun) {
					alert("${i18n.jizts}");
					return false;
				}
			}else {
				if(recordDingd[0].dingdh != selectJizhun && recordDingd[1].dingdh != selectJizhun) {
					alert("${i18n.jizts}");
					return false;
				}
			}
		}
		else {
			alert("${i18n.jiztsx}");
			return false;
		}
	}
	return true;
}

function createCheckBox(){
	return "<input  name='choices' type='CheckBox' value='0'/>";
}

//比较按妞事件
function func_button_bijiao() {
	if(vali()) {
		var recordMaoxq = $('#maoxqGrid').grid('getSelectedRecords');
		var recordDingd = $('#dingdGrid').grid('getSelectedRecords');
		var pplbc = "";
		var dingdh1 = "";
		var dingdh2 = "";
		var jizhunValue = $('#layout_selectJizhun').fieldValue();
		if(recordMaoxq.length > 0) {
			pplbc = recordMaoxq[0].pplbc;
		}
		var dingdjssj1="";
		var dingdjssj2="";
		for (var i=0;i < recordDingd.length;i++) {
			if(i==0) {
				dingdh1 = recordDingd[i].dingdh;
				dingdjssj1 = recordDingd[i].dingdjssj;
			}
			else if(i==1) {
				dingdh2 = recordDingd[i].dingdh;
				dingdjssj2 = recordDingd[i].dingdjssj;
			}
		}
		
		var datasJson = {
			"pplbc":pplbc,
			"dingdh1":dingdh1,
			"dingdh2":dingdh2,
			"jizhunValue":jizhunValue,
			"dingdjssj1":dingdjssj1,
			"dingdjssj2":dingdjssj2
		};
		
		$.sdcui.pageUtils.goPage({
				url:'/kdorder/toBijiaoResult.do',//url
				record:datasJson,
				mode:'form',
				beforeSubmit:function(){
					//
					return true;
				}
			});
	}
}

function selectRow(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		//var chk = $(rowTr).find("input[type='checkbox']");
		//var red = $(rowTr).find("input[type='radio']");
        if(checkbox.type == 'checkbox'){
			return true;
		}
		return false;
   }
</script>
<!--主体内容开始-->
<t:form id="bijiaoForm" submit="NOT" reset="NOT">
<!-- 毛需求列表 -->
<t:grid id="maoxqGrid" caption="${i18n.pplTitle}"  idKeys="maoxqbc"
	src="/kdorder/queryListNiandyg.ajax" add="NOT"  back="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="true" scrollHeight="123" selectRowEvent="selectRow" multiple="true" showNum="true">
	<t:fieldLayout prefix="layout">
		<t:fieldHidden property="selectXuqbc"></t:fieldHidden>
		<t:fieldHidden property="selectXuqly"></t:fieldHidden>
		<t:fieldHidden property="selectJizhun"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
	<t:gridCol property="pplbc" caption="${i18n.pplbanc}" width="150"></t:gridCol>
	<t:gridCol property="maoxqbc"  caption="${i18n.xuqbanc}" width="150"></t:gridCol>
	<t:gridCol property="jissj"  caption="${i18n.ppljssj}" width="100"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100" convert="convertXqlyForChn"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
</t:grid>
<!-- 订单列表 -->
<t:grid id="dingdGrid" caption="${i18n.KDzqddlb}"  back="NOT" idKeys="dingdh"
	src="/kdorder/queryListDingd.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="true" scrollHeight="122" selectRowEvent="selectRow" multiple="true"  showNum="true">
	<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
	<t:gridCol property="sz" renderer="radioJizhun" align="center" caption="${i18n.jiz}"></t:gridCol>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}" width="100"></t:gridCol>
	<t:gridCol property="chullx" caption="${i18n.dingdlb}" width="100"></t:gridCol>
	<t:gridCol property="gongysdm"  caption="${i18n.gongysdm}" width="150"></t:gridCol>
	<t:gridCol property="heth"  caption="${i18n.heth}" width="100"></t:gridCol>
	<t:gridCol property="fahzq"  caption="${i18n.jiszq}" width="100"></t:gridCol>
	<t:gridCol property="dingdwhr" caption="${i18n.dingdwhr}" width="100"></t:gridCol>
	<t:gridCol property="maoxqbc" caption="${i18n.xuqbanc}" width="100"></t:gridCol>
	<t:gridCol property="dingdjssj" caption="${i18n.dingdjssj}" width="100"></t:gridCol>
	<t:gridCol property="dingdztName" caption="${i18n.dingdzt}" width="100"></t:gridCol>
</t:grid>
	
<t:buttons id="button_form">
  <t:button name="bijiao" caption="${i18n.bijiao}"></t:button>
</t:buttons>
</t:form>
<p>
</p>
</t:page>
</t:html>