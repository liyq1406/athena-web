<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","150");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_150 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					keyFields:['xiehzt','liush','flag','blh','chengysdm','gongysdm','lingjbh','lingjsl','zhengclsh','cangkbh','peislx','keh','create_time','caozy','lingjmc'],
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/15002.do',
					cols:[
						{property:'cangkbh',caption:'${i18n.cangkbh}',width:50},
						{property:'blh',caption:'${i18n.blh}',width:50},
						{property:'xiehzt',caption:'${i18n.xiehzt}',width:50},
						{property:'chengysdm',caption:'${i18n.chengysdm}',width:50},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
						{property:'peislx',caption:'${i18n.peislb}',width:50},
						{property:'keh',caption:'${i18n.keh}',width:50},
						{property:'lingjsl',caption:'${i18n.bukhgs}',width:50},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:50},
						{property:'create_time',caption:'${i18n.create_time}',width:50},
						{property:'caozy',caption:'${i18n.creator}',width:50}
				      ],
				buttons:[
						{name:'search',caption:'${i18n.search }[F1]',keyboard:'F1',action:function(){
						    $('#grid_user_${pageId}').grid('clearRecords');
							if(!$('#flag').fieldSelect('validateNotNull')){
						 			return;
						 		}
							if(!$('#form_user_${pageId}').form("validateParam")){
						     	return;
					        }
					        
					        var starttime=new Date(($('#qissj input').val()).replace(/-/g,"/"));
		                    var endtime=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
		                    if(endtime<starttime){
		                              showPromptMsg('red','${i18n.datetime_invalid}');
		                               return false;
		                       }
						    var params = $('#form_user_${pageId}').form("getFormParam");
						    params.push("currentPage=1");
						    var  url = "<%=request.getContextPath()%>/shouhuo/15002.do";
						    $('#grid_user_${pageId}').grid("setQueryParams", params);
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
				                     $('#xiehzt input').attr('disabled',false);
				                     //$('#chengysdm input').attr('disabled',false);
				                     $('#cangkbh input').attr('disabled',false);
								      if(results.result.response != 'C_1403'){
										  $('#grid_user_${pageId}').grid('parseResult',results);
										  if('1' == $('#flag input').attr('realValue')){
											  $('#btn_update').hide();
											  $('#btn_delete').hide();
											  $('#btn_end').hide();
										  }else{
										    $('#btn_update').show();
										    $('#btn_delete').show();
										    $('#btn_end').show();
										  }
									  }
									}
						    });
				    		return false;  							
				    	}}
				    	,{name:'zjbc',caption:'${i18n.zjbc }[F2]',keyboard:'F2',action:function(){
							if(!$('#cangkbh').fieldSelect('validateNotNull')){
						 			return;
						 		}
							if(!$('#xiehzt').fieldSelect('validateNotNull')){
						 			return;
						 		}
						 	if(!$('#chengysdm').fieldText('validateNotNull')){
						 			return;
						 		}
						 	if(!$('#gongysdm').fieldText('validateNotNull')){
						 			return;
						 		}
						 	if(!$('#lingjbh').fieldText('validateNotNull')){
						 			return;
						 		}
						 	if(!$('#lingjsl').fieldText('validateNotNull')){
						 			return;
						 		}
						 	if(!$('#peislx').fieldSelect('validateNotNull')){
						 			return;
						 		}	
						 	if(!$('#zhengclsh').fieldText('validateNotNull')){
						 			return;
						 		}
							if(!$('#form_user_${pageId}').form("validateParam")){
						     	return;
					        }
					         
						    var params = $('#form_user_${pageId}').form("getFormParam");
						    params.push("currentPage=1");
						    var url ;
						    if("" != $('#liush input').val()){
						     url = "<%=request.getContextPath()%>/shouhuo/15005.do";
						    }else{
						      url = "<%=request.getContextPath()%>/shouhuo/15003.do";
						    }
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
								      
									 $('#grid_user_${pageId}').grid('parseResult',results);
									 // $('#form_user_${pageId}').form('clearValue');
									 //$('#chengysdm input').attr('disabled',true);
									 $('#cangkbh input').attr('disabled',true);
									 $('#xiehzt input').attr('disabled',true);
									 $('#gongysdm input').val('');
									 $('#lingjbh input').val('');
									 $('#lingjsl input').val('');
									 $('#zhengclsh input').val('');
									 $('#liush input').val('');
									 $('#peislx input').val('');
						             $('#peislx input').attr("realValue",''); 
						             $('#keh span').html('');
									 $('#btn_update').show();
									 $('#btn_delete').show();
								     $('#btn_end').show();
								     $('#gongysdm input').addClass('field-tabed').focus();
								     $('#peislx').fieldSelect('resetDatasource',[]);
	
									}
						    });
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
						    params.push("cangkbh="+$('#cangkbh input').attr('realValue'));
						    var params1 = $('#grid_user_${pageId}').grid('getQueryParams');
							params.concat(params1);
							 $('#grid_user_${pageId}').grid('clearRecords');
							var url = "<%=request.getContextPath()%>/shouhuo/15004.do";
							$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		    if (showPromptRequestMsg(results)==true){
					 		    	 if(results.result.response != 'C_1403'){
										//加载返回数据
										$('#grid_user_${pageId}').grid('parseResult',results);
									}else{
									window.location.reload();
									}
					 		    }	 
					          });
			    		 return false;
				 	   }}
				 	   ,{name:'update',caption:'${i18n.update}[F7]',keyboard:'F7',action:function(){
							var records = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(records.length !=15){
						       showPromptMsg('red','${i18n.selecterror}')
						       return false;
						       }
						    $('#xiehzt input').val(records[0].split("=")[1]);
				            $('#xiehzt input').attr("realValue",records[0].split("=")[1]);
						   	$('#blh input').val(records[3].split("=")[1]);
				 			$('#lingjsl input').val(records[7].split("=")[1]);
						 	$('#gongysdm input').val(records[5].split("=")[1]);
						 	$('#chengysdm input').val(records[4].split("=")[1]);
						 	$('#lingjbh input').val(records[6].split("=")[1]);
						 	$('#zhengclsh input').val(records[8].split("=")[1]);
						 	$('#liush input').val(records[1].split("=")[1]);
						 	$('#cangkbh input').val(records[9].split("=")[1]);
				            $('#cangkbh input').attr("realValue",records[9].split("=")[1]); 
				            $('#cangkbh input').attr('disabled',true);
				            $('#peislx').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/pieslb150.do'+st_Params+'&lingjbh='+$('#lingjbh input').val()+'&cangkbh='+records[9].split("=")[1]);
				            $('#peislx input').val(records[10].split("=")[1]);
				            $('#peislx input').attr("realValue",records[10].split("=")[1]); 
				            $('#keh span').html(records[11].split("=")[1]);
				            
				 	   }}
					,{name:'end',caption:'${i18n.quer}[F8]',keyboard:'F8',action:function(){
						var params=[];
						
						var url="<%=request.getContextPath()%>/shouhuo/15001.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								 $('#form_user_${pageId}').form('clearValue');
								 $('#grid_user_${pageId}').grid('clearRecords');
								 $('#cangkbh input').attr('disabled',false);
								 $('#xiehzt input').attr('disabled',false);
								 // $('#chengysdm input').attr('disabled',false);
								 $('#flag input').attr('realValue','0');
								 $('#flag input').val($.sdcui.resource.i18n['C_CLZTWCL']);
								  
								  
							    }
				      });
			    	return false;
					}}
					   ,{name:'back',caption:'${i18n.back}[F11]'}
			           ,{name:'return',caption:'${i18n.return}[F12]'}
			          ]
				   });
				$('#form_user_${pageId}').form({
				   onreload:true,
					fields:[
					   {fieldType:'fieldSelect',property:'cangkbh',notNull:true,caption:'${i18n.cangk}',onselect:'cangkchange()',src:'<%=request.getContextPath()%>/common/wareHouse.do'},
					    {fieldType:'fieldSelect',property:'xiehzt',includeNull:true,caption:'${i18n.xiehzt}'},
						{fieldType:'fieldSelect' , property:'peislx',caption:'${i18n.peislb}',onclose:'kehValue()'},
						{fieldType:'fieldLabel',property:'keh',caption:'${i18n.keh}'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',biaos:'enter'},
						{fieldType:'fieldText',property:'lingjsl',dataType:'mnumber',isZero:false,caption:'${i18n.bukhgs}'},
						{fieldType:'fieldText',property:'zhengclsh',dataType:'letter_numeric',limitedLength:'9',caption:'${i18n.zhengclsh}'},
						{fieldType:'fieldText',property:'qissj',caption:'${i18n.daoxqssj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}} ,
	                    {fieldType:'fieldText',property:'zhongzsj',caption:'${i18n.daoxzzsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText',property:'blh'},
                        {fieldType:'fieldHidden',property:'liush'},
                        {fieldType:'fieldHidden',property:'xiaohd'},
						{fieldType:'fieldSelect',property:'flag',internation:true,value:$.sdcui.resource.i18n['C_CLZTWCL'],realValue:'0',src:'<%=request.getContextPath()%>/common/chulbs.do',caption:'${i18n.chulbs}'}
					]
				});
				//零件编号回车事件
			    $("#lingjbh").bind('enter',function(event){
			     	if(!$('#cangkbh').fieldSelect('validateNotNull')){
						 			return;
					}
				 	if(!$('#lingjbh').fieldText('validateNotNull')){
				 			return;
				 	}
				 	 var params =[] ;
				 	 var cangkbh = $('#cangkbh input').attr('realValue');
				 	 params.push("cangkbh="+cangkbh);	
				 	 params.push("lingjbh="+$('#lingjbh input').val());	
			        var url = "<%=request.getContextPath()%>/shouhuo/15006.do";
				    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					  if (showPromptRequestMsg(results)==true){
					          $('#peislx').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/pieslb150.do'+st_Params+'&lingjbh='+$('#lingjbh input').val()+'&cangkbh='+cangkbh);
					      }else{
						      $('#peislx input').val('');
						      $('#keh span').html('');
						      $('#peislx').fieldSelect('resetDatasource',[]);
					      }
					  });
					      return false;
			    });
				$(document).keyboardsupport({});
			});
		 /**
		  *进入150页面后进行查询
		  */
		 $(document).ready(function(){
		    var params =[] 	
		    params.push("jszt=1");	
	        var url = "<%=request.getContextPath()%>/shouhuo/15002.do";
	           $('#grid_user_${pageId}').grid("setQueryParams", params);
		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  if (showPromptRequestMsg(results)==true){
			    $('#cangkbh input').val(results.result.parameter.cangkbh);
		        $('#cangkbh input').attr("realValue",results.result.parameter.cangkbh);
			     if(results.result.response !='C_1403'){
			       $('#grid_user_${pageId}').grid('parseResult',results);
			        $('#xiehzt input').val(results.result.parameter.xiehzt);
		            $('#xiehzt input').attr("realValue",results.result.parameter.xiehzt);
		            $('#cangkbh input').attr('disabled',true);
		            $('#xiehzt input').attr('disabled',true);
		            $('#gongysdm input').addClass('field-tabed').focus();
				 	$('#gongysdm input').val(results.result.parameter.gongysdm);
				 	$('#chengysdm input').val(results.result.parameter.chengysdm);
				  }else{
				  $('#xiehzt').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/xiehzt.do'+st_Params+'&cangkbh='+$("#cangkbh input").attr("realValue")+'&biaos=1');
				  }
			     }
			 });
      });
      //设置客户的值
       function kehValue(){
		   var params = [];
		   //if(!$('#peislx').fieldSelect('validateNotNull')){
		   //	 			return;
		   //}
		   var peislx =$('#peislx input').attr('realValue');
		   if(null != peislx && '' != peislx){
			   params.push("peislx="+peislx );
			   params.push("cangkbh="+$('#cangkbh input').attr('realValue'));
			   params.push("lingjbh="+$('#lingjbh input').val());
			   params.push("usercenter="+'${userCenter}');
			   var url = "<%=request.getContextPath()%>/shouhuo/15007.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 	if(results.result.xiaohd != null){
				 	var  xiaohd = results.result.xiaohd;
						    $('#keh span').html(xiaohd.slice(0,5));
						    $('#xiaohd input').val(xiaohd);
						}
						msgClear();
				    });
			}
			  
		   }
		   //卸货站台列表
		   function cangkchange(){
			   if(!$('#cangkbh').fieldSelect('validateNotNull')){
					return;
				  }
			   var  cangkbh = $('#cangkbh input').attr("realValue");
			   $('#xiehzt').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/xiehzt.do'+st_Params+'&cangkbh='+cangkbh+'&biaos=1');
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
						    <td>${i18n.cangk}</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
						    <td>${i18n.xiehzt}</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
					   </tr>
					   <tr> 
					        <td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
					        <td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.peislb}</td>
							<td><div class="ui-field" id="peislx"></div></td>
						</tr>
						  <tr> 
						   <td>${i18n.keh}</td>
							<td><div class="ui-field" id="keh"></div></td>
						    <td>${i18n.bukhgs}</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
						    <td>${i18n.zhengclsh}</td>
							<td><div class="ui-field" id="zhengclsh"></div></td>
						</tr>
						 <tr> 
						    <td>${i18n.blh}</td>
							<td><div class="ui-field" id="blh"></div></td>
						    <td>${i18n.qissj}</td>
							<td><div class="ui-field" id="qissj"></div></td>
							<td>${i18n.zhongzsj}</td>
							<td><div class="ui-field" id="zhongzsj"></div></td>					       
						</tr>
						<tr>
						    <td>${i18n.chulbs}</td>
							<td><div class="ui-field" id="flag"></div></td>
							<td><div class="ui-field" id="liush"></div></td>
							<td><div class="ui-field" id="xiaohd"></div></td>
						</tr>			
					</tbody>
				</table>
			</div>
			 <div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	 </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>