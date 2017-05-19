<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","107");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_107 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['jusgzdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/10701.do',
					cols:[
						{property:'jusgzdh',caption:'${i18n.genzdh}',width:50},
				  		{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
					 	{property:'jusljs',caption:'${i18n.lingjsl}',width:40},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
						{property:'gongysmc',caption:'${i18n.gongysmc}',width:50},
						{property:'xiehd',caption:'${i18n.xiehzt}',width:40},
						{property:'uabzlx',caption:'${i18n.uabzlx}',width:40},
						{property:'ucbzlx',caption:'${i18n.ucbzlx}',width:40},
						{property:'ucgs',caption:'${i18n.ucgs}',width:40},
						{property:'blh',caption:'${i18n.blh}',width:50},
						{property:'jusyy',caption:'${i18n.jusyy}',width:50},
						{property:'caozy',caption:'${i18n.caozy}',width:50},
						{property:'danw',caption:'${i18n.lingjdw}',width:50}
				   ],
				buttons:[
					{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}}
					,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}}
				]});
				
				$('#form_user_${pageId}_select').form({
					onreload:true,
					fields:[
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.chengysdm}'},
						{fieldType:'fieldSelect' , property:'shiftb',caption:'${i18n.shiftb}',notNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
						{fieldType:'fieldLabel',property:'jusdh'},
						{fieldType:'fieldLabel',property:'chengysmc'}
					]
				}); 
				
				$('#form_user_${pageId}_print').form({
					url:'ck/jusgzdXz.do',
					fields:[
						{fieldType:'fieldText',property:'kach',maxLength:'11',notNull:true,caption:'${i18n.tch}'},
						{fieldType:'fieldText',property:'jiesr',maxLength:'10',notNull:true,caption:'${i18n.jiesr}'},
						{fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'10',notNull:true,caption:'${i18n.caozy}',value:'${userName}'}
					]
				}); 
				
				$('#btn_search').bind('click',function() {
					if(!$('#form_user_${pageId}_select').form("validateParam")){
						return;
					  }
			 		var params = $('#form_user_${pageId}_select').form("getFormParam");
			 		params.push("currentPage=1");
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
			 		$('#grid_user_${pageId}').grid("load", params, function(results){
			 			if (showPromptRequestMsg(results)==true){
				 				$("#chengysmc span").html(results.result.parameter.chengysmc);
				 				
				 			}
			 		});
			 		return false;
			 	});
				
				$('#btn_scjsd').bind('click',function() {
					if(!$('#form_user_${pageId}_select').form("validateParam") || !$('#form_user_${pageId}_print').form("validateParam")){
						return false;
					}
					var params = $('#grid_user_${pageId}').grid('getSelectedAll');  //获取拒收跟踪单号
					if(params.length<1){
						showPromptMsg('red','${i18n.selectoneerror}');
						return  ;
					}
			 		var param1 = $('#form_user_${pageId}_select').form("getFormParam"); //获取承运商代码
			 		var param2 = $('#form_user_${pageId}_print').form("getFormParam"); //获取拒收单输入信息
			 		params = params.concat(param1);
			 		params = params.concat(param2);
			 	    var url = "<%=request.getContextPath()%>/shouhuo/10702.do";
			 		$('#form_user_${pageId}_select').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							 $("#jusdh span").html(results.result.parameter.jusdh);
							//$("#chengysmc span").html(results.result.parameter.chengysmc);
							 $('#grid_user_${pageId}').grid('parseResult',results);
							}
			 		 });
			 		 return false;
		 		 });
			 	
				
				$('#btn_day').bind('click',function(){
				    if(!$('#form_user_${pageId}_select').form("validateParam") || !$('#form_user_${pageId}_print').form("validateParam")){
						return false;
					}
					var records = $('#grid_user_${pageId}').grid('getSelectedAll');  //获取拒收跟踪单号
			 		
					if(records.length<1){
						showPromptMsg('red','${i18n.selectoneerror}');
						return  ;
					  }

			 		var param1 = $('#form_user_${pageId}_select').form("getFormParam"); //获取承运商代码
			 		var param2 = $('#form_user_${pageId}_print').form("getFormParam"); //获取拒收单输入信息
			 		records = records.concat(param1);
			 		records = records.concat(param2);
			 		 var url = "<%=request.getContextPath()%>/shouhuo/10703.do";
			 		$('#form_user_${pageId}_select').form("submitUrl", records, url, function(results){
				 		if (showPromptRequestMsg(results)==true){
								$('#grid_user_${pageId}').grid('parseResult',results);
						   }
			 		 });
			 	 return false;
			});
		
			$(document).keyboardsupport({});
	      });
		</script>
		
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}_select" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.chengysdm }</td>
							<td ><div  style="float:left" class="ui-field" id="chengysdm"></div><div  style="float:left" class="ui-field" id="chengysmc"></div></td>
							<td>${i18n.shiftb}</td>
							<td><div class="ui-field" id="shiftb"></div>
						</tr>
						<tr>
							<td>${i18n.jusdh}</td>
							<td><div class="ui-field" id="jusdh"></div></td>
							<td align="right" colspan="2">
								<div style="padding:20px;text-align: right">
									<span id="btn_search" class="ui-button">${i18n.search }[F1]</span>
									<span id="btn_back" class="ui-button">${i18n.back }[F11]</span>
									<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id="form_user_${pageId}_print" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.tch }</td>
							<td><div class="ui-field" id="kach"></div></td>
							<td>${i18n.jiesr }</td>
							<td><div class="ui-field" id="jiesr"></div></td>
							<td>${i18n.yewczy }</td>
							<td><div class="ui-field" id="caozy"></div></td>
						</tr>
						<tr>
							<td align="center" colspan="6">
							   <div style="padding:20px;text-align: right">
									<span id="btn_scjsd" class="ui-button">${i18n.shengcjsd }[F7]</span>
									<span id="btn_day" class="ui-button">${i18n.dayjsd }[F8]</span>
			                   </div>
			               </td>
					 </tr>
					</tbody>
				</table>
			</div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>