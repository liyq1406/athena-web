<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.truck.entity.Chelpd" %>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=100">  -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/decorators/athena/main.css"></link>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
//显示时间
function showLocale(objD)   
{   
    var str,colorhead,colorfoot;   
    var yy = objD.getYear();   
        if(yy<1900) yy = yy+1900;   
    var MM = objD.getMonth()+1;   
        if(MM<10) MM = '0' + MM;   
    var dd = objD.getDate();   
        if(dd<10) dd = '0' + dd;   
    var hh = objD.getHours();   
        if(hh<10) hh = '0' + hh;   
    var mm = objD.getMinutes();   
        if(mm<10) mm = '0' + mm;   
    var ss = objD.getSeconds();   
        if(ss<10) ss = '0' + ss;   
    var ww = objD.getDay();   
        if ( ww==0 ) colorhead="<font color=\"white\">";   
        if ( ww > 0 && ww < 6 ) colorhead="<font color=\"white\">";   
        if ( ww==6 ) colorhead="<font color=\"white\">";   
        if (ww==0) ww="星期日";   
        if (ww==1) ww="星期一";   
        if (ww==2) ww="星期二";   
        if (ww==3) ww="星期三";   
        if (ww==4) ww="星期四";   
        if (ww==5) ww="星期五";   
        if (ww==6) ww="星期六";   
        colorfoot="</font>"  
            str = colorhead + yy + "年" + MM + "月" + dd + "日" + hh + ":" + mm + ":" + ss + " " + ww + colorfoot;   
        return(str);   
}   
//刷新时间
function tick()   
{   
    var today;   
    today = new Date();   
    document.getElementById("localtime").innerHTML = showLocale(today);   
    window.setTimeout("tick()", 1000);   
}   
</script>
<style>
.row{
	border:2px solid white;
	border-top: 0px solid white;
	border-left: 0px solid white;
	padding-top: 0px;
}
.row_info{
	border:2px solid white;
	border-top: 0px solid white;
	border-left: 0px solid white;
}
.row_div{
	float:left;
	overflow: hidden;
}
.count1_status{
	font-size: 35;
}
.count1_time{
	font-size: 25;
}
.count1_number{
	font-size: 70;
}
.count2_status{
	font-size: 35;
}
.count2_time{
	font-size: 25;
}
.count2_number{
	font-size: 70;
}
.count3_status{
	font-size: 35;
}
.count3_time{
	font-size: 25;
}
.count3_number{
	font-size: 70;
}
.count4_status{
	font-size: 30;
}
.count4_time{
	font-size: 20;
}
.count4_number{
	font-size: 60;
}
.count5_status{
	font-size: 25;
}
.count5_time{
	font-size: 16;
}
.count5_number{
	font-size: 60;
}
</style>
</head>
<body style="text-align:center;background-color: black;margin-left: 0px;">
<div id="logo" style="width:100%;height:9%;">
	<table class="header-logo-bg" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td class="header-inner-left"><div class="header-div"></div></td>
				<td class="header-content"> </td>
				<td class="header-inner-right" >
				<div class="header-div"> </div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div id="head"  style="height:50px; line-height:50px; border: 2px solid white;">
	<c:choose>
		<c:when test="${fn:length(result) == 1}">
			<div id="info" style="height:100%;width:66.6%;float: left;">
				<div class="row_div" >
					<label style="color:white;font-size:28;font-family:楷体;float:left;padding-left: 50px;">&nbsp;物流火车编号</label>
				</div>
				<div style="padding-left: 200px;" class="row_div">
					<label style="color:red;font-size:28;font-family:楷体;align:right;">${result[0].shengcxbh}</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<label style="color:red;font-size:28;font-family:楷体;align:right;">${result[0].xiaohcbh}</label>
				</div>
			</div>
			<div id="tit2" style="width:33.3%;height:100%;float:right;">
				<div >
				  <font style="font-size: 28;color: white;" ><span id="localtime"  ></span><script language="javascript"> tick();</script> </font>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="xiaohc" items="${result}">
				<div style="height:100%;width:${100/fn:length(result) - 0.01}%;float: left;">
					<div style="padding-left : 10px;border-right: 2px solid white;height: 100%;">
							<label style="color:red;font-size:28;font-family:楷体;align:right;">${xiaohc.shengcxbh}</label>
						&nbsp;&nbsp;&nbsp;&nbsp;
							<label style="color:red;font-size:28;font-family:楷体;align:right;">${xiaohc.xiaohcbh}</label>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<div id="content" style="width:100%;height:auto;">
