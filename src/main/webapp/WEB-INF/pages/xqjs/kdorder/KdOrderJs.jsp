<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kdtitle}" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.ilOrder">
<script type="text/javascript">
//生成选择radio
function radioXuqbc(){
	return "<input name='selectXuqbcs' onclick='radioClick(this)' type='radio'/>";
}
//radio点击事件
function radioClick(obj){
	var rowElemt = $(obj).parent('td:first').parent('tr:first');
	var xuqbc = rowElemt.find('td:eq(1)').text();
	//选中的版次放到隐藏域
	$('#layout_xuqbc').fieldValue(xuqbc);
}
//计算类型change事件
function layout_dingdh_change() {
	var dingdh = $("#layout_dingdh").fieldValue();
	var datas = "dingdh="+dingdh;
	//得到制造路线
	$.sdcui.ajaxUtil.ajax({
		url:'${ctx}/kdorder/getZhizlxByDingd.ajax',//url
		data:datas,
		success:function (result){
			$('#layout_xuqbc').fieldValue("");
			$('#chooseMaoxqGrid').grid('reload');
			//设置制造路线(为需求来源取值的制造路线)
			if(result.result == "") {
				$("#layout_zhizlxForXuqly").fieldValue("1");
			}else {
				$("#layout_zhizlxForXuqly").fieldValue(result.result);
			}
			//设置制造路线
			$("#layout_zhizlx").fieldValue(result.result);
			
			return true;
		}
	});
}
//计算类型change事件
function layout_xuqly_change() {
	$('#maoxqGrid').grid('reload');
}
//表单验证
function vali() {
	//是否选中了版次
	var record = $('#maoxqGrid').grid('getSelectedRecords');
	if(record.length == 0) {
		//请选择版次
		alert("${i18n.message_null}");
		return false;
	}
	return true;
}
//取消表单验证
function qxvali() {
	//是否选中了版次
	var record = $('#chooseMaoxqGrid').grid('getSelectedRecords');
	if(record.length == 0) {
		//请选择版次
		alert("${i18n.message_null}");
		return false;
	}
	return true;
}
//确定按妞事件
function func_button_qd() {
	if(vali()) {
		//是否选中了版次
		var record = $('#maoxqGrid').grid('getSelectedRecords');
		//选中的版次放到隐藏域
		$('#layout_xuqbc').fieldValue(record[0].xuqbc);
		$('#layout_isDel').fieldValue("0");
		$('#chooseMaoxqGrid').grid('reload');
	}
}
//取消按妞事件
function func_button_qx() {
	if(qxvali()) {
		//是否选中了版次
		var record = $('#chooseMaoxqGrid').grid('getSelectedRecords');
		//选中的版次放到隐藏域
		$('#layout_xuqbc').fieldValue(record[0].xuqbc);
		$('#layout_isDel').fieldValue("1");
		$('#chooseMaoxqGrid').grid('reload');
	}
}

