<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","316");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_316}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
	        var paramsQuery;
	        var currentPage = 1;
	        var par=[];
			$(function(){
				
				girdload();
				
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/31603.do',
			 		fields:[
						{fieldType:'fieldText',biaos:'enter',property:'beihdh',dataType:'beihdh',notNull:true,caption:'${i18n.beihdh}'},
						{fieldType:'fieldLabel',property:'gonghmsxx',caption:'${i18n.gonghms}'},
						{fieldType:'fieldLabel',property:'keh',caption:'${i18n.keh}'},
						{fieldType:'fieldText',biaos:'enter',property:'beihybh',dataType:'beihybh',value:st_UserName}
					]
				}); 
			 	
			 	//按备货单号查询
 			 	$('#beihdh').bind('enter',function(){
 			 		search();
 			 	});
			 	
 			 	//按备货员编号查询
			 	$('#beihybh').bind('enter',function(){
			 		search();
			 	});
			 	$(document).keyboardsupport({});
			});
			function girdload(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uch','ush','shangxxh','shifsl','shifdj'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/beihuo/31601.do',
					editSubmitSrc:'<%=request.getContextPath()%>/beihuo/31602.do',
					params:par,
					cols:[
						{property:'uch',caption:'${i18n.uch}'}, 
						{property:'lingjbh',caption:'${i18n.lingjh}'},
				  		{property:'ush',caption:'${i18n.ush}',dataType:'ushls',notNull:true,editor:'fieldText',bind:'yush',biaos:'notsubmit'},
				  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
				  		{property:'shangxxh',caption:'${i18n.shangxbz}',editor:'fieldText',notNull:true,dataType:'letter_numeric',limitedLength:'5',biaos:'notsubmit'},
				  		{property:'shifsl',caption:'${i18n.shifsl}',editor:'fieldText',notNull:true,dataType:'dbnumber',biaos:'notsubmit'},
				  		{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'shifdj',caption:'${i18n.yuanbzdj}',editor:'fieldText',defValue:'N',dataType:'yesno',notNull:true,checkchange:'ush'}
					],
					buttons:[
						//F3确认
				   	 	{name:'querck',caption:'${i18n.querck}[F3]',keyboard:'F3',action:function(){
					 		//验证参数
		 			 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			 			return;
		 			 		}
					 		var params = [];
		 			 		var beihdh = $('#beihdh input').val();
		 			 		var beihybh = $('#beihybh input').val();
		 			 		params.push('beihdh=' + beihdh);
		 			 		if(beihybh){
		 			 			params.push('beihybh=' + beihybh);
		 			 		}else{
		 			 			params.push('beihybh=${userName}');
		 			 		}
		 			 		params.push('cangkbh=' + st_Cangkbh);
					 		$('#form_user_${pageId}').form('submit',params,function(results){
							  if (showPromptRequestMsg(results)==true){
							     if(results.result.response !="C_1403"){
						             $('#grid_user_${pageId}').grid('clearRecords');
						 			 $('#beihdh input').val("");
				                   }
				                 }
					 		});
						}},
						{name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
			}
			function search(){
                //验证参数
                if(!$('#form_user_${pageId}').form("validateParam")){
                	$('#grid_user_${pageId}').grid('clearRecords');
                    return;
                }
                var params = [];
                var beihdh = $('#beihdh input').val();
                var beihybh = $('#beihybh input').val();
                params.push('beihdh=' + beihdh);
                if(beihybh){
                    params.push('beihybh=' + beihybh);
                }else{
                    params.push('beihybh=${userName}');
                }
                params.push('cangkbh=' + st_Cangkbh);
                paramsQuery = jQuery.extend(true,[],params);
                currentPage = 1;
                params.push('currentPage=1');
                $('#grid_user_${pageId}').grid("setQueryParams", params);
               var url = "<%=request.getContextPath()%>/beihuo/31601.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					  if (showPromptRequestMsg(results)==true){
					        $('#keh span').html(results.result.parameter.keh);
					        $('#gonghmsxx span').html($.sdcui.resource.i18n[results.result.parameter.gonghmsxx]);
					        $('#grid_user_${pageId}').grid('parseResult',results);
					        par=[];
				 			par.push("beihdh="+$('#beihdh input').val());
				 			girdload();
					   } else {
					   		$('#keh span').html("");
					        $('#gonghmsxx span').html("");
					   		$('#grid_user_${pageId}').grid('clearRecords');
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
					<tbody>
						<tr>
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.chuklx}： B</td>
						</tr>
						<tr>
							<td>${i18n.gonghms}:</td>
							<td><div class="ui-field" id="gonghmsxx"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>