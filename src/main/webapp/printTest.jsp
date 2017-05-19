<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_101 }</title>
		<jsp:include page="WEB-INF/pages/common/js.jsp" />
	</head>
	<body>
		<!-- <input type="button" class="sysBtn" value="SQL打印" onclick="print3()"/>
		<input type="button" class="sysBtn" value="SQL打印（已知模版）" onclick="printveiw2()"/> -->
		<input type="button" class="sysBtn" value="JSON打印（已知模版）" onclick="printveiw1()"/>
		<br/>
		<input type="button" class="sysBtn" value="JSON模拟数据打印" onclick="print2()"/>
		
		<br></br>
        <div id="form_user" class="ui-fieldLayout"></div>
        <br></br>
		<form id="printformtest" class="ui-fieldLayout" name="printformtest" method="post">
		<table class="ui-grid" cellspacing="1" width="30%">
            <tbody>
                <tr>
                    <td><span style="width:10%">billtype:</span></td>
                    <td><input id="billtype" type="text"/></td>
                </tr>
                <tr>
                    <td><span style="width:10%">userid:</span></td>
                    <td><input id="userid" type="text"/></td>
                </tr>
                <tr>
                    <td><span style="width:10%">tempid:</span></td>
                    <td><input id="tempid" type="text"/></td>
                </tr>
                <tr>
                    <td><span style="width:10%">pageCommand:</span></td>
				    <td>
				        <select id="pageCommand">
					        <option>open</option>
					        <option>new</option>
				        </select>
				    </td>
                </tr>
                <tr>
                    <td><input id="printTestBtn" type="button" class="sysBtn" value="打印TEST" onclick="printTest()"/></td>
                    <td><input id="printTestBtn" type="button" class="sysBtn" value="预览TEST" onclick="printView()"/></td>
                </tr>
            </tbody>
        </table>
        </form>
<!-- 		<div><span style="width:120">billtype:</span><input id="billtype" type="text"/></div> -->
<!-- 		<div><span style="width:120">userid:</span><input id="userid" type="text"/></div> -->
<!-- 		<div>pageCommand：<select id="pageCommand"> -->
<!-- 		<option>open</option> -->
<!-- 		<option>new</option> -->
<!-- 		</select></div> -->
		
		
		
		<!-- <input type="button" class="sysBtn" value="自定义类模拟数据打印" onclick="print4()"/>-->
		<form id="printform" name="printform" method="post">
			<input type="hidden" id="justDoPrint" name="justDoPrint" value=""/><!-- 立即预览打印 -->
			<input type="hidden" id="billcode" name="billcode" value=""/><!-- 单据号（唯一标识单据，用作打印历史维护） -->
			<input type="hidden" id="jsondataprovider" name="jsondataprovider" value=""/><!-- 自定义封装的json字符串 -->		
			<input type="hidden" id="selectedid" name="selectedid" value=""/><!-- 选择数据表格时的多选id -->
			<input type="hidden" id="clazzparams" name="clazzparams" value=""/><!-- 配置为clazz时传递的json形式参数 -->	
			<input type="hidden" id="templatecode" name="templatecode" value=""/><!-- 直接预览（打印）不进行模板选择时使用 -->
		</form>
	</body>
</t:html>
<script type="text/javascript">
/**
*通过选取模板进行打印
*@typecode 单据类型编码（数据表sys_print_billtype标识字段，TYPECODE）
*@jsondataprovider 打印数据json串（sdc底层使用的json串封装函数不适用，因为存在回车和tab位占位符，flex无法识别
*@selectedid 打印方式为SQL时，主键标识（可以理解为单据编号billcode的值，多值间用","分隔）
*@clazzparams 打印方式为CLAZZ是，传入的值可以为字符串，例如json的字符串，后台自行进行解析（如果没有参数请传递"{}"）
*@billcode 单据编号标识字符串（记录打印历史的标识，如不记录打印历史，可以传递null）
* jsondataprovider、selectedid、clazzparams三个参数与打印类型的打印方式相关，默认为JS，即如果传递了jsondataprovider参数，则
* 不管打印参数是JS、SQL、CLAZZ，都会以这个jsondataprovider参数的数据为打印数据。
* 如果jsondataprovider传递为空，证明打印方式可能为SQL或CLAZZ，所以，应对应传递selectedid来指定SQL的查询关键词（一般为PK），
* 或对应传递clazzparams来指定自定义类中接到的参数（一般为字符串）
*/
function openTemplate(typecode,jsondataprovider,selectedid,clazzparams,billcode){
	//根据打印方式的不同将数据放到相应 的变量中。
	document.getElementById("jsondataprovider").value=jsondataprovider!=null?jsondataprovider:'';
	document.getElementById("selectedid").value=selectedid!=null?selectedid:'';
	document.getElementById("clazzparams").value=clazzparams!=null?clazzparams:'';
	document.getElementById("billcode").value=billcode!=null?billcode:'';
   	//var openedwin = window.showModalDialog("${ctx}/sys/templateType.do?typecode="+typecode,obj,"dialogWidth=520px;dialogHeight=360px");
  //弹出页面采用iframe形式弹出
	toft.getComp('dlgTemplateType').open("${ctx}/sys/templateType.do?typecode="+typecode);
}

