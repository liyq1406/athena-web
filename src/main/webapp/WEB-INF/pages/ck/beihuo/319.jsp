<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","319");%>

<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
	<title>${i18n.title_319}</title>
	<jsp:include page="../../common/js.jsp" />
	<script type="text/javascript">
       var paramsQuery;
       var currentPage = 1;
       var chuksl = 0;
       var  weicsl = 0;
		$(function(){
			$('#grid_user_${pageId}').grid({
				keyFields:['uch'],
				id:'grid_user_${pageId}',
				src:'<%=request.getContextPath()%>/beihuo/31901.do',
				cols:[
					{property:'ush',caption:'${i18n.ush}'}, 
			  		{property:'shangxxh',caption:'${i18n.shangxbz}'},
			  		{property:'lingjsl',caption:'${i18n.uskcsl}'},
			  		{property:'yaohsl',caption:'${i18n.yaohsl}'},
			  		{property:'shifsl',caption:'${i18n.shifsl}'},
			  		{property:'danw',caption:'${i18n.lingjdw}'},
					{property:'lingjbh',caption:'${i18n.lingjh}'},
			  		{property:'lingjmc',caption:'${i18n.lingjmc}'},
			  		{property:'uch',caption:'${i18n.uah}'}
				],
				buttons:[
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
	 			 		var params = [];
	 		 			params.push("beihdh=" + $('#beihdh input').val());
	                       params.push("keh=" + $('#keh span').html());
	                       params.push('cangkbh=' + st_Cangkbh);
	 			 		var beihybh = $('#beihybh span').html();
	 			 		if(beihybh){
	 			 			params.push('beihybh='+ beihybh);
	 			 		}else{
	 			 			params.push('beihybh=${userName}');
	 			 		}    
	 			 		  if( weicsl > 0 ? confirm($.sdcui.resource.i18n['C_319_0002']) : 1){
	                          var url="<%=request.getContextPath()%>/beihuo/31906.do";
	                          $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                          	if (showPromptRequestMsg(results)){
	                                  $('#form_user_${pageId}').form('clearValue');
	                                  $('#form_user_${pageId}_update').form('clearValue');
	                                  $('#grid_user_${pageId}').grid('clearRecords');
	                                  $('.hidden-item').hide();
	                                  $('.hidden-div2').show();
	                                  $('.hidden-div1').hide();
	                              }
	                          });
	                      }
					}}
				]
			});
			
			//零件序列号列表
	              $('#grid_user_lingj_${pageId}').grid({
	                  keyFields:['lingjxlh'],
	                  enableCutPage:false,//是否允许分页
	                  showCheckbox : true, // 显示复选框
	                  id:'grid_user_lingj_${pageId}',
	                  cols:[
	                      {property:'lingjxlh',caption:'${i18n.lingjxlh}'}
	                  ],
	                  buttons:[
	                      //F4单选
	                      {name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
	                              $('#grid_user_lingj_${pageId}').grid('selected');
	                              msgClear();
	                              return false;
	                      }},
	                      //F5全选
	                      {name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
	                              $('#grid_user_lingj_${pageId}').grid('selectedAll');
	                              msgClear();
	                              return false;
	                      }}
	                  ]
	              });
			
			//确认表单界面
		  	$("#form_user_${pageId}").form({
		  		onreload:true,
				fields:[
					{fieldType:'fieldText',biaos:'enter',property:'beihdh',dataType:'beihdh',notNull:true,caption:'${i18n.beihdh}'},
				    {fieldType:'fieldLabel',property:'beihybh',dataType:'beihybh',value:st_UserName},
				    {fieldType:'fieldLabel',property:'keh',dataType:'keh'},
					{fieldType:'fieldLabel',property:'baozzsl'},
					{fieldType:'fieldLabel',property:'yickbzsl'},
					{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',notNull:true,caption:'${i18n.ush}'},
					{fieldType:'fieldText',property:'uaxh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.uabz}'},
					{fieldType:'fieldText',property:'shifsl',dataType:'dbnumber',notNull:true,caption:'${i18n.shifsl}'},
					{fieldType:'fieldText',property:'ucxh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.ucxh}'},
					{fieldType:'fieldText',property:'ucgs',dataType:'plusinteger',notNull:true,caption:'${i18n.ucgs}'},
					{fieldType:'fieldLabel',property:'xiehzt',caption:'${i18n.shouhzt}'},
					{fieldType:'fieldHidden',property:'liush'}
				]
			});
		  	
		  	//修改表单界面
		  	$("#form_user_${pageId}_update").form({
		 		url:'<%=request.getContextPath()%>/beihuo/31905.do',
				fields:[
					{fieldType:'fieldText',biaos:'enter',property:'xg_uch',dataType:'letter_numeric',limitedLength:'9',limitedLength2:'10',notNull:true,caption:'${i18n.uah}'},
					{fieldType:'fieldText',biaos:'enter',property:'xg_ush',dataType:'ush',notNull:true,caption:'${i18n.ush}'},
					{fieldType:'fieldText',property:'xg_uaxh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.uabz}'},
					{fieldType:'fieldText',property:'xg_shifsl',dataType:'dbnumber',notNull:true,caption:'${i18n.shifsl}'},
					{fieldType:'fieldText',property:'xg_ucxh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.ucxh}'},
					{fieldType:'fieldText',property:'xg_ucgs',dataType:'plusinteger',notNull:true,caption:'${i18n.ucgs}'},
					{fieldType:'fieldHidden',property:'xg_beihdh'},
					{fieldType:'fieldHidden',property:'xg_yush'}
				]
			});
		 	
		  	
		 	//按备货单号查询
		 	$('#beihdh').bind('enter',function(){
			 	if (!$('#beihdh').fieldText('validate')){
			 		return;
			 	}
		 		submitBeihdh();
		    });
		 	
		 	//按US号查询
			 	$('#ush').bind('enter',function(){
		 		//验证备货单号是否改变
		 		if (checkBeihdhChange()){
		 			return;
		 		}
	 			//参数校验 
		 		if(!$('#beihdh').fieldText('validate') || !$('#ush').fieldText('validate')){
                    $("#uaxh").fieldText("setValue","");
                    $("#shifsl").fieldText("setValue","");
                    $("#ucxh").fieldText("setValue","");
                    $("#ucgs").fieldText("setValue","");
                    $("#liush").fieldHidden("setValue","");
		 			return;
	 			}
		 		var params = [];
		 		params.push("beihdh=" + $('#beihdh input').val());
		 		params.push("ush=" + $('#ush input').val());
		 		params.push('cangkbh=' + st_Cangkbh);
                var url="<%=request.getContextPath()%>/beihuo/31902.do";
                $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                	if (showPromptRequestMsg(results)){
                		$('#grid_user_lingj_${pageId}').grid('clearRecords');
                        $("#uaxh").fieldText("setValue",results.result.parameter.uaxh);
                        $("#shifsl").fieldText("setValue",results.result.parameter.shifsl);
                        $("#ucxh").fieldText("setValue",results.result.parameter.ucxh);
                        $("#ucgs").fieldText("setValue",results.result.parameter.ucgs);
                        $("#liush").fieldHidden("setValue",results.result.parameter.liush);
                        if (results.result.parameter.list.length > 0){
                        	$('.hidden-div1').show();
                        	$('.hidden-div2').hide();
                        	$('#grid_user_lingj_${pageId}').grid('parseResult',results);
                            var shifsl = parseInt($("#shifsl input").val());
                            //当实发数量大于等于零件序列号数量时默认全选
                            if (shifsl >= results.result.parameter.list.length){
                                $('#grid_user_lingj_${pageId}').grid('selectedAll');
                            }
                        }else{
                        	$('.hidden-div1').hide();
                            $('.hidden-div2').show();
                        }
                    }else{
                        $("#uaxh").fieldText("setValue","");
                        $("#shifsl").fieldText("setValue","");
                        $("#ucxh").fieldText("setValue","");
                        $("#ucgs").fieldText("setValue","");
                        //$("#xiehzt span").html("");
                        $("#liush").fieldHidden("setValue","");
                    }
                });
			 });
		 	
			    //确认明细F3
	              $('#btn_submit').bind('click',function(){
	              	 //验证备货单号是否改变
	                  if (checkBeihdhChange()){
	                      return;
	                  }
	                  //验证参数
	                  if(!$('#form_user_${pageId}').form("validateParam")){
	                      return;
	                  }
	                  //实发数量
	                  var shifsl = parseInt($("#shifsl input").val());
	                  //所有序列号
	                  var allrecords = $('#grid_user_lingj_${pageId}').grid('getRecordAll');
	                  //勾选序列号
	                  var records = $('#grid_user_lingj_${pageId}').grid('getSelectedAll');
	                  if (shifsl < records.length ){
	                  	showPromptMsg('red',$.sdcui.resource.i18n['C_F_SHIFSLSMALLER']);
	                  	return;
	                  }else if (shifsl > records.length && records.length < allrecords.length){
	                  	showPromptMsg('red',$.sdcui.resource.i18n['C_F_SHIFSLBIGGER']);
	                  	return;
	                  }
	                  
	                  var xlhListStr;
	                  if(records.length == 0){
	                  	xlhListStr = '\'\'';
	                  }
	                  else {
	                  	var xlhList = [];
	                   for(var i=0;i<records.length;i++){
	                       var xlh = records[i].split('=');
	                       xlhList.push('\''+xlh[1]+'\'');
	                   }
	                   xlhListStr = xlhList.join(',');
	                  }
	                  var params = $('#form_user_${pageId}').form("getFormParam");
	                  params.push('yush='+ $('#ush input').val());
	                  params.push('xlhList=' + xlhListStr);
	                  params.push('cangkbh=' + st_Cangkbh);
	                  params.push("currentPage=1");
	                  currentPage = 1;
	                  var flag = 0;
                       var url="<%=request.getContextPath()%>/beihuo/31903.do";
		              $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		                  if(showPromptRequestMsg(results)){
		                     if(results.result.response == '0000'){
		                        flag = 1;
		                       }
		                      $("#baozzsl").fieldLabel("setValue",results.result.parameter.baozzsl);
		                      chuksl = chuksl+1;
		                      weicsl = results.result.parameter.weicsl;
		                      $("#yickbzsl").fieldLabel("setValue",chuksl);
		                      $("#ush").fieldText("setValue","");
		                      $("#uaxh").fieldText("setValue","");
		                      $("#shifsl").fieldText("setValue","");
		                      $("#ucxh").fieldText("setValue","");
		                      $("#ucgs").fieldText("setValue","");
		                      $("#liush").fieldHidden("setValue","");
		                      //保存后清空列表
		                      $('#grid_user_lingj_${pageId}').grid('clearRecords');
		                      $('.hidden-div2').show();
		                      $('.hidden-div1').hide();
		                      //刷新列表数据
		                      $('#grid_user_${pageId}').grid('parseResult',results);
		                      $("#ush input").focus();
		                  }else{
		                  	$("#shifsl").fieldText("setValue","");
		                  }
		                  if(flag){
		                  showPromptMsg('blue',$.sdcui.resource.i18n['C_319_0001'](results.result.parameter.weicsl));
		                  }
		              });
	              });
		 	
		 	//按UA号查询UA明细
			 	$('#xg_uch').bind('enter',function(){
			 		//验证备货单号是否改变
			 		if (checkBeihdhChange()){
			 			return;
			 		}
			 		//参数校验 
			 		if(!$('#xg_uch').fieldText('validate')){
	                      $("#xg_ush").fieldText("setValue","");
	                      $("#xg_yush").fieldHidden("setValue","");
	                      $("#xg_uaxh").fieldText("setValue","");
	                      $("#xg_shifsl").fieldText("setValue","");
	                      $("#xg_ucxh").fieldText("setValue","");
	                      $("#xg_ucgs").fieldText("setValue","");
			 			return;
			 		}
		 		var params = [];
		 		params.push("beihdh=" + $('#xg_beihdh input').val());
		 		params.push("uch=" + $('#xg_uch input').val());
	                  var url="<%=request.getContextPath()%>/beihuo/31904.do";
	                  $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                  	if (showPromptRequestMsg(results)){
	                          $('.hidden-item').show();
	                          $("#xg_ush").fieldText("setValue",results.result.parameter.yush);
	                          $("#xg_yush").fieldHidden("setValue",results.result.parameter.yush);
	                          $("#xg_uaxh").fieldText("setValue",results.result.parameter.uaxh);
	                          $("#xg_shifsl").fieldText("setValue",results.result.parameter.shifsl);
	                          $("#xg_ucxh").fieldText("setValue",results.result.parameter.ucxh);
	                          $("#xg_ucgs").fieldText("setValue",results.result.parameter.ucgs);
	                          //如果查询零件序列号结果不为空，则显示列表
	                          if (results.result.parameter.list.length > 0){
	                              $('.hidden-div1').show();
	                              $('.hidden-div2').hide();
	                              $('#grid_user_lingj_${pageId}').grid('parseResult',results);
	                              var shifsl = parseInt($("#xg_shifsl input").val());
	                              //当实发数量大于等于零件序列号数量时默认全选
	                              if (shifsl >= results.result.parameter.list.length){
	                              	$('#grid_user_lingj_${pageId}').grid('selectedAll');
	                              }
	                          }else{
	                          	//查询零件序列号结果为空时清空列表
	                          	$('#grid_user_lingj_${pageId}').grid('clearRecords');
	                              $('.hidden-div1').hide();
	                              $('.hidden-div2').show();
	                          }
	                      }else{
	                          $("#xg_ush").fieldText("setValue","");
	                          $("#xg_yush").fieldHidden("setValue","");
	                          $("#xg_uaxh").fieldText("setValue","");
	                          $("#xg_shifsl").fieldText("setValue","");
	                          $("#xg_ucxh").fieldText("setValue","");
	                          $("#xg_ucgs").fieldText("setValue","");
	                      }
	                  });
			});
		 	
	              //修改明细US号重新查询
	              $('#xg_ush').bind('enter',function(){
	                  //验证备货单号是否改变
	                  if (checkBeihdhChange()){
	                      return;
	                  }
	                  //参数校验 
	                  if(!$('#xg_uch').fieldText('validate') ||!$('#xg_ush').fieldText('validate')){
	                      //$("#xg_yush").fieldHidden("setValue","");
	                      $("#xg_uaxh").fieldText("setValue","");
	                      $("#xg_shifsl").fieldText("setValue","");
	                      $("#xg_ucxh").fieldText("setValue","");
	                      $("#xg_ucgs").fieldText("setValue","");
	                      return;
	                  }
	                  var params = [];
	                  params.push("beihdh=" + $('#xg_beihdh input').val());
	                  params.push("uch=" + $('#xg_uch input').val());
	                  params.push("ush=" + $('#xg_ush input').val());
	                  var url="<%=request.getContextPath()%>/beihuo/31904.do";
	                  $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                      if (showPromptRequestMsg(results)){
	                          $('.hidden-item').show();
	                          //按US更新时
	                          //$("#xg_ush").fieldText("setValue",results.result.parameter.yush);
	                          //$("#xg_yush").fieldHidden("setValue",results.result.parameter.yush);
	                          $("#xg_uaxh").fieldText("setValue",results.result.parameter.uaxh);
	                          $("#xg_shifsl").fieldText("setValue",results.result.parameter.shifsl);
	                          $("#xg_ucxh").fieldText("setValue",results.result.parameter.ucxh);
	                          $("#xg_ucgs").fieldText("setValue",results.result.parameter.ucgs);
	                          //如果查询零件序列号结果不为空，则显示列表
	                          if (results.result.parameter.list.length > 0){
	                              $('.hidden-div1').show();
	                              $('.hidden-div2').hide();
	                              $('#grid_user_lingj_${pageId}').grid('parseResult',results);
	                              var shifsl = parseInt($("#xg_shifsl input").val());
	                              //当实发数量大于等于零件序列号数量时默认全选
	                              if (shifsl >= results.result.parameter.list.length){
	                                  $('#grid_user_lingj_${pageId}').grid('selectedAll');
	                              }
	                          }else{
	                              //查询零件序列号结果为空时清空列表
	                              $('#grid_user_lingj_${pageId}').grid('clearRecords');
	                              $('.hidden-div1').hide();
	                              $('.hidden-div2').show();
	                          }
	                      }else{
	                          //$("#xg_ush").fieldText("setValue","");
	                          //$("#xg_yush").fieldHidden("setValue","");
	                          $("#xg_uaxh").fieldText("setValue","");
	                          $("#xg_shifsl").fieldText("setValue","");
	                          $("#xg_ucxh").fieldText("setValue","");
	                          $("#xg_ucgs").fieldText("setValue","");
	                      }
	                  });
	              });
		 	
	              //修改明细F6
	              $('#btn_update').bind('click',function(){
	                   //是否显示修改
	                   if ($('#xiug').css("display")=='none'){
	                       return;
	                   }
	                   //验证备货单号是否改变
	                   if (checkBeihdhChange()){
	                       return;
	                   }
	                   //验证参数
	                   if(!$('#form_user_${pageId}_update').form("validateParam")){
	                       return;
	                   }
	                   //实发数量
	                   var shifsl = parseInt($("#xg_shifsl input").val());
	                   //所有序列号
	                   var allrecords = $('#grid_user_lingj_${pageId}').grid('getRecordAll');
	                   var records = $('#grid_user_lingj_${pageId}').grid('getSelectedAll');
	                   if (shifsl < records.length ){
	                       showPromptMsg('red',$.sdcui.resource.i18n['C_F_SHIFSLSMALLER']);
	                       return;
	                   }else if (shifsl > records.length && records.length < allrecords.length){
	                       showPromptMsg('red',$.sdcui.resource.i18n['C_F_SHIFSLBIGGER']);
	                       return;
	                   }
	                   var xlhListStr;
	                   if(records.length == 0){
	                       xlhListStr = '\'\'';
	                   }
	                   else {
	                       var xlhList = [];
	                       for(var i=0;i<records.length;i++){
	                           var xlh = records[i].split('=');
	                           xlhList.push('\''+xlh[1]+'\'');
	                       }
	                       xlhListStr = xlhList.join(',');
	                   }
	                   var params = [];
	                   params.push("beihdh=" + $('#xg_beihdh input').val());
	                   params.push("uch=" + $('#xg_uch input').val());
	                   params.push("yush=" + $('#xg_yush input').val());
	                   params.push("ush=" + $('#xg_ush input').val());
	                   params.push("shifsl=" + $('#xg_shifsl input').val());
	                   params.push("ucxh=" + $('#xg_ucxh input').val());
	                   params.push("uaxh=" + $('#xg_uaxh input').val());
	                   params.push("ucgs=" + $('#xg_ucgs input').val());
	                   params.push('xlhList=' + xlhListStr);
	                   params.push("currentPage=1");
	                   currentPage = 1;
	                   var url="<%=request.getContextPath()%>/beihuo/31905.do";
	                   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                       if (showPromptRequestMsg(results)){
	                           $('.hidden-item').hide();
	                           $('.hidden-div2').show();
	                           $('.hidden-div1').hide();
	                           $("#xg_uch").fieldText("setValue","");
	                           $("#xg_ush").fieldText("setValue","");
	                           $("#xg_yush").fieldHidden("setValue","");
	                           $("#xg_uaxh").fieldText("setValue","");
	                           $("#xg_shifsl").fieldText("setValue","");
	                           $("#xg_ucxh").fieldText("setValue","");
	                           $("#xg_ucgs").fieldText("setValue","");
	                           $("#baozzsl").fieldLabel("setValue",results.result.parameter.baozzsl);
	                           $("#yickbzsl").fieldLabel("setValue",results.result.parameter.chuksl);
	                           //刷新列表数据
	                           $('#grid_user_${pageId}').grid('parseResult',results);
	                       }
	                   });
	              });
		 	
	
		 	
	              $('.hidden-item').hide();
	              $('.hidden-div2').show();
	              $('.hidden-div1').hide();
		 	$(document).keyboardsupport({});
		});
		
		function checkBeihdhChange(){
			var newValue = $('#beihdh input').val();
			var oldValue = $('#xg_beihdh input').val();
			if (newValue != oldValue){
				showPromptMsg('red',$.sdcui.resource.i18n['C_F_BEIHDHYGB']);
				submitBeihdh();
				return true;
			}else{
				return false;
			}
		}
		//按备货单号查询
		function submitBeihdh(){
				var beihdhValue = $('#beihdh input').val();
				var beihybhValue = $('#beihybh span').html();
		    $('#form_user_${pageId}').form('clearValue');
			$('#form_user_${pageId}_update').form('clearValue');
			$('#grid_user_${pageId}').grid('clearRecords');
			$('#grid_user_lingj_${pageId}').grid('clearRecords');
	              $('.hidden-item').hide();
	              $('.hidden-div2').show();
	              $('.hidden-div1').hide();
			$("#beihdh").fieldText("setValue",beihdhValue);
			//$("#beihybh").fieldText("setValue",beihybhValue);
			$("#beihybh span").html(beihybhValue);
				//参数校验 
	 		if(!$('#beihdh').fieldText('validate')||!$('#beihybh').fieldText('validate')){
	 			return;
				}
	 		var params = [];
	 		var beihdh = $('#beihdh input').val();
	 		params.push('beihdh='+ beihdh);
	 		var beihybh = $('#beihybh span').html();
	 		if(beihybh){
	 			params.push('beihybh='+ beihybh);
	 		}else{
	 			params.push('beihybh=${userName}');
	 		}
	 		params.push('cangkbh=' + st_Cangkbh);
	              paramsQuery = jQuery.extend(true,[],params);
	              currentPage = 1;
	              params.push('currentPage=1');
	              $('#grid_user_${pageId}').grid("setQueryParams", params);
	              var url="<%=request.getContextPath()%>/beihuo/31901.do";
	              $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                  if (showPromptRequestMsg(results)){
	                      weicsl = results.result.parameter.weicsl;
	                      $("#keh span").html(results.result.parameter.keh);
	                      $("#baozzsl").fieldLabel("setValue",results.result.parameter.baozzsl);
	                      $("#xiehzt span").html(results.result.parameter.xiehzt);
	                      chuksl = parseInt(results.result.parameter.chuksl);
	                      $("#yickbzsl").fieldLabel("setValue",chuksl);
	                      $("#xg_beihdh").fieldHidden("setValue",beihdhValue);
	                      $('#grid_user_${pageId}').grid('parseResult',results);
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
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.chuklx}:</td>
							<td>D</td>
						</tr>
						<tr>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.baozzsl}:</td>
							<td><div class="ui-field" id="baozzsl"></div></td>
							<td>${i18n.yickbzsl}:</td>
							<td><div class="ui-field" id="yickbzsl"></div></td>
						</tr>
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.uabz}:</td>
							<td><div class="ui-field" id="uaxh"></div></td>			
							<td>${i18n.shifsl}:</td>
							<td><div class="ui-field" id="shifsl"></div></td>
					    </tr>
						<tr>
							<td>${i18n.ucxh}:</td>
							<td><div class="ui-field" id="ucxh"></div></td>
							<td>${i18n.ucgs}:</td>
							<td><div class="ui-field" id="ucgs"></div></td>
							<td><div class="ui-field" id="liush"></div></td>
							<td><div align="right"><span id="btn_submit" class="ui-button">${i18n.ok}[F3]</span><span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div></td>
						</tr>
						<tr>
							<td>${i18n.fahzt}:</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</tbody>
				</table>
				</div>
				<br/>
			   <div>${i18n.mingxcxxg}</div>
			   <div id="form_user_${pageId}_update" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td width="16%">${i18n.uah}:</td>
							<td><div class="ui-field" id="xg_uch"></div></td>
							<td id='xiug' class="hidden-item"><div class="ui-field" id="xg_beihdh"></div></td>
						</tr>
						<tr class='hidden-item'>
							<td class="hidden-item">${i18n.ush}:</td>
							<td class="hidden-item"><div class="ui-field" id="xg_ush"></div></td>
							<td class="hidden-item">${i18n.uabz}:</td>
							<td class="hidden-item"><div class="ui-field" id="xg_uaxh"></div></td>
							<td class="hidden-item">${i18n.shifsl}:</td>
							<td class="hidden-item"><div class="ui-field" id="xg_shifsl"></div></td>
						</tr>
						<tr class='hidden-item'>
							<td class="hidden-item">${i18n.ucxh}:</td>
							<td class="hidden-item"><div class="ui-field" id="xg_ucxh"></div></td>
							<td class="hidden-item">${i18n.ucgs}:</td>
							<td class="hidden-item"><div class="ui-field" id="xg_ucgs"></div></td>
							<td class="hidden-item"><div class="ui-field" id="xg_yush"></div></td>
							<td class="hidden-item"><div align="right"><span id="btn_update" class="ui-button">${i18n.update}[F6]</span></div></td>
						</tr>

					</tbody>
				</table>
			</div>
			<br></br>
			<div class="hidden-div1" id="grid_user_lingj_${pageId}"></div>
			<div class="hidden-div2" id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>