<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17801");%>
<!-- V4_022 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_17801 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		    var add = false;
			$(function(){
				$('#grid_user_${pageId}').grid({
				    keyFields:['uah'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/15101.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'uaxh',caption:'${i18n.uaxh}'},
						{property:'ucxh',caption:'${i18n.ucxh}'},
						{property:'ucgs',caption:'${i18n.ucgs}'}
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
					,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
				   	 	var params = $('#form_user_${pageId}').form("getFormParam");
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
						 params=params.concat(records);
						   var  url = "<%=request.getContextPath()%>/shouhuo/15104.do";
						   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									//加载返回数据
									$('#grid_user_${pageId}').grid('parseResult',results)
								 }
						 });
				    		return false;  	 
					}}
					,{name:'shouh',caption:'${i18n.shouh}[F8]',keyboard:'F8',action:function(){
						if(!$('#form_user_${pageId}').form("validateParam")){
								return;
							}
							
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 		
				   	 		//0010868 2015-9-2日修改
				   	 		var blh1=$('#blh span').html();
				   	 		params.push("blh1="+blh1);
				   	 		var uth = $('#uth input').val();
				   	 		
				   	 	    var  url = "<%=request.getContextPath()%>/shouhuo/17801.do";
						    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									//加载返回数据
									$('#grid_user_${pageId}').grid('parseResult',results);
									$('#grid_user_${pageId}').grid('clearRecords');
									$('#form_user_${pageId}').form('clearValue');
									var buttons = $(document).find(".ui-button");
			                        for(var i=0; i<buttons.length; i++){
			                         if($(buttons[i]).text().indexOf('[F11]')>0){
			                            $(buttons[i]).hide();
			                               var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes";  
					   						 window.open("<%=request.getContextPath()%>/shouhuo/dhsbdy.do?"+"&usercenter="+st_UserCenter+"&cangkbh="+st_Cangkbh+"&uth="+uth,"",strWindowType);		                           
			                         }
			                       }
								 }
						 });
				    		return false;  	 
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
					
				]});
				
			 	$('#form_user_${pageId}').form({
			 	    //onreload:true,
			 	    //<!-- huxy_11435 -->
					fields:[
						{fieldType:'fieldLabel',property:'blh',caption:'${i18n.blh}'},
						{fieldType:'fieldHidden',property:'uth',caption:'${i18n.uth}'},
						{fieldType:'fieldHidden',property:'xiehzt',caption:'${i18n.xiehzt}'}
					]
				}); 	
		 	
			
			  $(document).keyboardsupport({});
		});
		
		  $(document).ready(function(){
				//加载返回数据
				if ('${result}' != ''){
						var result = JSON.parse('${result}');
						$('#grid_user_${pageId}').grid('parseResult',result.result);
						var params=[];
			    		params.push("uth="+result.result.parameter.uth);
			    		params.push("blh="+result.result.parameter.blh);
			    		params.push("xiehzt="+result.result.parameter.xiehzt);
			    		$('#xiehzt input').val(result.result.parameter.xiehzt);
			    		// huxy_11435 
			    		$('#blh span').html(result.result.parameter.blh);
			    		$('#uth input').val(result.result.parameter.uth);
			    		//设置分页条件
					    $('#grid_user_${pageId}').grid("setQueryParams", params);
					    
					    //0010868
						$("#blh span").attr('disabled',true);
				     }
			});   
		</script>
		
	</head>
	<body>
	<div style="padding:20px;">
		<div id="title"></div>
        <input id="serachKey" name="serachKey" type="Hidden"></input>
        <form id="putform" method="post" name="putform">
		<input id="putvalue" name="putvalue" type="Hidden"></input>
	    </form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
						<!-- huxy_11435 -->
							<td class="field-label">${i18n.blh }:&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td class="field-container"><div class="ui-field" id="blh"></div></td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td><div class="ui-field" id="uth"></div></td>
						</tr>
					</tbody>
				</table>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>