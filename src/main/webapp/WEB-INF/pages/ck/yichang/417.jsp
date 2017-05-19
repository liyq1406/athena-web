<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","417");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_417}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'fanxdh',dataType:'fanxdh',caption:'${i18n.fanxdh}',notNull:false},
                {fieldType:'fieldSelect',property:'ckandzick',caption:'${i18n.zickbh}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouseck.do'+'?buhgpk='+2+'&buhgpk2='+0},
                {fieldType:'fieldSelect',property:'flag',caption:'${i18n.baoflx}',internation:true,value:$.sdcui.resource.i18n['C4_YCLX_2'],realValue:'0',src:'<%=request.getContextPath()%>/common/yiclxStr.do'},
                {fieldType:'fieldText',property:'fxgongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}',notNull:false},
                {fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
                {fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:true},
                {fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
                {fieldType:'fieldText',property:'rukrq1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.ruksj}'},
			    {fieldType:'fieldText',property:'rukrq2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.ruksj}'},
                {fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}',notNull:false},
                {fieldType:'fieldText',property:'str1',dataType:'shuzzm',maxLength:'10',caption:'${i18n.suopdh}',notNull:false}       //Mantis	0010459
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ush','usgs','fanxsl','elh','lingjbh','lingjmc','lingjsl','uswld','pich','gongysdm','gongysmc','rukpjh','zhuangtxx','kuwbh','usxh','chengysdm'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41701.do',
		cols:[
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},	
		{property:'fanxsl',caption:'${i18n.tuigyssl}',align:'center',editor:'fieldText',dataType:'dbnumber',width:50},
		{property:'usxh',caption:'${i18n.usxh}',align:'center',width:50,editor:'fieldText',dataType:'letter_numeric',limitedLength:'5'},
		{property:'usgs',caption:'${i18n.usgs}',align:'center',editor:'fieldText',dataType:'dbnumber',width:50},
		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true,width:50},
		{property:'chengysdm',caption:'${i18n.chengysdm}',align:'center',width:50,editor:'fieldText',dataType:'letter_numeric',limitedLength:'10',notNull:true},
        {property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
		{property:'ruksj',caption:'${i18n.ruksj}',align:'center',width:50},
		{property:'uswld',caption:'${i18n.yuanwld}',align:'center',width:50},
		{property:'kuwbh',caption:'${i18n.kuw}',align:'center',width:50},
		{property:'rukpjh',caption:'${i18n.rukpjh}',align:'center',width:50}
  		],
  		buttons:[
    				//F1查询 
       	  			{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
       	  	 		 //参数校验
       	  	 		if(!$('#form_user_${pageId}').form("validateParam")){
       	  					return;	
       	  	 		}
       	  	 		//范围校验
	                if(!validRangeData("date", $('#rukrq1 input').val(), $('#rukrq2 input').val())){
	                    $('#rukrq1 input').focus();
	                    $('#rukrq1 input').removeClass('validate-success').addClass('validate-error');
	                    return;
	                }
       	  	 		var cangkh=$('#ckandzick input').val();
       	  	 		var cangkbh=cangkh.substr(0,3);
       	  	 		var params2 = [];
       	  			 var url2 = "<%=request.getContextPath()%>/common/wareHouse.do";
       	  			 $('#form_user_${pageId}').form("submitUrl", params2, url2, function(results){
       	  				 showPromptMsg('blue','');
       	  				 var size=results.result.parameter.list.length;
       	  				 var id=0;
       	  				 for(var i=0;i<size;i++){
       	  					 if(cangkbh!=results.result.parameter.list[i].value){
       	  						 	id=0;
       	  					 }else{
       	  						 id=1;
       	  						 break;
       	  					 }
       	  				 }
       	  				 if(id==0){
       	  					 $('#grid_user_${pageId}').grid('clearRecords');
       	  					 showPromptMsg('red','${i18n.C_C_cuowckh}')
       	  					  return;
       	  				 }else{
       	  				 		 //提交数据
       	  				 		var params = $('#form_user_${pageId}').form("getFormParam");
       	  						params.push("baozzt=10");
       	  						$('#grid_user_${pageId}').grid("setQueryParams", params);
       	  				 		var url = "<%=request.getContextPath()%>/yichang/41701.do";
       	  				 		g_isSub=0;
       	  						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
       	  							 if (showPromptRequestMsg(results)==true){
       	  								//加载grid
       	  								    $('#chengyunsdm').val('');
       	  								    $('#chengyunsdm').val(results.result.parameter.chengysdm);
       	  									$('#grid_user_${pageId}').grid("parseResult",results)
       	  							 }
       	  							 });
       	  				 }
       	  			 });
       	  		 		return false;
       				}},
    				//F2确定
      				{name:'btn_ok',caption:'${i18n.ok}[F2]',keyboard:'F2',action:function(){
      				 if(!$('#str1').fieldText("validate")){
					     return;
					  	} 
      				
      			 		//是否选中
      					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
      					if(records.length < 1){
      						showPromptMsg('red','${i18n.selectoneerror}')
      						return false;
      					}
      					
      				//循环验证所选记录是否为随废，如果为随废就提示用户是否继续  hzg 2014.9.24
						var flag = true;
      					$.each(records,function(i,n){
      						var str = n.split('=');
      						if(str[1]==="C4_YCLX_3"){
      							if(!confirm("所选记录中存在随废类型，是否继续！")){
									flag = false;
      								return false;
      							}
      						}
						}); 
      					
						if(!flag){
							return false;
						}
      					
      			 		//验证Grid的输入格式
      			 		if (!$('#grid_user_${pageId}').grid("validate")){
      			 			return false;
      			 		}
      			 		if(!$('#fxgongysdm').fieldText('validateNotNull')){
      			 			return;
      			 		}
      			 		
      			 		 //提交数据 add flag hzg 2014.9.25
      			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
      			 		paramsQuery = jQuery.extend(true,[],params);
      					params.push("currentPage="+currentPage);
      					params.push("baozzt=10");
      					params.push("fanxdh="+$('#fanxdh span').html());
      					params.push("fxgongysdm="+$('#fxgongysdm input').val());
      					params.push("ckandzick="+$('#ckandzick input').val());
      					params.push("elh="+$('#elh input').val());
      					params.push("gongysdm="+$('#gongysdm input').val());
      					params.push("lingjbh="+$('#lingjbh input').val());
      					params.push("pich="+$('#pich input').val());
      					params.push("chengysdm="+$('#chengyunsdm').val());
      					params.push("flag="+$('#flag input').attr("realValue"));
      					params.push("str1="+$('#str1 input').val());
      			 		var url = "<%=request.getContextPath()%>/yichang/41702.do";
      					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
      						if (showPromptRequestMsg(results)==true){
      							//加载grid
      							$('#grid_user_${pageId}').grid("parseResult",results)
      							$('#fanxdh span').html(results.result.parameter.fanxdh);
      							$('#fxgongysdm input').attr("readonly",true);
      							showPromptMsg('red','${i18n.danjsxh}')
      						}else{
      							 if (results.result.response == "0000"){
      								 $('#grid_user_${pageId}').grid('clearRecords');
      							 }
      						}
      					});
      				}},
   				//单选
   				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
   					$('#grid_user_${pageId}').grid('selected');
   					return false;
   				}}
   			//全选
 				,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}},
				//F6打印
 				{name:'btn_print',caption:'${i18n.print}[F6]',keyboard:'F6',action:function(){
 					if(!$('#str1').fieldText("validate")){
					     return;
					  	}
 					if($('#fanxdh span').html()==""){
 						showPromptMsg('red',$.sdcui.resource.i18n['C_fanxdh'])
 						return;
 					}
 					var params = $('#form_user_${pageId}').form("getFormParam");
 					params.push("baozzt=10");
 					//params.push("gongysdm="+$('#gongysdm input').val());
 					//params.push("str1="+$('#str1 input').val());
 					var url = "<%=request.getContextPath()%>/yichang/41703.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 if (results.result.response == "0000"){
 								 $('#form_user_${pageId}').form("resetFields");
 								 $('#grid_user_${pageId}').grid('clearRecords');
 								 $('#fanxdh span').html("");
 								 $('#fxgongysdm input').attr("readonly",false);
 								 $('#btn_ok').show();
 								 $('#btn_search').show();
 							 }
 						 }
 					 });
 				}},
 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
 				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
   				]
	});
	
	
 	$(document).ready(function(){
 		var params = [];
 		params.push("danjlx=2");
 			var url = "<%=request.getContextPath()%>/yichang/41704.do";
 			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 				 if (showPromptRequestMsg(results)==true){
 					showPromptMsg('red','')
 					$('#grid_user_${pageId}').grid("parseResult",results)
 					$('#fanxdh span').html(results.result.parameter.fanxdh);
 					$('#chengyunsdm').val('');
 					$('#chengyunsdm').val(results.result.parameter.chengysdm);
 					$('#fxgongysdm input').val(results.result.parameter.fxgongysdm);
 					$('#str1 input').val(results.result.parameter.str1);
 					if(results.result.parameter.fxgongysdm && results.result.parameter.fxgongysdm!=""){
 						$('#fxgongysdm input').attr("readonly",true);
 					}
 					if(results.result.parameter.list!=""){
 						$('#btn_ok').hide();
 						$('#btn_search').hide();
 					}else{
 						$('#btn_ok').show();
 						$('#btn_search').show();
 					}
 				 }
 				 });
	})
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<input type="hidden" id="chengyunsdm"></input>
	<div id="form_user_${pageId}" class="ui-fieldLayout">
		<table class="ui-grid" cellspacing="1" width="100%">
		     <tr>
				<td class="field-label">${i18n.tuihdh}：</td>
				<td class="field-container"><div class="ui-field" id="fanxdh"></div></td>
				<td class="field-label">${i18n.buhpckh}：</td>
				<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		      </tr>
		      <tr>
				<td class="field-label"></td>
				<td class="field-container"></td>
				<td class="field-label">${i18n.chengysdm}：</td>
				<td class="field-container"><div class="ui-field" id=fxgongysdm></div></td>
		      </tr>
		      <tr>
				<td class="field-label">${i18n.elh}：</td>
				<td class="field-container"><div class="ui-field" id="elh"></div></td>
				<td class="field-label">${i18n.gongysdm}：</td>
				<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		      </tr>
		      <tr>
				<td class="field-label">${i18n.lingjbh}：</td>
			    <td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
				<td class="field-label">${i18n.pich}：</td>
				<td class="field-container"><div class="ui-field" id="pich"></div></td>
		      </tr>
		      <tr>
				<td class="field-label">${i18n.ruksj}：</td>
				<td class="field-container"><div class="ui-field" id="rukrq1"></div></td>
				<td class="field-label">${i18n.zhi}：</td>
				<td class="field-container"><div class="ui-field" id="rukrq2"></div></td>
			  </tr>
			   <tr>
				<td class="field-label">${i18n.baoflx}：</td>
				<td class="field-container"><div class="ui-field" id="flag"></div></td>
				<td class="field-label">${i18n.suopdh}：</td>
				<td class="field-container"><div class="ui-field" id="str1"></div></td>	
			  </tr>
		</table>
	</div> 
 <div id="grid_user_${pageId}" class='hidden-item'></div> 
 <div id='prompt'>${i18n.prompt}</div>    
</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>