/**
*已知模板，直接预览
*@templatecode 已知的模板编码（数据表标识字段，TCODE）
*@jsondata 打印数据json串（sdc底层使用的json串封装函数不适用，因为存在回车和tab位占位符，flex无法识别
*@selectedid 打印方式为SQL时，主键标识（可以理解为单据编号billcode的值，多值间用","分隔）
*@clazzparams 打印方式为CLAZZ是，传入的值可以为字符串，例如json的字符串，后台自行进行解析（如果没有参数请传递"{}"）
*@billcode 单据编号标识字符串（记录打印历史的标识，如不记录打印历史，可以传递null）
* jsondata、selectedid、clazzparams三个参数与打印类型的打印方式相关，默认为JS，即如果传递了jsondata参数，则
* 不管打印参数是JS、SQL、CLAZZ，都会以这个jsondata参数的数据为打印数据。
* 如果jsondata传递为空，证明打印方式可能为SQL或CLAZZ，所以，应对应传递selectedid来指定SQL的查询关键词（一般为PK），
* 或对应传递clazzparams来指定自定义类中接到的参数（一般为字符串）
*/
function doprint_view(templatecode,jsondata,selectedid,clazzparams,billcode){
	document.getElementsByName("jsondataprovider")[0].value = jsondata;
	document.getElementsByName("selectedid")[0].value=selectedid;
	document.getElementsByName("clazzparams")[0].value=clazzparams;
	document.getElementsByName("billcode")[0].value = billcode;
	document.getElementsByName("templatecode")[0].value = templatecode;
	document.getElementsByName("justDoPrint")[0].value = "false";
	var fm = document.getElementById("printform");
	fm.action = "<%=request.getContextPath()%>/webprint/print_doit.jsp";
	fm.target = "_blank";
	fm.submit();	
}

