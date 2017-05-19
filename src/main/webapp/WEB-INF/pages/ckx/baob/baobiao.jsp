<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<!-- huxy_11458 -->  <!-- 11726 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/decorators/athena/main.css"></link>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.core.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.mouse.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/sdc.ui-1.0.0.min.js" type="text/javascript"></script>
<style type="text/css">
 #main{
 	width:100%;
 	height:80%;
 	background:white;
 }
.time{
   width:100%;
   height:5%;
   background:gray;
}
#content{
   width:100%;
   height:95%;
   background:white;
   margin-top:10px;
}
.show{
  background:white;
  width:440px;
  float:left;
  height:400px;
  margin-right:15px;
}
#content_left{
  margin-left:1px;
}

#footer{
   magin-top:8px;
   width:100%;
   height:40px;
   background:white;
}
table.tab1{
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	width:100%;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.tab1 th {
	border-width: 1px;
	padding: 7px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.tab1 td {
	border-width: 1px;
	padding: 7px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
#btn_page{
	float:left;
	width:40%;
	height:100%;
}
#message{
	float:left;
	height:100%;
	width:30%;
}
#promot{
	float:left;
	height:100%;
	width:30%;
}
</style>

<script type="text/javascript">
/*
 * 生成表标题部分
 */
 var is_Request = false;
 var currentPage = 1;
 var pageSize = 18;
 var maxPage;
 
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
 
function myshowJson(data,begin,end)
{
	var i = 0;
	if(data == '')
		return "";
	strHtml="<table class=\"tab1\"><font class=\"font_1\"><tr><th>"+data.group+"</th>";
	var factoryNameList = data.factoryList.split(",");
	var factoryNum = factoryNameList.length;
	if(factoryNum > 0)
	{
		
		if(data.group == "承运商"){
			strHtml +="<th>承运商类型</th>"+"<th>承运商名称</th>";
		}
		for( i = 0;i<factoryNum;i++)
		{
			strHtml += "<th>"+factoryNameList[i]+"</th>";
		}
		
		strHtml += "<th>合计</th>"+"</tr>";
		var total1 = 0;
		var total2 = 0;
		var total3 = 0;
		var data_x = data.result;
		
	if(factoryNum == 2)
	{
		for(i = begin;i<data_x.length && i< end;i++)
		{
			total = data_x[i].num_1 + data_x[i].num_2;
			if(data.group == "计划员")
			{
				strHtml = strHtml + "<tr><td>"+data_x[i].jihy+"</td>"+"<td>"+data_x[i].num_1+"</td>"+"<td>"+data_x[i].num_2+"</td>"+"<td>"+total+"</td>";
				
			}else{
				strHtml = strHtml + "<tr><td>"+data_x[i].chengys+"</td>"+"<td>"+data_x[i].chengyslx+"</td>"+"<td>"+data_x[i].chengysmc+"</td>"+"<td>"+data_x[i].num_1+"</td>"+"<td>"+data_x[i].num_2+"</td>"+"<td>"+total+"</td>";
				
			}
			
			total = 0;
			total1 += data_x[i].num_1;
			total2 +=  data_x[i].num_2;

		}
		total3 = total1 + total2 ; 
		if(data.group == "计划员"){
			strHtml = strHtml + "<tr><td>合计</td><td>"+total1+"<td>"+total2+"</td>"+"<td>"+total3+"</td></tr>";
		}else{
			strHtml = strHtml + "<tr><td>合计</td><td>"+''+"<td>"+''+"</td>"+"<td>"+total1+"</td>"+"<td>"+total2+"</td>"+"<td>"+total3+"</td></tr>";
		}
		strHtml = strHtml + "</font></table>";	
	}else{
		for(i = begin;i<data_x.length && i< end;i++)
		{
			total = data_x[i].num_1 + data_x[i].num_2;
			if(data.group == "计划员")
			{
				strHtml = strHtml + "<tr><td>"+data_x[i].jihy+"</td>"+"<td>"+data_x[i].num_1+"</td>"+"<td>"+total+"</td>";
				
			}else{
				strHtml = strHtml + "<tr><td>"+data_x[i].chengys+"</td>"+"<td>"+data_x[i].chengyslx+"</td>"+"<td>"+data_x[i].chengysmc+"</td>"+"<td>"+data_x[i].num_1+"</td>"+"<td>"+total+"</td>";
				
			}
			
			total = 0;
			total1 += data_x[i].num_1;
			total2 +=  data_x[i].num_2;
		}
		total3 = total1;
		if(data.group == "计划员"){
			strHtml = strHtml + "<tr><td>合计</td><td>"+total1+"</td>"+"<td>"+total3+"</td></tr>";
		}else{
			strHtml = strHtml + "<tr><td>合计</td><td>"+''+"</td>"+"<td>"+''+"</td>"+"<td>"+total1+"</td>"+"<td>"+total3+"</td></tr>";
		}
		strHtml = strHtml + "</font></table>";	
	}    
	}
	return strHtml;	
}

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

