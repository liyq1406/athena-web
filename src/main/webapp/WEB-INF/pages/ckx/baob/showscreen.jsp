<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<!-- 11458 --><!-- 11726 -->
<html>
<head>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/decorators/athena/main.css"></link>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.4.4.min.js" type="text/javascript"></script>
<style type="text/css">
 #show{
 	background:gray;
	height:700px;
 }
 #show_left{
 	float:left;
 }
  #show_right{
 	float:left;
 }
 .sep_2{
  	width:49.9%;
 	height:95%;
 }
 .safe{
 	font-size: 20;
 	color: green
 }
  .danger{
 	font-size: 20;
 	color: red
 }
 .normal{
  	font-size: 13;
  	font-family:微软雅黑;
        align-text:left;
 }
  .content{
  	font-size: 15;
  	font-family:微软雅黑;
        align-text:left;
 }
 .ywsl{
 	font-size: 18;
  	font-family:微软雅黑;
        align-text:left;
	color:white;
 }
  .bj{
  color:red;
  font-size:13;
  font-family:微软雅黑;
  align-text:left;
 }
 .tab1{
     color:white;
     font-size:15;
     font-family:微软雅黑;
     align-text:left;
     width:100%;
    }
  .title{
  	 width:30%;
  	 float:left;
  }
  .time{
    margin-left:2px;
    margin-right:2px;
  	width:100%;
  }
  #btn_func {
    height: 5%;
    width:100%;
    magin-top:10px;
 }
 #btn_page{
	float:left;
	width:20%;
 }
 #message{
 	float:left;
	width:20%;
 }
 #btn_baob{
 	float:left;
	width:20%;
	border-left:50px;
 }
 #btn_back{
 	float:left;
	width:10%;
	border-left:10px;
 }
 #promot{
 	float:left;
	width:20%;
	border-left:10px;
 }
</style>
<script type="text/javascript">
var currentPage = 1;
var pageSize = 28;
var maxPage = 0;
var yanwbjsj = 0;
//左右2边是否有空
var l_flag = 0;
var r_flag = 0;
var is_Request = false;
//从一个json字符串中获取某一个key的键值
function getParam(str,key)
{	
	var s = str.split('&');
	var k;
	var i;
	var m;
	for( i in s)
	{
		m = s[i].split('=');
		if(m[0] == key)
			return m[1];
	}
	return '';
}
/*
 * 生成表标题部分
 */
function myshowJson(data)
{
    strHtml="<table class=\"tab1\"><tr><td><font class=\"normal\">序号</font></td><td><font class=\"normal\">零件编号</font></td><td><font class=\"normal\">零件名称</font></td><td><font class=\"normal\">仓库</font></td><td><font class=\"normal\">产线</font></td><td><font class=\"normal\">类型</font></td><td><font class=\"normal\">状态</font></td><td><font class=\"normal\">要货令号</font></td><td><font class=\"normal\">供商编号</font></td><td><font class=\"normal\">运商名称</ftont></td><td><font class=\"normal\">要货数量</font></td><td><font class=\"normal\">计划员</font></td></tr> ";
    strHtml=mydg(data,strHtml);
    return strHtml;
}

/*
 * 生成表标题部分
 */
function showTitle()
{
	return "<table class=\"tab1\"><tr><td><font class=\"normal\">序号</font></td><td><font class=\"normal\">零件编号</font></td><td><font class=\"normal\">零件名称</font></td><td><font class=\"normal\">仓库</font></td><td><font class=\"normal\">产线</font></td><td><font class=\"normal\">类型</font></td><td><font class=\"normal\">状态</font></td><td><font class=\"normal\">要货令号</font></td><td><font class=\"normal\">供商编号</font></td><td><font class=\"normal\">运商名称</ftont></td><td><font class=\"normal\">要货数量</font></td><td><font class=\"normal\">计划员</font></td></tr> ";
}
/*
 * 生成数据部分
 */
