<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","41102");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_41102}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'zhijy'},
                {fieldType:'fieldLabel',property:'zhijz'},
                {fieldType:'fieldLabel',property:'zhijsj'},
                {fieldType:'fieldText',property:'zhidh',dataType:'phone',limitedLength:'11',caption:'${i18n.zhijydh}',notNull:true}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['elh','lingjsl','buhgsl','zhijqdh','zhijjjbgdh','ckandzick','zerzt'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		cols:[
		{property:'zhijjjbgdh',caption:'${i18n.zhijjjbgdh}',align:'center',width:50},
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
		{property:'ckandzick',caption:'${i18n.cangkh}',align:'center',width:50},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},
		{property:'choujsl',caption:'${i18n.zhijsl}',align:'center',width:50},
		{property:'hegsl',caption:'${i18n.hegsl}',align:'center',width:50},
		{property:'buhgsl',caption:'${i18n.buhgsl}',align:'center',width:50},
		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
        {property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
		{property:'zhijqdh',caption:'${i18n.zhijqdh}',align:'center',width:50},
		{property:'shixq',caption:'${i18n.shixq}',align:'center',width:50}
  		],
  		buttons:[
				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
					$('#grid_user_${pageId}').grid('selected');
					return false;
				}},
				//删除
				{name:'delectzjjl',caption:'${i18n.delectzjjl}[F3]',keyboard:'F3',action:function(){
					//获取选择行
					var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','elh')
			        if(currPandfs.length!=1){
			        	showPromptMsg('red','${i18n.selecterror}')
						return false;
					}
					//打开提示框是否删除
					if(confirm($.sdcui.resource.i18n['C_remove'])){
						//存放查询条件
						var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
						vQuery.push("currentPage="+currentPage);
						$('#serachKey').val(vQuery);
		                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
		                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						params.push("currentPage=1");
				 		var url = "<%=request.getContextPath()%>/yichang/41106.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								 $('#grid_user_${pageId}').grid('deleteCheckBoxedRow');
							 }
						});
					}
				}}
  		   ]
	});
	
 	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#zhijz span').html('${result.result.parameter.zhijz}');
			$('#zhijy span').html('${result.result.parameter.zhijy}');
			$('#zhijsj span').html('${result.result.parameter.zhijsj}');
			$('#rongqwls span').html('${result.result.parameter.chengysdm}');
			//$('#zhijqdh').val('${result.result.parameter.zhijqdh}');
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	
	//F1打印
 	$('#btn_print').bind('click',function(){
 	 		 
		//是否选中
 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 		if(records.length < 1){
 			showPromptMsg('red','${i18n.selectoneerror}');
 			return false;
 		}

 		records.push("zhidh="+$('#zhidh input').val());
 		var params = $('#grid_user_${pageId}').grid('getSelectedColumnValue','zhijjjbgdh');
 		var url2 = "<%=request.getContextPath()%>/yichang/41107.do";
		$('#form_user_${pageId}').form("submitUrl", records, url2, function(results){
		
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('clearRecords');
				 $('#grid_user_${pageId}').grid("parseResult",results);
				 
				 //alert('第一次response:'+results.result.response);
				 
				 if(results.result.response == "0000"){
				 //alert('0000:'+results.result.response);
					var strZhijqdh;
		 	 		for(i=0;i<params.length;i++){
		 	 			if(i == 0){
		 	 				strZhijqdh=params[i];
		 	 			}else{
		 	 				strZhijqdh=strZhijqdh+"','" + params[i];
		 	 			}
		 	 		}
		 	 		params.push("usercenter="+st_UserCenter);
		 	 		params.push("zhijjjbgdh='"+ strZhijqdh +"'");
		 	 		var url = "<%=request.getContextPath()%>/yichang/41108.do";
		 	 		g_isSub=0;
		 	 		
		 	 		doprint(st_PageId,params,url,function(){
		 	 			if (!results.result.parameter.list || results.result.parameter.list.length<1){
			 				$(document).keyboardsupport('keyButtonClick','F11')
			 			}	
		 	 		});
		 	 	 
			 	}
			 }else{
			        //showPromptMsg('red',results.result.response);
			        //alert('失败response1:'+results.result.response);	
			        var resp ='i18n.'+results.result.response;
			        var res =results.result.response;
			        // showPromptMsg('red','${i18n.P41107_10');
			} 

			 
		});
 	}); 
	
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<div id="grid_user_${pageId}" class='hidden-item'></div> 
<input id="zhijqdh" name="zhijqdh" type="Hidden"></input>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.zhijy}：</td>
		<td class="field-container"><div class="ui-field" id="zhijy"></div></td>
		<td class="field-label">${i18n.zhijz}：</td>
		<td class="field-container"><div class="ui-field" id="zhijz"></div></td>
		<td class="field-label">${i18n.zhijsj}：</td>
		<td class="field-container"><div class="ui-field" id="zhijsj"></div></td>
		<td class="field-label">${i18n.zhijydh}：</td>
		<td class="field-container"><div class="ui-field" id="zhidh"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.zhijqz}：</td>
		<td class="field-container"></td>
		<td class="field-label">${i18n.wulqz}：</td>
		<td class="field-container"></td>
		<td class="field-label">${i18n.buhgpkqz}：</td>
		<td class="field-container"></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>
  </table>
</div>	
<div align="right">
	<span id="btn_print"  class="ui-button">${i18n.print}[F1]</span>	
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
</div>
	
<div id='prompt'>${i18n.prompt}</div>	
</div>    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>