function printveiw1(){
	/*var arrChoosed = new Array();
	arrChoosed= toft.getComp("grid").getSelections();//获取多行数据数组;
	var templateCode = "";
	if(arrChoosed.length>1){
		//多选
		templateCode = 'JTNBZZPJLB';
		var P_ACCOUNT = new Array();
		var P_NAME = new Array();
		var C_ACCOUNT = new Array();
		var C_NAME = new Array();
		var AMOUNT = new Array();
		var AMOUNT_CN = new Array();
		var CORP = new Array();
		var DESCRIPTION = new Array();
		var strtemp = "[{";
		for(var i=0;i<arrChoosed.length;i++){
			P_ACCOUNT.push('"'+arrChoosed[i].pAccount+'"');
			P_NAME.push('"'+arrChoosed[i].pName+'"');
			C_ACCOUNT.push('"'+arrChoosed[i].cAccount+'"');
			C_NAME.push('"'+arrChoosed[i].cName+'"');
			AMOUNT.push('"'+arrChoosed[i].amount+'"');
			AMOUNT_CN.push('"'+arrChoosed[i].amount+'"');
			CORP.push('"'+arrChoosed[i].corp+'"');
			DESCRIPTION.push('"'+arrChoosed[i].description+'"');
		}
		strtemp+='"BILLKEY":"TESTLOOP",'
		strtemp+='"P_ACCOUNT":['+P_ACCOUNT.toString()+'],';
		strtemp+='"P_NAME":['+P_NAME.toString()+'],';
		strtemp+='"C_ACCOUNT":['+C_ACCOUNT.toString()+'],';
		strtemp+='"C_NAME":['+C_NAME.toString()+'],';
		strtemp+='"AMOUNT":['+AMOUNT.toString()+'],';
		strtemp+='"AMOUNT_CN":['+AMOUNT_CN.toString()+'],';
		strtemp+='"CORP":['+CORP.toString()+'],';
		strtemp+='"DESCRIPTION":['+DESCRIPTION.toString()+']';
		strtemp += "}]";
	}else{
		//单选
		templateCode = 'JTNBZZPJ';
		
		var strtemp = "[";
		for(var i=0;i<arrChoosed.length;i++){
			if(i==arrChoosed.length-1){
				strtemp += '{"BILLKEY":"TESTSINGLE","P_ACCOUNT":"'+arrChoosed[i].pAccount+'","P_NAME":"'+arrChoosed[i].pName+'","C_ACCOUNT":"'+arrChoosed[i].cAccount+'","C_NAME":"'+arrChoosed[i].cName+'","AMOUNT":"'+arrChoosed[i].amount+'","AMOUNT_CN":"'+arrChoosed[i].amount+'","CORP":"'+arrChoosed[i].corp+'","DESCRIPTION":"'+arrChoosed[i].description+'","date":"1288599036921"}';
			}else{
				strtemp += '{"BILLKEY":"TESTSINGLE","P_ACCOUNT":"'+arrChoosed[i].pAccount+'","P_NAME":"'+arrChoosed[i].pName+'","C_ACCOUNT":"'+arrChoosed[i].cAccount+'","C_NAME":"'+arrChoosed[i].cName+'","AMOUNT":"'+arrChoosed[i].amount+'","AMOUNT_CN":"'+arrChoosed[i].amount+'","CORP":"'+arrChoosed[i].corp+'","DESCRIPTION":"'+arrChoosed[i].description+'","date":"1288599036921"},';
			}
		}
		strtemp += "]";
	}*/
	
	templateCode = "tt";
	strtemp = '[{"T_DESC":["desc1","desc2"],"ACCOUNT":"account"}]';
	//alert(strtemp);
    doprint_view(templateCode,strtemp,null,null,'tt');
}
function printveiw2(){
	var arrChoosed = new Array();
	arrChoosed= toft.getComp("grid").getSelections();//获取多行数据数组
	var ids = new Array();
	for(var i=0;i<arrChoosed.length;i++){
		ids.push(arrChoosed[i].billid);
	}
	if(arrChoosed.length>1){
		//多选
		templateCode = 'JTNBZZPJLB';
	}else{
		//单选
		templateCode = 'JTNBZZPJ';
	}
	doprint_view(templateCode,null,ids.toString(),null,'BILLID');	
}


