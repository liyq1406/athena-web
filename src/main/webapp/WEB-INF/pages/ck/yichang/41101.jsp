<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","41101");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_41101}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var chengysbh;
var chengysmc;
var gongysbh;
var gongysmc;
var shengbd;
var par = [];
$(function(){
	$('#form_user_${pageId}').form({
		onreload:false,
 		fields:[
                {fieldType:'fieldLabel',property:'zhijz'},
                {fieldType:'fieldLabel',property:'ckandzick'},
                {fieldType:'fieldLabel',property:'elh'},
                {fieldType:'fieldLabel',property:'blh'},
                {fieldType:'fieldLabel',property:'lingjbh'},
                {fieldType:'fieldLabel',property:'lingjmc'},
                {fieldType:'fieldLabel',property:'lingjsl'},
                {fieldType:'fieldLabel',property:'lingjmc'},
                {fieldType:'fieldLabel',property:'lingjsl'},
                {fieldType:'fieldLabel',property:'choujsl'},
                {fieldType:'fieldLabel',property:'gongysdm'},
                {fieldType:'fieldLabel',property:'gongysmc'},
                {fieldType:'fieldLabel',property:'pich'},
                {fieldType:'fieldText',property:'hegsl',dataType:'dbnumber',caption:'${i18n.hegsl}',notNull:false},
                {fieldType:'fieldText',property:'buhgsl',dataType:'dbnumber',caption:'${i18n.buhgsl}',notNull:false},
                {fieldType:'fieldSelect',property:'zerzt',internation:true,caption:'${i18n.zerzt}',onselect:'flagchange()',notNull:false,src:'<%=request.getContextPath()%>/common/zerzt.do'},
                {fieldType:'fieldSelect',isExistCheck:false,property:'zerztdm',caption:'${i18n.zerztdm}',notNull:false},
                {fieldType:'fieldText',property:'yuany',maxLength:'20',caption:'${i18n.yuany}',notNull:false},
                {fieldType:'fieldSelect',property:'shifdy',dataType:'printusbq',value:'N',realValue:'0',caption:'${i18n.printusbq}',notNull:false,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
                {fieldType:'fieldSelect',property:'xianskkw',dataType:'xianskkw',value:'N',realValue:'0',caption:'${i18n.shifxgkw}',notNull:false,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
                {fieldType:'fieldText',property:'kuwbh',dataType:'letter_numeric',limitedLength:'6',caption:'${i18n.buhgpkuw}',notNull:false}
	 			]
 		});
	
	gridload();
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#zhijz span').html('${result.result.parameter.zhijz}');
			$('#ckandzick span').html('${result.result.parameter.ckandzick}');
			$('#elh span').html('${result.result.parameter.elh}');
			$('#elh1').val('${result.result.parameter.elh}');
			par.push('elh='+$('#elh1').val());
			par.push('zhijqdh='+'${result.result.parameter.zhijqdh}');
			$('#blh span').html('${result.result.parameter.blh}');
			$('#lingjbh span').html('${result.result.parameter.lingjbh}');
			$('#lingjmc span').html('${result.result.parameter.lingjmc}');
			$('#lingjsl span').html('${result.result.parameter.lingjsl}');
			$('#choujsl span').html('${result.result.parameter.choujsl}');
			$('#gongysdm span').html('${result.result.parameter.gongysdm}');
			$('#gongysmc span').html('${result.result.parameter.gongysmc}');
			$('#pich span').html('${result.result.parameter.pich}');
			$('#hegsl input').val('${result.result.parameter.zhegsl}');
			$('#zhijqdh').val('${result.result.parameter.zhijqdh}');
			$('#buhgsl input').val('${result.result.parameter.zbhegsl}');
			$('#zerzt input').val($.sdcui.resource.i18n['${result.result.parameter.zerztxx}']);
			$('#zerzt input').attr('realvalue','${result.result.parameter.zerzt}');
			$('#zerztdm input').val('${result.result.parameter.zerztdm}');
			$('#zerztdm input').attr('realvalue','${result.result.parameter.zerztdm}');//	0011294
			$('#yuany input').val('${result.result.parameter.yuany}');
			var day='${result.result.parameter.shifdy}';
			if(day==0){
				$('#shifdy input').val('N');
				$('#shifdy input').attr('realvalue','0');
			}else{
				$('#shifdy input').val('Y');
				$('#shifdy input').attr('realvalue','1');
			}
			var kkw='${result.result.parameter.xianskkw}';
			if(kkw==0){
				$('#xianskkw input').val('N');
				$('#xianskkw input').attr('realvalue','0');
			}else{
				$('#xianskkw input').val('Y');
				$('#xianskkw input').attr('realvalue','1');
			}
			$('#kuwbh input').val('${result.result.parameter.kuwbh}');
			par.push('zbhegsl='+$("#buhgsl input").val());
			par.push('zhegsl='+$("#hegsl input").val());
			chengysbh='${result.result.parameter.chengysdm}';
			gongysbh='${result.result.parameter.gongysdm}';
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			params.push("zhijqdh="+$("#zhijqdh").val());
			$('#grid_user_${pageId}').grid("setQueryParams", params);
		gridload();
	});
 	
	
	//F3结束
 	$('#btn_over').bind('click',function(){
 	 // 参数校验
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
 		
 		
 		//var params = $('#form_user_${pageId}').form("getFormParam");
 		
 		params.push("zhijqdh="+$("#zhijqdh").val()); 
 		var url = "<%=request.getContextPath()%>/yichang/41104.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 if (results.result.response == "0000"){
		    		   //操作成功--返回
			 			history.back();
				 }
			 }
		});
 	}); 
	$(document).keyboardsupport({});
});

	function oper(results,trId){
		$('#hegsl input').val(results.result.parameter.zhegsl);
		$('#buhgsl input').val(results.result.parameter.zbhegsl);
		$('#choujsl span').html(results.result.parameter.shoujsl);
		//获取列表所有行
		var list = $(".grid-row");
		for(var i=0; i<list.length; i++){
			if (list[i].id == trId){
				var lingjsl = $(list[i]).find('td.lingjsl').text();
				var buhgsl = $(list[i]).find('td.buhgsl input').val();
				//赋值给合格数量
				if(lingjsl!=null&&buhgsl!=null){
					var hegsl=Math.round((lingjsl-buhgsl)*1000)/1000;
					$(list[i]).find('td.hegsl').text(hegsl);
				}
			}
		}
	}