function mydg(data,strHtml)
{
	for(cc in data)
	{
		if(typeof(data[cc]) == 'object')
		{
			var id= (currentPage -1)* pageSize + parseInt(cc) + 1;
			var sj = parseInt(data[cc].yanwsj);
			if( sj > yanwbjsj)
			{
				strHtml = strHtml + "<tr><td><font class=\"bj\">"+id+"</font></td>"+"<td><font class=\"bj\">"+data[cc].lingjbh+"</font></td>"+"<td><font class=\"bj\">"+data[cc].lingjmc+"</font></td>"+"<td><font class=\"bj\">"+data[cc].cangkbh+"</font></td>"+"<td><font class=\"bj\">"+data[cc].chanx+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohllx+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohlzt+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohlh+"</font></td>";
				strHtml = strHtml + "<td><font class=\"bj\">"+data[cc].gongysdm+"</font></td>"+ "<td><font class=\"bj\">"+data[cc].chengysmc+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohsl+"</font></td>"+"<td><font class=\"bj\">"+data[cc].jihy+"</font></td>"+"</tr>";
			}else{
				strHtml = strHtml + "<tr><td><font class=\"content\">"+id+"</font></td>"+"<td><font class=\"content\">"+data[cc].lingjbh+"</font></td>"+"<td><font class=\"content\">"+data[cc].lingjmc+"</font></td>"+"<td><font class=\"content\">"+data[cc].cangkbh+"</font></td>"+"<td><font class=\"content\">"+data[cc].chanx+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohllx+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohlzt+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohlh+"</font></td>";
				strHtml = strHtml + "<td><font class=\"content\">"+data[cc].gongysdm+"</font></td>"+ "<td><font class=\"content\">"+data[cc].chengysmc+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohsl+"</font></td>"+"<td><font class=\"content\">"+data[cc].jihy+"</font></td>"+"</tr>";				
			}
		}
	}
	strHtml = strHtml + "</table>";
    return strHtml;
}

//
function myshowJson_1(data,begin,end)
{
	strHtml="<table class=\"tab1\"><tr><td><font class=\"normal\">序号</font></td><td><font class=\"normal\">零件编号</font></td><td><font class=\"normal\">零件名称</font></td><td><font class=\"normal\">仓库</font></td><td><font class=\"normal\">产线</font></td><td><font class=\"normal\">类型</font></td><td><font class=\"normal\">状态</font></td><td><font class=\"normal\">要货令号</font></td><td><font class=\"normal\">供商编号</font></td><td><font class=\"normal\">运商名称</ftont></td><td><font class=\"normal\">要货数量</font></td><td><font class=\"normal\">计划员</font></td></tr> ";
    var cc = 0;
    for(cc = 0;cc <data.length;cc++)
	{
    	if(cc >= begin && cc < end)
    	{
    		if(typeof(data[cc]) == 'object')
    		{
    			var id= (currentPage -1)* pageSize + parseInt(cc) + 1;
    			var sj = parseInt(data[cc].yanwsj);
    			if( sj > yanwbjsj)
    			{
    				strHtml = strHtml + "<tr><td><font class=\"bj\">"+id+"</font></td>"+"<td><font class=\"bj\">"+data[cc].lingjbh+"</font></td>"+"<td><font class=\"bj\">"+data[cc].lingjmc+"</font></td>"+"<td><font class=\"bj\">"+data[cc].cangkbh+"</font></td>"+"<td><font class=\"bj\">"+data[cc].chanx+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohllx+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohlzt+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohlh+"</font></td>";
    				strHtml = strHtml + "<td><font class=\"bj\">"+data[cc].gongysdm+"</font></td>"+ "<td><font class=\"bj\">"+data[cc].chengysmc+"</font></td>"+"<td><font class=\"bj\">"+data[cc].yaohsl+"</font></td>"+"<td><font class=\"bj\">"+data[cc].jihy+"</font></td>"+"</tr>";
    			}else{
    				strHtml = strHtml + "<tr><td><font class=\"content\">"+id+"</font></td>"+"<td><font class=\"content\">"+data[cc].lingjbh+"</font></td>"+"<td><font class=\"content\">"+data[cc].lingjmc+"</font></td>"+"<td><font class=\"content\">"+data[cc].cangkbh+"</font></td>"+"<td><font class=\"content\">"+data[cc].chanx+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohllx+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohlzt+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohlh+"</font></td>";
    				strHtml = strHtml + "<td><font class=\"content\">"+data[cc].gongysdm+"</font></td>"+ "<td><font class=\"content\">"+data[cc].chengysmc+"</font></td>"+"<td><font class=\"content\">"+data[cc].yaohsl+"</font></td>"+"<td><font class=\"content\">"+data[cc].jihy+"</font></td>"+"</tr>";				
    			}
    		}		
    	}
	}
    return strHtml;
}