<c:forEach var="xiaohc" items="${result}" varStatus="status">

  <div style="width:${100/fn:length(result) == 100 ? 49.9 : 100/fn:length(result) - 0.01}%;float:left;">

 	 <div class="row" style="height: 135px;color:white;margin-top: 0px;">
	     <div style="width:30%;height: 120px;" class="row_div">
	     	<div id="riq_curr${status.index}"></div>
	     	<span id="tangc_curr${status.index}" style="font-size: 75;font-family: arial;"></span>
		 </div>
		 <div style="width:35%;height: 120px;line-height: 105px;text-align: left;"  class="row_div">
		 	<span id="beihsj_curr${status.index}" class="time" style="white-space: nowrap;"></span>
		 </div>
		 <div style="width:34.9%;height: 120px;line-height: 105px;"  class="row_div">
			<span class="status"> 应备货</span>
		 </div>
 	 </div>
 	 <div class="row" style="height: 230px;color:white;">
	     <div style="width:30%;height: 180px;"  class="row_div">
	     	<div id="riq1_curr${status.index}"></div>
	     	<span id="tangc1_curr${status.index}" style="font-size: 75;color:#EE1111;font-family: arial;"></span>
		 </div>
		 <div style="width:35%;height: 100px;line-height: 100px;text-align: left;"  class="row_div">
		 	<span id="beihsj1_curr${status.index}" class="time" style="white-space: nowrap;"> </span>
		 </div>
		 <div style="width:34.9%;height: 100px;line-height: 100px;" class="row_div">
			<span class="status"> 待发货</span>
		 </div>
		 <div id="div_max${status.index}" style="width:40%;height: 100px; line-height:100px; background-color: #22AA22;border:1px solid white;text-align: left;"  class="row_div">
			<span id="max${status.index}" class="number" style="color: white;font-family: arial;"></span>
		 </div>
 	 </div>
 	 <div class="row" style="height: 130px;color:white;">
	     <div style="width:30%;height: 125px;"  class="row_div">
	     	<div id="riq_prev${status.index}"></div>
	     	<span id="tangc_prev${status.index}" style="font-size: 75;color: #389EB7;font-family: arial;"></span>
		 </div>
		 <div style="width:35%;height: 125px;padding-top:10px;text-align: left;"  class="row_div">
		 	<div id="beihsj_prev${status.index}" class="time" style="white-space: nowrap;padding-top:10px;"> </div>
		 	<div id="tuijsxsj_prev${status.index}" class="time" style="color: #389EB7;white-space: nowrap;padding-top:10px;overflow: visible;"> </div>
		 </div>
		 <div style="width:34.9%;height: 110px;line-height: 105px;"  class="row_div">
			<span class="status"> 已发货</span>
		 </div>
 	 </div>
 </div>	 
</c:forEach>
 
<c:if test="${fn:length(result) == 1}">
<div style="width:50%;float:right;color:white;">
	 <div class="row_info" style="height: 135px;">
	     <div style="width:49%;height: 120px;padding-top: 15px;" class="row_div">
	     	<form>
	     		<fieldset style="text-align: left">
					<legend><span style="color:white;">火车发运数量</span></legend>
					<table width="100%" style="color:white;">
						<tr>
							<td>发运提前量</td>
							<td id="faytql"></td>
						</tr>
						<tr>
							<td>发运覆盖数</td>
							<td id="fayfgs"></td>
						</tr>
						<tr>
							<td>EMON</td>
							<td id="emon"></td>
						</tr>
					</table>
	     		</fieldset>
	     	</form>
		 </div>
		 <div id="pdtitle" style="width:49%;height: 120px;padding-top: 15px;" class="row_div">
	     	<form>
	     		<fieldset style="text-align: left">
					<legend><span style="color:white;">SPPV过点数量</span></legend>
					<table width="100%" style="color:white;">
						<tr>
							<td>跟踪物理点</td>
							<td id="genzwld"></td>
						</tr>
						<tr>
							<td>工作日</td>
							<td id="gongzr"></td>
						</tr>
						<tr>
							<td>SMON</td>
							<td id="smon"></td>
						</tr>
					</table>
	     		</fieldset>
	     	</form>
		 </div>
 	 </div>
 	 <div class="row_info" style="height: 230px;overflow-y:scroll;">
	     <div style="width:100%;"  class="row_div" >
	     	<table width="100%" id="yibhxhcmb" style="padding:5px;">
				<tr bgcolor="#777777">
					<td width="10%" align="center" style="color:white;">产线</td>
					<td width="10%" align="center" style="color:white;">编号</td>
					<td width="10%" align="center" style="color:white;">趟次</td>
					<td width="25%" align="center" style="color:white;">备货时间</td>
					<td width="25%" align="center" style="color:white;">上线推荐时间</td>
					<td width="20%" align="center" style="color:white;">EMON上线顺序</td>
				</tr>
			</table>
	     </div>
 	 </div>
 	 <div class="row_info" style="height: 130px;">
	     <div id="pdtitle" style="height: 50px;">
	     	<span style="font-size: 30;">系统推荐发货时间</span>
		 </div>
		 <div id="pdxx" style="height: 30px;">
		 	<span id="tuijfhsj" style="font-size: 18;color: red;"> </span>
		 </div>
		 <div id="pdxx" style="height: 40px;">
			<span id="tuijfhtc" style="font-size: 30"> </span>
		 </div>
 	 </div>    	
