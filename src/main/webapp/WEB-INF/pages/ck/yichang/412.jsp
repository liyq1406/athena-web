<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","412");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_412}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:false,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
				{fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',limitedLength:'3',caption:'${i18n.zick}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}',notNull:false},
				{fieldType:'fieldText',property:'zhijrq1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.zhijsj1}',notNull:false},
				{fieldType:'fieldText',property:'zhijrq2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:false},				
				{fieldType:'fieldSelect',property:'zhijz',caption:'${i18n.zhijz}',notNull:false,src:'<%=request.getContextPath()%>/common/zhijz.do'}
				]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['zhijjjbgdh'],
		id:'grid_user_${pageId}',
		//enableCutPage:false,
		showCheckbox:true,
		pageSize:'5',
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41201.do',
		cols:[
        {property:'zhijjjbgdh',caption:'${i18n.zhijjjbgdh}',align:'center',width:50},
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
  		{property:'ckandzick',caption:'${i18n.cangkbh}',align:'center',width:50},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},
  		{property:'choujsl',caption:'${i18n.zhijsl}',align:'center',width:50},
  		{property:'hegsl',caption:'${i18n.hegsl}',align:'center',width:50},
  		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
  		{property:'zhijz',caption:'${i18n.zhijz}',align:'center',width:50},
  		{property:'caozy',caption:'${i18n.yonghm}',align:'center',width:50},
  		{property:'zhijy',caption:'${i18n.zhijy}',align:'center',width:50},
  		{property:'shixq',caption:'${i18n.shixq}',align:'center',width:50},
  		{property:'zerztxx',caption:'${i18n.zerzt}',align:'center',internation:true,width:50},
  		{property:'zhijsj',caption:'${i18n.blscsj}',align:'center',width:50},
  		{property:'yuany',caption:'${i18n.buhgyy}',align:'center',width:50},
  		],
  		buttons:[
					//查询
					{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				 		//参数校验
						  if(!$('#form_user_${pageId}').form("validateParam")){
								return;	
						}
					 		var shengbrq1 = $('#zhijrq1 input').val();
					 		var shengbrq2 = $('#zhijrq2 input').val();
							  var date1 = new Date(shengbrq1.replace(/-/g,"/"));
							  var date2 = new Date(shengbrq2.replace(/-/g,"/"));
							  if(date1>date2){
									 showPromptMsg('red','${i18n.diyigsjxydrg}')
									 return;
							  }
				 		 //提交数据
				 		var params = $('#form_user_${pageId}').form("getFormParam");
				 		params.push('pageSize=5');
				 		$('#grid_user_${pageId}').grid("setQueryParams", params);
				 		var url = "<%=request.getContextPath()%>/yichang/41201.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){

									//加载返回数据
									$('#grid_user_${pageId}').grid("parseResult",results)
							 }
							 });
						 return false;			 		
					}},
					//单选
					{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
						return false;
					}},
				 	//查看
					{name:'info',caption:'${i18n.info}[F3]',keyboard:'F3',action:function(){
						//获取选择行
						var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','zhijjjbgdh')
				        if(currPandfs.length!=1){
				        	showPromptMsg('red','${i18n.selecterror}')
							return false;
						}
						
						//存放查询条件
						var Query= $('#form_user_${pageId}').form("getFormParam");
						var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
						$('#serachKey').val(vQuery);
		                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
		                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						//去掉List[0];
						for(i=0;i<params.length;i++){
							params[i]=params[i].toString().replace("list[0].","");
						}
				 		var url = "<%=request.getContextPath()%>/yichang/41202.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								 if (results.result.response == "0000"){
									//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/yichang/4120202.do"+st_Params);
		    			    		document.putform.submit();
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
 	//加载时判断是否是回退
 	$(document).ready(function(){
 		if ( $('#serachKey').val()!=""){
 			//为界面查询字段赋值
 			var params = $('#serachKey').val().split(",");
 			for(i=0;i<params.length;i++){
 				var vParam = params[i].split("=");
 				if (vParam[0].indexOf("elh") != -1){                   //任务编号
 					$('#elh input').val(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("lingjbh") != -1){           //状态信息
 					$('#lingjbh input').val(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("cangkbh") != -1){             //状态
 					$('#cangkbh input').attr(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("zickbh") != -1){        //生成库存时间
 					$('#zickbh input').val(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("gongysdm") != -1){        //生成库存时间
 					$('#gongysdm input').val(vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("pich") != -1){        //生成库存时间
 					$('#pich input').val(vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("zhijsj1") != -1){        //生成库存时间
 					$('#zhijsj1 input').val(vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("zhijsj2") != -1){        //生成库存时间
 					$('#zhijsj2 input').val(vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("zhijz") != -1){        //生成库存时间
 					$('#zhijz input').val(vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("currentPage") != -1){       //页码
 					currentPage = vParam[1]
 					continue;
 				}
 			}
 			//移除当前页码
 			params.splice(params.length-1,1);
 			//设置分页条件
 			$('#grid_user_${pageId}').grid("setQueryParams", params);
 			//加载列表数据
 			$('#grid_user_${pageId}').grid("load",params);
 		}
 	});
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>  
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.cangk}：</td>
		<td class="field-container"><div class="ui-field" id="cangkbh"></div></td>
      </tr>
       <tr>
		<td class="field-label">${i18n.zick}：</td>
		<td class="field-container"><div class="ui-field" id="zickbh"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
       </tr>
       <tr>
        <td class="field-label">${i18n.zhijz}：</td>
		<td class="field-container"><div class="ui-field" id="zhijz"></div></td>
		<td class="field-label">${i18n.zhijsj}：</td>
		<td colspan="3"><div style="float:left" class="ui-field" id="zhijrq1"></div><div style="float:left" >-</div><div class="ui-field" style="float:left" id="zhijrq2"></div></td>
       </tr>
  </table>
</div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>    
<div id='prompt'>${i18n.prompt}</div>	    		    		    
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>