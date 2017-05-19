<!-- huxy_11462 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","434");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_434}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var zhijqdh="";        
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHousecpck.do'},                           
                {fieldType:'fieldSelect',property:'zhijz',caption:'${i18n.zhijz}',notNull:true,src:'<%=request.getContextPath()%>/common/zhijz.do'},
                {fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}'}, 
                {fieldType:'fieldText',property:'liush1',dataType:'letter_numeric',limitedLength:'7'},
				{fieldType:'fieldText',property:'liush2',dataType:'letter_numeric',limitedLength:'7'}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ckandzick','ush','lingjbh','lingjmc','lingjsl','elh','pich','zhijz','gongysdm','gongysmc','blh','kuwbh','uth','shixq','flag','danw','flag'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/43401.do',
		cols:[
        {property:'zhijz',caption:'${i18n.zhijz}',align:'center',width:'50'},
		{property:'ckandzick',caption:'${i18n.cangkh}',align:'center',width:'50'},
		{property:'ush',caption:'${i18n.ush}',align:'center',width:'50'},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:'50'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:'50'},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:'50'},
		{property:'elh',caption:'${i18n.elh}',align:'center',width:'50'},
		{property:'blh',caption:'${i18n.blh}',align:'center',width:'50'},
		{property:'pich',caption:'${i18n.pich}',align:'center',width:'50'},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:'50'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:'50'},
		{property:'kuwbh',caption:'${i18n.kuw}',align:'center',width:'50'},
		{property:'ruksj',caption:'${i18n.ruksj}',align:'center',width:'50'},
		{property:'shixq',caption:'${i18n.shixq}',align:'center',width:'50'},
		{property:'zhuangtsx',caption:'${i18n.zhuangtsx}',align:'center',width:'50',internation:true},
		{property:'zhuangtxx',caption:'${i18n.zhuangt}',align:'center',width:'40',internation:true}
  		],
  		buttons:[
					//查询
					{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				 		//参数校验
						if(!validRangeData("integer", $('#liush1 input').val(), $('#liush2 input').val())){
                                $('#liush1 input').focus();
                                $('#liush1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                        }
                        if(!$('#form_user_${pageId}').form("validateParam")){
							return;	
 						}
						//提交数据
						var params = $('#form_user_${pageId}').form("getFormParam");								
                        //设置分页条件
				        $('#grid_user_${pageId}').grid("setQueryParams", params);
                        $('#grid_user_${pageId}').grid("load",params);
				 		return false;				 		
					}},
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
	 				//确认
	 				{name:'submit',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
	 					//是否选中
				 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				 		if(records.length < 1){
							showPromptMsg('red','${i18n.selecterror}')
							return false;
						}
				 		var params = $('#form_user_${pageId}').form("getFormParam");
						params = params.concat(records);
						//2015-9-17 张耀强确认，传回数据加zhijqdj
						var str = "zhijqdh="+zhijqdh;
						params = params.concat(str);
				 		var url = "<%=request.getContextPath()%>/yichang/43402.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
							 	if (results.result.response == "0000"){
									zhijqdh=results.result.parameter.zhijqdh;
								}
							 	$('#grid_user_${pageId}').grid("parseResult",results)
	 						 }
						});
	 				}},
				 	//打印
					{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
						//判断质检清单是否存在
						if (zhijqdh==""){
							return;
						}
				 		//查询数据
				 		var params = [];
				 		params.push("zhijqdh="+zhijqdh);
				 		var url = "<%=request.getContextPath()%>/yichang/41003.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								 if (results.result.response == "0000"){
									zhijqdh=results.result.parameter.zhijqdh;
									var params2=[];
									params2.push("usercenter="+st_UserCenter);
									params2.push("zhijqdh='"+ zhijqdh +"'");
									var url2 = "<%=request.getContextPath()%>/yichang/40805.do";
									g_isSub=0;
									doprint(408,params2,url2);
									$('#form_user_${pageId}').form("resetFields");
									$('#grid_user_${pageId}').grid('clearRecords');
									$('#ckandzick input').val(st_Cangkbh);									
									zhijqdh="";
								 }
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
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.cangkbh}：</td>
		<td class="field-container"><div class="ui-field" id="cangkbh"></div></td>
		<td class="field-label">${i18n.zhijz}：</td>
		<td class="field-container"><div class="ui-field" id="zhijz"></div></td>
      </tr>
      <tr>
      	<td class="field-label">${i18n.xulhqlw}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
		<td class="field-label">${i18n.xulhqj}：</td>
		<td><div class="ui-field" style="float:left" id="liush1"></div><div style="float:left" >${i18n.zhi}</div><div style="float:left" class="ui-field"  id="liush2" ></div> </td>
      </tr>
  </table>	
</div> 
<div id="grid_user_${pageId}"></div>
<div id='prompt'>${i18n.prompt}</div>	
</div>    		    		    	    	    	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>