<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.athena.truck.entity.Chelpd" %>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=100">  -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/decorators/athena/main.css"></link>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
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
function tick()   
{   
    var today;   
    today = new Date();   
    document.getElementById("localtime").innerHTML = showLocale(today);   
    window.setTimeout("tick()", 1000);   
}   
</script>
<style>
 .tab{color:red;
     font-size:27;
     font-family:楷体;
     align-text:center;
     width:100%;
    }
 .tab1{
     color:green;
     font-size:27;
     font-family:楷体;
     align-text:center;
     width:100%;
    }

  .tab3{
    color: yellow;
    font-size:27;
    font-family:楷体;
    width:100%;
    align-text:center;
   }
   .tab4{
    color:white;
    font-size:27;
    font-family:楷体;
    width:100%;
    align-text:center;
   }
   
  .zhant{
	color: white;
	font-size: 27;
	font-family:楷体;
	align-text:center;
    width:100%;
}
</style>
</head>
<body style="text-align:center;background-color: black;width: 100%;height:100%;margin-left: 0px;">
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
<div id="title"  style="width:100%;height:6%;border:1px solid white;">
	<div id="info" style="height:100%;width:66.6%;float: left; ">
		    <input id="quybh" type="hidden" value="${quybh}" ></input>
			<label style="color:white;font-size:25;font-family:楷体;float:left;">${usercenter}</label>
			<label style="color:white;font-size:25;font-family:楷体;float:right;">${username}</label>
			<label style="color:white;font-size:40;font-family:楷体;align:right;">车辆入厂管理系统</label>
			<label style="color:white;font-size:30;font-family:楷体;align:right;">${quymc}</label>
	</div>
	<div id="tit2" style="width:33.3%;height:100%;float:right;border-left:1px solid white;">
	  <font style="font-size: 28;color: white;" ><span id="localtime"  ></span><script language="javascript"> tick();</script> </font>
	</div>
</div>
<div id="content" style="width:100%;height:auto;" >
 <div id="paid" style="width:33.3%;float:left;">
     <div id="pdtitle" style="width:100%;border:1px solid white;border-top: 0px solid white;">
		  <label style='width:100%;color:white;font-size:30;font-family: 楷体; '>车辆排队、申报信息</label>
	 </div>
	 <div id="pdxx" style="width:100%;height:700px;border-right: 1px solid white; border-left: 1px solid white;border-bottom:1px solid white;">
			 <div style="width:100%;height:3%;">
				 <table  class="tab4" ><tr ><td  width="30%">车号</td><td  width="15%">序号</td><td  width="20%">状态</td><td  width="40%">时间</td></tr></table>
			 </div>
			 <div id="pd"></div>
	</div>
 </div>	 

<div id="ruc" style="width:66.5%;float:right; height:710px;">
	     <div id="rctitle" style="width:100%;border-bottom:1px solid white;border-right:1px solid white;">
			<label style='width:100%;color:white;font-size:30;font-family: 楷体; '>车辆准入信息</label>
		 </div>
		 <div id="rc" style="width:100%;">	
				 <div id="c_left" style="width: 50%;float:left;height:700px; border-right: 1px solid white;border-bottom:1px solid white;">
						 <div style="width:100%;height:3%;">
							 <table  class="tab4" ><tr ><td  width="30%">车号</td><td  width="20%">大站台</td><td  width="15%">车位</td><td  width="35%">准入时间</td></tr></table>
						 </div>
						 <div id="ruc1" ></div>
				</div>
				<div id="c_right" style="width:49.5%;float:right;height:700px; border-right: 1px solid white;border-bottom:1px solid white;">
						 <div style="width:100%;height:3%;">
						 	<table  class="tab4"  style="color:white;width:100%;"><tr><td  width="30%">车号</td><td  width="20%">大站台</td><td  width="15%">车位</td><td  width="35%">准入时间</td></tr></table>
						 </div>
						 <div id="ruc2"></div>
				</div> 
		</div>		
</div>
</div>


</body>
<script type="text/javascript">
	var rucxxState = "T";	//初始状态
	var shenbpdxxState = "T";//初始状态
//var Contents;
     //车辆入厂信息
	function  rucxx(){
		if(rucxxState == "T"){
			rucxxState = "F";
		 $.ajax({
	            url: '/athena/kac/queryRucxx.ajax?quybh='+$('#quybh').val(),
	            type: 'GET',
	            dataType: 'json',
	            cache:false,
	            success: function (result) {
	                var jsonData = eval(result.result);
	                var str=''; var title='';var str1='';
	            	   $('#ruc1 div').remove();
	                   $('#ruc2 div').remove();  
	                   var Contents = $('#ruc1');
	                   var Contents2=$('#ruc2');
            	   for(var n=0;n<jsonData.length && n<15;n++){ 
            		   str='<table class="tab1" style="float:left;"><tr style="width:100%"><td  width="30%">'+jsonData[n]["kach"]+'</td><td  width="20%">'+jsonData[n]["daztbh"]+'</td><td  width="15%">'+jsonData[n]["beiz"]+'</td><td  width="35%">'+jsonData[n]["rucsj"]+'</td></tr></table>';
	            	   Contents.append( $("<div>").addClass('zhant').html(str));
            	     }
            	   for(var m=15;m<jsonData.length && m<30;m++){ 
            		 str1='<table class="tab1" style="float:left;"><tr style="width:100%"><td  width="30%">'+jsonData[m]["kach"]+'</td><td  width="20%">'+jsonData[m]["daztbh"]+'</td><td  width="15%">'+jsonData[m]["beiz"]+'</td><td  width="35%">'+jsonData[m]["rucsj"]+'</td></tr></table>';
  	            	  Contents2.append( $("<div>").addClass('zhant').html(str1));
              	     }
					rucxxState = "T";
	            } 
	         });		
		}
		 
	   }
	 $().ready(function(){ 
		        rucxx();
			    shenbpdxx();
				setInterval("rucxx()", 30000);
		        setInterval("shenbpdxx()", 30000);
				
			});

         //申报排队信息 
		 function shenbpdxx(){ 
			if(shenbpdxxState == "T"){
				shenbpdxxState = "F";
			  $.ajax({
                url: '/athena/kac/queryShenbpdxx.ajax?quybh='+$('#quybh').val(),
                type: 'GET',
                dataType: 'json',
                cache:false,
                success: function (result){
                    var jsonData = eval(result.result);
                    var newsContents = $('#pd');
                    var str='';
                    $('#pd div').remove();
                    for(var j = 0;j<jsonData.length && j<15  ;j++){
                   		 if('申报'==jsonData[j]["zhuangtmc"]){
                        		str='<table class="tab3"><tr><td  width="30%">'+jsonData[j]["kach"]+'</td><td  width="15%">'+jsonData[j]["beiz"]+'</td><td  width="20%">'+jsonData[j]["zhuangtmc"]+'</td><td  width="35%">'+jsonData[j]["rucsj"]+'</td></tr></table>';
    	                  }else{
    	            			str='<table class="tab"><tr><td  width="30%">'+jsonData[j]["kach"]+'</td><td  width="15%">'+jsonData[j]["beiz"]+'</td><td  width="20%">'+jsonData[j]["zhuangtmc"]+'</td><td  width="35%">'+jsonData[j]["rucsj"]+'</td></tr></table>';
    	            	  }
                	   newsContents.append( $("<div>").addClass('zhant').html(str));
                    }
					shenbpdxxState = "T";
               }
				});
			}
			  
            
		}
	
</script>
</html>