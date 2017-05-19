<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<!-- huxy_V4_041 -->
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.core.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.mouse.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/sdc.ui-1.0.0.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/echarts.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/json2.js" type="text/javascript"></script>
<style type="text/css">
#container{
	margin-left:10%;
	margin-right:10%;
	width:80%;
	height:auto;
}
#container2{
	margin-left:25%;
	margin-right:25%;
	margin-top:1%;
	width:50%;
	height:auto;
}
#baob1{
	margin-left:15%;
	width:70%;
	height:auto;
	display:inline;
}
#baob2{
	margin-top:5%;
	margin-left:15%;
	width:70%;
	height:auto;
	display:inline;
}
#baob3{
	margin-top:5%;
	margin-left:15%;
	display:inline;
	width:70%;
	height:auto;
}
#download{
	float:left;
}
.show{
  background:white;
  width:100%;
  height:400px;
}
.tab1{
 	 border-left:2px solid black;
 	 border-right:2px solid black;
 	 border-top:2px solid black;
 	 border-bottom:2px solid black;
 	 cellspacing:1;
     width:100%;
     border-collapse:collapse;
    }
 .tab1 td{
 	border:solid 1px;
 }
 
.tab2{
 	 border-left:2px solid black;
 	 border-right:2px solid black;
 	 border-top:2px solid black;
 	 border-bottom:2px solid black;
 	 cellspacing:1;
     width:100%;
     border-collapse:collapse;
    }
.tab2 td{
 	border:solid 1px;
 }
.show2{
  background:white;
  width:70%;
  margin-left:10%;
  margin-right:10%;
  height:400px;
}

.bb{
	align :center;

	margin-bottom:3px;
}
.b3{
	align :center;
	width : 80%;
	height: 80%;
	margin-bottom:3px;
}
.normal{
  	font-size: 15;
  	font-family:微软雅黑;
    align-text:left;
 }
 .table{
 	margin-left:10%;
 	width:80%;
 	height:atuo;
 	align:center;
 }
.table2{
 	margin-left:10%;
 	width:80%;
 	height:atuo;
 	align:center;
 }
 .lie{
  	font-size: 10;
  	font-family:微软雅黑;
    align-text:left;
 }
 .form{
  	margin-left:15%;
 	width:60%;
 	height:atuo;
 	align:center;
 }
</style>

<script type="text/javascript">
var usercenter=[];
var factory = [];
var bblx1 = "外部要货令统计";
var bblx2 = "07：30外部要货令统计";
var bblx3 = "过点数量统计";
var num=0;//实际报表个数
var title = [];
var gcsl = [];
var chanx=[];
var yaohllx = [];
var xAis = [];
var series = [];
var aXis = [];

