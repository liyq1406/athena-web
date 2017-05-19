<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","614");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_614}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp"/>
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'rongqidblx',caption:'${i18n.diaoblx}',notNull:false,internation:true,onselect:'flagchange()',src:'<%=request.getContextPath()%>/common/diaoblx.do',value:'${i18n.diaobck}'}                
	 			]
 		});
	$('#form_user1_${pageId}').form({
		onreload:true,
 		fields:[               
                {fieldType:'fieldText',property:'diaobdh1',dataType:'diaobdh',caption:'${i18n.diaobdh}',notNull:true}
	 			]
 		});
	$('#form_user2_${pageId}').form({
		onreload:true,
		showCheckbox:true,
 		fields:[               
                {fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.diaobdh}',notNull:true},
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
                {fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:true},
                {fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:true},             
                {fieldType:'fieldLabel',property:'diaoruwld',value:st_Rongqcbh}, 
                {fieldType:'fieldSelect',property:'wuld',maxLength:'10',caption:'${i18n.diaochurqq}',notNull:true,src:'<%=request.getContextPath()%>/common/diaorurqq611.do?rongqcbh='+st_Rongqcbh},
                {fieldType:'fieldText',property:'shengbr',maxLength:'10',caption:'${i18n.shengbr}',notNull:true},
                {fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.rongqsl}',notNull:true},
                {fieldType:'fieldText',property:'zhuangt',caption:'${i18n.zhuangt}',notNull:true},  
                {fieldType:'fieldHidden',property:'rongqcbh',value:st_Rongqcbh}
	 			]
 		});
	var par=[];
	gridload();
	function gridload()
	{
		$('#grid_user1_${pageId}').grid({
			keyFields:['rongqxh','wuld','gongysdm','chengysdm','diaoruwld','rongqsl2','diaobdh'],
			id:'grid_user1_${pageId}',
			showCheckbox:false,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/61401.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/61402.do?zhuangtsx=3',
			cols:[
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
			{property:'rongqsl',caption:'${i18n.diaobsl}'},
			{property:'yidbsl',caption:'${i18n.weidbsl}'},
			{property:'rongqsl2',caption:'${i18n.chuksl}',editor:'fieldText',dataType:'plusinteger'},
	  		{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
	  		{property:'wuld',caption:'${i18n.diaochurqq}'},
	  		//{property:'gongysdm',caption:'${i18n.gongys}'},
	  		{property:'chengysdm',caption:'${i18n.wuls}'}	  		
	  		]
		});
		$('#grid_user2_${pageId}').grid({
			keyFields:['rongqxh','diaobdh','rongqsl','diaobdh'],
			id:'grid_user2_${pageId}',
			showCheckbox:true,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/61405.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/61404.do?zhuangtsx=3',
			cols:[
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
			{property:'rongqsl',caption:'${i18n.rongqsl}',editor:'fieldText',dataType:'plusinteger'},
			//{property:'yidbsl',caption:'${i18n.yidbsl}'},
			{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
	  		{property:'wuld',caption:'${i18n.diaochurqq}'},
	  		//{property:'gongysdm',caption:'${i18n.gongys}'},
	  		{property:'chengysdm',caption:'${i18n.wuls}'}	  		
	  		]
		});
	}
		
	
	//F1查询
 	$('#btn_search').bind('click',function(){
 		currentPage=1;
 		//参数校验
		  if(!$('#form_user1_${pageId}').form("validateParam")){
				return;	
		}
 		 //提交数据
 		var params = [];
 		params.push("diaobdh="+$('#diaobdh1 input').val()); 
		params.push("currentPage="+currentPage);
		params.push("rongqcbh="+st_Rongqcbh);
		$('#grid_user1_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61401.do";
		 $('#form_user1_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user1_${pageId}').grid("parseResult",results);
					if (results.result.response == "0001"){
						par=[];
						par.push('diaobdh='+$('#diaobdh input').val());
					}
					gridload();
			 }
			 });
 	});
	//页面加载时显示form1 grid1 隐藏form2 grid2
	$('#form_user2_${pageId}').hide();
	$('#grid_user2_${pageId}').hide();
	$('#fomuser2').hide();	
	//F2 确认
 	$('#btn_ok').bind('click',function(){
 		currentPage=1;
 		 //参数校验
 		//参数校验
		  if(!$('#form_user2_${pageId}').form("validateParam")){
				return;	
		}
 		//提交数据
 		var url;
 		var params = $('#form_user2_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
		params.push("zhuangtsx=1");
		$('#grid_user2_${pageId}').grid("setQueryParams", params);
 		url = "<%=request.getContextPath()%>/rongqi/61403.do";
		 $('#form_user2_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid	
				//$('#grid_user2_${pageId}').grid('clearRecords');						
				$('#grid_user2_${pageId}').grid("parseResult",results);
					 if (results.result.response == "0000"){
							 $('#diaobdh input').attr("disabled",true);
							 $('#gongysdm input').attr("disabled",true);
							 $('#chengysdm input').attr("disabled",true);
							 $('#diaoruwld input').attr("disabled",true);
							 $('#wuld input').attr("disabled",true);
							 $('#shengbr input').attr("disabled",true);
							 $('#zhuangt input').attr("disabled",true);
							 $('#rongqxh input').val('').focus();
							 $('#rongqsl input').val('');
						 }
			 }
			 });
		});
	//F3  删除
 	$('#btn_delete').bind('click',function(){
		//获取选择行
 		var params = $('#grid_user2_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
 		currentPage=1;
      //获取表单数据
      var p=[];
        var parm=$('#form_user2_${pageId}').form("getFormParam");
			var dhdh="";
				//去掉List[0];
				for(i=0;i<parm.length;i++){
					parm[i]=parm[i].toString().replace("list[0].","");
				var vParam = parm[i].split("=");
			if (vParam[0].indexOf("diaobdh") != -1){            
				dhdh = vParam[1];
				continue;
		     }
				}
        var params = $('#grid_user2_${pageId}').grid('getSelectedAll');
		params.push("currentPage="+currentPage);
		params.push("zhuangtsx=2");
		params.push("diaobdh="+dhdh);
		$('#grid_user2_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61404.do";
		 $('#form_user2_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid					
					if (results.result.response == "0001"){
						$('#grid_user2_${pageId}').grid("parseResult",results);
					}
					//gridload();
			 }
			 });
 	});
	
	//F4  选中
 	$('#btn_selected').bind('click',function(){
 		$('#grid_user2_${pageId}').grid('selected');
        msgClear();
        return false;
 	});
	
	//F5 结束录入
 	$('#btn_endinput').bind('click',function(){
 		currentPage=1;
 		 //提交数据
 		var params = $('#form_user2_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
		$('#grid_user2_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61403.do";
		 $('#form_user2_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){	
					if (results.result.response == "0000"){
						//$('#grid_user2_${pageId}').grid("parseResult",results);
						//var params2 = [];
						params.push("danjlxxx=1");
						params.push("usercenter="+st_UserCenter);
						//params2.push("diaobdh="+ $('#diaobdh input').val());
						var url2 = "<%=request.getContextPath()%>/rongqi/61103.do";
						g_isSub=0;
						doprint(611,params,url2);
						$('#grid_user2_${pageId}').grid('clearRecords');
						$('#form_user2_${pageId}').form("resetFields");	
						$('#diaoruwld span').html(st_Rongqcbh);
						$('#diaobdh input').attr("disabled",false);
						$('#gongysdm input').attr("disabled",true);
						$('#chengysdm input').attr("disabled",false);
						$('#diaoruwld input').attr("disabled",false);
						$('#wuld input').attr("disabled",false);
						$('#shengbr input').attr("disabled",false);
						$('#zhuangt input').attr("disabled",false);						
					}
					//加载grid
					gridload();
			 }
			});
 	});
	//F6   确认并打印
 	$('#btn_print').bind('click',function(){
 		currentPage=1;
 		  if(!$('#form_user1_${pageId}').form("validateParam")){
				return;	
		}
 		 //提交数据
 		var params = $('#form_user1_${pageId}').form("getFormParam");
 		params.push("diaobdh="+$('#diaobdh1 input').val()); 
		params.push("currentPage="+currentPage);
		params.push("zhuangt=1");
		//params.push("zhuangtsx=3");
		$('#grid_user1_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61402.do";
		 $('#form_user1_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					if (results.result.response == "0001"){	
						//var params2 = [];
						params.push("usercenter="+st_UserCenter);
						//params2.push("diaobdh="+ $('#diaobdh input').val());
						var url2 = "<%=request.getContextPath()%>/rongqi/61103.do";
						g_isSub=0;
						doprint(611,params,url2);
						 $('#grid_user1_${pageId}').grid('clearRecords');
						 $('#form_user1_${pageId}').form("resetFields");					
						 $('#diaobdh input').attr("readonly",false);
						 $('#gongysdm input').attr("readonly",false);
						 $('#chengysdm input').attr("readonly",false);
						 $('#wuld input').attr("readonly",false);
						 $('#shengbr input').attr("readonly",false);
						 $('#zhuangt input').attr("readonly",false);
						 gridload();
					}					
			 }
			 });
 	});
	$(document).keyboardsupport({});
});
function flagchange(){
	if($("#rongqidblx input").attr("realValue")=='1'){
		$('#form_user1_${pageId}').hide();
		$('#grid_user1_${pageId}').hide();
		$('#fomuser1').hide();
		$('#form_user2_${pageId}').show();
		$('#grid_user2_${pageId}').show();
		$('#fomuser2').show();
	    var params =[] ;
        params.push("diaoruwld="+st_Rongqcbh);	
        var url = "<%=request.getContextPath()%>/rongqi/61405.do";
       $('#form_user2_${pageId}').form("submitUrl", params, url, function(results){
	   if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 params.push("diaobdh="+results.result.parameter.diaobdh);
				 $('#grid_user2_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#diaobdh input").val(results.result.parameter.diaobdh);
		         $("#wuld input").val(results.result.parameter.wuld);
		         $("#wuld input").attr('realValue',results.result.parameter.wuld);
   	             $("#shengbr input").val(results.result.parameter.shengbr);
   	             $("#gongysdm input").val(results.result.parameter.gongysdm);
	             $("#chengysdm input").val(results.result.parameter.chengysdm);
   	             $('#grid_user2_${pageId}').grid('parseResult',results);
   	             if(
   	            		$('#diaobdh input').val()!="" &&
   	            		$('#gongysdm input').val()!="" &&
   					    $('#chengysdm input').val()!="" &&
   					    $('#diaoruwld input').val()!="" &&
   					    $('#wuld input').val()!="" &&
   					    $('#shengbr input').val()!="" &&
   					    $('#zhuangt input').val()!=""
   	            		 ){
		   	            	 $('#diaobdh input').attr("disabled",true);
							 $('#gongysdm input').attr("disabled",true);
							 $('#chengysdm input').attr("disabled",true);
							 $('#diaoruwld input').attr("disabled",true);
							 $('#wuld input').attr("disabled",true);
							 $('#shengbr input').attr("disabled",true);
							 $('#zhuangt input').attr("disabled",true);
							 $('#rongqxh input').val('').focus();
   	             }
  	         }
        }
       msgClear();
     });
		return false;	
	}else{
		$('#form_user2_${pageId}').hide();
		$('#grid_user2_${pageId}').hide();
		$('#fomuser2').hide();
		$('#form_user1_${pageId}').show();
		$('#grid_user1_${pageId}').show();
		$('#fomuser1').show();
		$('#diaobdh input').attr("readonly",false);
	}
}
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
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<!-- 
<input id="diaobdh" name="diaobdh" type="Hidden"></input>
 -->
 <div id="form_user_${pageId}" class="ui-fieldLayout">
	<table class="ui-grid" cellspacing="1" width="100%" >
		<tr>
			<td class="field-label">${i18n.diaoblx}：</td>
			<td class="field-container"><div class="ui-field" id="rongqidblx"></div></td>	
		</tr>		
	</table>
