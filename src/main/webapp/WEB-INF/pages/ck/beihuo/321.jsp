<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","321");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_321}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		 
		    var paramsQuery;
		    var currentPage = 1;
			$(function(){
			     $('.hidden-item').hide();
				var par=[];
				girdload();
				function girdload(){
					$('#grid_user_${pageId}').grid({
						keyFields:['uch','ush','shangxxh','shifsl','shifdj'],
						id:'grid_user_${pageId}',
						params:par,
						src:'<%=request.getContextPath()%>/beihuo/32101.do',
						editSubmitSrc:'<%=request.getContextPath()%>/beihuo/32102.do',
						cols:[
							{property:'uch',caption:'${i18n.uah}'}, 
							{property:'lingjbh',caption:'${i18n.lingjh}'},
					  		{property:'ush',caption:'${i18n.ush}',editor:'fieldText',dataType:'ush',notNull:true,editor:'fieldText',bind:'yush',biaos:'notsubmit'},
					  		{property:'gongysmc',caption:'${i18n.gongys}'},
					  		{property:'shangxxh',caption:'${i18n.kehbz}',editor:'fieldText',notNull:true,dataType:'letter_numeric',limitedLength:'5',biaos:'notsubmit'},
					  		{property:'shifsl',caption:'${i18n.shifsl}',editor:'fieldText',notNull:true,dataType:'dbnumber',biaos:'notsubmit'},
					  		{property:'danw',caption:'${i18n.lingjdw}'},
					  		{property:'shifdj',caption:'${i18n.yuanbzdj}',editor:'fieldText',defValue:'N',dataType:'yesno',notNull:true,onenter:'enter()'}
						],
						buttons:[
							//F3确认出库
					   	 	{name:'querck',caption:'${i18n.querck}[F3]',keyboard:'F3',action:function(){
						 		//验证参数
			 			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			 			return;
			 			 		}
			 			 		if('CP'==$('#beihlx input').val()){
			 			 	      if(!$('#chengysdm').fieldSelect("validateNotNull")){
							 			return;
							 		}
			 			 		}
						 		var params = $('#form_user_${pageId}').form("getFormParam");
						 		var beihybh = $('#beihybh input').val();
				                if(!beihybh){
				                    params = rpArrProperty(params,'beihybh','${userName}');
				                }
				                params.push('cangkbh=' + st_Cangkbh);
						 		$('#form_user_${pageId}').form('submit',params,function(results){
							  if (showPromptRequestMsg(results)==true){
							     if(results.result.response !="C_1403"){
						             $('#grid_user_${pageId}').grid('clearRecords');
						             $('.hidden-item').hide();
				                   }
				                 }
						 		});
							}},
							//F11返回上一页
	                        {name:'back',caption:'${i18n.back}[F11]'},
	                        //F12返回
	                        {name:'return',caption:'${i18n.return}[F12]'}
	                      
						]
					});
				}
				
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/32103.do',
					fields:[
						{fieldType:'fieldText',biaos:'enter',property:'beihdh',dataType:'beihdh',notNull:true,caption:'${i18n.beihdh}'},
						{fieldType:'fieldText',biaos:'enter',property:'beihybh',dataType:'beihybh',value:st_UserName},
						{fieldType:'fieldLabel',property:'xiehzt'},
						{fieldType:'fieldHidden',property:'beihlx'},
						{fieldType:'fieldSelect',property:'chengysdm',caption:'${i18n.chengysdm}'},
						{fieldType:'fieldLabel',property:'keh'}
					]
				}); 
			 	
			 	//按备货单号查询
 			 	$('#beihdh').bind('enter',function(){
 			 	    search();
				 });	
			 	
 			 	//按备货员编号查询
 			 	$('#beihybh').bind('enter',function(){
 			 		search();
			    }); 
 			 	function search(){
 			 	   $('#chengysdm').fieldSelect('resetDatasource',[]);
 			 	   $('.hidden-item').hide();
 	                //验证参数
 	                if(!$('#form_user_${pageId}').form("validateParam")){
 	                    $('#grid_user_${pageId}').grid('clearRecords');
 	                    return;
 	                }
 	                var params = $('#form_user_${pageId}').form("getFormParam");
 	                var beihybh = $('#beihybh input').val();
 	                if(!beihybh){
 	                    params = rpArrProperty(params,'beihybh','${userName}');
 	                }
 	                params.push('cangkbh=' + st_Cangkbh);
 	                paramsQuery = jQuery.extend(true,[],params);
 	                currentPage = 1;
 	                params.push('currentPage=1');
 	                $('#grid_user_${pageId}').grid("setQueryParams", params);
 	                var url = "<%=request.getContextPath()%>/beihuo/32101.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 $('#xiehzt span').html(results.result.parameter.xiehzt);
 							 $('#keh span').html(results.result.parameter.keh);
 							 $('#grid_user_${pageId}').grid('parseResult',results);
 							 $('#beihlx input').val(results.result.parameter.beihlx);
 							  par=[];
 							  girdload();
 							  par.push('beihdh='+$('#beihdh input').val());
 					      if('CP'==results.result.parameter.beihlx ){
 					          $('.hidden-item').show();
 							  var params2=[];
 							  params2.push("keh="+results.result.parameter.keh);
 							  params2.push("usercenter="+st_UserCenter);
 							  g_isSub = 0 ;
 							     var url2 = "<%=request.getContextPath()%>/beihuo/chengysdm.do";
			 					 $('#form_user_${pageId}').form("submitUrl", params2, url2, function(results){
			 						 if (showPromptRequestMsg(results)==true){
			 						 $('#chengysdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/beihuo/chengysdm.do'+st_Params+'&keh='+$("#keh span").html() +'&cangkbh='+st_Cangkbh+'&usercenter='+st_UserCenter);
			 						 $('#chengysdm input').val(results.result.parameter.chengysdm);
			 						 $('#chengysdm input').attr('realvalue',results.result.parameter.chengysdm);
			 						 
			 							 }
			 						 });
			 			}
 							 }
 						 });
 				}
			 	$(document).keyboardsupport({});
			});
			  function enter(){
			    var srcTr = $(document).find(".ed");
				var shifsl = srcTr.find('.shifsl :input').val();
				var oldvalue = srcTr.find('td.ush').attr("value");
				var newvalue = srcTr.find('.ush :input').val();
				var editValue= srcTr.find('.shifdj :input').val();
				if('0' == shifsl){
				
				}else{
			      if (oldvalue == newvalue && editValue == 'Y'){
						showMsg($.sdcui.resource.i18n['C_F_CHECKUSCHANGE']);
						return false;
					}
				}
				
				return true;
			    
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
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.chuklx}：G</td>
						</tr>
						<tr>
							<td>${i18n.fahzt}:</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td class="hidden-item">${i18n.chengysdm}:</td>
							<td class="hidden-item"><div class="ui-field" id="chengysdm"></div></td>
							<td><div class="ui-field" id="beihlx"></div></td>
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