//lx = 0,1,2 显示每个报表的title
function showTitle(lx)
{
	if(lx == 0)
	{
		title = factory + bblx1;
		//$('#title1').html(title);	
	}else if(lx == 1)
	{
		title = factory + bblx2;
		//$('#title2').html(title);	
	}
	else if(lx == 2)
	{
		title = factory + bblx3;
		//$('#title3').html(title);	
	}else {
		return false;
	}

	return true;
}
//显示报表主体部分
function showGraph(yaohllx,xAis,series,bblx,id)
{
	var chart = echarts.init(document.getElementById(id));
	if(bblx < 2)
	{
		chart.setOption({
			title : {
				text:title
			},
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {          
		        type : 'shadow'    
		        }
		    },
		    legend: {
		        data : yaohllx[bblx]
		    },
		    toolbox: {
		        show : true,
		        orient: 'vertical',
		        x: 'right',
		        y: 'center',
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: [ 'stack', 'tiled']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '2%',
		        containLabel: true
		    },
		    xAxis : [
		 	        {
		 	            type : 'category',
		 	            data : xAis[bblx],
		 	            axisLabel : {
		 	            	show :true,
		 	            	interval : 0
		 	            }
		 	        }
		 	    ],
		 	    yAxis : [
		 	        {
		 	            type : 'value'
		 	        }
		 	    ],
		 	   series : series[bblx]
		 		}
		    );
	}else if(2 == bblx){
		chart.setOption({
			title : {
				text:title
			},
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {          
		        type : 'shadow'    
		        }
		    },
		    toolbox: {
		        show : true,
		        orient: 'vertical',
		        x: 'right',
		        y: 'center',
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: [ 'stack', 'tiled']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    legend: {
		        data : yaohllx
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '2%',
		        containLabel: true
		    },
		    xAxis : [
		 	        {
		 	            type : 'category',
		 	            data : xAis
		 	        }
		 	    ],
		 	    yAxis : [
		 	        {
		 	            type : 'value'
		 	        }
		 	    ],
		 	   series : series
		 		}
		    );
	}
	return true;
}
//bblx第几个报表  显示第一个第二个报表的表格数据
function showTable(yaohllx,xAis,series,bblx)
{
	//开头
	var html= "<table class=\"tab1\"><tr><td><font class=\"normal\"></font>类型</td>";
	//第一行
	for(var j=0;j<yaohllx[bblx].length+1;j++)
	{
		var params = [];
		var i=0;
		if(j==0)
		{
			for(i=0;i<xAis[bblx].length;i++)
			{
				params=[];
				params = "<td><font class=\"lie\">"+xAis[bblx][i]+"</font></td>";
				html = html + params;
			}
			html = html + "</tr>";
		}else{
			html = html +"<tr>" + "<td><font class=\"normal\"></font>" + yaohllx[bblx][j-1]+"</td>";;
			for(i=0;i<xAis[bblx].length;i++)
			{
				params = [];
				params="<td><font class=\"normal\"></font>"+ series[bblx][j-1].data[i]+"</td>";
				html = html + params;
			}
			html = html+"</tr>";
		}
	}
	//加合计
	html = html + "<tr><td><font class=\"normal\"></font>"+"合计"+"</td>";
	i=0;
	j=0;
	for(i=0,j=0;i<xAis[bblx].length;i++)
	{
		var params = [];
		result = 0;
		for(j=0;j<yaohllx[bblx].length;j++)
		{
			result = result + series[bblx][j].data[i];
		}
		params = "<td><font class=\"normal\"></font>"+result+"</td>";
		html = html + params;
	}
	html = html +"</br></table>";
	
	if(bblx == 0)
	{
		$('#table0').html(html);	
	}else if(bblx == 1)
	{
		title = factory + bblx2;
		$('#table1').html(html);	
	}
	else if(bblx == 2)
	{
		title = factory + bblx3;
		$('#table2').html(html);	
	}else {
		return false;
	}
	
	return true;
}

//显示第三个报表的表格数据  showTable3(chanx,aXis,gcsl)
function showTable3(chanx,aXis,gcsl,bblx)
{
	//开头
	var html= "<table class=\"tab2\"><tr><td><font class=\"normal1\"></font>类型</td>";
	//第一行
	for(var j=0;j<chanx.length+1;j++)
	{
		var params = [];
		var i=0;
		if(j==0)
		{
			for(i=0;i<aXis.length;i++)
			{
				params=[];
				params = "<td><font class=\"lie\">"+aXis[i]+"</font></td>";
				html = html + params;
			}
			html = html + "</tr>";
		}else{
			html = html +"<tr>" + "<td><font class=\"normal\"></font>" + chanx[j-1]+"</td>";;
			for(i=0;i<aXis.length;i++)
			{
				params = [];
				params="<td><font class=\"normal\"></font>"+ gcsl[j-1].data[i]+"</td>";
				html = html + params;
			}
			html = html+"</tr>";
		}
	}
	html = html +"</br></table>";
	
	if(bblx == 0)
	{
		$('#table0').html(html);	
	}else if(bblx == 1)
	{
		title = factory + bblx2;
		$('#table1').html(html);	
	}
	else if(bblx == 2)
	{
		title = factory + bblx3;
		$('#table2').html(html);	
	}else {
		return false;
	}
	
	return true;
}
function showCharts(yaohllx,xAis,series)
{
	var bblx = 0;
	var chart = [];
	var id=[];
	for(bblx=0;bblx<num;bblx++)
	{
		showTitle(bblx);
		id = "b"+bblx;
		showGraph(yaohllx,xAis,series,bblx,id);
		showTable(yaohllx,xAis,series,bblx);
	}
	return true;
}
//进总装6000点报表生成方法
function showCharts_3(chanx,aXis,gcsl)
{
	var bblx = 2;
	var chart = [];
	var id=[];

	showTitle(bblx);
	id = "b"+bblx;
	showGraph(chanx,aXis,gcsl,bblx,id);
	showTable3(chanx,aXis,gcsl,bblx)
	
	return true;
}

