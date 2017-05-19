<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","176");%>
<!-- V4_022 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_176 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		  var updateflag = 0;   //修改标识  1代表修改 
		  function GetCurrentTime() {
			    var currentTime = "";
			    var myDate = new Date();
			    var year = myDate.getYear();
			    var month = parseInt(myDate.getMonth().toString()) + 1; //month是从0开始计数的，因此要 + 1
			    if (month < 10) {
			        month = "0" + month.toString();
			    }
			    var date = myDate.getDate();
			    if (date < 10) {
			        date = "0" + date.toString();
			    }
			    var hour = myDate.getHours();
			    if (hour < 10) {
			        hour = "0" + hour.toString();
			    }
			    var minute = myDate.getMinutes();
			    if (minute < 10) {
			        minute = "0" + minute.toString();
			    }
			    var second = myDate.getSeconds();
			    if (second < 10) {
			        second = "0" + second.toString();
			    }
			   
			        currentTime = year.toString() + month.toString() + date.toString() + hour.toString() + minute.toString() + second.toString(); //返回时间的数字组合
			    return currentTime;
			}
			$(function(){
				var  yuanljsl=0;
				var  pichflag=-1;   //0代表批次号不需要输入1 代表需要输入
				var  shixrqflag=-1;   //0代表失效日期不需要输入1 代表需要输入
			    $('#grid_gys_${pageId}').hide();
				$('#grid_user_${pageId}').grid({
				    keyFields:['uah','yaohlh','lingjsl','uaxh','ucxh','ucgs','pich','shixrq','gongysdm','lingjbh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/10201.do',
					submitURL:'<%=request.getContextPath()%>/shouhuo/10204.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'uaxh',caption:'${i18n.uaxh}'},
						{property:'ucxh',caption:'${i18n.ucxh}'},
						{property:'ucgs',caption:'${i18n.ucgs}'},
						{property:'pich',caption:'${i18n.pich}'},
						{property:'shixrq',caption:'${i18n.shixrq}'}
				    ],
				buttons:[
			   	 	{name:'add',caption:'${i18n.zjbc}[F2]',keyboard:'F2',action:function(){
			   	 	   	if(!$('#form_ua_${pageId}').form("validateParam")){
				     		return;
				     	}
				     	if($('#ucgs input').val() > 0 && $('#ucxh input').val() == ''){
				     	    showMsg("${i18n.ucxhwk}");
				     	    return false;
				     	}
			   	 	   if(null==$('#uah input').val()||''==$('#uah input').val()){
				   	 		var xuh=$('#xuh input').val();
				   	 	    var p = $('#grid_gys_${pageId}').grid('getSelectedByRowNum',xuh);
				   	 	    if(!$("#gongysdm input").attr("disabled")){
						 		if(p.length < 1){
									showPromptMsg('red','${i18n.wucgys}');
									return false;
								  }
							    $('#gongysdm input').val(p[0].split("=")[1]);
					        }
				   	 	    if(!$('#form_user_${pageId}').form("validateParam")){
					     		return;
					     	}
				   	 	
			   	 	   }
				     	var yanssl=$('#yanssl span').html();
			   	 	    var lingjsl=$('#lingjsl input').val();
			   	 	    var lingjzsl=$('#lingjzsl input').val();
			   	 	    if(yanssl == null){
				   	 	    yanssl=0;
			   	 	      }
				   	 	 if(null==$('#uah input').val()||''==$('#uah input').val()){
			   	 		    //增加时判断输入的零件数量是否大于总数
			   	 	        if(parseFloat(yanssl) + parseFloat(lingjsl) > parseFloat(lingjzsl)){
					   	 	     showPromptMsg('red','${i18n.ljslwx}');
								 return false;
				   	 	      } 
				   	 	 }else{
			   	         	//修改时判断输入的零件数量是否大于总数
					   	 	 if(parseFloat(yanssl) + parseFloat(lingjsl)-parseFloat(yuanljsl) > parseFloat(lingjzsl)){
						   	 	     showPromptMsg('red','${i18n.ljslwx}');
									 return false;
			   	 	        } 
				   	 	 }
						var params = $('#form_user_${pageId}').form("getFormParam");
						var params1=$('#form_ua_${pageId}').form("getFormParam");
						params=params.concat(params1);
						params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
						var url = "<%=request.getContextPath()%>/shouhuo/10203.do";
	 	             	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 	             	 if (showPromptRequestMsg(results)==true || results.result.response == 'C_102_0002'){
		 					if (results.result.response == '0001'){
			 					  if($('#yaohlh input').attr("disabled")){
			 					      $('#yaohlh input').attr("disabled",false);	
			 					    }
		 						    //加载返回数据
		 						    //将pich的状态恢复到修改前的状态
		 							if(pichflag == "1"){
		 								$('#pich input').attr("disabled",false);	
		 								pichflag = -1;
		 							}else if(pichflag == "0"){
		 								$('#pich input').attr("disabled",true);	
		 								pichflag = -1;
		 							}
		 							//将shixrq的状态恢复到修改前的状态
		 							if(shixrqflag == "1"){
		 								$('#shixrq input').attr("disabled",false);	
		 								shixrqflag = -1;
		 							}else if(shixrqflag == "0"){
		 								$('#shixrq input').attr("disabled",true);	
		 								shixrqflag = -1;
		 							}
		 							
		 							$('#grid_gys_${pageId}').hide();
									$('#grid_user_${pageId}').grid('parseResult',results);
									$('#uah input').val('');
									yuanljsl=0;
									var  temp=$('#pich input').val();
									var  temp1=$('#shixrq input').val();
									$('#form_ua_${pageId}').form("resetFields");
									$('#pich input').val(temp);
									$('#shixrq input').val(temp1);
									$('.field-tabed').removeClass('field-tabed').blur();  //移除样式
									$('#yaohlh input').addClass('field-tabed').focus();   //增加焦点
									$('#uth input').val(results.result.parameter.uth);
								    $("#lingjbh input").attr("disabled",true);
								    $("#gongysdm input").attr("disabled",true);
								     if(yanssl == ""){
				   	 	                   yanssl=0;
			   	 	                   }
			   	 	                  //flag为1时代表修改
								     if(results.result.parameter.flag =='1'){
								    	 $('#yanssl span').html(results.result.parameter.yanssl); 
								    	 updateflag = 0 ;
								    	 
								     }else if(results.result.parameter.flag =='0'){
								    	 
								     }else{
								    	 yanssl =parseFloat(lingjsl)+parseFloat(yanssl) ;
				   	 	                 $('#yanssl span').html(yanssl); 
				   	 	                // $('#pich1 input').attr("disabled",true); 
								     }
								     yanssl= $('#yanssl span').html(); 
			   	 	                 if(lingjzsl == yanssl){
				   	 	                 $("#lingjbh input").attr("disabled",false);
				   	 	                 $("#gongysdm input").attr("disabled",false);
				   	 	                 $("#xuh input").val('');
				   	 	                 $("#lingjbh input").val('');
				   	 	                 $("#gongysdm input").val('');
				   	 	                 $("#lingjzsl input").val('');
					   	 	             $("#pich input").val('');
				   	 	                 $("#pich1 input").val('');
				   	 	                 $("#shixrq input").val('');
				   	 	                 $("#shixrq1 input").val('');
				   	 	                 $("#yanssl span").html('');
				   	 	                 $("#lingjbh input").focus();
			   	 	                 }
		 					} else if(results.result.response == 'C_102_0002'){
			   	 	                 if(confirm($.sdcui.resource.i18n['C_102_0002'])){
			   	 	                   params.push("chuljg=1");
			   	 	                    g_isSub = 0;
			 	             	       $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 					   if (showPromptRequestMsg(results)==true){
				 					       if($('#yaohlh input').attr("disabled")){
				 					          $('#yaohlh input').attr("disabled",false);	
				 					        }
				 							//加载返回数据
				 							//将pich的状态恢复到修改前的状态
				 							if(pichflag == "1"){
				 								$('#pich input').attr("disabled",false);	
				 								pichflag = -1;
				 							}else if(pichflag == "0"){
				 								$('#pich input').attr("disabled",true);	
				 								pichflag = -1;
				 							}
				 							//将shixrq的状态恢复到修改前的状态
				 							if(shixrqflag == "1"){
				 								$('#shixrq input').attr("disabled",false);	
				 								shixrqflag = -1;
				 							}else if(shixrqflag == "0"){
				 								$('#shixrq input').attr("disabled",true);	
				 								shixrqflag = -1;
				 							}
				 							
				 							$('#grid_gys_${pageId}').hide();
											$('#grid_user_${pageId}').grid('parseResult',results);
											$('#uah input').val('');
											yuanljsl=0;
											var  temp=$('#pich input').val();
											var  temp1=$('#shixrq input').val();
											$('#form_ua_${pageId}').form("resetFields");
											$('#pich input').val(temp);
											$('#shixrq input').val(temp1);
											$('.field-tabed').removeClass('field-tabed').blur();  //移除样式
											$('#yaohlh input').addClass('field-tabed').focus();   //增加焦点
											$('#uth input').val(results.result.parameter.uth);
										    $("#lingjbh input").attr("disabled",true);
										    $("#gongysdm input").attr("disabled",true);
										    if(yanssl == ""){
						   	 	                   yanssl=0;
					   	 	                  }
					   	 	                  //flag为1时代表修改
										     if(results.result.parameter.flag =='1'){
										    	 $('#yanssl span').html(results.result.parameter.yanssl); 
										    	 updateflag = 0 ;
										    	 
										     }else if(results.result.parameter.flag =='0'){
										    	 
										     }else{
										    	 yanssl =parseFloat(lingjsl)+parseFloat(yanssl) ;
						   	 	                 $('#yanssl span').html(yanssl); 
						   	 	                // $('#pich1 input').attr("disabled",true); 
										     }
										     yanssl= $('#yanssl span').html(); 
					   	 	                 if(lingjzsl == yanssl){
						   	 	                 $("#lingjbh input").attr("disabled",false);
						   	 	                 $("#gongysdm input").attr("disabled",false);
						   	 	                 $("#xuh input").val('');
						   	 	                 $("#lingjbh input").val('');
						   	 	                 $("#gongysdm input").val('');
						   	 	                 $("#lingjzsl input").val('');
							   	 	             $("#pich input").val('');
						   	 	                 $("#pich1 input").val('');
						   	 	                 $("#shixrq input").val('');
						   	 	                 $("#shixrq1 input").val('');
						   	 	                 $("#yanssl span").html('');
						   	 	                 $("#lingjbh input").focus();
					   	 	                 }
					   	 	               }
			
					   	 	            });
			   	 	                   }
			   	 	                 } 
			   	 	                }else{
			   	 	                   $("#yaohlh input").focus();
			   	 	                }
			   	 	                 $('#btn_click').hide();
	 		            });
	 		           return false;
					}}
			    	 ,{name:'update',caption:'${i18n.update}[F3]',keyboard:'F3',action:function(){
		    		    var records=$('#grid_user_${pageId}').grid('getSelectedAll');
					   	  	if(records.length !=10){
						   	  	showPromptMsg('red','${i18n.selecterror}');
						   	  	return false;
					   	  	} 
					   	$('#uah input').val(records[0].split("=")[1]);  	
					   	$('#yaohlh input').val(records[1].split("=")[1]);
			 			$('#lingjsl input').val(records[2].split("=")[1]);
					 	$('#uaxh input').val(records[3].split("=")[1]);
					 	$('#ucxh input').val(records[4].split("=")[1]);
					 	$('#ucgs input').val(records[5].split("=")[1]);
					
					 	
					 	if($('#pich input').attr("disabled")){
					 		pichflag = 0
					 	}else{
					 		pichflag =1
					 	}
					 	if($('#shixrq input').attr("disabled")){
					 		shixrqflag = 0
					 	}else{
					 		shixrqflag =1
					 	}
					 	//如果pich的值为空则pich不能输入，否则批次号可以输入值
					 	if('' == records[6].split("=")[1]){
					 		$('#pich input').val('');
					 		$('#pich input').attr("disabled",true);
					 	}else{
					 		$('#pich input').attr("disabled",false);
					 		$('#pich input').val(records[6].split("=")[1]);
					 	}
					 	if('' == records[7].split("=")[1]){
					 		$('#shixrq input').val('');
					 		$('#shixrq input').attr("disabled",true);
					 	}else{
					 		$('#shixrq input').attr("disabled",false);
					 		$('#shixrq input').val(records[7].split("=")[1]);
					 	}
					 	yuanljsl=records[2].split("=")[1];
					    $('.field-tabed').removeClass('field-tabed').blur();  //移除样式
						$('#yaohlh input').addClass('field-tabed').focus();  
						$('#gongysdm3 input').val(records[8].split("=")[1]);
						$('#lingjbh3 input').val(records[9].split("=")[1]);
						 //增加焦点
						//212110当 点击修改按键时要货令只读
						$('#yaohlh input').attr("disabled",true);
						//将修改标识设置为1
						updateflag = 1;
			    		return false;
					}}
				   	,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}}
					,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}}
					,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
					    $('#form_ua_${pageId}').form('clearValue');
						$('#yaohlh input').attr("disabled",false);
						var uth = $("#uth input").val();
						params.push("uth="+uth);
						params.push("gongysdm="+$('#gongysdm input').val());
						params.push("lingjbh="+$('#lingjbh input').val());
						var url = "<%=request.getContextPath()%>/shouhuo/10204.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		    if (showPromptRequestMsg(results)==true){
				 		    	 if(results.result.response == '0001'){
									//加载返回数据
									$('#grid_user_${pageId}').grid('parseResult',results);
									
									if(results.result.parameter.list.length == 0){
										window.location.reload();
									} else {
										$('#uth input').val(results.result.parameter.uth);
					                    $('#yanssl span').html(results.result.parameter.yanssl);
					                    showMsg("${i18n.deletesucc}");
									}
								}
				 		    }	 
				          });
		    		 return false;
			 	   }}
					,{name:'end',caption:'${i18n.endinput}[F7]',keyboard:'F7',action:function(){
						var params=[];
						if('' == $('#uth input').val()){
							showPromptMsg('red','${i18n.endbefore}');
							return  false;
						}
						params.push("uth="+$("#uth input").val());
						var url="<%=request.getContextPath()%>/shouhuo/17601.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								 var param=[];
								 var tmp1 = $("#uth input").val();
								 param.push("uth="+$("#uth input").val());
								 param.push("blh="+$("#blh input").val());
								 //param.push("tch="+$("#tch input").val()); 
								 param.push("list[0].uth="+$("#uth input").val());
									//加载返回数据
								    $("#chengysdm input").attr("disabled",false);
								    $("#xiehzt input").attr("disabled",false);
								    $('#grid_user_${pageId}').grid('clearRecords');
								    $('#form_user_${pageId}').form('clearValue');
								    $('#form_ua_${pageId}').form('clearValue');
								    $('#grid_gys_${pageId}').grid('clearRecords');
								
									var url = "<%=request.getContextPath()%>/shouhuo/17501.do";
								    g_isSub = 0;
									$('#form_user_${pageId}').form("submitUrl", param, url, function(results){
										  if (showPromptRequestMsg(results)==true){
										   $('#grid_user_${pageId}').grid('parseResult',results);
										  							     //去掉List[0];
                      					 // for(i=0;i<params.length;i++){
                               	   		//    params[i]=params[i].toString().replace("list[0].","&");
                       				    //  }
                       				    var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes";  
					   					 window.open("<%=request.getContextPath()%>/shouhuo/dhsbdy.do"+st_Params+"&usercenter="+st_UserCenter+"&cangkbh="+st_Cangkbh+ "&uth="+tmp1,"",strWindowType);			       
					     	 }
									 });
									 $('#btn_click').show();
						    		return false;
							    }
				      });
			    	return false;
					}}
				 ,{name:'back',caption:'${i18n.back}[F11]'}
				 ,{name:'return',caption:'${i18n.return}[F12]'}
				]});
				
				//F8推荐
				$('#btn_click').bind('click',function(){
	              // $('#blh input').val(GetCurrentTime());
				 //	return false;
				 var url = "<%=request.getContextPath()%>/shouhuo/10211.do";
			 	    ajaxRequestNoParams(url, function(results){
						  if (showPromptRequestMsg(results)==true){
							 $('#blh input').val(results.result.parameter.BLH);
							 }
				 });
				 return false;
				});
				$('#grid_gys_${pageId}').grid({
					keyFields:['gongysdm','gongysmc','shifsxgl','shifyzpch'],
					id:'grid_gys_${pageId}',
					enableCutPage:false,
					cols:[
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
				  		{property:'gongysmc',caption:'${i18n.gongysmc}'}
				        ]});
				//EL_grid
			 	$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldText',biaos:'enter',property:'blh',dataType:'text',maxLength:'10',notNull:true,caption:'${i18n.blh}'},
						{fieldType:'fieldText',property:'tch',dataType:'laiy',maxLength:'11',notNull:true,caption:'${i18n.tch}'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.chengysdm}'},
						{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.lingjbh}',onchange:"change()"},
						{fieldType:'fieldHidden',property:'xuh'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.gongysdm}',onchange:"changegys()"},
						{fieldType:'fieldText',property:'xiehzt',notNull:true,caption:'${i18n.xiehzt}'},
						{fieldType:'fieldText',property:'lingjzsl',dataType:'dbnumber',isPlus:true,notNull:true,caption:'${i18n.lingjzs}'},
						{fieldType:'fieldText',property:'pich1',dataType:'text',maxLength:'12',caption:'${i18n.pich}',notNull:true},
						{fieldType:'fieldHidden',property:'uth',dataType:'daohdh',notNull:true,caption:'${i18n.uth}'},
						{fieldType:'fieldLabel',property:'yanssl'},
						{fieldType:'fieldText',property:'shixrq1',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shixrq}',notNull:true}
					]
				}); 
			 	//UA_grid
			 	$('#form_ua_${pageId}').form({
					fields:[
					    {fieldType:'fieldText',biaos:'enter',property:'yaohlh',dataType:'yaohlhnt',caption:'${i18n.yaohlh}'},
					    {fieldType:'fieldText',property:'lingjsl',dataType:'dbnumber',isPlus:true,notNull:true,caption:'${i18n.lingjsl}'},
						{fieldType:'fieldText',property:'uaxh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.uaxh}',onchange:"changeuaxh()"},
						{fieldType:'fieldText',property:'ucxh',dataType:'text',maxLength:'5',caption:'${i18n.ucxh}',onchange:"changeuaxh()"},
						{fieldType:'fieldText',property:'pich',dataType:'text',maxLength:'12',notNull:true,caption:'${i18n.pich}'},
						{fieldType:'fieldText',property:'shixrq',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shixrq}',notNull:true},
						{fieldType:'fieldHidden',property:'uah'},
						{fieldType:'fieldHidden',property:'gongysdm3'},
						{fieldType:'fieldHidden',property:'lingjbh3'},
						{fieldType:'fieldText',property:'ucgs',dataType:'positive',maxLength:'5',caption:'${i18n.ucgs}'}
					]
				}); 
				
			 	$("#blh").bind('enter',function(event){
			 	 $('#grid_user_${pageId}').grid('clearRecords');
		    	 $('#form_ua_${pageId}').form('clearValue');
			 	 
			 	 $('#grid_gys_${pageId}').grid('clearRecords');
			 		//校验BL号格式是否正确
			 		if(!$('#blh').fieldText("validate")){
					     return;
					  	}
					$("#chengysdm input").attr("disabled",false);
					$("#gongysdm input").attr("disabled",false);
					$("#lingjbh input").attr("disabled",false);
					$("#xiehzt input").attr("disabled",false);
					$("#pich1 input").attr("disabled",false);
					$("#pich input").attr("disabled",false);
					$("#shixrq input").attr("disabled",false);
					$("#shixrq1 input").attr("disabled",false);
					var params =[] 
					var blh=$('#blh input').val();
					params.push("blh="+blh);
					$('#form_user_${pageId}').form('clearValue');
					$("#blh input").val(blh);
					params.push("currentPage=1");
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					 var url = "<%=request.getContextPath()%>/shouhuo/10201.do";
			 	    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						//  if (showPromptRequestMsg(results)==true){
							  if(results.result.response == '0001'){
								     $("#chengysdm").fieldText("setValue",results.result.parameter.chengysdm);
					    	         $("#chengysmc").fieldText("setValue",results.result.parameter.chengysmc);
					    	         $('#xiehzt input').val(results.result.parameter.xiehzt);
									 $("#lingjzsl").fieldText("setValue",results.result.parameter.lingjzsl);
						     	     $("#uth input").val(results.result.parameter.uth);
						     	     $("#tch input").val(results.result.parameter.tch);
						     	     $('#yanssl span').html(results.result.parameter.yanssl);
							         $('#grid_user_${pageId}').grid('parseResult',results);
							         $("#chengysdm input").attr("disabled",true);
							         $("#xiehzt input").attr("disabled",true);
							         if( $('#yanssl span').html() ==  $('#lingjzsl input').val()){
							        	 
							           }else{
								          $("#gongysdm input").val(results.result.parameter.gongysdm);
								          $("#lingjbh input").val(results.result.parameter.lingjbh);
									      $("#lingjbh input").attr("disabled",true);
									      $("#gongysdm input").attr("disabled",true);
									      if("" != results.result.parameter.pich ){
									          $("#pich1 input").val(results.result.parameter.pich);
									          $("#pich input").val(results.result.parameter.pich);
									      }else{
									    	  $("#pich input").attr("disabled",true);
									    	  $("#pich1 input").attr("disabled",true);
									    	  
									      }
							            }
							         if("" != results.result.parameter.shixrq ){
								        $("#shixrq input").val(results.result.parameter.shixrq);
								        $("#shixrq1 input").val(results.result.parameter.shixrq);
							         }else{
							        	 $("#shixrq input").attr("disabled",true);
							        	 $("#shixrq1 input").attr("disabled",true);
							         }
							         msgClear();
						         }else if(results.result.response == 'C_GZLX_E'){
						        	if(confirm($.sdcui.resource.i18n['C_102_0009'])){
						        		g_isSub = 0;
						        		$('#btn_click').click();
				
						        	  } else{
						        		$('#blh input').val('');
						        		return;
						              }
						         }else{
						        		showPromptMsg('red',$.sdcui.resource.i18n[results.result.response]);
						         }
							  
							  
						//  }    
				  });
		    		return false;
			   });
                $("#lingjbh").bind('enter',function(event){
                    $('#grid_gys_${pageId}').grid('clearRecords');
                    $('#grid_gys_${pageId}').hide();
                    if(!$('#lingjbh').fieldText("validate")){
					     return;
					  	}
			        var params = [];
			        if($('#uth input').val() !='' ){
			        params.push("xiehzt="+$('#xiehzt input').val());
			        }
					params.push("lingjbh="+$('#lingjbh input').val());
					params.push("cangkbh="+st_Cangkbh);
					var url = "<%=request.getContextPath()%>/shouhuo/10208.do"
			 	    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						if (showPromptRequestMsg(results)==true){
							 if(results.result.response == '0001'){
								$('#xiehzt input').val(results.result.parameter.xiehzt); 
							    $("#xiehzt input").attr("disabled",true);
							    $("#lingjbh input").removeClass($.sdcui.resource.keyboardFocusClass)
							    $("#gongysdm input").addClass($.sdcui.resource.keyboardFocusClass);
							    $("#gongysdm input").focus();
								$('#grid_gys_${pageId}').show();
								$('#grid_gys_${pageId}').grid('parseResult',results);
								msgClear();
							 }
						}
					});
					return false;
				});	
					
			 	$("#yaohlh").bind('enter',function(event){
		 	       if(!$('#yaohlh').fieldText('validate')){
 			 			return;
 			 		}
 			 		var params=[];
		 			var yaohlh = $("#yaohlh input").val();
		 		    var lingjbh=$("#lingjbh input").val();
		 			params.push("yaohlh=" + yaohlh);
		 			params.push("lingjbh=" + lingjbh);
		 			if(!$("#gongysdm input").attr("disabled")){
			 		    var p = $('#grid_gys_${pageId}').grid('getSelectedByRowNum',$("#gongysdm input").val());
			 			if(p.length < 1){
							showPromptMsg('red','${i18n.wucgys}');
							return false;
					      }
					     params.push("gongysdm="+p[0].split("=")[1]);
				      }
		 			params.push("xiehzt="+$("#xiehzt input").val());
		 			params.push("gongysdm="+$("#gongysdm input").val());
		 			var	 url = "<%=request.getContextPath()%>/shouhuo/10202.do";
		 			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
							   if(results.result.response == '0001'){
							        //加载返回数据
									 $("#lingjsl").fieldText("setValue",results.result.parameter.lingjsl);
									 $("#uaxh").fieldText("setValue",results.result.parameter.uaxh);
									 $("#ucxh").fieldText("setValue",results.result.parameter.ucxh);
									 $("#ucgs").fieldText("setValue",results.result.parameter.ucgs);
									 msgClear();
							   }
							 }
							 if($('#pich input').val() == ""){
							 $('#pich input').val($('#pich1 input').val());
							 }
							  if($('#shixrq input').val() == ""){
							 $('#shixrq input').val($('#shixrq1 input').val());
							 }
							 
			          });
	    		return false;
			 	});
			 	$(document).keyboardsupport({});
			});
			 	
		 /**
		  *进入102页面后进行查询
		  */
		 $(document).ready(function(){
		    var params =[] 		
	        var url = "<%=request.getContextPath()%>/shouhuo/10201.do";
		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  if (showPromptRequestMsg(results)==true){
			       $('#btn_click').hide();
				     //设置分页
				     var params =[] 
					params.push("blh="+results.result.parameter.blh);
					params.push("currentPage=1");
					$('#grid_user_${pageId}').grid("setQueryParams", params);
			         //加载返回数据
			         $("#blh input").val(results.result.parameter.blh);
			         $("#chengysdm").fieldText("setValue",results.result.parameter.chengysdm);
	    	         $("#chengysmc").fieldText("setValue",results.result.parameter.chengysmc);
	    	         $('#xiehzt input').val(results.result.parameter.xiehzt);
					 $("#lingjzsl").fieldText("setValue",results.result.parameter.lingjzsl);
		     	     $("#uth input").val(results.result.parameter.uth);
		     	     $("#tch input").val(results.result.parameter.tch);
		     	     $('#yanssl span').html(results.result.parameter.yanssl);
			         $('#grid_user_${pageId}').grid('parseResult',results);
			         $("#chengysdm input").attr("disabled",true);
			         $("#xiehzt input").attr("disabled",true);
			         if( $('#yanssl span').html() ==  $('#lingjzsl input').val()){
			        	 
			           }else{
				          $("#gongysdm input").val(results.result.parameter.gongysdm);
				          $("#lingjbh input").val(results.result.parameter.lingjbh);
					      $("#lingjbh input").attr("disabled",true);
					      $("#gongysdm input").attr("disabled",true);
					      if("" != results.result.parameter.pich ){
					          $("#pich1 input").val(results.result.parameter.pich);
					          $("#pich input").val(results.result.parameter.pich);
					      }else{
					    	  $("#pich input").attr("disabled",true);
					    	  $("#pich1 input").attr("disabled",true);
					    	  
					      }
			            }
			         if("" != results.result.parameter.shixrq ){
				        $("#shixrq1 input").val(results.result.parameter.shixrq);
				        $("#shixrq input").val(results.result.parameter.shixrq);
			         }else{
			        	 $("#shixrq input").attr("disabled",true);
			        	 $("#shixrq1 input").attr("disabled",true);
			         }
		         }else{
		         $('#btn_click').show();
		         }
		         
		        msgClear();
	       });
	  		return false;
		 
		 });
		//零件编号发生改变则清空供应商代码信息
		function  change(){
		$('#gongysdm input').val('');
		}
		//供应商代码发生改变后判断批次号及失效期是否管理
		function  changegys(){
		 var xuh=$('#gongysdm input').val();
		 $('#xuh input').val(xuh);
	 	 var p = $('#grid_gys_${pageId}').grid('getSelectedByRowNum',xuh);
		 if(p.length < 4){
				showPromptMsg('red','${i18n.wucgys}');
				return false;
		      }
		 var params =[] 
		 params.push("gongysdm="+p[0].split("=")[1]);
		 //是否失效管理
         if("1" != p[2].split("=")[1]){
        	 $("#shixrq input").attr("disabled",true);
        	 $("#shixrq1 input").attr("disabled",true);
         }else{
        	 $("#shixrq input").attr("disabled",false);
        	 $("#shixrq1 input").attr("disabled",false);
         }
 	    //是否验证批次号
 	    if("1" != p[3].split("=")[1]){
 	    	$("#pich1 input").attr("disabled",true);
 	    	$("#pich input").attr("disabled",true);
 	    } else{
 	    	$("#pich1 input").attr("disabled",false);
 	    	$("#pich input").attr("disabled",false);
 	    }
		 params.push("uth="+$('#uth input').val());	
		 params.push("lingjbh="+$('#lingjbh input').val());	
         var url = "<%=request.getContextPath()%>/shouhuo/10206.do";
	    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		  if (showPromptRequestMsg(results)==true){
		       if('0' == results.result.parameter.lingjzsl){
		          $('#lingjzsl input').val('');
		       }else{
		         $('#lingjzsl input').val(results.result.parameter.lingjzsl);
		       }
		       $('#yanssl span').html(results.result.parameter.yanssl);
		     }
		    });
		    return false;
		}
		//UC型号发生改变后则判断UC型号是否正确
		<%-- function changeucxh(){
			var params=[];
			params.push("lingjbh="+$('#lingjbh input').val());
			if($('#lingjbh input').attr("disabled")){
				params.push("gongysdm="+$('#gongysdm input').val());
			}else{
				 var p = $('#grid_gys_${pageId}').grid('getSelectedByRowNum',$('#gongysdm input').val());
				 if(p.length < 4){
						showPromptMsg('red','${i18n.wucgys}');
						return false;
				      }
				 params.push("gongysdm="+p[0].split("=")[1]);
			}
			  var url = "<%=request.getContextPath()%>/shouhuo/10206.do";
			    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				  if (showPromptRequestMsg(results)==true){
				     }
				    });
				    return false;
		} --%>
		//UA型号发生给变后则判断UA型号是否正确
		function changeuaxh(){
			var params=[];
			if($('#lingjbh input').attr("disabled")){
				params.push("gongysdm="+$('#gongysdm input').val());
				params.push("lingjbh="+$('#lingjbh input').val());
			}else if(updateflag){
			 params.push("gongysdm="+$('#gongysdm3 input').val());
			 params.push("lingjbh="+$('#lingjbh3 input').val());
			}else{
				 var p = $('#grid_gys_${pageId}').grid('getSelectedByRowNum',$('#gongysdm input').val());
				 if(p.length < 4){
						showPromptMsg('red','${i18n.wucgys}');
						return false;
				      }
				 params.push("gongysdm="+p[0].split("=")[1]);
				 params.push("lingjbh="+$('#lingjbh input').val());
			}
			 params.push("uaxh="+$('#uaxh input').val());
			 params.push("ucxh="+$('#ucxh input').val());
			  var url = "<%=request.getContextPath()%>/shouhuo/10209.do";
			    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				  if (showPromptRequestMsg(results)==true){
				     }
				    });
				    return false;
		}
		
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td>${i18n.blh }</td>
							<td><div class="ui-field" id="blh" style="float:left"></div>
							    <div style="float:left">
								<span id="btn_click"  class="ui-button"  >${i18n.tuij}[F8]</span>	
							    </div>
							</td>
							<td>${i18n.tch }</td>
							<td><div class="ui-field" id="tch"></div></td>
						</tr>
						<tr>
						    <td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						    <td>${i18n.lingjbh }</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
						    <td>${i18n.xiehzt }</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td>${i18n.gongysdm }</td>
							<td><div class="ui-field" id="gongysdm"></div></td>							
						</tr>
						<tr>
						    <td>${i18n.lingjzs }</td>
							<td><div class="ui-field" style="float:left" id="lingjzsl"></div><div style="float:left" >/</div><div style="float:left" class="ui-field"  id="yanssl" ></div></td>
							<td>${i18n.pich }</td>
							<td><div class="ui-field" id="pich1"></div></td>
					   </tr>
					   <tr>
							<td>${i18n.shixq }</td>
							<td><div class="ui-field" id="shixrq1"></div></td>
							<td><div class="ui-field" id="uth"></div></td>
							<td><div class="ui-field" id="xuh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="form_ua_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tr>
						<td>${i18n.yaohlh}</td>
						<td><div class="ui-field" id="yaohlh"></div></td>
						<td>${i18n.lingjsl }</td>
						<td><div class="ui-field" id="lingjsl"></div></td>
						<td>${i18n.uaxh }</td>
						<td><div class="ui-field" id="uaxh"></div></td>
						<td>${i18n.shixq }</td>
						<td><div class="ui-field" id="shixrq"></div></td>
					</tr>
					<tr>
						<td>${i18n.ucxh }</td>
						<td><div class="ui-field" id="ucxh"></div></td>
						<td>${i18n.ucgs }</td>
						<td><div class="ui-field" id="ucgs"></div></td>
						<td>${i18n.pich }</td>
						<td><div class="ui-field" id="pich"></div></td>
					</tr>
					<tr><td colspan="1"><div class="ui-field" id="uah"></div></td>
					    <td colspan="1"><div class="ui-field" id="gongysdm3"></div></td>
					    <td colspan="4"><div class="ui-field" id="lingjbh3"></div></td>
					</tr>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id="grid_gys_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>