</div>
<div id="form_user1_${pageId}" class="ui-fieldLayout">
	<table class="ui-grid" cellspacing="1" width="100%" >
		<tr>
			<td class="field-label">${i18n.diaobdh}：</td>
			<td class="field-container"><div class="ui-field" id="diaobdh1"></div></td>		
		</tr>		
	</table>
</div>
<div id="form_user2_${pageId}" class="ui-fieldLayout">
	<table class="ui-grid" cellspacing="1" width="100%" >
		<tr>
			<td class="field-label">${i18n.diaobdh}：</td>
			<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>	
			<td class="field-label">${i18n.rongqxh}：</td>
			<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
			<td class="field-label">${i18n.gongysdm}：</td>
			<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>	
			<td class="field-label">${i18n.chengysdm}：</td>
			<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>	
		</tr>	
		<tr>	
			<td class="field-label">${i18n.diaorurqq}：</td>
			<td class="field-container"><div class="ui-field" id="diaoruwld"></div></td>
		    <td class="field-label">${i18n.diaochurqq}：</td>
			<td class="field-container"><div class="ui-field" id="wuld"></div></td>
			<td class="field-label">${i18n.shengbr}：</td>
			<td class="field-container"><div class="ui-field" id="shengbr"></div></td>
			<td class="field-label">${i18n.rongqsl}：</td>
			<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>				
		</tr>	
	</table>
</div>
<div>
	<table class="ui-grid" cellspacing="1" width="100%" id="fomuser1">
		<tr>
		    <td align="right">
		        <span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
		        <span id="btn_print" class="ui-button">${i18n.okprint}[F6]</span>
				<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
				<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
            </td>
		
		</tr>		
	</table>
</div>	
<div>
	<table class="ui-grid" cellspacing="1" width="100%" id="fomuser2">
		<tr>
		    <td align="right">
		        <span id="btn_ok"  class="ui-button">${i18n.ok}[F2]</span>
		        <span id="btn_delete"  class="ui-button">${i18n.delete}[F3]</span>
		        <span id="btn_selected"  class="ui-button">${i18n.checked}[F4]</span>
		        <span id="btn_endinput"  class="ui-button">${i18n.endinput}[F5]</span>
				<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
				<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
            </td>
		
		</tr>		
	</table>
</div>	
<div id="grid_user1_${pageId}" class='hidden-item'></div>
<div id="grid_user2_${pageId}" class='hidden-item'></div>

		<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>