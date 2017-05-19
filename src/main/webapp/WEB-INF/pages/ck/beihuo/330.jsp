<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","330");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_330}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			//var demorecord = {"result":{"response":"0000","trans_bran_code":"abc","seqno":0,"parameter":{"jiesckbh":"D000000001",cangkbh:st_Cangkbh,"pageSize":"10","list":[{"jiaofsj":"","lingjmc":"5","weiwcsl":-10,"shipsl":30,"lingjbh":"a01","jihy":"5","lux":"123","danw":"m","zhixsl":40},{"jiaofsj":"","lingjmc":"5","weiwcsl":100,"shipsl":100,"lingjbh":"a04","jihy":"5","lux":"123","danw":"m","zhixsl":0}],"shij":"2012-3-27","cangkbh":"C01","beihybh":"ck"}}};
			//var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{us:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['ush'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/beihuo/33003.do',
					cols:[
						{property:'ush',caption:'${i18n.ush}'},
						{property:'lingjsl',caption:'${i18n.shul}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
				  		{property:'gongysdm',caption:'${i18n.gongys}'},
				  		{property:'kuwbh',caption:'${i18n.kuw}'}
					],
					//records:demorecord,
					buttons:[
						//F3确认
				   	 	{name:'ok',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
							//参数校验
					 		if(!$('#beihdh').fieldText('validate')||!$('#beihybh').fieldText('validate')){
					 			return;
					 		}
							//验证备货单号是否改变
					 		if(checkBeihdhChange()){
					 			return;
					 		}
					 		var beihdh = $('#beihdh input').val();
					 		var beihybh = $('#beihybh input').val();
					 		var params = [];
					 		params.push('beihdh=' + beihdh);
					 		if(beihybh){
					 			params.push('beihybh=' + beihybh);
					 		}else{
					 			params.push('beihybh=${userName}');
					 		}
					 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
                            if(records.length < 1){
                                showPromptMsg('red',$.sdcui.resource.i18n['C_F_QRUSMX']);
                                return false;
                            }
                            var url="<%=request.getContextPath()%>/beihuo/33002.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if(showPromptRequestMsg(results)){
                            	  
	                                    $('#grid_user_${pageId}').form('clearValue');
	                                    $('#grid_user_${pageId}').grid('clearRecords');
                                }
                            });
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
						//F12返回
						{name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 		url:'<%=request.getContextPath()%>/beihuo/33001.do',
			 		onreload:true,
			 		fields:[
							{fieldType:'fieldText',biaos:'enter',property:'beihdh',notNull:true,caption:'${i18n.beihdh}',dataType:'beihdh'},
							{fieldType:'fieldText',biaos:'enter',property:'beihybh',caption:'${i18n.beihybh}',dataType:'beihybh',value:st_UserName},
							{fieldType:'fieldText',biaos:'enter',property:'ush',notNull:true,caption:'${i18n.ush}',dataType:'ush'}
			 		]
			 	});
			 	
			 	//备货单号回车验证权限并查询
 			 	$('#beihdh').bind('enter',function(){
 			 		checkAuthSearch();
 			 	});
			 	
			 	//备货员编号回车验证权限并查询
 			 	$('#beihybh').bind('enter',function(){
 			 		checkAuthSearch();
 			 	});
			 	
			 	//us号回车确认明细
 			 	$('#ush').bind('enter',function(){
					//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
					//验证备货单号是否改变
			 		if(checkBeihdhChange()){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
 			 		var beihybh = $('#beihybh input').val();
 			 		if(!beihybh){
 			 			params = rpArrProperty(params,'beihybh','${userName}');
 			 		}
 			 		params.push('cangkbh=' + st_Cangkbh);
 			 		params.push("currentPage=1");
 			 		//设置分页条件
				    $('#grid_user_${pageId}').grid("setQueryParams", params);
			 		$('#form_user_${pageId}').form('submit',params,function(results){
			 			if(showPromptRequestMsg(results)){
			 			  if(results.result.response=="0001"){
				 			//刷新列表数据
                            $('#grid_user_${pageId}').grid('parseResult',results);
				 			$('#ush').fieldText('setValue','');
				 			//设置备货单号
				 			$('#xg_beihdh').val($('#beihdh input').val());
				 			 msgClear();
				 			 }
			 			}
			 		});
 			 	});
			 	
                $(document).keyboardsupport({});
            });
			
			function checkAuthSearch(){
				//参数校验 
		 		if(!$('#beihdh').fieldText('validate')||!$('#beihybh').fieldText('validate')){
		 			return;
		 		}
	 			var params = [];
		 		var beihdh = $('#beihdh input').val();
		 		var beihybh = $('#beihybh input').val();
		 		params.push('beihdh=' + beihdh);
		 		params.push('cangkbh=' + st_Cangkbh);
		 		if(beihybh){
		 			params.push('beihybh=' + beihybh);
		 		}else{
		 			params.push('beihybh=${userName}');
		 		}
                params.push('currentPage=1');
                //设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
                $('#grid_user_${pageId}').grid("load",params,function(results){
                    if(showPromptRequestMsg(results)){
                        if(results.result.response == "0001"){
	                         msgClear();
	                       }else{
	                         showPromptMsg('red',$.sdcui.resource.i18n['C3_00d0046']);
	                       }
	                    $('#xg_beihdh').val(beihdh);
                        $('.field-tabed').removeClass('field-tabed').blur();  //移除样式
						$('#ush input').addClass('field-tabed').focus();   //增加焦点
                    }
                });
			}
			
			//验证备货单号是否改变
			function checkBeihdhChange(){
				var newValue = $('#beihdh input').val();
				var oldValue = $('#xg_beihdh').val();
				if (oldValue !='' && newValue != oldValue){
					showPromptMsg('red',$.sdcui.resource.i18n['C_F_BEIHDHYGB']);
					$('#grid_user_${pageId}').grid('clearRecords');
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
			<form id="putform" method="post" name="putform" >
			<input id="xg_beihdh" name="xg_beihdh" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
						</tr>
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
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