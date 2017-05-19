<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","413");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_413}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var chengysbh;
var gongysbh;
var list;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
 		        {fieldType:'fieldHidden',property:'flagtag'},
                {fieldType:'fieldText',property:'zhijjjbgdh',dataType:'zhijjsbgdh',caption:'${i18n.zhijjjbgdh}',notNull:true},
				{fieldType:'fieldLabel',property:'cangkbh'},
				{fieldType:'fieldLabel',property:'zickbh'},
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'blh'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lingjmc'},
				{fieldType:'fieldLabel',property:'lingjsl'},
				{fieldType:'fieldLabel',property:'choujsl'},
				{fieldType:'fieldLabel',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'gongysmc'},
				{fieldType:'fieldLabel',property:'pich'},
				{fieldType:'fieldLabel',property:'hegsl'},
				{fieldType:'fieldLabel',property:'buhgsl'},
				{fieldType:'fieldSelect',property:'zerzt',caption:'${i18n.zerzt}',onselect:'flagSelected()',internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/zerzt.do'},
				{fieldType:'fieldSelect',isExistCheck:false,property:'zerztdm',caption:'${i18n.zerztdm}',maxLength:'10',notNull:false},
				{fieldType:'fieldText',property:'yuany',maxLength:'20',caption:'${i18n.yuany}',notNull:false},				
				{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.ush}',notNull:false},
				{fieldType:'fieldText',property:'buhgsl',dataType:'dbnumber',caption:'${i18n.buhgsl}',notNull:false},
				
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ush'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41301.do',
		cols:[
        {property:'ush',caption:'${i18n.ush}',align:'center'},
		{property:'zhuangtxx',caption:'${i18n.zhijbz}',align:'center',internation:true},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'},
  		{property:'hegsl',caption:'${i18n.hegsl}',align:'center'},
  		{property:'buhgsl',caption:'${i18n.buhgsl}',align:'center'},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'}
  		],
  		buttons:[
  		           //查询
                  {name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
              		 //参数校验
               		if(!$('#zhijjjbgdh').fieldText('validate')){
               			return;
               		}
               		 //提交数据
               		var params = [];
               		 params.push('zhijjjbgdh='+$('#zhijjjbgdh input').val())
               		$('#grid_user_${pageId}').grid("setQueryParams", params);
               		var url = "<%=request.getContextPath()%>/yichang/41301.do";
              		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
              			 if (showPromptRequestMsg(results)==true){
              				 if (results.result.response == "0001"){
              				 //加载返回数据
              					$('#cangkbh span').html(results.result.parameter.cangkbh);
              					$('#zickbh span').html(results.result.parameter.zickbh);
              					$('#elh span').html(results.result.parameter.elh);
              					$('#blh span').html(results.result.parameter.blh);
              					$('#lingjbh span').html(results.result.parameter.lingjbh);
              					$('#lingjmc span').html(results.result.parameter.lingjmc);
              					$('#lingjsl span').html(results.result.parameter.lingjsl);
              					$('#choujsl span').html(results.result.parameter.choujsl);
              					$('#gongysdm span').html(results.result.parameter.gongysdm);
              					$('#gongysmc span').html(results.result.parameter.gongysmc);
              					$('#pich span').html(results.result.parameter.pich);
              					$('#hegsl span').html(results.result.parameter.hegsl);
              					$('#buhgsl input').val(results.result.parameter.buhgsl);
              					//$('#zerzt input').val(results.result.parameter.zerztxx);
              					$('#zerzt input').val($.sdcui.resource.i18n[results.result.parameter.zerztxx]);
              					$('#zerzt input').attr('realvalue',results.result.parameter.zerzt);
              					$('#zerztdm input').val(results.result.parameter.zerztdm);
              					$('#yuany input').val(results.result.parameter.yuany);
              					$('#printusbq input').val(results.result.parameter.printusbq);
              					chengysbh=results.result.parameter.chengysdm;
              					chengysmc=results.result.parameter.chengysmc;
              					gongysbh=results.result.parameter.gongysdm;
              					
              					$('#ush').val(results.result.parameter.ush);
              					$('#flagtag input').val('');
              					$('#flagtag input').val(results.result.parameter.buhgsl+","
              							+$('#zerzt input').val()+","
              							+results.result.parameter.zerztdm+","
              							+results.result.parameter.yuany);
              					//加载grid
              					$('#grid_user_${pageId}').grid("parseResult",results)
              					list=results.result.parameter.list;
              				 }
              			 }
              			 });
              		 return false;	 		
				}},
				 	//修改 
					{name:'update',caption:'${i18n.update}[F3]',keyboard:'F3',action:function(){
					   //参数校验
						if(!$('#form_user_${pageId}').form("validateParam")){
							return;	
						}
						if(list==""){
							showPromptMsg('red','${i18n.zhijbgdcx}')
							return;
						}
				 		//查询数据
				 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
				 		//去掉List[0];
						for(i=0;i<params.length;i++){
							params[i]=params[i].toString().replace("list[0].","");
						}
						var flag_tag=$('#flagtag input').val().toString().split(",");
						if(
						   flag_tag[0]==$('#buhgsl input').val() &&
						   flag_tag[1]==$('#zerzt input').val() &&
						   flag_tag[2]==$('#zerztdm input').attr("realValue") &&
						   flag_tag[3]==$('#yuany input').val()
								){
							showPromptMsg('red','${i18n.shujuwxg}');
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
					 	 }
					 	 
				 		params.push("elh="+$('#elh span').html());
				 		params.push('ush='+$('#ush').val());
				 		params.push("lingjsl="+$('#lingjsl span').html());
				 		params.push("hegsl="+$('#hegsl span').html());
				 		params.push("buhgsl="+$('#buhgsl input').val());
				 		params.push("zhijjjbgdh="+$('#zhijjjbgdh input').val());
				 		params.push("zerzt="+$('#zerzt input').attr('realvalue'));
				 		params.push("zerztdm="+$('#zerztdm input').attr('realvalue'));				 		
				 		params.push("yuany="+$('#yuany input').val()); 
				 		var url = "<%=request.getContextPath()%>/yichang/41302.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								//加载grid
								 $('#grid_user_${pageId}').grid('parseResult',results);
								 list=results.result.parameter.list;
							 }
							 });
					}},
				 	//返回上一页
					{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
					//返回主页
					{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
				 ]
	});
	$(document).keyboardsupport({});
});
//根据责任主体回显责任主体代码和责任主体名称
var flagSelected=function(){
	if(!$('#zerzt').fieldSelect('validateNotNull')){
	        $('#zerztdm input').attr("realValue","");
			$('#zerztdm input').val("");
			$('#zerztdm input').attr("readonly",true);
			return;
	     }
       var zerzt = $('#zerzt input').attr('realValue');
		if("1" == zerzt){
		     $('#zerztdm').fieldSelect('clearSelect');
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
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<input id="ush" name="ush" type="Hidden"></input> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.zhijjjbgdh}：</td>
		<td class="field-container"><div class="ui-field" id="zhijjjbgdh"></div></td>
      </tr>
 </table>

<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.cangk}：</td>
		<td class="field-container"><div class="ui-field" id="cangkbh"></div></td>
		<td class="field-label">${i18n.zick}：</td>
		<td class="field-container"><div class="ui-field" id="zickbh"></div></td>
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
		<td class="field-label">${i18n.yuany}：</td>
		<td class="field-container"><div class="ui-field" id="yuany"></div></td>

	</tr>
	<tr>
	    <td class="field-label"></td>
		<td class="field-container"><div class="ui-field" id="flagtag"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
		<td class="field-label"></td>
		<td class="field-container"></td>

	</tr>
   </table>	
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	    		    		    
</div>	 	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>