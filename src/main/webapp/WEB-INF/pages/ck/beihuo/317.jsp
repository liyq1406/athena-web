<%@ page language="java" pageEncoding="UTF-8" import="com.athena.authority.entity.LoginUser,com.athena.authority.util.AuthorityUtils"%>
<%request.setAttribute("pageId","317");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<% 
String path = request.getContextPath();
LoginUser loginUser1 = AuthorityUtils.getSecurityUser();
String Usercenter1 = loginUser1.getUsercenter();
%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_317}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uch'],
					id:'grid_user_${pageId}',
					enableCutPage:false,
					cols:[
					    {property:'keh',caption:'${i18n.kehxhd}'},
						{property:'ush',caption:'${i18n.ush}'},
						{property:'lingjbh',caption:'${i18n.lingjh}'},
				  		{property:'uclx',caption:'${i18n.shangxbz}'},
				  		{property:'shifsl',caption:'${i18n.shifsl}'},
				  		{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
				  		{property:'gongysmc',caption:'${i18n.gongysmc}'}
					],
					buttons:[
						//F3确认
				   	 	{name:'ok',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){				   	 	    
					 		//验证参数
		 			 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			 			return;
		 			 		}
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		var beihybh = $('#beihybh input').val();
					 		if(!beihybh){
					 			params[0] = 'beihybh=${userName}';
					 		}
					 							 		   	
							var usercenter="<%=Usercenter1%>"; 		
					 		
			         	    params.push("usercenter="+usercenter);
			         	    
			         	    var len1 = $('#keh input').val();
			         	    //alert(len1.length);
			         	    
			         	    if(len1.length!=5){
			         	        if(len1.length!=9){
			         	           alert("客户号只能为5位和9位！");
			         	        return false;
			         	        }
			         	    }
			         	          	    
			         	    params.push("len="+len1.length);
			         	    
			         	    //xss 0011210
			         	    var res = $('#grid_user_${pageId}').grid('getRecordAll');
									 
						    if(res.length >= 70){
		                       showPromptMsg('red',$.sdcui.resource.i18n['C_P317_01']);
		                       return false;
		                    }
			         	    	         	    
	 		   
					 		$.ajax({					    
                                    url:"<%=request.getContextPath()%>/beihuo/317044.do",
								    type:'post', //数据发送方式 
								    dataType:'json', //接受数据格式 
								    data:params.join('&'),
									success:function(result){
									//alert( result.result.parameter.list[0].value);
									var msg = result.result.parameter.list[0].value;
									
		
									 
									 if(msg==0){
									 	if(confirm($.sdcui.resource.i18n['P317_A002']) ){
							 		   	  $('#form_user_${pageId}').form('submit',params,function(results1){
							 		      if(showPromptRequestMsg(results1)){
										   //新增列表行数据
											var record = results1.result.parameter;
											$('#grid_user_${pageId}').grid('addRow',record);
											$('#form_user_${pageId}').form('clearValue');
											$('#beihdh input').val(results1.result.parameter.beihdh);
											}
							 		      });		                             		 		          
					 		            }else{
					 		            	//$('#form_user_${pageId}').form('clearValue');
					 		            	$('#beihybh input').val("");	
					 		            	$('#keh input').val("");	
					 		            	$('#ush input').val("");	
					 		            	$('#lingjbh input').val("");	
					 		            	$('#uclx input').val("");	
					 		            	$('#gongysdm input').val("");	
					 		            	$('#gongysmc span').val("");
					 		            	$('#shifsl input').val("");	            	
					 		            }
									}else{							     							 		   	 
							 		   	  $('#form_user_${pageId}').form('submit',params,function(results1){
							 		      if(showPromptRequestMsg(results1)){
										   //新增列表行数据
											var record = results1.result.parameter;
											$('#grid_user_${pageId}').grid('addRow',record);
											$('#form_user_${pageId}').form('clearValue');
											$('#beihdh input').val(results1.result.parameter.beihdh);
											}
							 		      });	
									}
																		
								 }								
								});
						}},
						//F8打印
				   	 	{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
                            var records = $('#grid_user_${pageId}').grid('getRecordAll');
                            if(records.length < 1){
                                showPromptMsg('red',$.sdcui.resource.i18n['C_F_QRUSMX']);
                                return false;
                            }
                                                                                    
                            var params = [];
                            var ucList = [];
                            for(var i=0;i<records.length;i++){
                                var uc = records[i].split('=');
                                ucList.push('\''+uc[1]+'\'');
                            }
                            params.push('ucList=' + ucList.join(','));
                            var url="<%=request.getContextPath()%>/beihuo/31704.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                  $('#grid_user_${pageId}').grid('clearRecords');
                                  $('#form_user_${pageId}').form('clearValue');
                            });
						}},
						//F12返回
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/31703.do',
					fields:[
					    {fieldType:'fieldText',biaos:'enter',property:'beihybh',dataType:'beihybh',value:st_UserName},
					    {fieldType:'fieldText',property:'keh',maxLength:'9',notNull:true,caption:'${i18n.kehxhd}'},
						{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',notNull:true,caption:'${i18n.ush}'},
						{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',notNull:true,caption:'${i18n.lingjh}',limitedLength:'10'},
						{fieldType:'fieldText',property:'uclx',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.shangxbz}'},
						{fieldType:'fieldText',property:'shifsl',dataType:'dbnumber',notNull:true,caption:'${i18n.shifsl}'},
						{fieldType:'fieldLabel',property:'gongysdm'},
						{fieldType:'fieldHidden',property:'beihdh'},
						{fieldType:'fieldLabel',property:'gongysmc'}
					]
				}); 
			 	
			 	//按备货员编号查询客户
 			 	$('#beihybh').bind('enter',function(){
 			 		//参数校验 
 			 		if(!$('#beihybh').fieldText('validate')){
 			 			$("#keh").fieldText("setValue","");
 			 			return;
 			 		}
 			 		var params = [];
 			 		var beihybh = $('#beihybh input').val();
			 		if(beihybh){
			 			params.push('beihybh='+ beihybh);
			 		}else{
			 			params.push('beihybh=${userName}');
			 		}
			 		
                    var url="<%=request.getContextPath()%>/beihuo/31701.do";
                    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                    	if (showPromptRequestMsg(results)){
                            $("#keh").fieldText("setValue",results.result.parameter.keh);
                        }else{
                            $("#keh").fieldText("setValue","");
                        }
                    });
			    });
			 	
 			 	//按US查询
 			 	$('#ush').bind('enter',function(){
		 			//参数校验 
			 		if(!$('#beihybh').fieldText('validate')||!$('#keh').fieldText('validate')||!$('#ush').fieldText('validate')){
                        $("#lingjbh").fieldText("setValue","");
                        $("#uclx").fieldText("setValue","");
                        $("#gongysdm").fieldLabel("setValue","");
                        $("#gongysmc").fieldLabel("setValue","");
			 			return;
		 			}
			 		var params = [];
			 		var beihybh = $('#beihybh input').val();
			 		var keh = $('#keh input').val();
			 		var ush = $('#ush input').val();
			 		if(beihybh){
			 			params.push('beihybh='+ beihybh);
			 		}else{
			 			params.push('beihybh=${userName}');
			 		}
			 		params.push("keh=" + keh);
			 		params.push("ush=" + ush);
			 		$('#grid_user_${pageId}').grid("setQueryParams", params);
                    var url="<%=request.getContextPath()%>/beihuo/31702.do";
                    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                    	if (showPromptRequestMsg(results)){
                            $("#lingjbh").fieldText("setValue",results.result.parameter.lingjbh);
                            $("#uclx").fieldText("setValue",results.result.parameter.uclx);
                            $("#gongysdm").fieldLabel("setValue",results.result.parameter.gongysdm);
                            $("#gongysmc").fieldLabel("setValue",results.result.parameter.gongysmc);
                            $("#shifsl").fieldText("setValue",results.result.parameter.shifsl);
                            $("#shifsl input").focus();
                            $("#shifsl input").select();
                        }else{
                            $("#lingjbh").fieldText("setValue","");
                            $("#uclx").fieldText("setValue","");
                            $("#gongysdm").fieldLabel("setValue","");
                            $("#gongysmc").fieldLabel("setValue","");
                            $("#shifsl").fieldText("setValue","");
                        }
                    });
			    });
				
			 	//按零件号查询
 			 	$('#lingjbh').bind('enter',function(){
		 			//参数校验 
			 		if(!$('#beihybh').fieldText('validate')||!$('#keh').fieldText('validate')||!$('#lingjbh').fieldText('validate')){
                        $("#ush").fieldText("setValue","");
                        $("#uclx").fieldText("setValue","");
                        $("#gongysdm").fieldLabel("setValue","");
                        $("#gongysmc").fieldLabel("setValue","");
			 			return;
		 			}
			 		var params = [];
			 		var beihybh = $('#beihybh input').val();
			 		var keh = $('#keh input').val();
			 		var lingjbh = $('#lingjbh input').val();
			 		if(beihybh){
			 			params.push('beihybh='+ beihybh);
			 		}else{
			 			params.push('beihybh=${userName}');
			 		}
			 		params.push("keh=" + keh);
			 		params.push("lingjbh=" + lingjbh);
                    var url="<%=request.getContextPath()%>/beihuo/31702.do";
                    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                    	if (showPromptRequestMsg(results)){
                            $("#ush").fieldText("setValue",results.result.parameter.ush);
                            $("#uclx").fieldText("setValue",results.result.parameter.uclx);
                            $("#gongysdm").fieldLabel("setValue",results.result.parameter.gongysdm);
                            $("#gongysmc").fieldLabel("setValue",results.result.parameter.gongysmc);
                            $("#shifsl").fieldText("setValue",results.result.parameter.shifsl);
                            $("#shifsl input").focus();
                            $("#shifsl input").select();
                        }else{
                            $("#ush").fieldText("setValue","");
                            $("#uclx").fieldText("setValue","");
                            $("#gongysdm").fieldLabel("setValue","");
                            $("#gongysmc").fieldLabel("setValue","");
                            $("#shifsl").fieldText("setValue","");
                        }
                    });
 			 	});
			 	
			 	$(document).keyboardsupport({});
			});
			
		</script>
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.kehxhd}:</td>
							<td><div class="ui-field" id="keh"></div></td>
						</tr>
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.shangxbz}:</td>
							<td><div class="ui-field" id="uclx"></div></td>
							<td>${i18n.shifsl}:</td>
							<td><div class="ui-field" id="shifsl"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.gongysmc}:</td>
							<td><div class="ui-field" id="gongysmc"></div></td>
							<td><div class="ui-field" id="beihdh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>