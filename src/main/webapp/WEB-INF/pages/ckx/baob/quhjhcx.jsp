<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="取货计划查询">


<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="">
	<t:grid id="grid_quhjhcx" caption="取货计划查询" idKeys="usercenter,yunsjhh,yaohlh" src="/baob/queryquhjhcx.ajax" 
	        add="NOT" edit="NOT" remove="NOT" load="false" save="NOT" showNum="true" pageSize="15" scrollHeight="270">
		<t:fieldLayout id="quhjhcx" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="120" defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldText property="yunsjhh" caption="运输计划号" width="120" maxLength="12"></t:fieldText>
			<t:fieldText property="yaohlh" caption="要货令号" width="120" maxLength="12"></t:fieldText>
			<t:fieldText property="lingjbh" caption="零件编号" width="120" maxLength="10"></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商代码" width="120" maxLength="10"></t:fieldText>
			<t:fieldText property="chengysdm" caption="承运商代码" width="120" maxLength="10"></t:fieldText>
			<t:fieldText property="chanx" caption="产线" width="120" maxLength="5"></t:fieldText>
			<t:fieldText property="cangkbh" caption="仓库" width="120" maxLength="3"></t:fieldText>
			<t:fieldText property="cheph" caption="车牌号" width="120"></t:fieldText>
			<t:fieldCalendar property="startdhsj" caption="到货时间" format="yyyy-MM-dd" width="120"></t:fieldCalendar>
 			<t:fieldCalendar property="enddhsj" caption="至" format="yyyy-MM-dd" width="120"></t:fieldCalendar>
 			<t:fieldSelect property="flag" caption="FLAG" convert="zt" width="120"></t:fieldSelect>			
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="用户中心" width="80"/>
		<t:gridCol property="yunsjhh" caption="运输计划号" width="90"/>
		<t:gridCol property="yaohlh" caption="要货令号" width="90"/>
		<t:gridCol property="lingjbh" caption="零件编号" width="80"/>
		<t:gridCol property="lingjsl" caption="零件数量" width="80"/>
		<t:gridCol property="gongysdm" caption="供应商代码" width="80"/>
		<t:gridCol property="chengysdm" caption="承运商代码" width="80"/>
		<t:gridCol property="chanx" caption="产线" width="80"/>
		<t:gridCol property="mudd" caption="目的地" width="100"/>
		<t:gridCol property="cangkbh" caption="仓库" width="80"/>
		<t:gridCol property="yujddsj" caption="预计到达时间" width="130"/>
		<t:gridCol property="shijddsj" caption="实际到达时间" width="130"/>
		<t:gridCol property="yujdhsj" caption="预计到货时间" width="130"/>
		<t:gridCol property="cheph" caption="车牌号" width="80"/>
		<t:gridCol property="wullj" caption="物流路径" width="80"/>
		<t:gridCol property="flag" caption="FLAG" width="80"/>
		<t:gridCol property="yicjhh" caption="异常计划号" width="90"/>
		<t:gridCol property="" caption=" "></t:gridCol>
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
	<div><font color="red">导出结果最大5000条</font></div>		
</t:page>
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['zt'] = {
		'1' : '正常',
		'2' : '数量异常',
		'3' : '时间异常',
		'4' : '没取到货异常'
	};
	
//空格查询
function grid_quhjhcx_beforeSubmit() {
	$("#layout_yunsjhh").fieldValue(trim($("#layout_yunsjhh").fieldValue()));    
	$("#layout_yaohlh").fieldValue(trim($("#layout_yaohlh").fieldValue()));  
	$("#layout_lingjbh").fieldValue(trim($("#layout_lingjbh").fieldValue()));    
	$("#layout_gongysdm").fieldValue(trim($("#layout_gongysdm").fieldValue()));
	$("#layout_chengysdm").fieldValue(trim($("#layout_chengysdm").fieldValue()));    
	$("#layout_chanx").fieldValue(trim($("#layout_chanx").fieldValue()));  
	$("#layout_cangkbh").fieldValue(trim($("#layout_cangkbh").fieldValue()));    
	$("#layout_cheph").fieldValue(trim($("#layout_cheph").fieldValue()));
	
	//至少输入一个查询条件
	var usercenter = trim($("#layout_usercenter").fieldValue());
	var yunsjhh = trim($("#layout_yunsjhh").fieldValue());
	var yaohlh = trim($("#layout_yaohlh").fieldValue());
	var lingjbh = trim($("#layout_lingjbh").fieldValue());
	var gongysdm = trim($("#layout_gongysdm").fieldValue());
	var chengysdm = trim($("#layout_chengysdm").fieldValue());
	var chanx = trim($("#layout_chanx").fieldValue());
	var cangkbh = trim($("#layout_cangkbh").fieldValue());
	var cheph = trim($("#layout_cheph").fieldValue());
	var startdhsj = trim($("#layout_startdhsj").fieldValue());
	var enddhsj = trim($("#layout_enddhsj").fieldValue());
	var flag = trim($("#layout_flag").fieldValue());
	if("" == usercenter && "" == yunsjhh && "" == yaohlh && "" == lingjbh && "" == gongysdm && "" == chengysdm 
	   && "" == chanx && "" == cangkbh && "" == cheph && "" == startdhsj && "" == startdhsj && "" == flag){
		alert("至少输入一个查询条件");
		return false;
	}
	
	//比较时间大小 结束时间必须大于开始时间
	if($("#layout_startdhsj").fieldValue()!="" && $("#layout_enddhsj").fieldValue()!=""){
		var startdhsj = new Date(($("#layout_startdhsj").fieldValue()).replace(/-/g,"/")); //起始日期 （将格式2014-10-12转换成2014/10/12）
		var enddhsj = new Date(($("#layout_enddhsj").fieldValue()).replace(/-/g,"/")); //结束日期（将格式2014-10-22转换成2014/10/22）
		if(startdhsj > enddhsj){
			alert("最大到货时间必须大于最小到货时间");
			return false;
		}
	}else if($("#layout_startdhsj").fieldValue()=="" && $("#layout_enddhsj").fieldValue()=="" ){
	}else{
		alert("若根据到货时间筛选，请将时间段填写完整！");
		return false;
	}
	return true;
}

