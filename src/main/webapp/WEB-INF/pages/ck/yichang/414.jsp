<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","414");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_414}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'rukpjh',dataType:'rukpjh',caption:'${i18n.rukpjh}',notNull:true},
                {fieldType:'fieldLabel',property:'lingjsl'},
                {fieldType:'fieldText',property:'ckandzick',dataType:'letter_numeric',limitedLength:'6',limitedLength2:'3',caption:'${i18n.zickbh}',notNull:false},
                {fieldType:'fieldText',property:'buhgpkuw',dataType:'letter_numeric',limitedLength:'6',caption:'${i18n.buhgpkuw}',notNull:false,value:'000000'},
                // modified by xss for 0010815
                {fieldType:'fieldSelect',property:'jippmz',caption:'${i18n.jippmz}',notNull:false,value:'N',realValue:'0',src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
                {fieldType:'fieldLabel',property:'shengbd'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['usxh','usgs','ruksl','ucxh','ucgs','ush','lingjsl','elh','lingjbh','lingjmc','pich','gongysdm','gongysmc','chengysdm','chengysmc','zhuangtsx'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41401.do',
		cols:[
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},	
		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
        {property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
		{property:'ruksl',caption:'${i18n.ruksl}',align:'center',editor:'fieldText',dataType:'dbnumber',width:50},//,width:50
		{property:'usxh',caption:'${i18n.usxh}',align:'center',editor:'fieldText',dataType:'letter_numeric',limitedLength:'5',width:50},
		{property:'usgs',caption:'${i18n.usgs}',align:'center',editor:'fieldText',dataType:'dbnumber',width:50},
		{property:'ucxh',caption:'${i18n.ucxh}',align:'center',editor:'fieldText',dataType:'letter_numeric',limitedLength:'5',width:50},
		{property:'ucgs',caption:'${i18n.ucgs}',align:'center',editor:'fieldText',dataType:'dbnumber',width:50}
  		],
  		buttons:[
				//查询
				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			 		 //参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			$('#grid_user_${pageId}').grid('clearRecords');
						return;	
			 		}
			 		$('#shengbd span').html("");
			 		$('#rukpjh input').attr("disabled",true);
			 		
			 		//提交数据
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		params.push('cangkbh='+$('#cangkbh').val());
			 		$('#grid_user_${pageId}').grid("setQueryParams", params);
			 		var url = "<%=request.getContextPath()%>/yichang/41401.do";
					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
						 	
						 	//modified by xss for 0010824		 
		  					if( results.result.parameter.list.length==0){					  								 		  						
		  					    $('#rukpjh input').attr("disabled",false);
		  					} 		  					
		  					
							//加载grid
							$('#grid_user_${pageId}').grid("parseResult",results)
							$('#lingjsl span').html(results.result.parameter.lingjsl);
							$('#shengbd span').html(results.result.parameter.shengbd);
							$('#ckandzick').val(results.result.parameter.ckandzick);
							$('#danw').val(results.result.parameter.danw);
							$('#cangkbh').val(results.result.parameter.cangkbh)
							if(results.result.parameter.ckandzick != ""){
								$('#ckandzick input').val(results.result.parameter.ckandzick);
								$('#ckandzick input').attr("readonly",true);
							} else {
								$('#ckandzick input').val(st_Cangkbh);
								$('#ckandzick input').attr("readonly",false);
							}
						 }
						 else
						 {
							 $('#grid_user_${pageId}').grid('clearRecords');
							 						  					
							 
						 }
					});
				 	return false;	 		
				}},
				//F2确定
  				{name:'btn_ok',caption:'${i18n.ok}[F2]',keyboard:'F2',action:function(){				
  				
  			 		//是否选中
  					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
  					if(records.length < 1){
  						showPromptMsg('red','${i18n.selecterror}')
  						return false;
  					}
  					if(!$('#ckandzick input').fieldText('validateNotNull')){
  						return;
  					}
  					//验证Grid的输入格式
  			 		if (!$('#grid_user_${pageId}').grid("validate")){
  			 			return false;
  			 		}
  			 		 //提交数据
  			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
  			 		params.push('rukpjh='+$('#rukpjh input').val());
  			 		params.push('buhgpkuw='+$('#buhgpkuw input').val());
  			 		params.push('jippmz='+$('#jippmz input').val());
  			 		params.push('cangkbh='+$('#cangkbh').val());
  			 		params.push('danw='+$('#danw').val());
  			 		params.push('shengbd='+$('#shengbd span').html());
  			 		params.push('lingjsl='+$('#lingjsl span').html());
  			 		params.push('ckandzick='+$('#ckandzick input').val());
  			 		var url = "<%=request.getContextPath()%>/yichang/41402.do";
  					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
  						 if (showPromptRequestMsg(results)==true){
  							 $('#grid_user_${pageId}').grid("parseResult",results)
  							 $('#lingjsl span').html(results.result.parameter.lingjsl);
  							 $('#ckandzick input').attr("readonly",true);
  					
		  					//modified by xss for 0010824		 
		  					if( results.result.parameter.list.length==0){					  								 		  						
		  					    $('#rukpjh input').attr("disabled",false);
		  					} 
  							 
  						 }else{
  							 if (results.result.response == "0000"){
  								 $('#grid_user_${pageId}').grid('clearRecords');
  								 $('#ckandzick input').attr("readonly",false);

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
 					msgClear();
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}},
			 	//返回上一页
				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
				//返回主页
				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
  				]
	});

<%--  	//F3打印US标签
 	$('#btn_print').bind('click',function(){
 		//是否选中
		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 		
		if(records.length < 1){
			showPromptMsg('red','${i18n.selecterror}')
			return false;
		}
 		var url = "<%=request.getContextPath()%>/yichang/41403.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
 	}); --%>
 	
	
 	$(document).keyboardsupport({});
});
//grid中加入零件编号： LJ001 零件名称： 零件001 EL号： EL123456789 批次号： PC0001 供应商编号： M100970000 供应商名称： 宁波华德 
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div> 
<input id="cangkbh" name="cangkbh" type="Hidden"></input>
<input id="danw" name="danw" type="Hidden"></input>
<div id="form_user_${pageId}" class="ui-fieldLayout"> 	
<table class="ui-grid" cellspacing="1" width="100%">
 <tr>
		<td class="field-label">${i18n.rukpjh}：</td>
		<td class="field-container"><div class="ui-field" id="rukpjh"></div></td>
		<td class="field-label">${i18n.lingjsl}：</td>
		<td class="field-container"><div class="ui-field" id="lingjsl"></div></td>
		<td class="field-label">${i18n.zickbh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
    </tr>
	  
		<tr>
		<td class="field-label">${i18n.buhgpkuw}：</td>
		<td class="field-container"><div class="ui-field" id="buhgpkuw"></div></td>
		<td class="field-label">${i18n.jippmz}：</td>
		<td class="field-container" colspan="1"><div class="ui-field" id="jippmz"></div></td>
　　　	<td class="field-label">${i18n.shengbwld}：</td>
		<td class="field-container"><div class="ui-field" id="shengbd"></div></td>
		
	</tr>
   </table>	
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div> 	    
<div id='prompt'>${i18n.prompt}</div>	    		    		    
</div> 			    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>