function showTable(para)
{
	if(para.total == 0)
		return showTitle();
	else 
		return myshowJson(para.rows);
}
function askRequest(countFactory)
{
	is_Request = true;
	$('#promot').css("display","none");
	var param = $('#searchKey1').val();
	var params = param.concat('&currentPage='+currentPage+'&pageSize='+pageSize);
	var yanwbjsl = parseInt(getParam(params,"yanwbjsl"));

    $.ajax({
		    url : "queryYwyhlByParam.ajax",
			data : params,
            type: 'GET',
            dataType: 'json',
			success : function(result) {	
			 //两页
			 if(countFactory > 1)
			 {
				if(result.result0.total  <= 0)
				{
					$('#left_yanwsl').html(0);
					l_flag = 1 ;
				}
				if(result.result1.total  <= 0)
				{
					$('#right_yanwsl').html(0);
					r_flag = 1;
				}
				var max_left = Math.ceil(result.result0.total/pageSize);
				var max_right = Math.ceil(result.result1.total/pageSize);			
				maxPage = max_left > max_right ? max_left: max_right;
				$('#factory_left').html(result.factoryList[0]);
				$('#factory_right').html(result.factoryList[1]);
				if(result.result0.total > yanwbjsl)
				{
					if($('#left_yanwsl').attr("class") == "safe")
					{
						$('#left_yanwsl').removeClass("safe").addClass("danger");								
					}
				}
				$('#left_yanwsl').html(result.result0.total);
				if(result.result1.total > yanwbjsl)
				{
					if($('#right_yanwsl').attr("class") == "safe")
					{
						$('#right_yanwsl').removeClass("safe").addClass("danger");								
					}
				}
				$('#right_yanwsl').html(result.result1.total);
				var p = showTable(result.result0);
				var p1 = showTable(result.result1);
				$('#left-content').html(p);
				$('#right-content').html(p1);					
				$('#showPage').html(currentPage);
				$('#showPageCount').html(maxPage);
			 }else{
				 //单工厂 左右均显示一个工厂
				if(result.result0.total  <= 0)
				{//没有数据 显示空 返回
					$('#left_yanwsl').html(0);
					$('#right_yanwsl').html(0);
					$('#left-content').html(showTitle());
					$('#right-content').html(showTitle());
				}
				 //页码显示区域
				maxPage = Math.ceil(result.result0.total/pageSize);
				$('#showPage').html(currentPage);
				$('#showPageCount').html(maxPage);
				$('#factory_left').html(result.factoryList[0]);
				$('#factory_right').html(result.factoryList[0]);
				
				//数量显示区域
				if(result.result0.total > yanwbjsl)
				{
					if($('#left_yanwsl').attr("class") == "safe")
					{
						$('#left_yanwsl').removeClass("safe").addClass("danger");								
					}
					if($('#right_yanwsl').attr("class") == "safe")
					{
						$('#right_yanwsl').removeClass("safe").addClass("danger");								
					}
				}
				$('#left_yanwsl').html(result.result0.total);
				$('#right_yanwsl').html(result.result0.total);
				//表格区域
				var p = myshowJson_1(result.result0.rows,0,pageSize/2);
				var p1 = myshowJson_1(result.result0.rows,pageSize/2,pageSize);
				$('#left-content').html(p);
				$('#right-content').html(p1);

			 }
			}
    });		
    is_Request = false;
}

function autoRequest()
{
	var param = $('#searchKey1').val();
	var countFactory = parseInt(getParam(param,"num"));
	if(currentPage < maxPage)
	{
		currentPage = currentPage +1;
	}else{
		currentPage = 1;
	}
	askRequest(countFactory);
}

$(function(){
	//进入页面第一次请求
	if('${result}' !='' )
	{	
		var params = window.opener.value;
		$('#searchKey1').val(params);
		var countFactory = parseInt(getParam(params,"num"));
		if(countFactory == 1)
			pageSize = pageSize * 2;
		askRequest(countFactory);
		//定时请求
		var time = 1000*parseInt(getParam(params,"dapsxsj"));
		setInterval("autoRequest()", time);
		//延误报警时间
		yanwbjsj = parseInt(getParam(params,"yanwbjsj"));
	}
	var cans = params;
    $('#firstPage').bind("click",function(){
    	if( !is_Request)
    	{
    		if(currentPage == 1)
    		{
				 $('#promot span').html("当前页是第一页");
				 $('#promot').css("display","block");
				 document.getElementById('promot').focus();
				 return ;
    		}else{
        		currentPage = 1;
        		askRequest(countFactory);  
        		return ;
    		} 		  		
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
    		document.getElementById('promot').focus();
    		return ;
    	}
	
	});
    
    $('#nextPage').bind("click",function(){
    	if( !is_Request)
    	{
   			if(currentPage == maxPage)
		 	{
			 	$('#promot span').html("当前页是最后一页");
			 	$('#promot').css("display","block");
			 	document.getElementById('promot').focus();
			 	return ;
			 }else{
				 currentPage = currentPage+1;
				 askRequest(countFactory);
				 return ;
		 	}    		
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
    		document.getElementById('promot').focus();
    		return ;
    	}

	});
    
    $('#lastPage').bind("click",function(){
     	if( !is_Request)
    	{
    		if(currentPage == 1)
		 	{
				 $('#promot span').html("当前页是第一页");
				 $('#promot').css("display","block");
				 document.getElementById('promot').focus();
				 return ;
			 }else{
				 currentPage = currentPage - 1;
				 askRequest(countFactory);
				 return ;
			 }
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
    		document.getElementById('promot').focus();
    		return ;
    	}
	});
    
    $('#endPage').bind("click",function(){
     	if( !is_Request)
    	{
   		 if(currentPage == maxPage)
		 {
			 $('#promot span').html("当前页是最后一页");
			 $('#promot').css("display","block");
			 document.getElementById('promot').focus();
			 return ;
		 }else{
			 currentPage = maxPage;
			 askRequest(countFactory);
			 return ;
		 }     		
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
    		document.getElementById('promot').focus();
    		return ;
    	}

	});
    
		  
	  $('#GridByJihy').bind("click",function(){
	    var jihy = cans + '&_jihy=1&_chengys=0';
		$('#putvalue').val(jihy);
		$("#putform").attr("action","baobiao.do");
		document.putform.submit();
	});
	  $('#GridByChengys').bind("click",function(){
		    var jihy = cans + '&_jihy=0&_chengys=1';
			$('#putvalue').val(jihy);
			$("#putform").attr("action","baobiao.do");
			document.putform.submit();
		});
	  $('#btn_back').bind("click",function(){
		  	window.close();
		});
	  
});





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
    var time = showLocale(today);
    document.getElementById("localtime").innerHTML = time;
    //$('.time').html(showLocale(today));
    window.setTimeout("tick()", 1000);   
}
</script>
</head>

