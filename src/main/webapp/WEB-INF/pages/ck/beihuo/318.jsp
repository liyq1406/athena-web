<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","318");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_318}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		  var paramsQuery;
		  var flag = 0;
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['liush','ush','shifsl','shifdj'],
					id:'grid_user_${pageId}',
					enableCutPage:true,
					src:'<%=request.getContextPath()%>/beihuo/31801.do',
					editSubmitSrc:'<%=request.getContextPath()%>/beihuo/31802.do',
					cols:[
						{property:'lingjbh',caption:'${i18n.lingjh}'},
						{property:'ush',caption:'${i18n.ush}',dataType:'ush',notNull:true,editor:'fieldText',bind:'yush',biaos:'notsubmit'},
				  		{property:'gongysmc',caption:'${i18n.gongys}'},
				  		{property:'beihsl',caption:'${i18n.beihsl}'},
				  		{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'shifsl',caption:'${i18n.shifsl}',editor:'fieldText',notNull:true,dataType:'dbnumber',biaos:'notsubmit'},
				  		{property:'shifdj',caption:'${i18n.yuanbzdj}',editor:'fieldText',defValue:'N',dataType:'yesno',notNull:true,checkchange:'ush'}
					],
					buttons:[
						//F3确认出库
				   	 	{name:'querck',caption:'${i18n.querck}[F3]',keyboard:'F3',action:function(){
					 		//验证参数
		 			 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			 			return;
		 			 		}
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		var beihybh = $('#beihybh input').val();
					 		if(!beihybh){
					 			params[1] = 'beihybh=${userName}';
					 		}
					 		var weicsl = 0;
					 		$('#form_user_${pageId}').form('submit',params,function(results){
							  if (showPromptRequestMsg(results)==true){
							     if(results.result.response !="C_1403"){
						             $('#grid_user_${pageId}').grid('clearRecords');
						             weicsl = results.result.parameter.weicsl;
				                   }
				                 }else{
				                	 weicsl = 0;
				                 }
							  if(weicsl >0){
								  showPromptMsg('blue',$.sdcui.resource.i18n['C_319_0001'](results.result.parameter.weicsl));
							  }
					 		});
						}},
						{name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		//确认出库交易
			 		url:'<%=request.getContextPath()%>/beihuo/31803.do',
			 		fields:[
						{fieldType:'fieldLabel',property:'beihdh',dataType:'beihdh',caption:'${i18n.beihdh}',notNull:false},
						{fieldType:'fieldText',property:'beihybh',dataType:'beihybh',value:st_UserName},
						{fieldType:'fieldText',biaos:'enter',property:'baozdykh',dataType:'baozdykh',caption:'${i18n.baozdykh}',notNull:true}
			 		]
			 	});
			 	
			 	/* //按备货单和包装单元卡查询
 			 	$('#beihdh').bind('enter',function(){
 			 		search();
			    }); */
			 	
 			 	//按备货单和包装单元卡查询
 			 	$('#baozdykh').bind('enter',function(){
 			 		search();
			    });
			 	
			 	$(document).keyboardsupport({});
			});
			
			function search(){
				 flag = 0 ;   //当重新查询时flag为0
				//参数校验
                if(!$('#form_user_${pageId}').form("validateParam")){
                    $('#grid_user_${pageId}').grid('clearRecords');
                    return;
                }
                var params = $('#form_user_${pageId}').form("getFormParam");
                var beihybh = $('#beihybh input').val();
                if(!beihybh){
                    params[1] = 'beihybh=${userName}';
                }
                $('#grid_user_${pageId}').grid("setQueryParams", params);
                var url = "<%=request.getContextPath()%>/beihuo/31801.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 if(results.result.response != 'C_1403'){
						     $('#grid_user_${pageId}').grid("parseResult",results);
							 $('#beihdh span').html(results.result.parameter.beihdh);
							 flag = 1;
							 weicsl = results.result.parameter.weicsl;
						 }
					 }else{
						 $('#beihdh span').html('');
					 }
					if(flag){
						 showPromptMsg('blue',$.sdcui.resource.i18n['C_319_0001'](weicsl)); 
					  }
					 });
			}
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.baozdykh}:</td>
							<td><div class="ui-field" id="baozdykh"></div></td>
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.chuklx}:F</td>
							<td></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>