function askRequest()
{
	is_Request = true;
	var param = $('#searchKey').val();
	//由于分成3屏显示 所以pageSize翻3倍
	var size = 3 * pageSize;
	var params = param.concat('&currentPage='+currentPage+'&pageSize='+size);
	var total;
	
    $.ajax({
	    url : "GetBaobiaoFromJihy.ajax",
		data : params,
        type: 'GET',
        dataType: 'json',
		success : function(result) {	
			//获取返回数据的条数
		total = result.result.length;
		if(total <= pageSize)
		{
			var p = myshowJson(result,0,total);
			$('#content_middle').html(p);
		}else if(total > pageSize && total <= pageSize*2){
			var p = myshowJson(result,0,pageSize);
			$('#content_left').html(p);
			var p1 = myshowJson(result,pageSize,total);
			$('#content_middle').html(p1);
		}else if(total > 2*pageSize && total <= pageSize*3)
		{
			var p = myshowJson(result,0,pageSize);
			$('#content_left').html(p);
			var p1 = myshowJson(result,pageSize,pageSize*2);
			$('#content_middle').html(p1);
			var p2 = myshowJson(result,2*pageSize,pageSize*3);
			$('#content_right').html(p2);
		}
		maxPage = Math.ceil(result.total/(3*pageSize));
		$('#showPage').html(currentPage);
		$('#showPageCount').html(maxPage);
		$('#group').val(result.group);
	  }
	});
    is_Request =false;
}
$(function()
{
    var today;   
    today = new Date();  
    var time = showLocale(today);
    document.getElementById("localtime").innerHTML = time;
    
    
	if('${result}' !='' )
	{	
		var params = '${result}';
		$('#searchKey').val(params);
		askRequest();
	}
	
    $('#firstPage').bind("click",function(){
    	if( !is_Request)
    	{
    		if(currentPage == 1)
    		{
				 $('#promot span').html("当前页是第一页");
				 $('#promot').css("display","block");
				 return ;
    		}else{
        		currentPage = 1;
        		askRequest();  
        		return ;
    		}
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
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
			 	return ;
			 }else{
				 currentPage = currentPage+1;
				 askRequest();
				 return ;
		 	}    		
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
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
				 return ;
			 }else{
				 currentPage = currentPage - 1;
				 askRequest();
				 return ;
			 }
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
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
			 return ;
		 }else{
			 currentPage = maxPage;
			 askRequest();
			 return ;
		 }     		
    	}else{
    		$('#promot span').html("当前服务正在请求，请稍候");
    		$('#promot').css("display","block");
    		return ;
    	}

	});
    $('#download').bind("click",function (){
    	$.sdcui.pageUtils.goPage({
			url : '../baob/Daoc.do?'+$('#searchKey').val(),
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });  
    });
});
		

	
</script>
</head>
<body>
<div id="container">
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
	
	<div id="main">
			<input id="searchKey" name="searchKey" type="Hidden"></input>
			<div class="time">
					<center>
					    <font style="font-size: 28;color: white;" >
						<label>统计时间</label>&nbsp&nbsp&nbsp<span  id="localtime"></span></font>
					</center>
			</div>
			<div id="content">
				<div id="content_left" class="show" ></div>
				<div id="content_middle" class="show"></div>
				<div id="content_right" class="show"></div>
			</div>
	</div>
	<div id="footer">
		<div id="btn_page">
		<center>
				<input type="button" class="page" name="firstPage" id="firstPage" value="首页">
				<input type="button" class="page" name="nextPage" id="nextPage" value="下一页">
				<input type="button" class="page" name="lastPage" id="lastPage" value="上一页">
				<input type="button" class="page" name="endPage" id="endPage" value="尾页">
				<input type="button" class="page" name="download" id="download" value="导出xls">
		</center>
		</div>
		<div id="message">
				<label>当前第</label>
				<span id="showPage"></span><label>页,</label>
					<label>共</label>
				<span id="showPageCount"></span><label>页</label>
		</div>
		<div id="promot" ><font color="red"><span></span></font></div>
	</div>
</div>
</body>


