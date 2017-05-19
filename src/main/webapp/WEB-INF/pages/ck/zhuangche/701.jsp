<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","701");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html  i18n="i18n.ck">
	<head>
		<title>${i18n.title_701}</title>
		<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
	 //V4_039 卡车号限长输入8位 如 HBA12345  
	var pageId = '${pageId}';
	$(function(){
		//表单
		$('#form_user_${pageId}').form({
			fields:[
				{fieldType:'fieldText',biaos:'enter',property:'peizdh',caption:'${i18n.peizdh}',notNull:true},
				{fieldType:'fieldText',property:'chep',dataType:'text',maxLength:'8',width:100},
				{fieldType:'fieldLabel',property:'usercenter',value:'${userCenter}'},
				{fieldType:'fieldLabel',property:'zhidr',value:'${userName}'},
				{fieldType:'fieldHidden',property:'yunssbm'},
				{fieldType:'fieldHidden',property:'gongsmc'},
				{fieldType:'fieldHidden',property:'jihcx'},
				{fieldType:'fieldHidden',property:'yunslx'}
			]
		});
		
		$('#form_ua_${pageId}').form({
			fields:[
				{fieldType:'fieldText',biaos:'enter',property:'ua',dataType:'uah1',caption:'${i18n.uah}',notNull:true} 
			]
		});
		
		$('#grid_user_${pageId}').grid({
			keyFields:['uakh'],
			id:'grid_user_${pageId}',
			enableCutPage:false,
			url:'/athena-fj/fj/70101.do',
			cols:[
			{property:'UCH',caption:'${i18n.uah}'}, 
			{property:'USH',caption:'${i18n.ush}'},
	  		{property:'LINGJBH',caption:'${i18n.lingjbh}'},
	  		{property:'LINGJSL',caption:'${i18n.lingjsl}'},
	  		{property:'UAXH',caption:'${i18n.uaxh}'},
	  		{property:'XIEHD',caption:'${i18n.xiehd}'},
	  		{property:'BEIHDH',caption:'${i18n.beihdh}'},
	  		{property:'CANGKBH',caption:'${i18n.cangkbh}'},
	  		{property:'KEH',caption:'${i18n.kehbh}'},
	  		{property:'PEIZDH',caption:'${i18n.peizdh}'}
		],
	 	buttons:[
 		 	//确认 （打印配载信息）
 			{name:'submit',caption:'${i18n.quer}[F3]',keyboard:'F3',action:function(){
 				var grid_peizd = $('td.PEIZDH ').attr('value');
 				//var param = "peizdh="+$('#peizdh input').val()+"&uch="+$('#ua input').val()+"&usercenter="+$("#usercenter").text();
 				var param = [];
 				param.push("peizdh="+$('#peizdh input').val());
 				param.push("uch="+$('#ua input').val());
 				param.push("usercenter="+$("#usercenter").text());
 				//验证整个表单				 		
 				if(!$('#form_user_${pageId}').form("validateParam")){
 		 			return;
 		 		}
 				if(grid_peizd==null){//UA列表为空
 					if(!$('#ua').fieldText('validate')){//验证form中的UA卡号是否为空
 			 			return;
 			 		}
 				   showPromptMsg('red','${i18n.uaList_empty_label_des}')
 				   return;
 				}
 				//peizd_ajax(param);
 				//获得Form表单数据
 				var params = $('#form_user_'+pageId).form("getFormParam");
 		 		params.push("uch="+ualist.join(','));
 		 		var url = "<%=request.getContextPath()%>/fj/70103.ajax";
 		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 		 			showPromptMsg("red",results.result.message);
					$("#peizdh input").val('');
					$("#chep input").val('');
					$("#ua input").val('');
					$('div.grid-content tr.grid-row.field-tab').remove();
					ualist = [];
 				 }); 
 			}}
 			//删除 （删除选中一行的信息）
 			,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
 				var ua = $('tr.field-tabed.selected td.UCH').attr('value');
 				$('tr.field-tabed.selected').remove();
 				//将原来保存在ualist中的元素删除掉
 				for (var index =0; index < ualist.length; index++) {
 					if (ualist[index] == ua) {
 						ualist.splice(index,1);
 						break;
 					}
 				}
 			}}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]' }
		]});
		
		
		//车牌回调函数
		function getChep(){
			var peizdh = $('#peizdh input').val();
 			var grid_peizd = $('td.PEIZDH ').attr('value');
	 		//var param = "peizdh="+peizdh;
	 		
	 		var param = [];
	 		param.push("peizdh="+peizdh);
	 		
 			//参数校验
	 		if(peizdh == ""){
	 			showPromptMsg("red","${i18n.peizdh_label_des}");
 			}else{
	 			if(grid_peizd!=null){
	 				if ($('td.PEIZDH ').text){ 
	 					if (grid_peizd != peizdh) {
	 						if(confirm("${i18n.peizdh_change_label_des}")){
	 							$('div.grid-content tr.grid-row.field-tab').remove();
	 							ualist = [];
	 							//$('#chep input').val();
	 							peizd_ajax(param);
	 						}else{
	 							$('#peizdh input').val(grid_peizd);
	 							return;
	 						}
	 					}
	 				}
	 			}else{
	 				peizd_ajax(param);
		 			}
	 			}
		}
		
		//验证配载单号
		function peizd_ajax(params){
			var url = "<%=request.getContextPath()%>/fj/70102.do";
	 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 			//判断：如果没有检索到配载单号，则提示用户
	 			if(results.result.length==0){
	 				showPromptMsg("red","${i18n.peizdh_noExist_label_des}");
					return;
				}
	 			if(results.result[0].SHIFZC=='1'){
	 				showPromptMsg("red","${i18n.peizdh_zcDown_label_des}");
					return;
	 			}
	 			 $('#chep input').val(results.result[0].CHEP);
				 $('#yunssbm input').val(results.result[0].YUNSSBM);
				 $('#gongsmc input').val(results.result[0].GONGSMC);
				 $('#jihcx input').val(results.result[0].JIHCX);
				 $('#yunslx input').val(results.result[0].YUNSLX);
				 $('#ua input').focus();
				 showPromptMsg('blue',$.sdcui.resource.i18n['C_OperSuccess']);
	 		 }); 
		}
		
		//回车事件，根据输入的配载单号获得车牌
		$('#peizdh').bind('enter',function(){
		 	getChep();
	    }); 
		//down事件，根据输入的配载单号获得车牌
		$('#peizdh input').bind('keydown','down',function(){
		 	getChep();
	    }); 
		
		
		var ualist = [];
		var beihdh = '';
		//检索UA包装
		$('#ua').bind('enter',function(){
			if(!$('#form_user_${pageId}').form("validateParam")){
	 			return;
	 		}
			var uah = $('#ua input').val();
			//var param = "peizdh="+$('#peizdh input').val()+"&uch="+uah+"&usercenter="+$("#usercenter").text();
			var param = [];
			//param.push("peizdh="+$('#peizdh input').val()); //去掉，peizdh参数不做UCBQ表查询条件 hzg 2012-7-10
			param.push("uch="+uah);
			param.push("yunslx="+$('#yunslx input').val());   //增加,所在配载单的运输路线组 hzg 2012-7-10 
			//param.push("usercenter="+$("#usercenter").text()); //不用传参，直接在获得登录人所在用户中心即可 hzg 2012-7-10
 			if(uah == ''){
 				showPromptMsg('red','${i18n.uah_label_des}')
			}else{
				for (var i =0; i < ualist.length; i++) {
					if (ualist[i] == uah) {
						showPromptMsg('red','${i18n.uah_repeat_label_des}');
						return;
					}
				}
				ua_ajax(param);
			}
		}); 
		
		
		//验证UA卡号
		function ua_ajax(params){
			var peizdh=$('#peizdh input').val();
			var yunslx = $('#yunslx input').val();
			var url = '<%=request.getContextPath()%>/fj/70101.ajax';
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				//判断：如果没有检索到对应的UC号，则提示用户，不增加行
				if(results.result.length==0){//UC卡号不在
					 showPromptMsg('red','${i18n.uah_noExist_label_des}')
					 return;
				 }
				//备货明细表中UC的扫描状态,0未出库，2已出库，3已扫描
				if(results.result[0].BIAOS==3){
					 showPromptMsg('red','${i18n.uah_hadZhuangc_label_des}');
					 return;
				}
				//卸货点不存在
				if(results.result[0].XIEHD==""||results.result[0].XIEHD==null){
					 showPromptMsg('red','${i18n.xiehd_noExist_label_des}')
					 return;
				}
				if(peizdh!=results.result[0].PEIZDH){ //UC号不在配载单下
					//验证UC号的客户是否在该配载单的路线组下
					var kehArr = results.kehList;
					var keh = results.result[0].KEH;
					if(!kehLxz(kehArr,keh)){//路线组下没有UC号客户
						showPromptMsg('red','${i18n.uah_peizd_lxz_label_des}:'+keh);
						return;
					}
					var zcQuer = prompt('${i18n.uah_lxz_exitKeh_label_des}','');
					if(zcQuer=='Y'){
						ualist.push(results.result[0].UCH);
						$('#grid_user_${pageId}').grid('addRow',results.result[0]);
						$('#ua input').val('');
					}else{
						showPromptMsg('red','${i18n.uah_lxz_exitKeh_cancel_label_des}')
						$('#ua input').val('');
						return;
					}
				}else{ //UC号在配载单下
					ualist.push(results.result[0].UCH);
					$('#grid_user_${pageId}').grid('addRow',results.result[0]);
					$('#ua input').val('');
				}
				
				showPromptMsg('blue',$.sdcui.resource.i18n['C_OperSuccess'])
			});
		}
		
		//验证UC卡号下的客户是否在配载单的路线组下
		function kehLxz(kehArr,keh){
			var hasKeh = false;
			for(var i=0;i<kehArr.length;i++){
				if(keh.indexOf(kehArr[i])>=0){
					hasKeh = true;
					break;
				}else{
					hasKeh = false;
					return;
				}
			}
			return hasKeh;
		}
		
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
							<td width="100">${i18n.peizdh}：</td>
							<td width="200"><div class="ui-field" id="peizdh"></div></td>
							<td width="100">${i18n.chep}：</td>
							<td width="200"><div class="ui-field" id="chep"></div></td>
							<td width="100">${i18n.usercenter }：</td>
							<td width="50"><div class="ui-field" id="usercenter"></div></td>
							<td width="100">${i18n.zhidr }：</td>
							<td width="50"><div class="ui-field" id="zhidr"></div></td>
						</tr>
					</tbody>
				</table>
			<div class="ui-field" id="yunssbm"></div>
			<div class="ui-field" id="gongsmc"></div>
			<div class="ui-field" id="jihcx"></div>
			<div class="ui-field" id="yunslx"></div>
			</div>
			
			<br></br>
			<div id="form_ua_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td width="100">${i18n.uah_label_des}：</td>
							<td><div class="ui-field" id="ua"></div></td> 
						</tr> 
					</tbody>
				</table>
			</div>		
			<br />
			<div id="grid_user_${pageId}"></div>
			<br/>
			<!-- 提示区域： -->
			<div id='prompt'>${i18n.prompt}</div>
		</div>
</body>
</t:html>