<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.yhlwbtitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	
</script>
</head>
<t:page i18n="i18n.xqjs.kanbyhl.kanbjs">
	<t:grid id="Yaohl" caption="CD/MD上线全程跟踪" showNum="true" scrollHeight="250" 
		src="/yaohl/queryYaohlOfCdmd.ajax" add="NOT" edit="NOT" remove="NOT" load="false"
		idKeys="yaohlh">
		<t:fieldLayout id="yaohl" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true" width="100"></t:fieldSelect>
			<t:fieldSelect property="yaohllx" convert="selectYaohllx" caption="要货令类型"  notNull="true" width="100"></t:fieldSelect>
			<t:fieldText property="lingjbh" maxLength="10" caption="零件编号" width="100"></t:fieldText>
			<t:fieldText property="mudd" maxLength="9" dataType="text" caption="消耗点" width="100"></t:fieldText>
			<t:fieldText property="qiandYaohlh" maxLength="12" caption="前段要货令" width="100"></t:fieldText>
			<t:fieldSelect property="qiandYaohlzt" caption="前段状态" parents="yaohllx" parentsAlias="yaohllxParams"  src="/yaohl/selectQdYhlzt.ajax"  show="YAOHLMC" code="YAOHLLX"  width="100"></t:fieldSelect>
			<t:fieldText property="houdYaohlh" maxLength="12" caption="后段要货令" width="100"></t:fieldText>
			<t:fieldSelect property="houdYaohlzt" caption="后段状态" convert="selectHdYhlzt" width="100"></t:fieldSelect>
			<t:fieldText property="gongysdm" maxLength="10" caption="${i18n.gongysdm}" width="100"></t:fieldText>
			<t:fieldText property="chengysdm"  caption="${i18n.chengysdm}" width="100"></t:fieldText>
			<t:fieldText property="xiaohch"  caption="小火车号"  width="100"></t:fieldText>
			<t:fieldText property="tangc" caption="小火车趟次" width="100" maxLength="5"></t:fieldText>
			<t:fieldSelect property="shij" caption="时间" convert="selectYhlsj"  notNull="true"   width="140"></t:fieldSelect>
			<t:fieldCalendar property="qissj" caption="时间范围" format="yyyy-MM-dd HH:mm:ss"  notNull="true" width="146"></t:fieldCalendar>
			<t:fieldCalendar property="jiessj" format="yyyy-MM-dd HH:mm:ss" caption="至"  notNull="true" width="146"></t:fieldCalendar>
			<t:fieldText property="chanx" maxLength="5" caption="产线" width="100"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol width="100" property="qiandYaohlh" caption="前段要货令号"></t:gridCol>
		<t:gridCol width="100" property="qiandYaohlhzt" caption="前段要货令状态" convert="qiandYaohlhzt"></t:gridCol>
		<t:gridCol width="100" property="houdYaohlh" caption="后段要货令号"></t:gridCol>
		<t:gridCol width="100" property="houdYaohlhzt" caption="后段要货令状态" convert="houdYaohlhzt"></t:gridCol>
		<t:gridCol width="50" property="chanx" caption="产线"></t:gridCol>
		<t:gridCol width="80" property="mudd" caption="消耗点"></t:gridCol>
		<t:gridCol width="80" property="lingjbh" caption="零件编号"></t:gridCol>
		<t:gridCol width="80" property="lingjmc" caption="零件名称"></t:gridCol>
		<t:gridCol width="60" property="baozxh" caption="包装类型"></t:gridCol>
		<t:gridCol width="60" property="yaohsl" caption="要货数量"></t:gridCol>
		<t:gridCol width="100" property="qiandJiaofsl" caption="前段交付数量"></t:gridCol>
		<t:gridCol property="dingdh" caption="订单号"></t:gridCol>
		<t:gridCol width="80" property="gongysdm" caption="供应商代码"></t:gridCol>
		<t:gridCol width="80" property="chengysdm" caption="承运商代码"></t:gridCol>
		<t:gridCol property="dinghCangkbh" caption="订货仓库"></t:gridCol>
		<t:gridCol property="dinghZick" caption="订货子仓库"></t:gridCol>
		<t:gridCol width="60" property="xianbCangkbh" caption="线边仓库"></t:gridCol>
		<t:gridCol width="80" property="xianbZick" caption="线边子仓库"></t:gridCol>
		<t:gridCol width="130" property="yaohlbdsj" caption="要货令表达时间"></t:gridCol>
		<t:gridCol width="130" property="qiandYjjfsj" caption="前段预计交付时间"></t:gridCol>
		<t:gridCol width="130" property="qiandSjjfsj" caption="前段实际交付时间"></t:gridCol>
		<t:gridCol width="100" property="qiandDdzt" caption="前段到达状态" convert="qiandDdzt"></t:gridCol>
		<t:gridCol width="60" property="xiaohch" caption="小火车号"></t:gridCol>
		<t:gridCol width="80" property="tangc" caption="小火车趟次"></t:gridCol>
		<t:gridCol width="80" property="chex" caption="小火车车厢"></t:gridCol>
		<t:gridCol width="130" property="xiaohcBhsj" caption="小火车备货时间"></t:gridCol>
		<t:gridCol width="130" property="xiaohcYjsxsj" caption="小火车预计上线时间"></t:gridCol>
		<t:gridCol width="130" property="xiaohcSjsxsj" caption="小火车实际上线时间"></t:gridCol>
		<t:gridCol width="20" property="11" caption=""></t:gridCol>
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
$(function(){
	var htmls =[];
	htmls.push($('#ck_dataItems_selectedValues').html());
	$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
	 $('#ck_dataItems_selectedValues').empty();
	$('#button_expxls').click(func_grid_expcheck);
});

