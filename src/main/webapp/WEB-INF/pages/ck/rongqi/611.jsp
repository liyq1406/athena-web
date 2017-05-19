<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","611");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_611}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'diaoruwld',caption:'${i18n.rongqiq}',notNull:true,src:'<%=request.getContextPath()%>/common/diaorurqq611.do?rongqcbh='+st_Rongqcbh},
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                {fieldType:'fieldHidden',property:'diaobdh'},
                {fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}',notNull:true},
                {fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}',notNull:true},
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
                {fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.rongqsl}',notNull:true}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','chengysdm','gongysdm','wuld'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/61102.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},
  		{property:'chengysdm',caption:'${i18n.rongqwls}'}
  		//{property:'gongysdm',caption:'${i18n.rongqgys}'}
  		]
	});
 	$('#gongysdm input').bind('blur',function(){
 		var gongys=$('#gongysdm input').val();
 		if(gongys.toUpperCase()=="DPCA"){
 			$('#chengysdm input').val('DPCA');
		}else{
			$('#chengysdm input').val('');
		}
 	});
	//F1确认
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		// if(!$('#diaoruwld').fieldSelect('validate')){
 		//	return;
 		//}
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		} 		
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("currentPage="+currentPage);
		//params.push("diaobdh="+$('#diaobdh input').val());
		params.push("caozy="+st_UserName);
		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					$('#diaobdh input').val(results.result.parameter.diaobdh)
					if (results.result.response == "0000"){
						//禁用文本框
						$('#diaoruwld input').attr("disabled",true);
						$('#chengysdm input').attr("disabled",true);
						$('#gongysdm input').attr("disabled",true);
						$('#rongqxh input').val('').focus();
						$('#rongqsl input').val('');
					}					
			 }
			 });
 	});
 	//F3打印 结束录入
 	$('#btn_print').bind('click',function(){
 		if($('#diaobdh input').val()==""){
 			showPromptMsg('red',$.sdcui.resource.i18n['C_diaobdh']);
 			return;
 		} 		
 		var params = [];
		params.push("usercenter="+st_UserCenter);
		params.push("diaobdh="+$('#diaobdh input').val());
		var url = "<%=request.getContextPath()%>/rongqi/61104.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 $('#grid_user_${pageId}').grid('parseResult',results)
					   if (results.result.response == "0000"){
						   $('#chengysdm input').attr("readonly",false);
							$('#gongysdm input').attr("readonly",false);
					 		var params2 = [];
							params2.push("usercenter="+st_UserCenter);
							params2.push("diaobdh="+ $('#diaobdh input').val());
							var url2 = "<%=request.getContextPath()%>/rongqi/61103.do";
							g_isSub=0;
							doprint(st_PageId,params2,url2);
							$('#form_user_${pageId}').form("resetFields");
					 		$('#grid_user_${pageId}').grid('clearRecords');
					 		$('#wuld span').html(st_Rongqcbh);
					 		$('#diaobdh input').val("");
					 		$('#diaoruwld input').attr("disabled",false);
							$('#chengysdm input').attr("disabled",false);
							$('#gongysdm input').attr("disabled",true);		
		  } 
		 
	 }
	 });				
		 return false;		
 	}); 
	$(document).keyboardsupport({});
});
/**
  *进入611页面后进行查询
  */
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
    var params =[] ;
    params.push("wuld="+st_Rongqcbh);	
    var url = "<%=request.getContextPath()%>/rongqi/61102.do";
    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#diaobdh input").val(results.result.parameter.diaobdh);
		         $("#diaoruwld input").val(results.result.parameter.diaoruwld);
		         $("#diaoruwld input").attr('realValue',results.result.parameter.diaoruwld);
    	         $("#gongysdm input").val(results.result.parameter.gongysdm);
    	         $('#chengysdm input').val(results.result.parameter.chengysdm);
    	         $('#grid_user_${pageId}').grid('parseResult',results);
    	         if(
    	        		 $('#diaoruwld input').val()!="" &&
    	        		 $('#chengysdm input').val()!="" &&
    	        		 $('#gongysdm input').val()!=""
    	        		 ){
    	        	    $('#diaoruwld input').attr("disabled",true);
						$('#chengysdm input').attr("disabled",true);
						$('#gongysdm input').attr("disabled",true);
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
<!--  <input id="diaobdh" name="diaobdh" type="Hidden"></input>-->
<div id="form_user_${pageId}" class="ui-fieldLayout">
		<table class="ui-grid" cellspacing="1" width="100%" >
			<tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div>
		</td>
		<td class="field-label">${i18n.diaorurqq}：</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div>
		</td> 
		
				     
		</tr>
		   <tr>
		   <td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
      </tr>
     <tr>
      <tr>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label">${i18n.rongqsl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
      </tr> 
  </table>
  <br/>
  <div align="right">
   		<span id="btn_ok"  class="ui-button">${i18n.ok}[F1]</span>
   		<span id="btn_print"  class="ui-button">${i18n.jieslr}[F3]</span>
   		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>

  </div>
  <br/>
  <div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
		<br>
		
		<div id='prompt'>${i18n.prompt}</div>


</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>