$(function(){
	var htmls = [];
	htmls.push($('#ck_dataItems_selectedValues').html());
	$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
	$('#ck_dataItems_selectedValues').empty();
	$('#button_expxls').click(func_grid_expcheck);
});

//查询检查数据条数是否超过5000
function func_grid_expcheck(event){
	
	if(!grid_quhjhcx_beforeSubmit()){
		return;
	}

	var usercenter = "";
	var yunsjhh = "";
	var yaohlh = "";
	var lingjbh = "";
	var gongysdm = "";
	var chengysdm = "";
	var chanx = "";
	var cangkbh = "";
	var cheph = "";
	var startdhsj = "";
	var enddhsj = "";
	var flag = "";
	
	var params = [];
	 usercenter = $('#layout_usercenter').fieldValue();
	 yunsjhh = $('#layout_yunsjhh').fieldValue();
	 yaohlh = $('#layout_yaohlh').fieldValue();
	 lingjbh = $('#layout_lingjbh').fieldValue();
	 gongysdm = $('#layout_gongysdm').fieldValue();
	 chengysdm = $('#layout_chengysdm').fieldValue();
	 chanx = $('#layout_chanx').fieldValue();
	 cangkbh = $('#layout_cangkbh').fieldValue();
	 cheph = $('#layout_cheph').fieldValue();
	 startdhsj = $('#layout_startdhsj').fieldValue();
	 enddhsj = $('#layout_enddhsj').fieldValue();
	 flag = $('#layout_flag').fieldValue();			 	 
	 
	 params.push('usercenter=' + usercenter);
	 params.push('yunsjhh=' + yunsjhh);
	 params.push('yaohlh=' + yaohlh);
	 params.push('lingjbh=' + lingjbh);
	 params.push('gongysdm=' + gongysdm);
	 params.push('chengysdm=' + chengysdm);
	 params.push('chanx=' + chanx);
	 params.push('cangkbh=' + cangkbh);
	 params.push('cheph=' + cheph);
	 params.push('startdhsj=' + startdhsj);
	 params.push('enddhsj=' + enddhsj);
	 params.push('flag=' + flag);
	 
	$.sdcui.ajaxUtil.ajax({
          url:"${ctx}/baob/expcheck.ajax",
          data:params.join('&'),
          success:function (result){
                if(result.errorMessage != null ){
                	alert(result.errorMessage);
                	return false;
                }
                func_grid_expxls(event);
         }
  });  
}

//导出数据
function func_grid_expxls(event) { 
	var usercenter = "";
	var yunsjhh = "";
	var yaohlh = "";
	var lingjbh = "";
	var gongysdm = "";
	var chengysdm = "";
	var chanx = "";
	var cangkbh = "";
	var cheph = "";
	var startdhsj = "";
	var enddhsj = "";
	var flag = "";
	
	 usercenter = $('#layout_usercenter').fieldValue();
	 yunsjhh = $('#layout_yunsjhh').fieldValue();
	 yaohlh = $('#layout_yaohlh').fieldValue();
	 lingjbh = $('#layout_lingjbh').fieldValue();
	 gongysdm = $('#layout_gongysdm').fieldValue();
	 chengysdm = $('#layout_chengysdm').fieldValue();
	 chanx = $('#layout_chanx').fieldValue();
	 cangkbh = $('#layout_cangkbh').fieldValue();
	 cheph = $('#layout_cheph').fieldValue();
	 startdhsj = $('#layout_startdhsj').fieldValue();
	 enddhsj = $('#layout_enddhsj').fieldValue();
	 flag = $('#layout_flag').fieldValue();
	 
	$.sdcui.pageUtils.goPage({
		url : '/baob/downloadQuhjh.do?usercenter=' + usercenter + '&yunsjhh=' + yunsjhh + '&yaohlh=' + yaohlh 
				+ '&lingjbh=' + lingjbh + '&gongysdm=' + gongysdm + '&chengysdm=' + chengysdm + '&chanx=' + chanx + '&cangkbh=' + cangkbh 
				+ '&cheph=' + cheph + '&startdhsj=' + startdhsj + '&enddhsj=' + enddhsj + '&flag=' + flag,//url
		mode : 'form',
		beforeSubmit : function() {
			return true;
		}
	});
	return false;   
}

</script>
</t:html>
