<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","406");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_406}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var chengysbh;
var chengysmc;
var gongysbh;
var gongysmc;
var shengbd;
var zhengclsh;
var paramsQuery;
var currentPage = 1;
var danw;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'xiaohdh',dataType:'yicxhdh',caption:'${i18n.xiaohdh}',notNull:true},
				{fieldType:'fieldLabel',property:'shengbdh'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lingjmc'},
				{fieldType:'fieldLabel',property:'lingjsl'},
				{fieldType:'fieldLabel',property:'shengbd'},
				{fieldType:'fieldLabel',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'gongysmc'},
				{fieldType:'fieldLabel',property:'uch'},
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'shengbr'},
				{fieldType:'fieldLabel',property:'pich'},
				{fieldType:'fieldText',property:'hegsl',dataType:'dbnumber',caption:'${i18n.hegsl}',notNull:false},
				//{fieldType:'fieldText',property:'gongfsl',dataType:'dbnumber',caption:'${i18n.gongfsl}',notNull:false},
				//{fieldType:'fieldText',property:'liaofsl',dataType:'dbnumber',caption:'${i18n.liaofsl}',notNull:false},
				{fieldType:'fieldSelect',property:'flag',onselect:'flagchange()',caption:'${i18n.gonglf}',internation:true,notNull:true,src:'<%=request.getContextPath()%>/common/zhijzl.do'},
				{fieldType:'fieldText',property:'buhgsl',dataType:'dbnumber',caption:'${i18n.shul}',notNull:false},
				{fieldType:'fieldText',biaos:'enter',property:'suifljh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.suifljh}',notNull:false},
				{fieldType:'fieldText',property:'suifljmc',maxLength:'20',caption:'${i18n.suifljmc}',notNull:false},
				{fieldType:'fieldText',property:'shuifsl',dataType:'dbnumber',isPlus:true,caption:'${i18n.shuifsl}',notNull:false},
				{fieldType:'fieldText',property:'shuifpc',dataType:'shuzzm',maxLength:'12',caption:'${i18n.shuifpc}',notNull:false},
				{fieldType:'fieldSelect',property:'zerzt',onselect:'flagchange1()',caption:'${i18n.zerzt}',internation:true,notNull:false},
				{fieldType:'fieldSelect',isExistCheck:false,property:'zerztdm',onselect:'flagchange3()',caption:'${i18n.zerztdm}',notNull:false},
				{fieldType:'fieldText',property:'zerztmc',maxLength:'35',caption:'${i18n.zerztmc}',notNull:false},
				{fieldType:'fieldText',biaos:'enter',property:'suifuch',dataType:'uch',caption:'${i18n.suifuch}',notNull:false},
				{fieldType:'fieldText',property:'suifrongq',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
				//{fieldType:'fieldText',biaos:'enter',property:'suifgongysdm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldSelect',property:'suifgongysdm',maxLength:'10',caption:'${i18n.gongysdm}',onselect:'flagchange2()',notNull:false},
				{fieldType:'fieldText',property:'suifgongysmc',maxLength:'35',caption:'${i18n.gongysmc}',notNull:false},
	 			
				//0010510
				{fieldType:'fieldText',property:'yuany',caption:'${i18n.hgyy}',notNull:false} 			
	 			]
 		});
	
	//F1查询 
 	$('#btn_search').bind('click',function(){
 		var xiaohd=$('#xiaohdh input').val();
 		$('#form_user_${pageId}').form("resetFields");
		$('#grid_user_${pageId}').grid('clearRecords');
		$('#xiaohdh input').val(xiaohd);
 		if(!$('#xiaohdh').fieldText('validate')){
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/yichang/40601.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				     
				    $('#yuany input').val(results.result.parameter.yuany)//0010510
				
				
					$('#shengbdh span').html(results.result.parameter.shengbdh)
					$('#uch span').html(results.result.parameter.uch)
					$('#shengbr span').html(results.result.parameter.shengbr)
					$('#pich span').html(results.result.parameter.pich)
					$('#elh span').html(results.result.parameter.elh)
					$('#lingjbh span').html(results.result.parameter.lingjbh)
					$('#lingjmc span').html(results.result.parameter.lingjmc)
					$('#lingjsl span').html(results.result.parameter.lingjsl)
					$('#gongysdm span').html(results.result.parameter.gongysdm)
					$('#gongysmc span').html(results.result.parameter.gongysmc)
					$('#shengbd span').html(results.result.parameter.shengbd)
					$('#hegsl input').val(results.result.parameter.hegsl)
					$('#buhgsl input').val(results.result.parameter.buhgsl)
					$('#zerztmc input').val("")
				    $('#flag input').attr('realvalue',results.result.parameter.flag)
				    zhengclsh=results.result.parameter.zhengclsh;
					chengysbh=results.result.parameter.chengysdm;
					chengysmc=results.result.parameter.chengysmc;
					gongysbh=results.result.parameter.gongysdm;
					gongysmc=results.result.parameter.gongysmc;
					shengbd=results.result.parameter.shengbd;
				    if("0" == results.result.parameter.flag){
				    $('#flag input').val($.sdcui.resource.i18n['C_GONGF'])
				    }else if("1" == results.result.parameter.flag){
				     $('#flag input').val($.sdcui.resource.i18n['C_LIAOF'])
				    }
				    //$('#gongfsl input').val(results.result.parameter.gongfsl)
				    //$('#liaofsl input').val(results.result.parameter.liaofsl)
				    //$('#zerztdm input').val(results.result.parameter.zerztdm)
				    //$('#zerztmc input').val(results.result.parameter.zerztmc)
				    flagchange();
				    $('#zerzt input').val($.sdcui.resource.i18n[results.result.parameter.zerztxx])
				    $('#zerzt input').attr('realvalue',results.result.parameter.zerzt)
				    flagchange1();
				    $('#zerztdm input').val(results.result.parameter.zerztdm)
				    $('#zerztdm input').attr('realvalue',results.result.parameter.zerztdm)
				    $('#zerztmc input').val(results.result.parameter.zerztmc)
				    $('#suifljzl').val(results.result.parameter.suifljzl)
				    $('#rongqxh input').html(results.result.parameter.rongqxh)
					$('#grid_user_${pageId}').grid("parseResult",results)
					
			 }
			 });
 	}); 

	
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ush'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		src:'<%=request.getContextPath()%>/yichang/40601.do',
		cols:[
         {property:'suifuch',caption:'${i18n.suifuch}',align:'center'},
		{property:'suifljh',caption:'${i18n.suifljh}',align:'center'},
  		{property:'suifljmc',caption:'${i18n.suifljmc}',align:'center'},
  		{property:'shuifsl',caption:'${i18n.shuifsl}',align:'center'},
  		{property:'suifgongysdm',caption:'${i18n.suifgongysdm}',align:'center'},
  		{property:'shuifpc',caption:'${i18n.shuifpc}',align:'center'},
  		{property:'suifgongysmc',caption:'${i18n.suifgongysmc}',align:'center'}
  		
  		],
  		buttons:[
  				//单选
  				 {name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
  					$('#grid_user_${pageId}').grid('selected');
  					return false;
  				}}, 
  			//全选
 				{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
 					msgClear();
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}},
  				//删除
  				{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
  				//获取选择行
 			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(params.length<1){
 						showPromptMsg('red','${i18n.selectoneerror}')
 						return false;
 					}
 					//打开提示框是否删除
 					if(confirm($.sdcui.resource.i18n['C_remove'])){
  					params.push("xiaohdh="+$('#xiaohdh input').val());
  					params.push("zhuangtsx=2");
  					params.push("shengbd="+$('#shengbd span').html());
  					var url = "<%=request.getContextPath()%>/yichang/40605.do";
  					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
  						 if (showPromptRequestMsg(results)==true){
  							$('#grid_user_${pageId}').grid('clearRecords');
  							 $('#grid_user_${pageId}').grid("parseResult",results)
  						 }else{
  							 if (results.result.response == "0000"){
  								 $('#grid_user_${pageId}').grid('clearRecords');
  							 }
  						 }
  						 });
 					}
  					return false;
  				}}
  				
    	   ]
	});
	
	
	//根据输入随废UC号带出 ,随废零件编号,随废零件名称
 	$('#suifuch').bind('enter',function (){
 		if(!$('#suifuch').fieldText('validateNotNull')){
 			return;
 		}
 		//var params = $('#form_user_${pageId}').form("getFormParam");
 		var params=[];
 		params.push('uch='+$('#suifuch input').val());
 		params.push("zhengclsh="+zhengclsh);
			var url = "<%=request.getContextPath()%>/yichang/40604.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					//赋值
					 if (results.result.response == "0000"){
							$('#suifljh input').val(results.result.parameter.lingjbh).attr("readonly",false);
							 $('#suifljmc input').val(results.result.parameter.lingjmc).attr("readonly",false);
							 $('#shuifpc input').val(results.result.parameter.pich).attr("readonly",false);
							 $('#suifgongysdm input').attr("realValue",results.result.parameter.gongysdm);
							 $('#suifgongysdm input').val(results.result.parameter.gongysdm).attr("readonly",false);
							 $('#suifgongysmc input').val(results.result.parameter.gongysmc).attr("readonly",false);
						} else
						 {
							 	 $('#suifljh input').attr("readonly",true);
							 	 $('#suifljmc input').attr("readonly",true);
						 	    $('#shuifpc input').attr("readonly",true); 
						 	   $('#suifgongysdm input').attr("readonly",true); 
						 	  $('#suifgongysmc input').attr("readonly",true); 
						 }
				 }
				 });
 	});
	
	
	//F3随废增加
 	$('#btn_add').bind('click',function(){
 		if(!$('#xiaohdh').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#suifljh').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#shuifsl').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#shuifpc').fieldText('validate')){
 			return;
 		}
 		if(!$('#suifgongysdm').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#form_user_${pageId}').form("validateParam")){
						     	return;
		  }
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("zhuangtsx=2");
 		params.push("zhengclsh="+zhengclsh);
 		params.push("danw="+danw);
 		var url = "<%=request.getContextPath()%>/yichang/40602.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 results.result.parameter.suifuch=$('#suifuch input').val();
				 results.result.parameter.suifljh=$('#suifljh input').val();
				 results.result.parameter.suifljmc=$('#suifljmc input').val();
				 results.result.parameter.shuifpc=$('#shuifpc input').val();
				 $('#grid_user_${pageId}').grid("parseResult",results)
				 if (results.result.response == "0000"){
					 $('#suifuch input').val('');
					 $('#suifljh input').val('');
					 $('#suifljmc input').val('');
					 $('#shuifpc input').val('');
					 $('#shuifsl input').val('');
					 $('#suifrongq input').val('');
					 $('#suifgongysdm input').val('');
					 $('#suifgongysdm input').attr("realValue",'');
					 $('#suifgongysmc input').val('');
				 }
			 }
			 });
 	}); 

	//根据输入零件编号带出 零件名称
 	$('#suifljh').bind('enter',function (){
 		if(!$('#suifljh').fieldText('validateNotNull')){
 			return;
 		}
 		var params = [];
 		params.push("lingjbh="+$("#suifljh input").val());
			 var url = "<%=request.getContextPath()%>/common/40104.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 //赋值
					 if (results.result.response == "0001"){
						 $('#suifljmc input').val(results.result.parameter.lingjmc)
						 danw=results.result.parameter.danw;
					 }else{
						 $('#suifljmc input').val("")
						 danw="";
					 }
					 var  lingjbh = $('#suifljh input').val();
				     $('#suifgongysdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/40107.do'+st_Params+'&lingjbh='+lingjbh);	
				 });
 	});
	//根据输入供应商编号带出 供应商名称
 	$('#suifgongysdm').bind('enter',function (){
 		if(!$('#suifgongysdm').fieldText('validateNotNull')){
 			return;
 		}
 		var params = [];
 		params.push("gongysdm="+$("#suifgongysdm input").val());
			 var url = "<%=request.getContextPath()%>/common/40105.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (results.result.response == "0001"){
					 $('#suifgongysmc input').val(results.result.parameter.gongysmc)
				 }else{
					 $('#suifgongysmc input').val("")
				 }
				 
				 });
 	});
	//F2修改
 	$('#btn_update').bind('click',function(){
 	
 	   //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		
 	    var zerzt = $('#zerzt input').attr('realValue');
 	    if("1" == zerzt){
		 	if(!$('#zerztdm').fieldSelect('validateSelect')){
				return;
		    }	
		}
 	    
		if("3" == zerzt){
		 	if(!$('#zerztdm').fieldSelect('validateSelect')){
				return;
		    }	
		}
		
		if("4" == zerzt){
		 	if(!$('#zerztdm').fieldSelect('validateSelect')){
				return;
		    }	
		}
 		
 		
 		
 		if($('#buhgsl input').val()>0){
 			if(!$('#zerzt').fieldSelect('validateNotNull')){
				return;
			 }
			 if(!$('#zerztdm').fieldSelect('validateNotNull')){
				return;
			 }
 	 	 }else{
 	 	    $('#zerzt input').val('');
 	 	    $('#zerzt input').attr('realValue','');
 	 	    $('#zerztdm input').val('');
 	 	    $('#zerztdm input').attr('realValue','');
 	 	    $('#zerztmc input').val('');
 	 	 }
 	 	 
 		 //提交数据
 		var params =[];
 		params.push("zerztdm="+$('#zerztdm input').val()); 
 		var params2=$('#form_user_${pageId}').form("getFormParam");
 		params=params.concat(params2);
 		
 		//params.splice(28,1);
 		//param.splice(2,1,"c="+new4);
 		
 		params.push("suifljzl="+$('#suifljzl input').val());	
	    //params.push("zerztdm="+$('#zerztdm input').val());  
 		
 		var url = "<%=request.getContextPath()%>/yichang/40603.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 if (results.result.response == "0000"){
					 $('#form_user_${pageId}').form("resetFields");
					 $('#grid_user_${pageId}').grid('clearRecords');
				 }
			 }
			 });
 	}); 
	
	 //$('#zerztdm input').attr("readonly",true);
	 //$('#zerztmc input').attr("readonly",true); 

 	$(document).keyboardsupport({});
});
function flagchange(){
   if(!$('#flag').fieldSelect('validateNotNull')){
				return;
	 }
   var flag=$('#flag input').attr("realValue");
   $('#zerzt').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/zerzt.do?flag='+flag);	
}	
function flagchange1(){
		 //根据责任主体回显责任主体代码和责任主体名称
		 //获取责任主体标示
		 if(!$('#zerzt').fieldSelect('validateNotNull')){
	    	$('#zerztdm input').attr("realValue","");
			$('#zerztdm input').val("");
			$('#zerztmc input').val("");
			return;
	     }
		 var zerzt = $('#zerzt input').attr('realValue');
		if("1" == zerzt){
		     $('#zerztdm').fieldSelect('clearSelect'); 
             //$('#zerztdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/zerztdm.do?zerzt='+zerzt);  
             $('#zerztdm input').attr('realValue',gongysbh);
			 $('#zerztdm input').val(gongysbh);
			 $('#zerztmc input').val(gongysmc);
             $('#zerztdm input').attr("readonly",true);
             $('#zerztmc input').attr("readonly",true); 	
		}else if("2" == zerzt){
		    $('#zerztdm').fieldSelect('clearSelect');
			if(chengysbh.length>0){
			   $('#zerztdm input').attr('realValue',chengysbh);
			   $('#zerztdm input').val(chengysbh); 
			   $('#zerztmc input').val(chengysmc);
			   $('#zerztdm input').attr("readonly",true);
			   $('#zerztmc input').attr("readonly",true);
			 }else{ 
			   $('#zerztdm input').val(""); 
			   $('#zerztmc input').val("");
			   $('#zerztdm input').attr("readonly",false);
			   $('#zerztmc input').attr("readonly",false);		 
			 }
		}else if("3" == zerzt){
		     $('#zerztdm').fieldSelect('clearSelect');
			 $('#zerztdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/zerztdm.do?zerzt='+zerzt+'&flag='+shengbd);
			 $('#zerztdm input').attr('realValue',shengbd);
			 $('#zerztdm input').val(shengbd)
			 $('#zerztdm input').attr("readonly",false);
			 $('#zerztmc input').attr("readonly",false);
		 }else if("4" == zerzt){
		     $('#zerztdm').fieldSelect('clearSelect');
		     $('#zerztdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/zerztdm.do?zerzt='+zerzt);
		     $('#zerztdm input').attr("readonly",false);
			 $('#zerztmc input').attr("readonly",false);
		 }else if("5" == zerzt){		 //0011355
			 $('#zerztdm').fieldSelect('clearSelect');
		     $('#zerztdm input').val("")
			 $('#zerztmc input').val("")
		     $('#zerztdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/zerztdm.do?zerzt='+zerzt);
		 	 $('#zerztdm input').attr("readonly",false);
			 $('#zerztmc input').attr("readonly",false);
		 }
	}

