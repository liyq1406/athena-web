<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","636");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_636}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[				
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
				{fieldType:'fieldSelect',caption:'${i18n.diaorurqq}',notNull:true,property:'diaoruwld',onselect:'flagChange()',src:'<%=request.getContextPath()%>/common/getrongqc.do?temp=1&rongqcbh='+st_Rongqcbh},
				{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'11',caption:'${i18n.caozr}'},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.yiksl}',notNull:true},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldHidden',property:'diaobdh'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/63601.do',
		editSubmitSrc:'<%=request.getContextPath()%>/rongqi/63601.do?zhuangt1=3',
		cols:[
		//{property:'diaobdh',caption:'${i18n.diaobdh}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'}
  		]
	});
	//F1 增加
 	$('#btn_add').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 var temp1=$('#diaoruwld input').val();
 		 var temp2=$('#wuld span').html();
 		 if(temp1==temp2){
 			showPromptMsg('red','${i18n.diaorudif}')
			return;
 		 }
 		 
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/63601.do?zhuangt1=1";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				    $('#diaobdh input').val(results.result.parameter.diaobdh);
					$('#grid_user_${pageId}').grid('parseResult',results);
					$('#chengysdm input').attr("disabled",true);
					$('#gongysdm input').attr("disabled",true);
					$('#caozy input').attr("disabled",true);
					$('#diaoruwld input').attr("disabled",true);
					$('#rongqxh input').val('');
					$('#rongqsl input').val('');
					$('#rongqxh input').focus();
			 }
			 });
 	}); 
	
	//F2  删除
 	$('#btn_delete').bind('click',function(){
		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
			//先提交选中行，然后再重新加载
			var params = $('#grid_user_${pageId}').grid('getSelectedAll');	
			params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
			params.push("diaobdh="+$('#diaobdh input').val());
			var url = "<%=request.getContextPath()%>/rongqi/63601.do?zhuangt1=2";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 $('#grid_user_${pageId}').grid('parseResult',results)
				 }
			});
		}
		return false;
 	}); 

	//F3  结束录入
 	$('#btn_endinput').bind('click',function(){
 		if($('#diaobdh input').val()==""){
 			showPromptMsg('red','${i18n.danjbhbnwk}');
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/63601.do?zhuangt1=4";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
			 	//提交成功后 重新刷新当前页面
				$('#form_user_${pageId}').form('resetFields');
				$('#grid_user_${pageId}').grid('clearRecords');
				$('#wuld span').html(st_Rongqcbh);
				$('#chengysdm input').attr("disabled",false);
				$('#gongysdm input').attr("disabled",true);
				$('#caozy input').attr("disabled",false);
				$('#diaoruwld input').attr("disabled",false);
			 }
		});
 	}); 
	
	//F4  选中
 	$('#btn_selected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
        msgClear();
        return false;
 	}); 

 	//全键盘控制
	$(document).keyboardsupport({});
	
	/*加载时判断容器区
	$(document).ready(function(){
		if (st_Rongqclx != "F"){
			$('#chengysdm input').attr("disabled",true);
			$('#gongysdm input').attr("disabled",true);
		}
		$('#diaoruwld input').focus();
	});*/
});
var flagChange=function(){
	$.ajax({
		type:'post',
		url:'<%=request.getContextPath()%>/common/flagJudge624.do',
		data:'rongqqbh='+$('#diaoruwld input').val(),
		//dataType:'text',
		success:function(msg){
			//设置供应商编号不可输入
			$("#gongysdm input").attr('disabled',true);
			var judge=msg.result.parameter[0].value;
			if(judge=="0" || st_Rongqclx == "F"){
				$('#chengysdm input').attr("disabled",false);
				//$('#gongysdm input').attr("disabled",false);
			}else{
				$('#chengysdm input').attr("disabled",true);
				//$('#gongysdm input').attr("disabled",true);
			}
		},
		error:function(){
			//alert("error");
		}		
	});
}
/**
 *进入636页面后进行查询
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
   $('#form_user_${pageId}').form("resetFields");
   $('#wuld span').html(st_Rongqcbh);
   var params =[] ;
   params.push("wuld="+st_Rongqcbh);	
      var url = "<%=request.getContextPath()%>/rongqi/63601.do";
   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#diaobdh input").val(results.result.parameter.diaobdh);
		         $("#diaoruwld input").val(results.result.parameter.diaoruwld);
   	             $("#caozy input").val(results.result.parameter.caozy);
   	             $("#gongysdm input").val(results.result.parameter.gongysdm);
	             $("#chengysdm input").val(results.result.parameter.chengysdm);
   	             $('#grid_user_${pageId}').grid('parseResult',results);
   	             if('' != results.result.parameter.diaoruwld){
   	              $('#diaoruwld input').attr("disabled",true);
   	             }
  	         }
        }
        $('#chengysdm input').attr("disabled",true);
		$('#gongysdm input').attr("disabled",true);
       msgClear();
     });
		return false;
});
</script>
	</head>
	<body>
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
        <td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
   		<td class="field-label">${i18n.diaorurqq}：</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>		
      </tr>
      <tr>
        <td class="field-label">${i18n.yiksl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-label">${i18n.shenqr}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>		
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>		
     </tr>
     <tr>
        <td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td> 
		<td class="field-label"></td>
		<td ><div class="ui-field" id="diaobdh"></div></td> 
		<td class="field-label"></td>
		<td class="field-container"></td> 
     </tr>
  </table>   
  <br/>	
		<div align=right>
		<span id="btn_add"  class="ui-button">${i18n.add}[F1]</span>
		<span id="btn_delete"  class="ui-button">${i18n.delete}[F2]</span>
		<span id="btn_endinput"  class="ui-button">${i18n.endinput}[F3]</span>
		<span id="btn_selected"  class="ui-button">${i18n.checked}[F4]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	    </div>
  <br/>	    
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>    
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>