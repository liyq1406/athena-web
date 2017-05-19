<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="车位放空" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css">
		 .youi-fieldLayout table td.contral.label-col {     width: 125px; } 
		</style>
	</head>
	<t:page i18n="i18n.kac.kacckx">
		<t:grid id="grid_chew" caption="车位放空"  showNum="true"
		load="false" scrollHeight="350" src="/kac/queryChewyd.ajax"   dataFormId="form_yund"  showCheckbox="true"
		idKeys="usercenter,yundh,kach,zhuangt,liucbh,biaozsj" remove="NOT" back="NOT" add="NOT" edit="NOT"  pageSize="15">
			<t:fieldLayout  columns="3">
				<t:fieldText property="yundh" caption="运单号"   width="120"  ></t:fieldText>
				<!-- huxy_12941 -->
				<t:fieldText property="kach" caption="卡车号"  maxLength="8" width="120" ></t:fieldText>
				<t:fieldSelect property="zhuangt" caption="运单状态"   src="/kac/queryYundzt.ajax" 
				code="ZIDBM" show="ZIDMC"  width="120"></t:fieldSelect>
			</t:fieldLayout>
			<t:button caption="撤销" name="chex"></t:button>
			<t:gridCol property="usercenter"  caption="用户中心" width="60"></t:gridCol>
			<t:gridCol property="quybh" caption="区域编号" width="100"></t:gridCol>
			<t:gridCol property="daztbh" caption="大站台编号" width="100"></t:gridCol>
			<t:gridCol property="chewbh" caption="车位编号" width="100"></t:gridCol>
			<t:gridCol property="yundh" caption="运单号" width="150"></t:gridCol>
			<t:gridCol property="kach" caption="卡车号" width="150"></t:gridCol>
			<t:gridCol property="xiehxh" caption="卸货序号"  width="75"></t:gridCol>
			<t:gridCol property="zhuangtmc" caption="状态"   width="75"></t:gridCol>
			<t:gridCol property="liucmc" caption="流程操作" type="link"   width="75"></t:gridCol>
			<t:gridCol property="beiz" caption="报警" renderer="render"  width="75"></t:gridCol>
		</t:grid>
</t:page>
	
<script type="text/javascript">
    /*
	*撤销
	*/
	function func_button_chex(){
	    var params = [];
		var param = $('#grid_chew').grid('getSelectedRecords');//获取选中的车辆排队信息,仅可为一条
		var num=param.length;
		if(num == 0){
		   alert("请选中数据，进行撤销操作操作！");
			return false;
		}
		for(var i=0;i<num;i++){
		var zhuangt = param[i].zhuangt;
		if( 3!=zhuangt){
		  alert("只能对入厂状态的数据进行撤销操作！");
		  return false;
		}
	    params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].zhuangt",param[i].zhuangt));
	    params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].yundh",param[i].yundh));
        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].usercenter",param[i].usercenter));
        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].kach",param[i].kach));
        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].quybh",param[i].quybh));
        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].daztbh",param[i].daztbh));
        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].beiz",param[i].chewbh));
        }
		 $.sdcui.ajaxUtil.ajax({
             url:"../kac/yundChex.ajax",//请求url
             data:params.join('&'),//传递参数
            	success:function (result){//回调函数
            		alert(result.result);//弹出提示结果
            		$('#grid_chew').grid('reload');//刷新grid
            	
             }
     	});
	}
	/**
	*链接点击事件
	*/
	function link_liucmc(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement||event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_chew').grid('getRecord',rowDoc);//获取当前行对应的记录
		var param = [];
		param.push("yd.usercenter="+record.usercenter);
		param.push("yd.yundh="+record.yundh);
		param.push("yd.kach="+record.kach);
		param.push("yd.quybh="+record.quybh);
		param.push("yd.daztbh="+record.daztbh);
		param.push("yd.zhuangt="+record.liucbh);
		param.push("yd.beiz="+record.chewbh);
		param.push("yd.biaozsj="+record.biaozsj);
		var data = param.join('&');
		 $.sdcui.ajaxUtil.ajax({
             url:"../kac/liuccz.ajax",//请求url
             data:param.join('&'),//传递参数
            	success:function (result){//回调函数
            		alert(result.result);//弹出提示结果
            		$('#grid_chew').grid('reload');//刷新grid
             }
     	});

	}
  function render(col, value, rowIndex, colIndex) {
		var obj = this;
		var beiz = value["beiz"];
		if('1'==beiz){
		//$('.grid-table ').eq(3).find('tbody tr').eq(rowIndex).css('background','red');
 		return '<label  style="background-color:orange;" >准入超时</label>';
		}else if('2'==beiz){
		//$('.grid-table ').eq(3).find('tbody tr').eq(rowIndex).css('background','green');
		return '<label  style="background-color:red;" >放空超时</label>';
		}else{
			return '<label >正常</label>';
		}
	}

   
 
</script>
</t:html>