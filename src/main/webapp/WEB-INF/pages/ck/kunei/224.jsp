<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","212");%>
<t:html i18n="i18n.ck">
	<head>
	    <!-- V4_028 -->
		<title>${i18n.title_224}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
			onreload:true,
			fields:[
			        {fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh},
					{fieldType:'fieldText',property:'zickbh',limitedLength:'3',caption:'${i18n.zick}'},
					{fieldType:'fieldText',property:'lingjbh',limitedLength:'10',caption:'${i18n.lingjbh}'},
				    {fieldType:'fieldText',property:'rukkssj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.rukrq}'}, 
				    {fieldType:'fieldText',property:'rukjssj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.rukrq}'}, 
					{fieldType:'fieldText',property:'zhijrq1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}, 
                    {fieldType:'fieldText',property:'zhijrq2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
                    {fieldType:'fieldText',property:'huoch',maxLength:'5',caption:'${i18n.xiaohch}'},
                    {fieldType:'fieldText',property:'tangc',maxLength:'2',caption:'${i18n.tangc}'},
                    {fieldType:'fieldLabel',property:'lingjzsl'}
				]
		 	});
		 	
		 	$('#grid_user_${pageId}').grid({
					keyFields:['ush'],
					id:'grid_user_${pageId}',
					showCheckbox:false,
					src:'<%=request.getContextPath()%>/kunei/22401.do',
					cols:[
					{property:'zickbh',caption:'${i18n.zick}',width:'50'},
					{property:'elh',caption:'${i18n.elh}',width:'75'},
			  		{property:'ush',caption:'${i18n.ush}',width:'75'},
			  		{property:'lingjbh',caption:'${i18n.lingjbh}',width:'50'},
			  		{property:'lingjmc',caption:'${i18n.lingjmc}',width:'100'},
			  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:'50'},
			  		{property:'danw',caption:'${i18n.danw}',width:'50'},
			  		
			  		{property:'ucgs',caption:'${i18n.ucgs}',width:'50'},
			  		{property:'rukrq',caption:'${i18n.rukrq}',width:'150'},
			  		
			  		{property:'baozztxx',caption:'${i18n.zhuangt}',internation:true,width:'70'},
			  		{property:'zhuangtsx',caption:'${i18n.zhuangtsx}',internation:true,width:'50'},
			  		
			  		{property:'gongysdm',caption:'${i18n.gongysdm}',width:'70'},
			  		{property:'shangxsj',caption:'${i18n.shangxsj}',width:'70'},			  		
			  		{property:'huoch',caption:'${i18n.xiaohch}',width:'50'},			  		
			  		{property:'tangc',caption:'${i18n.tangc}',width:'50'}
			  		
				],
		 	buttons:[
		 	 //查询
			 {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
		 		//验证入库时间
				if ($("#rukkssj input").val()!="" && $("#rukjssj input").val()!=""){
					var iKaisl = parseInt($("#rukkssj input").val(),10);
					var iJiesl = parseInt($("#rukjssj input").val(),10);
					if (iKaisl > iJiesl){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.rukrq}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}else if (($("#rukkssj input").val() =="" && $("#rukjssj input").val()!="") || ($("#rukkssj input").val() !="" && $("#rukjssj input").val() ==""))
				{
					$('#grid_user_${pageId}').grid('clearRecords');
					showPromptMsg('red','${i18n.rukrq}'+$.sdcui.resource.i18n['C_fanwbf'])
					return;
				}
				//验证上线时间
				if ($("#zhijrq1 input").val()!="" && $("#zhijrq2 input").val()!=""){
					var dRukkssj=new Date(($('#zhijrq1 input').val()).replace(/-/g,"/"));
		            var dRukjssj=new Date(($('#zhijrq2 input').val()).replace(/-/g,"/"));
					if(dRukkssj > dRukjssj){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.shangxsj}'+$.sdcui.resource.i18n['C_fanwbf'])
						return;
					}
				}else if (($("#zhijrq1 input").val() =="" && $("#zhijrq2 input").val()!="") || ($("#zhijrq1 input").val() !="" && $("#zhijrq2 input").val() ==""))
				{
					$('#grid_user_${pageId}').grid('clearRecords');
					showPromptMsg('red','${i18n.shangxsj}'+$.sdcui.resource.i18n['C_fanwbf'])
					return;
				}
				//查询数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		//huxy_13535  若趟次为空，则默认传值为-1
		 		if($("#tangc input").val() =="")
		 		{
		 			params.splice(8,1,"tangc=-1");
		 		}
				$('#grid_user_${pageId}').grid("getCurrentPageParams", params);
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				var url = "<%=request.getContextPath()%>/kunei/22401.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				if (showPromptRequestMsg(results)==true){
								//加载返回数据												
						$('#grid_user_${pageId}').grid("parseResult",results);
						$('#lingjzsl span').html(results.result.parameter.lingjzsl);
					}
				});
				return false;
			}}
			//打印
			,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
				//调用打印服务	
				var params = $('#form_user_${pageId}').form('getFormParam');
				//huxy_13535  若趟次为空，则默认传值为-1
		 		if($("#tangc input").val() =="")
		 		{
		 			params.splice(8,1,"tangc=-1");
		 		}
				var url = "<%=request.getContextPath()%>/kunei/22402.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
		 				//打印成功
					 }
				});
				return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]' }
			]});
			$(document).keyboardsupport({});
		 });
		//加载时判断是否是回退
		$(document).ready(function(){
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
		<div id="title"></div>
		<br/>	
		<div id="form_user_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
					   <td>${i18n.cangkbh}:</td>
					   <td><div class="ui-field" id="cangkbh"></div></td>
					   <td>${i18n.zickbh}:</td>
						<td><div class="ui-field" id="zickbh"></div></td>
						<td>${i18n.lingjbh}:</td>
						<td><div class="ui-field" id="lingjbh"></div></td>
					</tr>
					<tr>
						<td>${i18n.rukrq}:</td>
						<td> <div class="ui-field" style="float:left" id="rukkssj"></div><div style="float:left" >至:</div><div style="float:left" class="ui-field"  id="rukjssj" ></div></td> 
					    <td>${i18n.shangxsj}:</td>
                        <td> <div class="ui-field" style="float:left" id="zhijrq1"></div><div style="float:left" >至:</div><div style="float:left" class="ui-field"  id="zhijrq2" ></div></td> 
					</tr>	
					<tr>
						<td>${i18n.xiaohch}:</td>
						<td><div class="ui-field" id="huoch"></div></td>
						<td>${i18n.tangc}:</td>
						<td><div class="ui-field" id="tangc"></div></td>
						<td>零件总数量:</td>
						<td><div class="ui-field" id="lingjzsl"></div></td>
					</tr>	
				</tbody>
			</table> 
		</div>
		<br/>
		<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>