//function download()
//{
//	var param=[];
//	param.push("usercenter="+usercenter);
//	$.sdcui.ajaxUtil.ajax({
//		url : "${ctx}/baob/downloadbb.ajax",
//		data : param.join('&'),
//		success : function(result) {
//		alert(result.result.result);
//	  	 }
//		});
//}

function openImage()
{
	var myChart = [];
	var myChart1 =[];
	var myChart2 =[];
	var data = [];
	var data1 = [];
	var data2 = [];
	if(document.getElementById("b0").innerHTML != '')
	{
		myChart = echarts.getInstanceByDom(document.getElementById("b0"));
		data = myChart.getDataURL("png");
	}
	if(document.getElementById("b1").innerHTML != '')
	{
		myChart1 = echarts.getInstanceByDom(document.getElementById("b1"));
		data1 = myChart1.getDataURL("png");
	}
	if(document.getElementById("b2").innerHTML != '')
	{
		myChart2 = echarts.getInstanceByDom(document.getElementById("b2"));
		data2 = myChart2.getDataURL("png");
	}
	//var myChart = echarts.getInstanceByDom(document.getElementById("b0"));
	//var myChart1 = echarts.getInstanceByDom(document.getElementById("b1"));
	//var myChart2 = echarts.getInstanceByDom(document.getElementById("b2"));
	//var data = myChart.getDataURL("png");
	//var data1 = myChart1.getDataURL("png");
	//var data2 = myChart2.getDataURL("png");
	$("#img").val(data);
	$("#img1").val(data1);
	$("#img2").val(data2);
	$("#factory").val(factory);
	$("#exportForm").submit(); 
}

$(function()
{
	 $('#btn_back').bind("click",function(){
		  	window.close();
		});
	  
	if('$(yaohllx)' !='')
	{
		yaohllx = JSON.parse('${yaohllx}');
		num = yaohllx.length;
	}
	if('$(xAis)' !='')
	{
		xAis = JSON.parse('${xAis}');
	}
	if('$(series)' !='')
	{
		series = JSON.parse('${series}');
	}
	if('$(chanx)' !='')
	{
		chanx = JSON.parse('${chanx}');
	}
	if('$(aXis)' !='')
	{
		 aXis = JSON.parse('${aXis}');
	}
	if('$(factory)' !='')
	{
		factory = '${factory}';
	}
	if('$(usercenter)' !='')
	{
		usercenter = '${usercenter}';
	}
	if('$(gcsl)' !='')
	{
		gcsl = JSON.parse('${gcsl}');
	}
	//第一个第二个报表的生成方法
	if(num > 0)
		showCharts(yaohllx,xAis,series);
	//第三个报表的生成方法
	if(chanx !='')
		showCharts_3(chanx,aXis,gcsl);
});
</script>
</head>
<body>
<div id="container">
	<div id="baob1" class="bb">
		<div id="b0" class="show"></div>
		<div id="table0" class="table" ></div>
	</div>
	
	<div id="baob2" class="bb">
		<div id="b1" class="show"></div>
		<div id="table1" class="table"></div>
	</div>
	<div id="baob3" class="bb">
		<div id="b2" class="show"></div>
		<div id="table2" class="table"></div>
	</div>
</div>
<div id="container2">
	<div id="download">
		<form action="${ctx}/baob/downloadbb.do" method="post" accept-charset="UTF-8" id="exportForm" class="form">
		<input id="download" type="button" class="search-btn" value="下载报表" onclick="openImage()"/>
		<center>
			<input type="hidden" name="img" id="img" />
			<input type="hidden" name="img1" id="img1" />
			<input type="hidden" name="img2" id="img2" />
			<input type="hidden" name="factory" id="factory" />
		</center>
	</form>
	</div>
	<!-- huxy_13164 -->
	<div id="btn_back">
		<input type="button"  name="back" id="back" value="返回">
	</div>
</div>

</body>