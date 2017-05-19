<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","356");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
	<title>${i18n.title_356}</title>
	<jsp:include page="../../common/js.jsp" />
	<script type="text/javascript">
       var paramsQuery;
       var currentPage = 1;
		$(function(){
		$('.hidden-item').hide();
		$('#grid_user_${pageId}').grid({
			keyFields:['uch','yush','shangxxh','shifsl','shifdj','liush'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			src:'<%=request.getContextPath()%>/beihuo/35601.do',
			cols:[
				{property:'uch',caption:'${i18n.uah}'}, 
				{property:'lingjbh',caption:'${i18n.lingjh}'},
		  		{property:'yush',caption:'${i18n.ush}'},
		  		{property:'shangxxh',caption:'${i18n.kehbz}'},
		  		{property:'shifsl',caption:'${i18n.shifsl}'},
		  		{property:'danw',caption:'${i18n.lingjdw}'}
			],
			buttons:[
				//选中
				{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}},
				//全选
				{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
				}},
				//取消
				{name:'qux',caption:'${i18n.qux}[F7]',keyboard:'F7',action:function(){
				    //验证备货单号是否改变
 			 		if (checkBeihdhChange()){
 			 			return;
 			 		}
 		 			//参数校验 
 			 		if(!$('#beihdh').fieldText('validate')){
 			 			return ;
 		 			}
					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
					if(params.length < 1){
				       showPromptMsg('red','${i18n.selectoneerror}')
				       return false;
				       }
				     params.push("beihdh="+$('#beihdh input').val());
					var url = "<%=request.getContextPath()%>/beihuo/35606.do";
					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 		    if (showPromptRequestMsg(results)==true){
			 		    	 if(results.result.response == '0000'){
								//加载返回数据
								$('#grid_user_${pageId}').grid('parseResult',results);
								$("#chuksl span").html(results.result.parameter.chuksl);
    		                    $("#weicsl input").val(results.result.parameter.weicsl);
								}
							}	 
			          });
	    		 return false;
		 	   }},
				//F8出库完成
			   {name:'print',caption:'${i18n.chukwc}[F8]',keyboard:'F8',action:function(){
	 			 		//验证备货单号是否改变
	 			 		if (checkBeihdhChange()){
	 			 			return;
	 			 		}
	 		 			//参数校验 
	 			 		if(!$('#beihdh').fieldText('validate')){
	 			 			return ;
	 		 			}
	 		 			if('CP'==$('#beihlx input').val()){
		 			 	    if(!$('#chengysdm').fieldSelect("validateNotNull")){
						 			return;
						 	  }
	 			    	 }
	 			 		var params = [];
	 		 			params.push("beihdh=" + $('#beihdh input').val());
	                    params.push('cangkbh=' + st_Cangkbh);
	                    params.push('chengysdm=' + $('#chengysdm input').attr('realValue'));
	                    var weicsl = $('#weicsl input').val();
	 			 		  if(weicsl > 0 ? confirm($.sdcui.resource.i18n['C_319_0002']) : 1){
	                          var url="<%=request.getContextPath()%>/beihuo/35604.do";
	                          $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                          	if (showPromptRequestMsg(results)){
	                                  $('#form_user_${pageId}').form('clearValue');
	                                  $('#grid_user_${pageId}').grid('clearRecords');
	                                  $('#beihybh span').html(st_UserName);
	                                  $('.hidden-item').hide();
	                              }
	                          });
	                      }
					}},
				//F11返回上一页
                 {name:'back',caption:'${i18n.back}[F11]'},
                 //F12返回
                 {name:'return',caption:'${i18n.return}[F12]'}
	                   
			]
		});

			//确认表单界面
		  	$("#form_user_${pageId}").form({
				fields:[
					{fieldType:'fieldText',biaos:'enter',property:'beihdh',dataType:'beihdh',notNull:true,caption:'${i18n.beihdh}'},
				    {fieldType:'fieldLabel',property:'beihybh',dataType:'beihybh',value:st_UserName},
				    {fieldType:'fieldLabel',property:'keh',dataType:'keh'},
					{fieldType:'fieldLabel',property:'baozzsl'},
					{fieldType:'fieldLabel',property:'chuksl'},
					{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',notNull:true,caption:'${i18n.ush}'},
					{fieldType:'fieldHidden',property:'liush'},
					{fieldType:'fieldHidden',property:'weicsl'},
					{fieldType:'fieldHidden',property:'oldbhdh'},
					{fieldType:'fieldSelect',property:'chengysdm',caption:'${i18n.chengysdm}'},
					{fieldType:'fieldHidden',property:'beihlx'}
					
				]
			});
		  	
		  	
		 	
		  	
		 	//按备货单号查询
		 	$('#beihdh').bind('enter',function(){
		 	    $('#chengysdm').fieldSelect('resetDatasource',[]);
		 	    $('.hidden-item').hide();
			 	if (!$('#beihdh').fieldText('validate')){
			 		return;
			 	}
		 	    var params = [];
		 		params.push('beihdh='+ $('#beihdh input').val());
		 		params.push('cangkbh=' + st_Cangkbh);
	            paramsQuery = jQuery.extend(true,[],params);
	            params.push('currentPage=1');
	            $('#grid_user_${pageId}').grid("setQueryParams", params);
	            var url="<%=request.getContextPath()%>/beihuo/35601.do";
		        $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		                  if (showPromptRequestMsg(results)){
		                     // weicsl = results.result.parameter.weicsl;
		                      $("#keh span").html(results.result.parameter.keh);
		                      $("#baozzsl span").html(results.result.parameter.baozzsl);
		                      $("#chuksl span").html(results.result.parameter.chuksl);
		                      $("#weicsl input").val(results.result.parameter.weicsl);
		                      $("#oldbhdh input").val(results.result.parameter.beihdh);
		                      $("#beihlx input").val(results.result.parameter.beihlx);
		                      $('#grid_user_${pageId}').grid('parseResult',results);
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
		    });
		 	//按US号查询
			 	$('#ush').bind('enter',function(){
		 		//验证备货单号是否改变
		 		if (checkBeihdhChange()){
		 			return;
		 		}
	 			//参数校验 
		 		if(!$('#beihdh').fieldText('validate') || !$('#ush').fieldText('validate')){
		 			return;
	 			}
		 		var params = [];
		 		params.push("beihdh=" + $('#beihdh input').val());
		 		params.push("ush=" + $('#ush input').val());
		 		params.push('cangkbh=' + st_Cangkbh);
                var url="<%=request.getContextPath()%>/beihuo/35602.do";
                $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                	if (showPromptRequestMsg(results)){
                	   if(results.result.response =="0000"){
                	    g_isSub = 0;
                        $("#liush").fieldHidden("setValue",results.result.parameter.liush);
                        var param = $('#form_user_${pageId}').form("getFormParam");
                        param.push('lingjbh='+results.result.parameter.lingjbh);
                        param.push('shifsl='+results.result.parameter.shifsl);
                        param.push('usxh='+results.result.parameter.usxh);
                        param.push('zickbh='+results.result.parameter.zickbh); 
                        param.push('kuwbh='+results.result.parameter.kuwbh);
    	                param.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
    	                var url="<%=request.getContextPath()%>/beihuo/35603.do";
    	                $('#form_user_${pageId}').form("submitUrl", param, url, function(results){
    					  if (showPromptRequestMsg(results)==true){
    					     if(results.result.response !="C_1403"){
    	                        $("#chuksl span").html(results.result.parameter.chuksl);
    		                    $("#weicsl input").val(results.result.parameter.weicsl);
    		                    $("#ush input").val('');
    		                    $('#grid_user_${pageId}').grid('parseResult',results);
    		                   }
    		                 }
    			 		});
    			 	 }
                        
                    }
                });
			 });
		 	$(document).keyboardsupport({});
		});
		function checkBeihdhChange(){
			var newValue = $('#beihdh input').val();
			var oldValue = $('#oldbhdh input').val();
			if (newValue != oldValue){
				showPromptMsg('red',$.sdcui.resource.i18n['C_F_BEIHDHYGB']);
				return true;
			}else{
				return false;
			}
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
							<td>${i18n.chuklx}:</td>
							<td>H</td>
						</tr>
						<tr>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.baozzsl}:</td>
							<td><div class="ui-field" id="baozzsl"></div></td>
							<td>${i18n.yisgs}:</td>
							<td><div class="ui-field" id="chuksl"></div></td>
						</tr>
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td class="hidden-item">${i18n.chengysdm}:</td>
							<td class="hidden-item"><div class="ui-field" id="chengysdm"></div></td>
							<td><div class="ui-field" id="beihlx"></div></td>
							<td><div class="ui-field" id="liush"></div></td>
							<td><div class="ui-field" id="oldbhdh"></div></td>
							<td><div class="ui-field" id="weicsl"></div></td>
						</tr>
				 </tbody>
				</table>
				</div>
			<div  id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>