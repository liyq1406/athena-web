<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","329");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_329}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			//var demorecord = {"result":{"response":"0000","trans_bran_code":"abc","seqno":0,"parameter":{"jiesckbh":"D000000001",cangkbh:st_Cangkbh,"pageSize":"10","list":[{"jiaofsj":"","lingjmc":"5","weiwcsl":-10,"shipsl":30,"lingjbh":"a01","jihy":"5","lux":"123","danw":"m","zhixsl":40},{"jiaofsj":"","lingjmc":"5","weiwcsl":100,"shipsl":100,"lingjbh":"a04","jihy":"5","lux":"123","danw":"m","zhixsl":0}],"shij":"2012-3-27","cangkbh":"C01","beihybh":"ck"}}};
			var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{us:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
			//返回界面初始值
			var searchKey = {};
			
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['us'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/32901.do',
					cols:[
						{property:'ush',caption:'${i18n.ush}'},
						{property:'lingjsl',caption:'${i18n.shul}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
				  		{property:'gongysdm',caption:'${i18n.gongys}'},
				  		{property:'kuwbh',caption:'${i18n.kuw}'},
				  		{property:'rukrq',caption:'${i18n.ruksj}'},
				  		{property:'elh',caption:'${i18n.elh}'}
					],
					buttons:[
						//F1查询
						{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
							
							//参数校验
							if(!$('#lingjbh').fieldText('validate')){
								$('#grid_user_${pageId}').grid('clearRecords');
								return;
							}
					 		var params = [];
					 		params.push('lingjbh=' + $('#lingjbh input').val());
					 		params.push('cangkbh=' + st_Cangkbh);	
					 		params.push('currentPage=1');
					 		//设置分页条件
				            $('#grid_user_${pageId}').grid("setQueryParams", params);
					 		$('#grid_user_${pageId}').grid("load",params);
						}},
						//F2添加
						{name:'tianj',caption:'${i18n.tianj}[F2]',keyboard:'F2',action:function(){
							//参数校验
					 		if(!$('#jiesckbh').fieldText('validate')){
					 			return;
					 		}
							//非本仓库验证
                            if($('#jiesckbh input').val() == st_Cangkbh){
                            	showPromptMsg('red',$.sdcui.resource.i18n['C_F_YIKCK']);
                                return;
                            }
							var jiesckbh = $('#jiesckbh input').val();
					 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(records.length == 0){
								showMsg("${i18n.selectoneerror}");
								return false;
							}
							var usList = [];
							for(var i=0;i<records.length;i++){
								var us = records[i].split('=');
								usList.push('\''+us[1]+'\'');
							}
							var params = $('#grid_user_${pageId}').grid('getQueryParams');
							params.push('jiesckbh='+ jiesckbh);
							params.push('usList='+ usList.join(','));
							params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
                            var url="<%=request.getContextPath()%>/beihuo/32902.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if (showPromptRequestMsg(results)){
                                    $('#grid_user_${pageId}').grid('parseResult',results);
                                }
                            });
						}},
						//F4单选
						{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
								$('#grid_user_${pageId}').grid('selected');
								msgClear();
								return false;
						}},
						//F5全选
				   	 	{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
					   	 		$('#grid_user_${pageId}').grid('selectedAll');
					   	 	    msgClear();
					   	 		return false;
						}},
						//F7查看
						{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
							//参数校验
					 		if(!$('#jiesckbh').fieldText('validate')){
					 			return;
					 		}
	                         //非本仓库验证
                            if($('#jiesckbh input').val() == st_Cangkbh){
                                showPromptMsg('red',$.sdcui.resource.i18n['C_F_YIKCK']);
                                return;
                            }
					 		var params = [];
					 		params.push('cangkbh=' + st_Cangkbh);
					 		params.push('jiesckbh='+$('#jiesckbh input').val());
					 		params.push('currentPage=1');
                            var url="<%=request.getContextPath()%>/beihuo/32903.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0000"){
                                    	//保存界面值
	                                   	searchKey = {
	                                        jiesckbh:$('#jiesckbh input').val(),
	                                        lingjbh:$('#lingjbh input').val(),
	                                        params:$('#grid_user_${pageId}').grid("getQueryParams"),
	                            	        currentPage:$('#grid_user_${pageId}').grid("getCurrentPage")
	                                    };
	                                   	var strSearchKey=JSON.stringify(searchKey);
                                        $('#searchKey').val(strSearchKey);
                                        
	                                    //加载返回数据
	                                    var strJSON=JSON.stringify(results);
	                                    $('#putvalue').val(strJSON);
	                                    $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P32901.do"+st_Params);
	                                    document.putform.submit();
                                    }
                                }
                            });
						}},
						//F8打印移库备货单
						{name:'print',caption:'${i18n.dayykbhd}[F8]',keyboard:'F8',action:function(){
					            //参数校验
	                            if(!$('#lingjbh').fieldText('validate')){
	                                $('#grid_user_${pageId}').grid('clearRecords');
	                                return;
	                            }
	                            var params = [];
	                            params.push('cangkbh=' + st_Cangkbh);
	                            params.push('jiesckbh=' + $('#jiesckbh input').val());
	                            params.push('lingjbh=' + $('#lingjbh input').val());
	                            var url="<%=request.getContextPath()%>/beihuo/32905.do";
	                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                                  $('#grid_user_${pageId}').grid('clearRecords');
	                                  $('#form_user_${pageId}').form('clearValue');
	                            });
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		fields:[
							{fieldType:'fieldText',property:'jiesckbh',notNull:true,caption:'${i18n.jiesck}',dataType:'letter_numeric',limitedLength:'3'},
							{fieldType:'fieldText',property:'lingjbh',notNull:true,caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'}
			 		]
			 	});
				
                //从跳转页面返回
                $(document).ready(function(){
                	var searchKeyValue = $('#searchKey').val();
                	//判断是否页面返回
                	if (searchKeyValue){
	                	searchKey = JSON.parse(searchKeyValue);
	                	//返回form参数
	                	$('#jiesckbh input').val(searchKey.jiesckbh);
	                	$('#lingjbh input').val(searchKey.lingjbh);
	                	//返回gird查询
	                	var params = searchKey.params;
                        //设置分页条件
				        $('#grid_user_${pageId}').grid("setQueryParams", params);
	                    $('#grid_user_${pageId}').grid("load",params);
                	}
                });
                
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="searchKey" name="searchKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" >
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.jiesck}:</td>
							<td><div class="ui-field" id="jiesckbh"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
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