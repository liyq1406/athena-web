<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.yaohl_title}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css">
		 .youi-fieldLayout table td.contral.label-col {     width: 125px; } 
		</style>
	</head>
	<t:page i18n="i18n.kac.kacckx">
	<t:grid id="grid_yaohl" caption="要货令调整查询" dataFormId="form_yaohl"   src="/kac/queryYaohltqyw.ajax"  idKeys="usercenter" 
		back="NOT" load="false" showNum="true" add="NOT" edit="NOT" remove="NOT"  scrollHeight="350" pageSize="15"  >
		<t:form id="yhl" submit="NOT" reset="NOT">
		<t:fieldLayout id="yaohltzcx" prefix="yaohltz"  columns="4" >
            <t:fieldHidden property="usercenter" caption="用户中心" defaultValue="${usercenter}" /> 
			<t:fieldSelect property="quybh" caption="区域编号" parents="usercenter"  src="/kac/queryPostDengdqy.ajax" notNull="true" code="quybh" show="quybh" width="120"/>
			<t:fieldSelect property="daztbh" caption="大站台编号" parents="usercenter,quybh"  src="/kac/queryPostDazt.ajax" notNull="true" code="daztbh" show="daztbh"   width="120"/>
			<t:fieldCalendar property="tiaozkssj" defaultValue="${currDate1}"  caption="要货令时间区间" width="150" notNull="true" format="yyyy-MM-dd HH:mm:ss" ></t:fieldCalendar>
			<t:fieldCalendar property="tiaozjssj" defaultValue="${currDate}" caption="至" width="150" notNull="true" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldSelect property="xiehzt" caption="卸货站台" parents="usercenter,daztbh" parentsAlias="usercenter,daztbh"  src="/kac/xiehztList.ajax" itemText=" " itemValue=" "  code="XIEHZTBH" show="XIEHZTBH"  width="150"/>
			<t:fieldSelect property="xiehztbz" caption="卸货站台编组"  parents="usercenter" parentsAlias="usercenter"  src="/kac/xiehztbz.ajax" itemText=" " itemValue=" "  code="XIEHZTBZH" show="XIEHZTBZH"  width="150"/>
			<t:fieldSelect property="yaohlzt" convert="yaohlzt" caption="要货令状态" width="100"></t:fieldSelect>
			<t:fieldSelect property="yaohllx" convert="queryWghms" caption="供货模式" width="100"></t:fieldSelect>
			<t:fieldText property="chengysbh" caption="承运商编号" width="150"/>
		</t:fieldLayout>
		</t:form>
		<t:gridCol property="usercenter" caption="用户中心" ></t:gridCol>
		<t:gridCol property="yaohlh" caption="要货令号"></t:gridCol>
		<t:gridCol property="lingjbh" caption="零件编号"></t:gridCol>
		<t:gridCol property="xiehd" caption="卸货点"></t:gridCol>
		<t:gridCol width="150" property="zuizsj"  caption="最早交付时间"></t:gridCol>
		<t:gridCol width="150" property="zuiwsj" caption="最晚交付时间"></t:gridCol>
		<t:gridCol width="150" property="faysj" caption="预计发运时间"></t:gridCol>
		<t:gridCol width="80" property="yaohllx" caption="供货模式"></t:gridCol>
		<t:gridCol width="80" property="yaohlzt" convert="yaohlzt" caption="要货令状态"></t:gridCol>
		<t:gridCol width="80" property="cangkbh" caption="仓库"></t:gridCol>
		<t:gridCol width="80" property="chengysdm" caption="承运商代码"></t:gridCol>
		<t:gridCol width="80" property="mudd" caption="目的地"></t:gridCol>
	</t:grid>
	<t:fieldLayout  columns="2">
	调整时间<input id="tiaozsj" width="200"  maxlength="4" onblur="isNumber()"  > (小时)
   <button  name="button_sub"  id="button_sub" onclick="button_sub()">提交</button>
   </t:fieldLayout>
</t:page>

<script type="text/javascript">
 function isNumber(){
  var tiaozsj = $('#tiaozsj').val();
     re=/^-?[0-9]+([.]{1}[0-9]+){0,1}$/;
	 if (!re.test(tiaozsj)){
	    $('#tiaozsj').val('');
		 alert("调整时间必须输入整数或小数!");
	 }
	}
	function grid_yaohl_beforeSubmit() {
		var t1 = $("#yaohltz_tiaozkssj").fieldValue();	//要货令调整开始时间
		var t2 = $("#yaohltz_tiaozjssj").fieldValue();	//要货令调整结束时间
		var d1 = new Date(t1.replace(/\-/g,"\/"));
		var d2 = new Date(t2.replace(/\-/g,"\/"));
		
		if(""==t1||""==t2){
			alert("要货令时间区间不能为空！");
			return false;
		}else if(d2<d1){
		   alert("开始时间不能大于结束时间！");
			return false;
		}else if(d2-d1>7*24*60*60*1000){
		    alert("时间区间不能大于7天！");
		    return false;
		}
	}
	//提交事件
	   function button_sub(){
	   grid_yaohl_beforeSubmit();
	   isNumber();
	   if(!$('#yhl').form('validate')){
			var errorMessage = [];
			$('#yhl').find('.youi-field.validating,.youi-field.validate-error').each(function(){
			  if(this.title)errorMessage.push(this.title);
			});
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
			}
	   var tiaozsj = $('#tiaozsj').val();
	   var params=[];
	   var param1 = $("#yhl").form('getFormRecord'); 
	    params.push('daztbh='+param1.daztbh);
	    var xiehzt=param1.xiehzt;
		if(xiehzt == null|| xiehzt == 'undefined'){
			 xiehzt = '';
		 }
		 params.push('xiehzt='+xiehzt);
		 var xiehztbz=param1.xiehztbz;
		 if(xiehztbz == null|| xiehztbz == 'undefined'){
			xiehztbz = '';
		 }
		 params.push('xiehztbz='+xiehztbz); 
		 params.push('tiaozkssj='+param1.tiaozkssj);
		 params.push('tiaozjssj='+param1.tiaozjssj);
		 var chengysbh=param1.chengysbh;
		 if(chengysbh == null|| chengysbh == 'undefined'){
			 chengysbh = '';
		 }
		 params.push('chengysbh='+chengysbh);
		 var yaohllx=param1.yaohllx;
		 if(yaohllx == null|| yaohllx == 'undefined'){
			 yaohllx = '';
		 }
		 params.push('yaohllx='+yaohllx);
		 var yaohlzt=param1.yaohlzt;
		 if(yaohlzt == null|| yaohlzt == 'undefined'){
			 yaohlzt = '';
		 }
		 params.push('yaohlzt='+yaohlzt);
		 params.push('usercenter='+param1.usercenter);
		params.push('tiaozsj='+tiaozsj);
		 $.sdcui.ajaxUtil.ajax({
	         url:"../kac/yaohltzcz.ajax",//请求url
	         data:params.join('&'),//传递参数
	        	success:function (result){//回调函数
	        		alert(result.result);//弹出提示结果
	        		$('#grid_yaohl').grid('reload');//刷新grid
	        		$('#tiaozsj').val('');
	         }
	 	});
	   }
	 //要货令状态
	$.sdcui.serverConfig.convertArray['yaohlzt'] = {
		'01' : '表达',
		'02' : '在途',
	};
</script>

</t:html>
 