//生成订单按钮事件
function func_button_scdd() {
	var flag = true;
	var grid = $('#chooseMaoxqGrid').grid('getRecords');
	if(grid.length<1){
	alert("${i18n.bancts}");
	flag = false;
	}else{
	var dingdh = $('#layout_dingdh').fieldValue();
	if(dingdh==''){
	alert("${i18n.dingdhts}");
	flag = false;
	}
	var ziyhqrq = $('#layout_ziyhqrq').fieldValue();
	if(ziyhqrq==''){
	alert("${i18n.ziyhqrqts}");
	flag = false;
	}
	}
	var param =[];
	for(var i=0;i<grid.length;i++){
	 param.push('edit['+i+'].xuqbc='+grid[i].xuqbc);
	 param.push('edit['+i+'].xuqcfsj='+grid[i].xuqcfsj);
	 param.push('edit['+i+'].xuqly='+grid[i].xuqly);
	 param.push('edit['+i+'].xuqlymc='+grid[i].xuqlymc);
	 param.push('edit['+i+'].beiz='+grid[i].beiz);
	}
	param.push('dingdh='+dingdh);
	param.push('ziyhqrq='+ziyhqrq);
	
	param.push('zhizlx='+$('#layout_zhizlx').fieldValue());
	
	
	if(flag){
	 $.sdcui.ajaxUtil.ajax({
                      url:"${ctx}/kdorder/kdCalculate.ajax",
                      data:param.join('&'),
                        success:function (result){
                       	 alert(result.result);
                       	 if (confirm("${i18n.daocts}")) {

        $.sdcui.pageUtils.goPage({
	url:'kdhzDownLoadFile.do',//url,
	mode:'form',
	beforeSubmit:function(){
        return true;
        }
		});
		return false;
}
                      }
                 });

	}
	


}
	
	function func_button_csxy() {
	var flag = true;
	var grid = $('#chooseMaoxqGrid').grid('getRecords');
	if(grid.length<1){
	alert("${i18n.bancts}");
	flag = false;
	}else{
	var dingdh = $('#layout_dingdh').fieldValue();
	if(dingdh==''){
	alert("${i18n.dingdh}");
	flag = false;
	}
	var ziyhqrq = $('#layout_ziyhqrq').fieldValue();
	if(ziyhqrq==''){
	alert("${i18n.ziyhqrqts}");
	flag = false;
	}
	}
	var param =[];
	for(var i=0;i<grid.length;i++){
	 param.push('edit['+i+'].xuqbc='+grid[i].xuqbc);
	 param.push('edit['+i+'].xuqcfsj='+grid[i].xuqcfsj);
	 param.push('edit['+i+'].xuqly='+grid[i].xuqly);
	 param.push('edit['+i+'].xuqlymc='+grid[i].xuqlymc);
	 param.push('edit['+i+'].beiz='+grid[i].beiz);
	}
	param.push('dingdh='+dingdh);
	param.push('ziyhqrq='+ziyhqrq);
	param.push('zhizlx='+$('#layout_zhizlx').fieldValue());
	
	
	if(flag){
	 $.sdcui.ajaxUtil.ajax({
	 	 	                         url:"${ctx}/kdorder/checkValue.ajax",
	 	 	                         data:param.join('&'),
	 	                             success:function (result){
	 	                            	 alert(result.result);
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
			var record = $('#maoxqGrid').grid('getRecord', rowDoc);//获取当前行对应的记录
			var xuqbc = record.xuqbc;
			/**
			 * form跳转模式提交
			 */
			winOpen = window.open ('${ctx}/zygzbj/mxqMx.do?removeId=layout-north,layout-west,layout-south&xuqbc='+xuqbc,'${i18n.maoxuqmx}','top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			winOpen.resizeTo(screen.availWidth,screen.availHeight);
			return false;

		}

</script>
<!--主体内容开始-->

  <!--查询列表开始-->
  <t:grid id="maoxqGrid" caption="${i18n.kdtitle}" showNum="true" idKeys="xuqbc,xuqcfsj,xuqly"
	src="/kdorder/queryListKdMaoxq.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="false"  scrollHeight="163" back="NOT">
	<t:fieldLayout prefix="layout" columns="3">
		<t:fieldHidden property="zhizlxForXuqly"></t:fieldHidden>
		<t:fieldSelect property="dingdh" caption="${i18n.dingdh}" src="/kdorder/executeDingdh.ajax" code="dingdh" show="dingdh" width="120"></t:fieldSelect>
		<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" parents="dingdh,zhizlxForXuqly" src="/kdorder/executeMaoxqXqly.ajax" show="gonghms" code="xuqly" width="120"></t:fieldSelect>
		<t:fieldSelect property="ziyhqrq" caption="${i18n.zyhqrq}" src="/kdorder/executeKDZiykzb.ajax" code="ziyhqrq" show="ziyhqrq" width="120"></t:fieldSelect>
		
	</t:fieldLayout>
	<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="${i18n.xuqlymc}" width="100"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
	</t:grid>
	<t:buttons id="button_form1">
	<t:button name="qd" caption="${i18n.qued}"></t:button>
	</t:buttons>
	
	<t:grid id="chooseMaoxqGrid" showNum="true" idKeys="xuqbc,xuqcfsj,xuqly"
	src="/kdorder/querySessionMaoxq.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="true"  scrollHeight="80" back="NOT">
	<t:fieldLayout prefix="layout">
		<t:fieldHidden property="xuqbc"></t:fieldHidden>
		<t:fieldHidden property="isDel"></t:fieldHidden>
		<t:fieldHidden property="zhizlx"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="${i18n.xuqlymc}" width="100"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_form2">
	<t:button name="qx" caption="${i18n.qux}"></t:button>
	</t:buttons>
	

<t:buttons id="button_form">
  <t:button name="csxy" caption="${i18n.csxy}"></t:button>
  <t:button name="scdd" caption="${i18n.scdd}"></t:button>
</t:buttons>

</t:page>
</t:html>