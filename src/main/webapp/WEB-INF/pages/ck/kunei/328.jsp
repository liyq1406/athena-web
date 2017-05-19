<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","328");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_328}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('.hidden-item').hide();
				
				$('#grid_user_${pageId}').grid({
					keyFields:['ush'],
					id:'grid_user_${pageId}',
					enableCutPage:false,
					cols:[
						{property:'ush',caption:'${i18n.ush}',width:50},
						{property:'gongysdm',caption:'${i18n.gongys}',width:50},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:50},
						{property:'usxh',caption:'${i18n.rongqxh}',width:50},
						{property:'lingjsl',caption:'${i18n.shul}',width:50},
				  		{property:'danw',caption:'${i18n.lingjdw}',width:50},
				  		{property:'bzzt',internation:true,caption:'${i18n.zhuangt}',width:50},
				  		{property:'diz',caption:'${i18n.diz}',width:50},
				  		{property:'beiyk',caption:'${i18n.beiyk}',width:50},
				  		{property:'beiykdz',caption:'${i18n.beiykdz}',width:50},
				  		{property:'danqdz',caption:'${i18n.danqdz}',width:50},
				  		{property:'uclx',caption:'${i18n.ucxh}',width:50}
					],
                    buttons:[
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
                    ]
					//records:{'result':{'total':2,'rows':[{'yicsbdh':'0000000','lingjh':123,'shenbrxm':234,'gongys':328,'lingjmc':12328,'shenbsl':901,'lingjdw':322,'yuanbzdj':'N'}]}}
				});
				
			 	$('#form_user_${pageId}').form({
			 		//查询交易
			 		url:'<%=request.getContextPath()%>/kunei/32801.do',
			 		fields:[
						{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',caption:'${i18n.ush}',notNull:true}
			 		]
			 	});
			 	
			 	$('#form_user_${pageId}_submit').form({
			 		onreload:true,
			 		//提交
			 		url:'<%=request.getContextPath()%>/kunei/32802.do',
			 		fields:[
							{fieldType:'fieldHidden',property:'xg_ush'},
							{fieldType:'fieldHidden',property:'xg_beiyk'},
							{fieldType:'fieldHidden',property:'xg_beiykdz'},
							{fieldType:'fieldLabel',property:'cangkbh'},
							{fieldType:'fieldText',property:'shifbyk',dataType:'yesno',notNull:true,caption:'${i18n.beiykbz}'},
							{fieldType:'fieldText',property:'xinkdz',dataType:'letter_numeric',limitedLength:'3',limitedLength2:'9'},
							{fieldType:'fieldText',property:'shifdy',dataType:'yesno',notNull:true,caption:'${i18n.shifdy}'}
			 		]
			 	});
			 	
 			 	//按US号查询
 			 	$('#ush').bind('enter',function(){
 			 		$('#grid_user_${pageId}').grid('clearRecords');
 			 		$('#form_user_${pageId}_submit').form('clearValue');
 			 		$('.hidden-item').hide();
 			 		
		 			//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			$('#grid_user_${pageId}').grid('clearRecords');
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		$('#form_user_${pageId}').form('submit',params,function(results){
			 			if(showPromptRequestMsg(results)){
				 			var record = results.result.parameter;
				 			//record = {"ush":"Sb00002099","danqdz":"1","pageSize":10,"uclx":"11111","beiykdz":"C01Z01123456","diz":"C01Z01","cangkbh":"C01","usxh":"2501B","beiyk":"Y","danw":"KG","bzzt":"C_USZT4","baozzt":"4","lingjbh":"lj01000001","lingjsl":1,"gongysdm":"gys0000001"};
				 			if (record){
				 				$('#grid_user_${pageId}').grid('clearRecords');
				 				$('#grid_user_${pageId}').grid('addRow',record);
					 			//如果查询有数据，显示隐藏域
					 			//保存查询US号到隐藏项
					 			$('.hidden-item').show();
					 			var ush = $('#ush input').val();
					 			$('#xg_ush input').val(record.ush);
					 			$('#xg_beiyk input').val(record.beiyk);
					 			$('#xg_beiykdz input').val(record.beiykdz);
					 			$('#cangkbh').fieldLabel("setValue",st_Cangkbh);
					 			$('#shifbyk input').val('N');
					 			$('#shifdy input').val('Y');
					 			
					 			if (record.beiyk != 'Y'){
					 				$('#shifbyk input').attr('readonly',true);
					 				$('#shifbyk input').attr('disabled','disabled');
					 			}else{
					 				$('#shifbyk input').attr('readonly',false);
					 				$('#shifbyk input').attr('disabled','');
					 			}
					 			$('#xinkdz input')[0].focus();
								$('#ush input').removeClass("field-tabed");
								$('#xinkdz input').addClass("field-tabed");
					 		}
			 			}
			 		});
			    });
 			 	
			 	//F1提交
			 	$('#btn_submit').bind('click',function(){
			 		if ($('.hidden-item').css("display")=='none'){
			 			return;
			 		}
		 			//参数校验
			 		if(!$('#form_user_${pageId}_submit').form("validateParam")){
			 			return;
			 		}
			 		var params = [];
			 		params.push('ush='+ $('#xg_ush input').val());
			 		params.push('shifbyk='+ $('#shifbyk input').val());
			 		var xinkdz = $('#xinkdz input').val();
			 		//是否使用备用库地址
			 		//if ($('#shifbyk input').val() == 'Y'){
			 		//	xinkdz = $('#xg_beiykdz input').val();
			 		//}else{
			 		xinkdz = $('#xinkdz input').val();
			 		//}
			 		//备用库地址
			 		if (xinkdz.length == 3){
		 				params.push('cangkbh=' + st_Cangkbh);
		 				params.push('zickbh=' + xinkdz);
		 				params.push('kuwbh=');
		 			}else if (xinkdz.length == 9){
		 				params.push('cangkbh=' + st_Cangkbh);
		 				params.push('zickbh=' + xinkdz.substring(0,3));
		 				params.push('kuwbh=' + xinkdz.substring(3,9));
		 			}else if (xinkdz.length == 12){
                        params.push('cangkbh=' + xinkdz.substring(0,3));
                        params.push('zickbh=' + xinkdz.substring(3,6));
                        params.push('kuwbh=' + xinkdz.substring(6,12));
                    }
		 			else{
		 				params.push('cangkbh=' + st_Cangkbh);
		 				params.push('zickbh=');
		 				params.push('kuwbh=');
		 			}
		 			
		 			params.push('shifdy='+ $('#shifdy input').val());
		 			$('#form_user_${pageId}_submit').form('submit',params,function(results){
		 				if(showPromptRequestMsg(results)){
			 				$('#form_user_${pageId}').form('clearValue');
			 				$('#form_user_${pageId}_submit').form('clearValue');
			 				$('#grid_user_${pageId}').grid('clearRecords');
		 			 		$('.hidden-item').hide();
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
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<div class='hidden-item'>
				<div id="form_user_${pageId}_submit" class="ui-fieldLayout">
				 	<table class="ui-grid" cellspacing="1" width="100%">
						<tbody>
							<tr>
								<td><div class="ui-field" id="xg_ush"></div></td>
								<td><div class="ui-field" id="xg_beiyk"></div></td>
								<td><div class="ui-field" id="xg_beiykdz"></div></td>
								<td>${i18n.cangk}:</td>
                                <td><div class="ui-field" id="cangkbh"></div></td>
								<td>${i18n.beiykbz}:</td>
								<td><div class="ui-field" id="shifbyk"></div></td>
								<td>${i18n.xinkdz}:</td>
								<td><div class="ui-field" id="xinkdz"></div></td>
								<td>${i18n.shifdy}:</td>
								<td><div class="ui-field" id="shifdy"></div></td>
								<td><div align="center"><span id="btn_submit" class="ui-button">${i18n.tij}[F1]</span></div></td>
							</tr>
						</tbody>
					</table> 
				</div>
			</div>
			<br/>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>