function print(){
	//1 获得表格中圈中的行
	//2for（）拼凑p
	var arrChoosed = new Array();
	arrChoosed= toft.getComp("grid").getSelections();//获取多行数据数组
	//var p= '[{"P_ACCOUNT":"15522","P_NAME":"sdf","C_ACCOUNT":"5521","C_NAME":"dsfds","AMOUNT":"300","AMOUNT_CN":"","CORP":"adsad","DESCRIPTION":"asda"},{"P_ACCOUNT":"123456","P_NAME":"李四","C_ACCOUNT":"789456","C_NAME":"张三","AMOUNT":"300000","AMOUNT_CN":"","CORP":"韩失色呃呃呃","DESCRIPTION":"阿斯多夫的饿饿饿饿饿"}]';
	var strtemp = "[";
	for(var i=0;i<arrChoosed.length;i++){
		if(i==arrChoosed.length-1){
			strtemp += '{"P_ACCOUNT":"'+arrChoosed[i].pAccount+'","P_NAME":"'+arrChoosed[i].pName+'","C_ACCOUNT":"'+arrChoosed[i].cAccount+'","C_NAME":"'+arrChoosed[i].cName+'","AMOUNT":"'+arrChoosed[i].amount+'","AMOUNT_CN":"'+arrChoosed[i].amount+'","CORP":"'+arrChoosed[i].corp+'","DESCRIPTION":"'+arrChoosed[i].description+'","date":"1288599036921"}';
		}else{
			strtemp += '{"P_ACCOUNT":"'+arrChoosed[i].pAccount+'","P_NAME":"'+arrChoosed[i].pName+'","C_ACCOUNT":"'+arrChoosed[i].cAccount+'","C_NAME":"'+arrChoosed[i].cName+'","AMOUNT":"'+arrChoosed[i].amount+'","AMOUNT_CN":"'+arrChoosed[i].amount+'","CORP":"'+arrChoosed[i].corp+'","DESCRIPTION":"'+arrChoosed[i].description+'","date":"1288599036921"},';
		}
	}
    strtemp += "]";
	//document.getElementById("jsondataprovider").value = strtemp;
	//document.getElementById("billcode").value = "BILL005585";
	
	openTemplate('111',strtemp,null,null,'BILL005585');	
}
function print2(){
	var jsondata = '[{"DEBIT":["1500","15000","20000","","","","1000","3500"],"ABSTRACT":["实时归集","实时归集","实时归集","实时下拨","实时下拨","实时下拨","实时归集","实时归集"],"T_DATE":["20081225","20081225","20081226","20081226","20081227","20081227","20081227","20081228"],"datetime":"2010-10-22","CURRENCY":"人民币","ACCOUNT":"一汽财务公司","CREDIT":["","","","15000","3000","1780","",""],"T_DESC":["35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司"],"UNIT":"元","ACODE":"35010188000060766"}]';
	openTemplate('XBD',jsondata,null,null,null);
}
function print3(){
	var arrChoosed = new Array();
	arrChoosed= toft.getComp("grid").getSelections();//获取多行数据数组
	var ids = new Array();
	for(var i=0;i<arrChoosed.length;i++){
		ids.push(arrChoosed[i].billid);
	}
	//document.getElementById("selectedid").value=;
	//document.getElementById("billcode").value = "BILL-SQL";
	openTemplate('111',null,ids.toString(),null,'BILLID');	
}
////+"?method="+datagrid3_options.queryParams.method+"&formid="+datagrid3_options.queryParams.formid+"&formcode="+datagrid3_options.queryParams.formcode+"&preview=true";
function test222(){
	var queryStr = datagrid3_options.url;
	toft.ajax( {
		url:datagrid3_options.url,
		data:datagrid3_options.queryParams,
		success:function (result){
	        var key = datagrid3_options.idField;
	        arrChoosed= toft.getComp(datagrid3_options.id).getSelections();//获取多行数据数组
			var ids = new Array();
			for(var i=0;i<arrChoosed.length;i++){
				ids.push(arrChoosed[i].billid);
			}
			var sql = result;
			var params = '{"params":{"sql":"'+sql+'","ids":['+ids.toString+'],"key":'+key+'}}'
			openTemplate('XBD',null,null,params,'BILL-Clazz');
        }
	});
}
function print4(){
	//document.getElementById("clazzparams").value='{"params":["aaa","bbb","ccc"]}';
	//document.getElementById("billcode").value = "BILL-Clazz";
	//获取页面参数，封装为字符串，会传递到“com.toft.widgets.printark.IDoprint! public 
	//String getDataByJson(Object param)”
	openTemplate('XBD',null,null,'{"params":["aaa","bbb","ccc"]}','BILL-Clazz');
}

$(function(){
	$('#form_user').form({
        fields:[
        ]
    });
	
    $('#billtype').bind('keydown','return',function(){
    	var userid = $('#userid').val("");
    	var tempid = $('#tempid').val("");
    	var billtype = $('#billtype').val();
    	
    	if (billtype == "308"){
    		var userid = $('#userid').val("002");
    	    var tempid = $('#tempid').val("13367089793591525238");
    	} else if (billtype == "601"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("13371361741401956484");
    	} else if (billtype == "621"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("13371383870461929782");
        } else if (billtype == "629"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("13376681776871652366");
        } else if (billtype == "630"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("13376682190461995860");
        }else if (billtype == "408"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("40801");
        } else if (billtype == "411"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("41101");
        } else if (billtype == "503"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("50301");
        } else if (billtype == "511"){
            var userid = $('#userid').val("temp");
            var tempid = $('#tempid').val("51101");
        }
    	
    	$('#pageCommand').focus();
    });
    
    $(document).bind('keydown','F8',function(){
    	var pageId = "308";
    	printView(pageId);
    });
    
    
});

