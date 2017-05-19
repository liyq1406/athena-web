<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","436");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_436}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'fanxdh',dataType:'fanxdh',caption:'${i18n.fanxdh}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'qissj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.qissj}',notNull:false},
				{fieldType:'fieldText',property:'zhongzsj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.zhongzsj}',notNull:false},
				{fieldType:'fieldText',property:'caozy',caption:'${i18n.username}',notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['fanxdh','zhuangt'],
		id:'grid_user_${pageId}',
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/43601.do',
		cols:[
		{property:'fanxrkdh',caption:'${i18n.fanxrkdh}',align:'center',width:40},
  		{property:'fanxdh',caption:'${i18n.fanxdh}',align:'center',width:40},
  		{property:'elh',caption:'${i18n.elh}',align:'center',width:40},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:40},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:40},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:40},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:40},
  		{property:'zhuangt',caption:'${i18n.fanxzt}',internation:true,align:'center',width:40},
  		{property:'fanxsl',caption:'${i18n.fanxsl}',align:'center',width:40},
  		{property:'fanxrksl',caption:'${i18n.fanxrksl}',align:'center',width:40},
  		{property:'zhijsj',caption:'${i18n.shengcsj}',align:'center',width:40},
  		{property:'caozy',caption:'${i18n.creator}',align:'center',width:40},
  		{property:'cangkbh',caption:'${i18n.cangkbh}',align:'center',width:40},
  		
  		],
		buttons:[
	 				//F1查询
	 				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	 			 		//参数校验
	 					  if(!$('#form_user_${pageId}').form("validateParam")){
	 							return;	
	 					}  
	 				 		var shengbrq1 = $('#qissj input').val();
	 				 		var shengbrq2 = $('#zhongzsj input').val();
	 						  var date1 = new Date(shengbrq1.replace(/-/g,"/"));
	 						  var date2 = new Date(shengbrq2.replace(/-/g,"/"));
	 						  if(date1>date2){
	 								 showPromptMsg('red','${i18n.diyigsjxydrg}')
	 								 return;
	 						  }
	 			 		var params = $('#form_user_${pageId}').form("getFormParam");
	 			 		if($('#zhuangtsx input').val() == "")
	 			 		{	 			 		
	 			 			params.splice(3,1,"zhuangtsx=0");	 			 			 			
	 			 		}	 			 		
	 					params.push("currentPage="+currentPage);
	 					$('#grid_user_${pageId}').grid("setQueryParams", params);
	 			 		var url = "<%=request.getContextPath()%>/yichang/43601.do";
	 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 						 if (showPromptRequestMsg(results)==true){
	 							 $('#grid_user_${pageId}').grid("parseResult",results)
	 						 }
	 						 });
	 			 		return false;
	 				}},
	 				
	 				
	 				//返回上一页
	 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
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
				if (vParam[0].indexOf("fanxdh") != -1){                   //任务编号
					$('#fanxdh input').val(vParam[1])
					continue;
				}else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
					$('#lingjbh').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
					$('#gongysdm').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
					$('#zhuangtsx').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
					$('#qissj').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
					$('#zhongzsj').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
					$('#caozy').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("currentPage") != -1){       //页码
					currentPage = vParam[1]
					continue;
				}
			}
			//移除当前页码
			params.splice(params.length-1,1);
			//设置分页条件
			$('#grid_user_${pageId}').grid("setQueryParams", params);
			//加载列表数据
			$('#grid_user_${pageId}').grid("load",params,function(results){
                    if(showPromptRequestMsg(results)){
                        
                    }
                   });
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
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
        <tr>
		<td class="field-label">${i18n.fanxdh}：</td>
		<td class="field-container"><div class="ui-field" id="fanxdh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>		
      </tr>
	  <tr>	
		<td class="field-label">${i18n.fanxiusj}：</td>
		<td class="field-container"><div style="float:left" class="ui-field" id="qissj"></div>
		 <div style="float:left" >-</div>
        <div style="float:left" class="ui-field" id="zhongzsj"></div>
		<td class="field-label">${i18n.username}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>
      </tr>
  </table>
<div id="grid_user_${pageId}" class='hidden-item'></div>	
</div> 
<div id='prompt'>${i18n.prompt}</div>	    		    
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>