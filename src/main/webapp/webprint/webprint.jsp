<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="web打印">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			function initPage(){
				//页面初始化
				$('#btn_print').bind('click',function(){
					var templatecode = "JTNBZZPJ";
					//var jsondata = '[{"DEBIT":["1500","15000","20000","","","","1000","3500"],"ABSTRACT":["实时归集","实时归集","实时归集","实时下拨","实时下拨","实时下拨","实时归集","实时归集"],"T_DATE":["20081225","20081225","20081226","20081226","20081227","20081227","20081227","20081228"],"datetime":"2010-10-22","CURRENCY":"人民币","ACCOUNT":"一汽财务公司","CREDIT":["","","","15000","3000","1780","",""],"T_DESC":["35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司","35140188000012345一汽财务公司分公司"],"UNIT":"元","ACODE":"35010188000060766"}]';
					
					var jsondata = '[{"P_ACCOUNT":"15522","P_NAME":"sdf","C_ACCOUNT":"5521","C_NAME":"AAA","AMOUNT":"300","AMOUNT_CN":"300","CORP":"BBB","DESCRIPTION":"abcd"},{"P_ACCOUNT":"123456","P_NAME":"李四","C_ACCOUNT":"789456","C_NAME":"张三","AMOUNT":"300000","AMOUNT_CN":"300000","CORP":"公司名称","DESCRIPTION":"描述信息"}]';
					var selectedid = null;
					var clazzparams = null;
					var billcode = "BILLKEY";
					doprint_view(templatecode,jsondata,selectedid,clazzparams,billcode);
				});
			}
			
			/**
			*已知模板，直接预览
			*@templatecode 已知的模板编码（数据表标识字段，TCODE）
			*@jsondata 打印数据json串（sdc底层使用的json串封装函数不适用，因为存在回车和tab位占位符，flex无法识别
			*@selectedid 打印方式为SQL时，主键标识（可以理解为单据编号billcode的值，多值间用","分隔）
			*@clazzparams 打印方式为CLAZZ是，传入的值可以为字符串，例如json的字符串，后台自行进行解析（如果没有参数请传递"{}"）
			*@billcode 单据编号标识字符串（记录打印历史的标识，打印平台会自动判断此值是变量，还是常量（变量为根据此key在json对象中搜寻value，常量即为value），如不记录打印历史，可以传递null）
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
				fm.action = "print_doit.jsp";
				fm.target = "_blank";
				fm.submit();	
			}
		</script>
	</head>
	<t:page>
		<form id="printform" name="printform" method="post">
			<div>
				<input type="text" id="justDoPrint" name="justDoPrint" value=""/><!-- 立即预览打印 -->
				<input type="text" id="billcode" name="billcode" value=""/><!-- 单据号（唯一标识单据，用作打印历史维护） -->
				<input type="text" id="jsondataprovider" name="jsondataprovider" value=""/><!-- 自定义封装的json字符串 -->		
				<input type="text" id="selectedid" name="selectedid" value=""/><!-- 选择数据表格时的多选id -->
				<input type="text" id="clazzparams" name="clazzparams" value=""/><!-- 配置为clazz时传递的json形式参数 -->	
				<input type="text" id="templatecode" name="templatecode" value=""/><!-- 直接预览（打印）不进行模板选择时使用 -->
			</div>
			<div>
				<input type="button" value="打印" id="btn_print"></input>
			</div>
		</form>	
	</t:page>
</t:html>