function flagchange(){

       if(!$('#zerzt').fieldSelect('validateNotNull')){
            $('#zerztdm input').attr("realValue","");
			$('#zerztdm input').val("");
				return;
	     }

       var zerzt = $('#zerzt input').attr('realValue');
		if("1" == zerzt){
		     $('#zerztdm').fieldSelect('clearSelect');	
		    //$('#zerztdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/zerztdm.do?zerztdm='+gongysbh);
			 $('#zerztdm input').attr("realValue",gongysbh);
			 $('#zerztdm input').val(gongysbh);
             $('#zerztdm input').attr("readonly",true);
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
		}else {
		     $('#zerztdm').fieldSelect('clearSelect');	
		     $('#zerztdm input').attr("realValue","");
			 $('#zerztdm input').val("");
		     $('#zerztdm input').attr("readonly",false);
			 $('#zerztmc input').attr("readonly",false);
			 $('#zerztdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/zerztdm.do?zerzt='+zerzt);
		 }
	}
function gridload()
{
	$('#grid_user_${pageId}').grid({
		keyFields:['ush','lingjsl','buhgsl','hegsl','zerzt'],
		id:'grid_user_${pageId}',
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41102.do',
		editSubmitSrc:'<%=request.getContextPath()%>/yichang/41103.do',
		params:par,
		cols:[
		{property:'ush',caption:'${i18n.ush}',align:'center'},
		{property:'zhuangtxx',caption:'${i18n.zhijbz}',align:'center',internation:true},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},
		{property:'buhgsl',caption:'${i18n.buhgsl}',align:'center',editor:'fieldText',dataType:'dbnumber',afterenter:'oper'},	        
        {property:'hegsl',caption:'${i18n.hegsl}',align:'center'}
  		]
	});
}
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<input id="elh1" name="elh1" type="Hidden"></input>
<input id="zhijqdh" name="zhijqdh" type="Hidden"></input>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout"> 	
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.zhijz}：</td>
		<td class="field-container"><div class="ui-field" id="zhijz"></div></td>
		<td class="field-label">${i18n.zickbh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.blh}：</td>
		<td class="field-container"><div class="ui-field" id="blh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.lingjmc}：</td>
		<td class="field-container"><div class="ui-field" id="lingjmc"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.lingjsl}：</td>
		<td class="field-container"><div class="ui-field" id="lingjsl"></div></td>
		<td class="field-label">${i18n.zhijsl}：</td>
		<td class="field-container" ><div class="ui-field" id="choujsl"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
	</tr>
      <tr>
		<td class="field-label">${i18n.gongysmc}：</td>
		<td class="field-container"><div class="ui-field" id="gongysmc"></div></td>
		<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
		<td class="field-label">${i18n.hegsl}：</td>
		<td class="field-container"><div class="ui-field" id="hegsl"></div></td>
	</tr>
      <tr>
	    <td class="field-label">${i18n.buhgsl}：</td>
		<td class="field-container"><div class="ui-field" id="buhgsl"></div></td>
		<td class="field-label">${i18n.zerzt}：</td>
		<td class="field-container"><div class="ui-field" style="float:left" id="zerzt"></div><div style="float:left" class="ui-field" id="zerztdm"></div></td>
		<td class="field-label">${i18n.buhgyy}：</td>
		<td class="field-container"><div class="ui-field" id="yuany"></div></td>

	</tr>
    <tr>
		<td class="field-label">${i18n.printusbq}：</td>
		<td class="field-container"><div class="ui-field" id="shifdy"></div></td>
		<td class="field-label">${i18n.shifxgkw}：</td>
		<td class="field-container"><div class="ui-field" id="xianskkw"></div></td>
		<td class="field-label">${i18n.buhgpkuw}：</td>
		<td class="field-container"><div class="ui-field" id="kuwbh"></div></td>
	</tr>
</table>	
</div>
<div align="right">
	<span id="btn_over"  class="ui-button">${i18n.jiesxg}[F3]</span>	
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>		
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div> 	
<div id='prompt'>${i18n.prompt}</div>	
</div>		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>