function printView(){
	var billtype = $('#billtype').val();
	var params = [];
	if (!billtype){
		alert("请填入billtype!")
		return; 
	}
    if (billtype == "308"){
    	var url="<%=request.getContextPath()%>/beihuo/308.do";
    } else if (billtype == "601"){
        params.push("usercenter=abc");
        params.push("jsfhdh=b00000044");
    	var url="<%=request.getContextPath()%>/rongqi/60104.do";
    } else if (billtype == "621"){
        params.push("usercenter=abc");
        params.push("jsfhdh=b00000044");
    	var url="<%=request.getContextPath()%>/rongqi/62105.do";
    }  else if (billtype == "629"){
        params.push("usercenter=abc");
        params.push("weixdh=b153");
        var url="<%=request.getContextPath()%>/rongqi/62903.do";
    } else if (billtype == "630"){
        params.push("usercenter=abc");
        params.push("danjbh=b003");
        var url="<%=request.getContextPath()%>/rongqi/63002.do";
    } else if (billtype == "408"){
        params.push("usercenter=abc");
        params.push("zhijqdh='b000071','b000070'");
        var url="<%=request.getContextPath()%>/yichang/40805.do";
    } else if (billtype == "411"){
    	params.push("usercenter=abc");
    	params.push("zhijjjbgdh='b000003','b000006'");
    	var url="<%=request.getContextPath()%>/yichang/41108.do";
    }  else if (billtype == "503"){
    	params.push("usercenter=abc");
    	params.push("jizxh='jzx001','jzx002'");
    	var url="<%=request.getContextPath()%>/shenbao/50305.do";
    } else if (billtype == "511"){
    	params.push("usercenter=abc")
    	params.push("wulid=B12")
    	params.push("qswulid=B12")
    	params.push("zzwulid=B12")
    	var url="<%=request.getContextPath()%>/shenbao/51105.do";
    }

	$('#form_user').form("submitUrl", params, url, function(results){
		if (results.result.length < 20){
			for(var i=0; i<results.result.length ;i++){
				var jsondata = "["+ JSON.stringify(results.result[i])+"]";
				doprint_view(billtype,jsondata,null,null,billtype);
			}
		} else {
			var jsondata = results.result;
			//alert(jsondata);
			//var jsondata = '[{"BAOZDYKH":"00035","TIAOMH":"Tb000B0000350Tb000B000035","LINGJLB":"0","SHENGCXH":"CX031","XIAOHDBH":"10007","YAOHL":"120","PEISL":"35","XUH":["0","0","0"],"WEIZ":[null,null,null],"LINGJH":["tb00B00035","tb00B00035","tb00B00035"],"LIUSH":["W00192801","W00193201","W00193401"],"LINGJMC":["螺丝钉D","螺丝钉D","螺丝钉D"],"YAOHSL":["40","40","40"],"SHANGX":["2012-04-24 08:00:00.0","2012-04-24 08:00:00.0","2012-04-24 08:00:00.0"],"ELH":["eb00b00035","eb00b00035","eb00b00035"]}]';
			//打印预览
			doprint_view(billtype,jsondata,null,null,billtype);
		      //直接打印
	        //openTemplate(pageId,jsondata,null,null,null);
		}
	});
}


function printTest()
{
// 	document.getElementsByName("jsondataprovider")[0].value = jsondata;
// 	document.getElementsByName("selectedid")[0].value=selectedid;
// 	document.getElementsByName("clazzparams")[0].value=clazzparams;
// 	document.getElementsByName("billcode")[0].value = billcode;
// 	document.getElementsByName("templatecode")[0].value = templatecode;
// 	document.getElementsByName("justDoPrint")[0].value = "false";
// 	var fm = document.getElementById("printformtest");
	var fmtest = $('#printformtest');
	var billtype = $('#billtype').val();
	var userid = $('#userid').val();
	var tempid = $('#tempid').val();
	var pageCommand = $('#pageCommand').val();
	if (!billtype){
        alert("请填入billtype!");
        return;
    }
    if (!userid){
        alert("请填入userid!");
        return;
    }
	if (pageCommand == "open"){
	    if (!tempid){
	        alert("请填入tempid!");
	        return;
	    }
		window.location ="<%=request.getContextPath()%>/webprint/print_designer.jsp?billtype="+billtype+"&pageCommand="+pageCommand+"&userid="+userid+"&id="+tempid;	
	}else if(pageCommand == "new"){
		window.location ="<%=request.getContextPath()%>/webprint/print_designer.jsp?billtype="+billtype+"&pageCommand="+pageCommand+"&userid="+userid;
	}
	
<%--  	fmtest.action = "<%=request.getContextPath()%>/print_designer.jsp?billtype="+billtype+"&pageCommand="+pageCommand+"&userid="+userid; --%>
// 	fmtest.target = "_blank";
// 	fmtest.submit();
}
//function test(){
	// var strtemp='[{"Name":["邓伟","杨文胜","韩瑞丽","郝伟","张耀春"],"address":["邢台","山东","沧州","山东","上海"],"school":["河北科技大学","忘了","河北科技大学","天津工业","天津师范"],"birthday":["1987-01-02","1987-01-03","1987-01-04","1987-01-05","1987-01-06"],"hobby":["玩游戏","看电影","逛街","工作","学习"]}]';
	//openTemplate('test2',strtemp,null,null,'');
//}
	
</script>

