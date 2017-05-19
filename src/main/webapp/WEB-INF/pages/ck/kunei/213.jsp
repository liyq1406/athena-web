<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","213");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_213}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var lingjzsl;
		//V4_028
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[		        
				{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh},
				{fieldType:'fieldText',property:'zickbh',dataType:'mask',maskLength:'3',caption:'${i18n.zick}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false}, 
				{fieldType:'fieldText',property:'mian',dataType:'mask',maskLength:'2',caption:'${i18n.mian}',notNull:false}, 	
				{fieldType:'fieldText',property:'kaisl',dataType:'fixnumber',limitedLength:'2',caption:'${i18n.lie}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'jiesl',dataType:'fixnumber',limitedLength:'2',caption:'${i18n.lie}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'kaisc',dataType:'letter_numeric',limitedLength:'2',caption:'${i18n.ceng}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'jiesc',dataType:'letter_numeric',limitedLength:'2',caption:'${i18n.ceng}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'rukkssj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.rukrq}'}, 
				{fieldType:'fieldText',property:'rukjssj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.rukrq}'}, 
				{fieldType:'fieldText',property:'xianskkw',dataType:'yesno',limitedLength:'1',caption:'${i18n.xianskkw}',notNull:false,value:'N'},		 		        
				{fieldType:'fieldText',property:'ancpx',dataType:'yesno',limitedLength:'1',caption:'${i18n.ancpx}',notNull:false,value:'N'},
				{fieldType:'fieldSelect',property:'baozzt',caption:'${i18n.zhuangt}',notNull:false,internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/baozzt.do'},
				{fieldType:'fieldSelect',property:'zhuangtsx',caption:'${i18n.zhuangtsx}',notNull:false,internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/zhuangtsx.do'},	 
				{fieldType:'fieldSelect',property:'ruklx',caption:'${i18n.ruklx}',notNull:false,internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/ruklx.do'},	 
				//huxy_11460
				{fieldType:'fieldLabel',property:'lingjzsl'},       
		 		]
		 	});
			$('#grid_user_${pageId}').grid({
				keyFields:['kuwbh','ush'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				src:'<%=request.getContextPath()%>/kunei/21301.do',
				cols:[
				{property:'elh',caption:'${i18n.elh}'},
				{property:'zickbh',caption:'${i18n.zick}',width:'50'},
				{property:'kuwbh',caption:'${i18n.cangkdz}',width:'50'},
		  		{property:'ush',caption:'${i18n.ush}',width:'50'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}',width:'50'},
		  		{property:'lingjmc',caption:'${i18n.lingjmc}',width:'50'},
		  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:'50'},
		  		{property:'danw',caption:'${i18n.lingjdw}',width:'50'},
		  		{property:'ucgs',caption:'${i18n.ucgs}',width:'50'},
		  		{property:'rukrq',caption:'${i18n.rukrq}',width:'50'},
		  		{property:'baozztxx',caption:'${i18n.zhuangt}',internation:true,width:'50'},
		  		{property:'zhuangtsx',caption:'${i18n.zhuangtsx}',internation:true,width:'50'},
		  		{property:'ruklx',caption:'${i18n.ruklx}',internation:true,width:'50'},
		  		{property:'gongysdm',caption:'${i18n.gongysdm}',width:'50'}
			],
		 	buttons:[
		 	//查询
			{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
		 		//验证开始面必须小于结束面
				if ($("#kaisl input").val()!="" && $("#jiesl input").val()!=""){
					var iKaisl = parseInt($("#kaisl input").val(),10);
					var iJiesl = parseInt($("#jiesl input").val(),10);
					if (iKaisl > iJiesl){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.lie}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}
				//验证开始层必须小于结束层
				if ($("#kaisc input").val()!="" && $("#jiesc input").val()!=""){
					var iKaisc = parseInt($("#kaisc input").val(),10);
					var iJiesc = parseInt($("#jiesc input").val(),10);
					if (iKaisc > iJiesc){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.ceng}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}
				//验证开始入库日期必须小于结束入库日期 V4_028
				if ($("#rukkssj input").val()!="" && $("#rukjssj input").val()!=""){
					var dRukkssj=new Date(($('#rukkssj input').val()).replace(/-/g,"/"));
		            var dRukjssj=new Date(($('#rukjssj input').val()).replace(/-/g,"/"));
					if(dRukkssj > dRukjssj){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.rukrq}'+$.sdcui.resource.i18n['C_fanwbf'])
						return;
					}
				}else if (($("#rukkssj input").val() =="" && $("#rukjssj input").val()!="") || ($("#rukkssj input").val() !="" && $("#rukjssj input").val() ==""))
				{
					$('#grid_user_${pageId}').grid('clearRecords');
					showPromptMsg('red','${i18n.rukrq}'+$.sdcui.resource.i18n['C_fanwbf'])
					return;
				}
				//查询数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		//params.push("currentPage=1");
		 		//huxy_11460
				$('#grid_user_${pageId}').grid("getCurrentPageParams", params);
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				var url = "<%=request.getContextPath()%>/kunei/21301.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				if (showPromptRequestMsg(results)==true){
								//加载返回数据												
						$('#grid_user_${pageId}').grid("parseResult",results);
						lingjzsl = results.result.parameter.lingjzsl;
						$('#lingjzsl').html(lingjzsl);
					}
				});
				//$('#grid_user_${pageId}').grid("getCurrentPageParams", params);
				//$('#grid_user_${pageId}').grid("setQueryParams", params);
				//$('#grid_user_${pageId}').grid("load",params);

				return false;
			}}
			//打印
			,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
		 		//验证开始面必须小于结束面
				if ($("#kaisl input").val()!="" && $("#jiesl input").val()!=""){
					var iKaisl = parseInt($("#kaisl input").val(),10);
					var iJiesl = parseInt($("#jiesl input").val(),10);
					if (iKaisl > iJiesl){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.lie}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}
				//验证开始层必须小于结束层
				if ($("#kaisc input").val()!="" && $("#jiesc input").val()!=""){
					var iKaisc = parseInt($("#kaisc input").val(),10);
					var iJiesc = parseInt($("#jiesc input").val(),10);
					if (iKaisc > iJiesc){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.ceng}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}
				//验证开始入库日期必须小于结束入库日期 V4_028
				if ($("#rukkssj input").val()!="" && $("#rukjssj input").val()!=""){
					var dRukkssj=new Date(($('#rukkssj input').val()).replace(/-/g,"/"));
		            var dRukjssj=new Date(($('#rukjssj input').val()).replace(/-/g,"/"));
					if(dRukkssj > dRukjssj){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.rukrq}'+$.sdcui.resource.i18n['C_fanwbf'])
						return;
					}
				}
				//调用打印服务	
				var params = $('#form_user_${pageId}').form('getFormParam');
				params.pop("lingjzsl");
				params.push("lingjzsl="+lingjzsl);
				var url = "<%=request.getContextPath()%>/kunei/21302.do";
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
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.mian}:</td>
							<td><div class="ui-field" id="mian"></div></td>
							<td>${i18n.lie}:</td>
							<td><div class="ui-field" id="kaisl"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="jiesl"></div></td>
						</tr>
						<tr>
							<td>${i18n.ceng}:</td>
							<td><div class="ui-field" id="kaisc"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="jiesc"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.zhuangt}:</td>
							<td><div class="ui-field" id="baozzt"></div></td>
							<td>${i18n.ruklx}:</td>
							<td><div class="ui-field" id="ruklx"></div></td>
						</tr>
						<tr>
							<td>${i18n.zhuangtsx}:</td>
							<td><div class="ui-field" id="zhuangtsx"></div></td>
							<td>${i18n.rukrq}:</td>
							<td><div class="ui-field" id="rukkssj"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="rukjssj"></div></td>
							<td>${i18n.xianskkw}:</td>
							<td><div class="ui-field" id="xianskkw"></div></td>
							<td>${i18n.ancpx}:</td>
							<td><div class="ui-field" id="ancpx"></div></td>
						</tr>
						<tr>
							<td>${i18n.lingjzsl}:</td>
							<td><div class="ui-field" id="lingjzsl"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>