function flagchange2(){
		if(!$('#suifgongysdm').fieldSelect('validateNotNull')){
				return;
			}
 		var params = [];
	 		params.push("gongysdm="+$("#suifgongysdm input").val());
				 var url = "<%=request.getContextPath()%>/common/40105.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (results.result.response == "0001"){
						 $('#suifgongysmc input').val(results.result.parameter.gongysmc)
					 }else{
						 $('#suifgongysmc input').val("")
					 }
					 
					});
	}
function flagchange3(){
		if(!$('#zerztdm').fieldSelect('validateNotNull')){
				return;
			}
		if("4" !=$("#zerzt input").attr('realValue')&& "3" !=$("#zerzt input").attr('realValue')&& "5" !=$("#zerzt input").attr('realValue')){
		        return;
		}
 		var params = [];
	 		params.push("zerztdm="+$("#zerztdm input").attr('realValue'));
	 		params.push("zerzt="+$("#zerzt input").attr('realValue'));
	 	
				 var url = "<%=request.getContextPath()%>/yichang/zerztmc.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (results.result.response == "0001"){
						 $('#zerztmc input').val(results.result.parameter.zerztmc);
					 }else{
						 $('#zerztmc input').val("");
						 msgClear();
					 }
					});
}
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>  
<input id="suifljzl" name="suifljzl" type="Hidden"></input> 
<div id="form_user_${pageId}" class="ui-fieldLayout"> 	
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.xiaohdh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>

		<td align="right"><span id="btn_search" class="ui-button">${i18n.search}[F1]</span><span id="btn_add"  class="ui-button">${i18n.suifzj}[F3]</span>
		<span id="btn_update"  class="ui-button">${i18n.update}[F2]</span>		
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>		
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	</td>
      </tr>
  </table>

