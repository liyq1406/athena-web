<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","64301");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_64301}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
	 		fields:[
				{fieldType:'fieldLabel',property:'rongqfhdh',caption:'${i18n.rongqbgdh}'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqfhdh'],
		id:'grid_user_${pageId}',
		src:'<%=request.getContextPath()%>/rongqi/64302.do',
		showCheckbox:false,
		//翻页查询交易
		cols:[
		{property:'rongqfhdh',caption:'${i18n.rongqfhdh}'},
		{property:'rongqbh',caption:'${i18n.rongqbaoh}'},				
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.tuifsl}'},  		
  		//0010495
  		{property:'gcbh',caption:'${i18n.gongcbh}'},
  		{property:'gcmc',caption:'${i18n.gongcmc}'},  		
  		{property:'create_time',caption:'${i18n.caozsj}'},
  		{property:'creator',caption:'${i18n.caozyhm}'}
  		]
	});
	
	//F5 激光打印补打
	$('#btn_print').bind('click',function(){
	        var params = [];
			params.push("usercenter="+st_UserCenter);
			
			var rongqfhdh = '${result.result.parameter.rongqfhdh}';			
			params.push("fanhdh="+rongqfhdh); 
			params.push("fanhjzq="+st_Rongqcbh); 
			
			$.ajax({					    
          			url:"<%=request.getContextPath()%>/rongqi/64307.do",
					type:'post', 
					dataType:'json', 
					data:params.join('&'),
					success:function(result){
							//alert( result.result.response);
							//var msg = result.result.parameter.list[0].value;
							
							 if(result.result.response=="C_1403"){
							         showMsg("${i18n.P64301_07}");
							         return false;
							 }else{				
							   if (result.result.response == "0000"||result.result.response == "0001"){	
							   		 					
									window.location.href="<%=request.getContextPath()%>/rongqi/64306.do?usercenter="+st_UserCenter+"&fanhdh="+rongqfhdh+"&cangkbh="+st_Cangkbh+st_Params;			       
									 
									$('#grid_user_${pageId}').grid('parseResult',results);
									$('.rongqfhdh').hide(); 						 
									rongqfhdh='';	
								}					 
							 }					 							 										 																					
						},
						error:function(){
								return false;
								alert("error");
						}								
					});					

	}); 
	//F7高速行补打
	$('#btn_print1').bind('click',function(){
			var params = [];
			params.push("usercenter="+st_UserCenter);
			var rongqfhdh = '${result.result.parameter.rongqfhdh}';			
			params.push("rongqfhdh="+rongqfhdh);
			 
			 var url = "<%=request.getContextPath()%>/rongqi/64308.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 //$('#grid_user_${pageId}').grid("parseResult",results);	
				 //$("#rongqfhdh input").val('');
			  }
			 });		
	});
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//设置供应商编号不可输入
		$("#gongysdm input").attr('disabled',true);
		//供应商编号赋值
		$('#chengysdm input').change(function(){
			$("#gongysdm input").val($('#chengysdm input').val());
		});
		//供应商编号赋值
		$('#chengysdm input').bind('input propertychange',function(){
			$("#gongysdm input").val($('#chengysdm input').val());
		});
		//加载返回数据
			$('#rongqfhdh span').html('${result.result.parameter.rongqfhdh}');
			
			
			
			$('#wuld span').html('${result.result.parameter.wuld}');
			$('#chengysdm span').html('${result.result.parameter.chengysdm}');
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	

	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始  huxy_13142-->
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
<form id="putform" method="post" name="putform" >
<input id="putvalue"   name="putvalue" type="hidden"></input>
</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
		  <table class="ui-grid" cellspacing="1" width="100%" >
		  	<tr>
              <td class="field-label">${i18n.danjbh}：</td>
              <td class="field-container"><div class="ui-field" id="rongqfhdh"></div></td>
            </tr>
          </table>
		  <br>
		<div align=right>		
	    <span id="btn_print"  class="ui-button">${i18n.jgdybud}[F6]</span>
	    <span id="btn_print1"  class="ui-button">${i18n.gshdbud}[F7]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	    </div>

<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
		<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>