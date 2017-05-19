<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<script type="text/javascript">
function doprint(billtype, params, url ,success){
	ajaxRequest(params, url, function(results){
		msgClear();
		if(results.result){
			for(var i=0; i<results.result.length ;i++){
				var jsondata = "["+ JSON.stringify(results.result[i])+"]";
				doprint_view(billtype,jsondata,null,null,null)
			}
			//回调函数
			if(success){
				success(results);
			} else {
				if (results.result.length < 1){
					showPromptMsg('blue',$.sdcui.resource.i18n['C_1403']);
				}
			}
			return true;
		} else {
			return false;
		}
	});
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
	document.getElementsByName("justDoPrint")[0].value = "true";
	var fm = document.getElementById("printform");
	fm.action = "<%=request.getContextPath()%>/webprint/print_doit.jsp";
	fm.target = "_blank";
	fm.submit();	
}
</script>
<form id="printform" name="printform" method="post">
	<input type="hidden" id="justDoPrint" name="justDoPrint" value=""/><!-- 立即预览打印 -->
	<input type="hidden" id="billcode" name="billcode" value=""/><!-- 单据号（唯一标识单据，用作打印历史维护） -->
	<input type="hidden" id="jsondataprovider" name="jsondataprovider" value=""/><!-- 自定义封装的json字符串 -->		
	<input type="hidden" id="selectedid" name="selectedid" value=""/><!-- 选择数据表格时的多选id -->
	<input type="hidden" id="clazzparams" name="clazzparams" value=""/><!-- 配置为clazz时传递的json形式参数 -->	
	<input type="hidden" id="templatecode" name="templatecode" value=""/><!-- 直接预览（打印）不进行模板选择时使用 -->
</form>