<body>
<div id="container">
	<div id="logo" style="width:100%;height:4%;">
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
	 <input id="searchKey1" name="searchKey1" type="Hidden"></input>
	  <form id="putform" method="post" name="putform" target="_blank">
	   	 	<input id="putvalue" name="putvalue" type="hidden"></input>
	   </form> 
		<div id="show">
			<div style="border:solid 1px white;height:5%;background:black;width:100%;" id="title">
			<!--  
			   <div class = "title">
			   		<center>
						<font style="font-size: 28;color: white;" >
						<label id="factory_left"></label></font>
					</center>
				</div> -->
				<div class="time">
					<center>
					    <font style="font-size: 28;color: white;" >
						<span  id="localtime"></span>  <script type="text/javascript">tick();</script></font>
					</center>
				</div>
				<!-- 
				<div class = "title">
			   		<center>
						<font style="font-size: 28;color: white;" >
						<label id="factory_right"></label></font>
					</center>
				</div>-->
			</div>			
			<div id="show_left" class="sep_2">
				<div id="left-top" style="width:100%;height:4%;background:black;max-height:25px;overflow:hidden;border:solid 1px white;">
					<center>
					<font class="ywsl" >
						<label id="factory_left"></label>&nbsp&nbsp
						<label>当前延误数量:</label><span id="left_yanwsl" class="safe"></span>
					 </font>
					</center>
				</div>
				<div id="left-content" style="border:solid 1px white;height:96%;background:black;font-color:white;width:100%;">
				</div>
			</div>
			<div id="show_right" class="sep_2">
				<div id="right-top" style="width:100%;height:4%;background:black;max-height:25px;overflow:hidden;border:solid 1px white;">
					<center>
					<font class="ywsl" >
					    <label id="factory_right"></label>&nbsp&nbsp
						<label>当前延误数量:</label><span id="right_yanwsl" class="safe"></span>					
					 </font>
					</center>
				</div>
				<div id="right-content" style="border:solid 1px white;height:96%;background:black;font-color:white;width:100%;">
				</div>
			</div>
	</div>
		<div id="btn_func" class = "btn_f">
			<div id="btn_page" >
				<input type="button" class="page" name="firstPage" id="firstPage" value="首页">
				<input type="button" class="page" name="nextPage" id="nextPage" value="下一页">
				<input type="button" class="page" name="lastPage" id="lastPage" value="上一页">
				<input type="button" class="page" name="endPage" id="endPage" value="尾页">
			</div>
			<div id="message">
					<label>当前第</label>
					<span id="showPage"></span><label>页,</label>
						<label>共</label>
					 <span id="showPageCount"></span><label>页</label>
			</div>
			<div id="btn_baob" class="baob">
				<input type="button"  name="GridByJihy" id="GridByJihy" value="按计划员统计">
				<input type="button"  name="GridByChengys" id="GridByChengys" value="按承运商统计">
			</div>
			<div id="btn_back">
				<input type="button"  name="back" id="back" value="返回">
			</div>
			<div id="promot" ><font color="red"><span></span></font></div>
		</div>
</div>
</body>