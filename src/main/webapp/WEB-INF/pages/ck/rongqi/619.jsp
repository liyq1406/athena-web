<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","619");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_619}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                {fieldType:'fieldHidden',property:'danjbh'},
                {fieldType:'fieldText',property:'gongysmc1',dataType:'laiy',maxLength:'35',caption:'${i18n.weixsqbm}',notNull:true},
                {fieldType:'fieldText',property:'shengqr',maxLength:'10',caption:'${i18n.shengqr}',notNull:true,value:st_UserName},
                {fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.rongqsl}',notNull:true},
                {fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.yujwcsj}',notNull:true},
                {fieldType:'fieldText',property:'zaiy',maxLength:'25',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','chengysdm','gongysdm','wuld','creator','rongqsl','rongqxh','weixs','yujwcrq'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/61902.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'weixs',caption:'${i18n.weixsqdw}'},
		{property:'creator',caption:'${i18n.shenqr}'},
		{property:'yujwcrq',caption:'${i18n.yujwcsj}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},
		{property:'zaiy',caption:'${i18n.zhaiy}'}
  		
  		],
  		buttons:[ 		         
   				//F1 确认
      			{name:'btn_ok',caption:'${i18n.ok}[F1]',keyboard:'F1',action:function(){
      		 		 //参数校验
      		 		if(!$('#form_user_${pageId}').form("validateParam")){
      						return;	
      		 		}
      		 		 //提交数据
      		 		var params = $('#form_user_${pageId}').form("getFormParam");
      		 		params.push("danjbh="+$('#danjbh input').val());
      				params.push("currentPage="+currentPage);
      				$('#grid_user_${pageId}').grid("setQueryParams", params);
      		 		var url = "<%=request.getContextPath()%>/rongqi/61901.do";
      				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
      					 if (showPromptRequestMsg(results)==true){
      						 $('#grid_user_${pageId}').grid('parseResult',results)
      						 $('#danjbh input').val(results.result.parameter.danjbh);
      						 if (results.result.response == "0000"){
      							 $('#gongysmc1 input').attr("disabled",true);
      							 $('#shengqr input').attr("disabled",true);
      							 $("#zaiy input").attr("disabled",true);
      			    	         $("#zhongzsj input").attr("disabled",true);
   								 $('#rongqxh input').val('').focus();      							
      							 $('#rongqsl input').val('');
      							}
      					 }
      					 });
      			}},
   				//F3 打印
    			{name:'btn_print',caption:'${i18n.shurjs}[F3]',keyboard:'F3',action:function(){
    		 		if($('#danjbh input').val()==""){
    		 			showPromptMsg('red',$.sdcui.resource.i18n['C_danjbh']);
    		 			return;
    		 		}
    		 		var params = [];
    				params.push("usercenter="+st_UserCenter);
    				params.push("danjbh="+$('#danjbh input').val());
    				var url = "<%=request.getContextPath()%>/rongqi/61904.do";
    				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
    					 if (showPromptRequestMsg(results)==true){
    						 $('#grid_user_${pageId}').grid('parseResult',results)
    						   if (results.result.response == "0000"){
    							   var params2 = [];
    								params2.push("usercenter="+st_UserCenter);
    								params2.push("weixdh="+ $('#danjbh input').val());
    								var url2 = "<%=request.getContextPath()%>/rongqi/62903.do";
    								g_isSub=0;
    								doprint(629,params2,url2);
    						 		$('#form_user_${pageId}').form("resetFields");
    						 		$('#grid_user_${pageId}').grid('clearRecords');
    						 		$('#danjbh input').val("");
    						 		$('#wuld span').html(st_Rongqcbh);
    						 		$('#shengqr input').val(st_UserName);    				
    								$('#gongysmc1 input').attr("disabled",false);
    								$('#shengqr input').attr("disabled",false);
    								$("#zaiy input").attr("disabled",false);
          			    	        $("#zhongzsj input").attr("disabled",false);
    						  } 
    						 
    					 }
    			 });		
    				return false;
    			}},
   				//F4 单选
   				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
   					$('#grid_user_${pageId}').grid('selected');
   					return false;
   				}},
   				//删除
   				{name:'delete',caption:'${i18n.delete}[F5]',keyboard:'F5',action:function(){
   					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
   					if(records.length < 1){
   						showPromptMsg('red','${i18n.selectoneerror}')
   						return false;
   					}
   				    //打开提示框是否删除
   					if(confirm($.sdcui.resource.i18n['C_remove'])){
   			 		 //提交数据
   			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
   					params.push("danjbh="+$('#danjbh input').val());
   					params.push("wuld="+$("#wuld span").html());
   					params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
   					var url = "<%=request.getContextPath()%>/rongqi/61903.do";
   				     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
   					 if (showPromptRequestMsg(results)==true){
   						 $('#grid_user_${pageId}').grid("parseResult",results)
   					 }
   					 });
   					}
   					return false;
   				}},
   				//F11 返回上一页
   				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
   			    //F12 返回主页面
   				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
   				]
	});
	$(document).keyboardsupport({});
});
/**
  *进入619页面后进行查询
  */
 $(document).ready(function(){
    var params =[] ;
    params.push("wuld="+st_Rongqcbh);	
    var url = "<%=request.getContextPath()%>/rongqi/61902.do";
    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#danjbh input").val(results.result.parameter.danjbh);
		         $("#gongysmc1 input").val(results.result.parameter.gongysmc1);
    	         $("#shengbr input").val(results.result.parameter.shengbr);
    	         $("#zaiy input").val(results.result.parameter.zaiy);
    	         $("#zhongzsj input").val(results.result.parameter.zhongzsj);
    	         $('#grid_user_${pageId}').grid('parseResult',results);
    	         if($('#gongysmc1 input').val()!="" && $('#shengqr input').val()!=""){
    	        	$('#gongysmc1 input').attr("disabled",true);
					$('#shengqr input').attr("disabled",true);
					$("#zhongzsj input").attr("disabled",true);
  	         		$("#zaiy input").attr("disabled",true);
					$('#rongqxh input').val('').focus();
    	         }
   	         }
         }
        msgClear();
      });
 		return false;
 });
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<!--  <input id="danjbh" type="Hidden"></input>-->
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div>	</td>
	    <td class="field-label">${i18n.weixsqbm}：</td> 
		<td class="field-container"><div class="ui-field" id="gongysmc1"></div>	</td>
		<td class="field-label">${i18n.shenqr}：</td>
		<td class="field-container"><div class="ui-field" id="shengqr"></div>	</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div>	</td>
	  </tr>
      <tr>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div>	</td>
		<td class="field-label">${i18n.rongqsl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div>	</td>
		<td class="field-label">${i18n.yujwcsj}：</td>
		<td class="field-container"><div class="ui-field" id="zhongzsj"></div>	</td>
      </tr>
      <tr>
		<td class="field-label">${i18n.zhaiy}：</td>
		<td class="field-container"><div class="ui-field" id="zaiy"></div>	</td>
		<td class="field-label"></td>
		<td class="field-container"></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>
</table>
  <div id="grid_user_${pageId}" class='hidden-item'></div>
</div>		
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>