</div>
</c:if>
</div>

<div style="display: none;" id="xiaohcs">
	<input type="hidden" id="aheadValue" value="${tiql}">
		<c:forEach var="xiaohc" items="${result}" varStatus="status">  
			<div id="xiaohc${status.index}">
				<input type="hidden" name="usercenter" value="${xiaohc.usercenter}">
				<input type="hidden" name="shengcxbh" value="${xiaohc.shengcxbh}">
				<input type="hidden" name="xiaohcbh" value="${xiaohc.xiaohcbh}">
			</div>
    	</c:forEach>  
</div>


</body>
<script type="text/javascript">
	
	//小火车数据
	var params = [];
	
	$(function(){
		//根据小火车数量调整样式
		adjustClass();
		//初始化小火车数据
		initParams();
		//刷新数据
		refreshData();
		//1分钟定时刷新小火车数据
		setInterval("refreshData()", 60000);
	});
	
	
	//初始化参数
	function initParams(){
		var aheadValue = $('#aheadValue').val();
		var xiaohcList = $('#xiaohcs').children('div');
		if(xiaohcList.length < 1 || xiaohcList.length > 5){
			alert('小火车数量必须处于1-5之间');
			window.location.href = "${ctx}/xuqjs/xiaohcsxzd.do";
		}
		params.push("tiql="+aheadValue);
		$.each(xiaohcList, function(i,xiaohc){
			params.push("list["+i+"].usercenter="+$('#'+xiaohc.id).children('input[name=usercenter]').first().val());
			params.push("list["+i+"].shengcxbh="+$('#'+xiaohc.id).children('input[name=shengcxbh]').first().val());
			params.push("list["+i+"].xiaohcbh="+$('#'+xiaohc.id).children('input[name=xiaohcbh]').first().val());
		});  
	}
	
	//刷新数据
	function refreshData(){
		$.ajax({
            url: '/athena/xuqjs/monitorXiaohc.ajax',
            type: 'POST',
            data:params.join('&'),
            dataType: 'json',
            cache:false,
            success: function (result){
            	if(result.success && result.success == false){
            		//失败，弹出错误信息
            		alert(result.message);
            	}else{
            		//成功，解析数据
            		praseData(result.result);
            	}
           	}
    	});
	}
	
	//解析数据
	function praseData(objList){
		var aheadValue = parseInt($('#aheadValue').val());	//提前量
		//刷新小火车概况 
       	$.each(objList, function(i, obj){
       		var xiaohc = obj.xiaohc;	//小火车 
       		var xiaohcmb = obj.xiaohcmb;	//小火车模板
       		var xiaohcmbYbh = obj.xiaohcmbYbh //应备货
       		if(xiaohcmbYbh){
       			$('#riq_curr'+i).html(xiaohcmbYbh.xiaohcrq);	//应备货-当前小火车日期
       			$('#tangc_curr'+i).html(xiaohcmbYbh.tangc);	//应备货-当前小火车趟次
       			$('#beihsj_curr'+i).html(xiaohcmbYbh.beihsj.substring(5,16));	//应备货-当前小火车备货时间
       		}
       		if(xiaohcmb){	       		
	       		$('#riq1_curr'+i).html(xiaohcmb.xiaohcrq);	//待发货-当前小火车日期	       		
	       		$('#tangc1_curr'+i).html(xiaohcmb.tangc);	//待发货-当前小火车趟次	       		
	       		$('#beihsj1_curr'+i).html(xiaohcmb.beihsj.substring(5,16));	//待发货-当前小火车备货时间
       		}
       		var max = obj.max;	//实际EMON - 火车模板EMON, 实际SMON - 火车模板SMON的最大值
       		if(max){
	       		$('#max'+i).html('&nbsp;'+max);
	       		if(max >= (0 - aheadValue)){	//大于或等于0-提前量，显示绿色 MANTIS:0012964 20161130 by CSY 
	       			$('#div_max'+i).css('background-color','#22AA22');
	       		}else{	//否则，显示红色
	       			$('#div_max'+i).css('background-color','#EE1111');
	       		}
       		}
       		var xiaohcmbSc = obj.xiaohcmbSc;	//上次小火车模板
       		if(xiaohcmbSc){
	       		$('#riq_prev'+i).html(xiaohcmbSc.xiaohcrq);	//已发货-上个小火车日期
	       		$('#tangc_prev'+i).html(xiaohcmbSc.tangc);	//已发货-上个小火车趟次
	       		$('#beihsj_prev'+i).text(xiaohcmbSc.beihsj.substring(5,16));	//已发货-上个小火车备货时间
	       		$('#tuijsxsj_prev'+i).text(xiaohcmbSc.beiz3.substring(5,16));	//已发货-上个小火车推荐上线时间
       		}
       	});
       	//刷新小火车详情
		if(objList.length == 1){	//只有一个小火车时
			var obj = objList[0];
			var xiaohc = obj.xiaohc;	//小火车
       		$('#faytql').html(xiaohc.pianycws);	//发运提前量=小火车偏移车位数
       		$('#fayfgs').html(xiaohc.xunhcss);	//发运覆盖数=小火车循环车身数
       		$('#genzwld').html(xiaohc.shengcxbh);	//跟踪物理点=小火车生产线编号
       		var emon = obj.emon;	//emon
       		if(emon){
	       		$('#emon').html(emon);
       		}
       		var smon = obj.smon;	//smon
       		if(smon){
	       		$('#smon').html(smon);
       		}
       		var xiaohcmb = obj.xiaohcmb;	//小火车模板
       		if(xiaohcmb){
       			$('#gongzr').html(xiaohcmb.xiaohcrq);	//工作日=小火车日期
       			$('#tuijfhsj').text(xiaohcmb.beiz3);	//推荐发货时间=小火车推荐上线时间
	       		$('#tuijfhtc').text(xiaohcmb.tangc);	//推荐发货趟次=小火车趟次
       		}
       		var max = obj.max;	//实际EMON - 火车模板EMON, 实际SMON - 火车模板SMON的最大值
       		if(max){
	       		if(max > (0 - aheadValue)){	//大于0-提前量，显示推荐发货时间
	       			$('#tuijfhsj').show();
	       		}else{	//否则，隐藏推荐发货时间
	       			$('#tuijfhsj').hide();
	       		}
       		}
       		var yibhXiaohcmbList = obj.yibhXiaohcmbList;	//已备货小火车模板
       		if(yibhXiaohcmbList){
	       		$('#yibhxhcmb').find('tr[bgcolor="#555555"]').remove();	//移除原有的已备货小火车模板
	       		$.each(yibhXiaohcmbList, function(i, yibhxhcmb){
	       			$('#yibhxhcmb').append([
	       			    '<tr bgcolor="#555555">',                    
	       			 	'<td align="center" style="color:white;">'+yibhxhcmb.chanx+'</td>',
		       			'<td align="center" style="color:white;">'+yibhxhcmb.xiaohcbh+'</td>',
		       			'<td align="center" style="color:white;">'+yibhxhcmb.tangc+'</td>',
		       			'<td align="center" style="color:white;">'+yibhxhcmb.beihsj+'</td>',
		       			'<td align="center" style="color:white;">'+yibhxhcmb.beiz3+'</td>',
		       			'<td align="center" style="color:white;">'+yibhxhcmb.emonsxlsh+'</td>',
		       			'</tr>'
	       			].join(''));
	       		});
       		}
        }
	}
	
	//调整样式
	function adjustClass(){
		//小火车数量
		var length = $('#xiaohcs').children('div').length;
		$('.status').addClass('count'+length+'_status');
		$('.time').addClass('count'+length+'_time');
		$('.number').addClass('count'+length+'_number');
		
		$('#content>div:first>div').css('border-left', '2px solid white');
		if(length >= 2){
			$('#head>div:last>div').css('border-right','');
		}
	}
	
</script>
</html>