<div id="content001"> 	
<table class="ui-grid" cellspacing="1" width="100%">
<tr>
		<td>${i18n.shengbdh}：</td>
		<td colspan="6"><div class="ui-field" id="shengbdh"></div></td>
      <tr>
		<td>${i18n.lingjbh}：</td>
		<td><div class="ui-field" id="lingjbh"></div></td>
		<td>${i18n.lingjmc}：</td>
		<td><div class="ui-field" id="lingjmc"></div></td>
		<td>${i18n.lingjsl}：</td>
		<td><div class="ui-field" id="lingjsl"></div></td>
      </tr>
      <tr>
      		<td>${i18n.shengbd}：</td>
		<td><div class="ui-field" id="shengbd"></div></td>
		<td>${i18n.gongysdm}：</td>
		<td><div class="ui-field" id="gongysdm"></div></td>
		<td>${i18n.gongysmc}：</td>
		<td><div class="ui-field" id="gongysmc"></div></td>
	</tr>
      <tr>
      		<td>${i18n.uch}：</td>
		<td><div class="ui-field" id="uch"></div></td>
		<td>${i18n.shengbr}：</td>
		<td><div class="ui-field" id="shengbr"></div></td>
		<td>${i18n.elh}：</td>
		<td><div class="ui-field" id="elh"></div></td>
	</tr>
	<tr>
			<td>${i18n.pich}：</td>
		<td><div class="ui-field" id="pich"></div></td> 
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
      <tr>
		<td>${i18n.hegsl}：</td>
		<td><div class="ui-field" id="hegsl"></div></td>
		<td>${i18n.gonglf}：</td>
		<td><div class="ui-field" id="flag"></div></td>
	 	<td>${i18n.shul}：</td>
		<td><div class="ui-field" id="buhgsl"></div></td>
	</tr>
    <tr>
    	<td>${i18n.zerzt}：</td>
		<td><div class="ui-field" id="zerzt"></div></td>
		<td>${i18n.zerztdm}：</td>
		<td><div class="ui-field" id="zerztdm"></div></td>
    	<td>${i18n.zerztmc}：</td>
		<td><div class="ui-field" id="zerztmc"></div></td>

	</tr>
	<tr>
		<td>${i18n.rongqxh}：</td>
		<td><div class="ui-field" id="rongqxh"></div></td>
 		
 		<!-- 0010510 -->
		<td>${i18n.hgyy}：</td>
		<td><div class="ui-field" id="yuany"></div></td>
 		
		<td></td>
		 <td></td>
		<td></td>
	</tr>
    <tr>
    <td>${i18n.suifuch}：</td>
		<td><div class="ui-field" id="suifuch"></div></td>
        <td>${i18n.suifljh}：</td>
		<td><div class="ui-field" id="suifljh"></div></td>
		<td>${i18n.suifljmc}：</td>
		<td><div class="ui-field" id="suifljmc"></div></td>

		</tr>
	<tr>
			<td>${i18n.shuifsl}：</td>
		<td><div class="ui-field" id="shuifsl"></div></td> 
		<td>${i18n.shuifpc}：</td>
		<td><div class="ui-field" id="shuifpc"></div></td>
		<td>${i18n.rongqxh}：</td>
		<td><div class="ui-field" id="suifrongq"></div></td>		
	</tr>
	<tr>
			<td>${i18n.gongysdm}：</td>
		<td><div class="ui-field" id="suifgongysdm"></div></td>
 		<td>${i18n.gongysmc}：</td>
		<td><div class="ui-field" id="suifgongysmc"></div></td>
		

	</tr>
  </table>	
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div> 
<div id='prompt'>${i18n.prompt}</div>	    		    		    	    
</div>		    
</body>

<jsp:include page="../../common/bottom.jsp" /></t:html>