function func_grid_expcheck(event){

	var usercenter="";
	var yaohllx="";
	var lingjbh = "";
	var mudd = "";
	var qiandYaohlh="";
	var qiandYaohlzt = "";
	var houdYaohlh = "";
	var houdYaohlzt = "";
	var gongysdm = "";
	var chengysdm = "";
	var xiaohch = "";
	var tangc = "";
	var shij = "";
	var qissj = "";
	var jiessj = "";
	var chanx = "";
	
	var params = [];
	 usercenter = $('#layout_usercenter').fieldValue();
	 yaohllx = $('#layout_yaohllx').fieldValue();
	 lingjbh = $('#layout_lingjbh').fieldValue();
	 mudd = $('#layout_mudd').fieldValue();
	 qiandYaohlh = $('#layout_qiandYaohlh').fieldValue();
	 qiandYaohlzt = $('#layout_qiandYaohlzt').fieldValue();
	 houdYaohlh = $('#layout_houdYaohlh').fieldValue();
	 houdYaohlzt = $('#layout_houdYaohlzt').fieldValue();
	 gongysdm = $('#layout_gongysdm').fieldValue();
	 chengysdm = $('#layout_chengysdm').fieldValue();
	 xiaohch = $('#layout_xiaohch').fieldValue();
	 tangc = $('#layout_tangc').fieldValue();
	 shij = $('#layout_shij').fieldValue();
	 qissj = $('#layout_qissj').fieldValue();
	 jiessj = $('#layout_jiessj').fieldValue();	
	 chanx = $('#layout_chanx').fieldValue();	
	 
	 if(usercenter == null || usercenter == ""){
		 alert("【用户中心】不能为空");
		 return false
	 }else if(yaohllx == null || yaohllx == ""){
		 alert("【要货令类型】不能为空");
		 return false
	 }else if(shij == null || shij == ""){
		 alert("【时间】不能为空");
		 return false
	 }else if(qissj == null || qissj == ""){
		 alert("【开始时间】不能为空");
		 return false
	 }else if(jiessj == null || jiessj == ""){
		 alert("【结束时间】不能为空");
		 return false
	 }
	if(!Yaohl_beforeSubmit()){
		return false;
	}
	 
	 params.push('usercenter=' + usercenter);
	 params.push('yaohllx=' + yaohllx);
	 params.push('lingjbh=' + lingjbh);
	 params.push('mudd=' + mudd);
	 params.push('qiandYaohlh=' + qiandYaohlh);
	 params.push('qiandYaohlzt=' + qiandYaohlzt);
	 params.push('houdYaohlh=' + houdYaohlh);
	 params.push('houdYaohlzt=' + houdYaohlzt);
	 params.push('gongysdm=' + gongysdm);
	 params.push('chengysdm=' + chengysdm);
	 params.push('xiaohch=' + xiaohch);
	 params.push('tangc=' + tangc);
	 params.push('shij=' + shij);
	 params.push('qissj=' + qissj);
	 params.push('jiessj=' + jiessj);
	 params.push('chanx=' + chanx);
	 
	$.sdcui.ajaxUtil.ajax({
          url:"${ctx}/yaohl/expcheck.ajax",
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


function func_grid_expxls(event) { 
	var usercenter="";
	var yaohllx="";
	var lingjbh = "";
	var mudd = "";
	var qiandYaohlh="";
	var qiandYaohlzt = "";
	var houdYaohlh = "";
	var houdYaohlzt = "";
	var gongysdm = "";
	var chengysdm = "";
	var xiaohch = "";
	var tangc = "";
	var shij = "";
	var qissj = "";
	var jiessj = "";
	var chanx = "";
	
	 usercenter = $('#layout_usercenter').fieldValue();
	 yaohllx = $('#layout_yaohllx').fieldValue();
	 lingjbh = $('#layout_lingjbh').fieldValue();
	 mudd = $('#layout_mudd').fieldValue();
	 qiandYaohlh = $('#layout_qiandYaohlh').fieldValue();
	 qiandYaohlzt = $('#layout_qiandYaohlzt').fieldValue();
	 houdYaohlh = $('#layout_houdYaohlh').fieldValue();
	 houdYaohlzt = $('#layout_houdYaohlzt').fieldValue();
	 gongysdm = $('#layout_gongysdm').fieldValue();
	 chengysdm = $('#layout_chengysdm').fieldValue();
	 xiaohch = $('#layout_xiaohch').fieldValue();
	 tangc = $('#layout_tangc').fieldValue();
	 shij = $('#layout_shij').fieldValue();
	 qissj = $('#layout_qissj').fieldValue();
	 jiessj = $('#layout_jiessj').fieldValue();
	 chanx = $('#layout_chanx').fieldValue();
	 
	$.sdcui.pageUtils.goPage({
		url : '/yaohl/downLoadFileYhlCDMD.do?usercenter=' + usercenter
				+ '&yaohllx=' + yaohllx + '&lingjbh=' + lingjbh + '&mudd='
				+ mudd + '&qiandYaohlh=' + qiandYaohlh +'&qiandYaohlzt='+qiandYaohlzt+'&houdYaohlh='+houdYaohlh+'&houdYaohlzt='+houdYaohlzt+'&gongysdm='+gongysdm+'&chengysdm='
				+chengysdm+'&xiaohch='+xiaohch+'&tangc='+tangc+'&shij='+shij+'&qissj='+qissj+'&jiessj='+jiessj+'&chanx='+chanx,//url
		mode : 'form',
		beforeSubmit : function() {
			//
			return true;
		}
	});
	return false;


   
}


	$.sdcui.serverConfig.convertArray['selectYaohllx'] = {'CD':'CD','MD':'MD'};
	$.sdcui.serverConfig.convertArray['selectYhlsj'] = {
		'0' : '要货令表达时间',
		'1' : '前段预计交付时间',
		'2' : '前段实际交付时间',
		'3' : '小火车备货时间',
		'4' : '小火车预计上线时间',
		'5' : '后段实际交付时间'
	};
	
	$.sdcui.serverConfig.convertArray['selectHdYhlzt'] = {
		'01' : '表达',
		'04' : '延误',
		'00' : '已交付'
	};

	$.sdcui.serverConfig.convertArray['qiandDdzt'] = {
			'0' : '延迟',
			'1' : '提前',
			'2' : '正常'
	};
	
	$.sdcui.serverConfig.convertArray['qiandYaohlhzt'] = {
			'00' : '${i18n.yjf}',
			'01' : '${i18n.bd}',
			'02' : '${i18n.zait}',
			'03' : '${i18n.ddjf}',
			'04' : '${i18n.ycjf}',
			'05' : '${i18n.yzz}',
			'06' : '未发送',
			'08' : '冻结',
			'09' : '创建'
		};	
	$.sdcui.serverConfig.convertArray['houdYaohlhzt'] = {
			'00' : '${i18n.yjf}',
			'01' : '${i18n.bd}',
			'02' : '${i18n.zait}',
			'03' : '${i18n.ddjf}',
			'04' : '${i18n.ycjf}',
			'05' : '${i18n.yzz}',
			'06' : '未发送',
			'08' : '冻结',
			'09' : '创建'
		};
	function Yaohl_beforeSubmit() {
		//验证打印开始日期必须小于打印结束日期 hzg 2014.11.3 
		if ($("#layout_qissj").fieldValue()!="" && $("#layout_jiessj").fieldValue()!=""){
			var qissj =new Date(($("#layout_qissj").fieldValue()).replace(/-/g,"/")); //起始日期 （将格式2014-10-12转换成2014/10/12）
			var jessj =new Date(($("#layout_jiessj").fieldValue()).replace(/-/g,"/"));//结束日期（将格式2014-10-22转换成2014/10/22）
			var qissjValue = qissj.valueOf(); //valueOf()将日期换算为秒级
			var _qssjAdd = new Date(qissjValue + 7*24*60*60*1000); //一周时间（选择时间往后推7天）
			//alert("qissj-->"+qissj+"jessj-->"+jessj+"qissjValue-->"+qissjValue+"_qssjAdd-->"+_qssjAdd);
			if(qissj > jessj){
				alert("起始时间不能大于结束时间");
				return false;
			}
			if(jessj > _qssjAdd){
				alert("时间范围必须在一周以内");
				return false;
			}
		}
		return true;
	}
	
	function callback(msg) 
	{
		alert(msg);
	}		
</script>
<style type="text/css">
#yaohl td.contral.label-col.col-6 {
	width: 65px;
}

#yaohl td.contral.label-col.col-0 {
	width: 70px;
}

#yaohl td.contral.label-col.col-2 {
	width: 65px;
}

#yaohl td.contral.label-col.col-4 {
	width: 65px;
}
</style>
</t:html>
