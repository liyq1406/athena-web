<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","323");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_323}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
	        var paramsQuery;
	        var currentPage = 1;
	        //var par=[];
	        
			$(function(){
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
				$('#grid_user_${pageId}').grid({
					keyFields:['uch','yush','shangxxh','shifsl'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/beihuo/31601.do',
					//editSubmitSrc:'<%=request.getContextPath()%>/beihuo/31602.do',
					showCheckbox:true,
					showCheckboxRenderer:function(record,tdValue,rowIndex,colIndex){
						var checked = '';
						if(parseInt(record.shifsl) > 0) {
							checked = 'checked="checked"';
						} 
						return '<input id=\"' + (rowIndex +'_box') + '\" type="checkbox" ' + checked + ' onclick="save(this)"></input>';					
					},					
					//params:par,
					cols:[
						{property:'uch',caption:'${i18n.uch}'}, 
						{property:'lingjbh',caption:'${i18n.lingjh}'},
				  		{property:'yush',caption:'${i18n.ush}'},
				  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
				  		{property:'shangxxh',caption:'${i18n.shangxbz}'},
				  		{property:'shifsl',caption:'${i18n.shifsl}'},
				  		{property:'danw',caption:'${i18n.lingjdw}'}
				  		//{property:'shifdj',caption:'${i18n.yuanbzdj}',editor:'fieldText',defValue:'N',dataType:'yesno',notNull:true,checkchange:'ush'}
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
		 			 		params.push('flag=2');
					 		$('#form_user_${pageId}').form('submit',params,function(results){
							  if (showPromptRequestMsg(results)==true){
							     if(results.result.response !="C_1403"){
						             $('#grid_user_${pageId}').grid('clearRecords');
						 			 $('#beihdh input').val("");
				                   }
				                 }
					 		});
						}},
						{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							 check();
					    }},
					 
					    
						{name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
			 	
			 	$('#btn_check').bind('click',function(){
						     check();
					    }),
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
                params.push('flag=2');
                $('#grid_user_${pageId}').grid("setQueryParams", params);
               var url = "<%=request.getContextPath()%>/beihuo/31601.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					  if (showPromptRequestMsg(results)==true){
					       	$('#keh span').html(results.result.parameter.keh);
					       	$('#gonghmsxx span').html($.sdcui.resource.i18n[results.result.parameter.gonghmsxx]);
					       	$('#grid_user_${pageId}').grid('parseResult',results);
					       	$('#grid_user_${pageId}').grid('focus');
					  } else {
					  		$('#grid_user_${pageId}').grid('clearRecords');
					  }
				 });
	    		return false;
			}
			
	    function  check(){
	        $('#grid_user_${pageId}').grid('selected');
	        $('#btn_checked').hide();
		    var params = [];
		    params.push("flag=2");
		    params.push("uch="+$('#grid_user_${pageId}').grid('getSelected').find('.uch').html());  
		    params.push("yush="+$('#grid_user_${pageId}').grid('getSelected').find('.yush').html());  
			params.push("shifsl="+$('#grid_user_${pageId}').grid('getSelected').find('.shifsl').html()); 
			params.push("beihdh="+$('#beihdh input').val())
			var num=parseInt($('#grid_user_${pageId}').grid('getSelected').find('.num').html())-1;
			 var url = "<%=request.getContextPath()%>/beihuo/31602.do";
		         $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			           if (showPromptRequestMsg(results)==true){
			               	//$('#grid_user_${pageId}').grid('getSelected').find('.shifsl').html(results.result.parameter.shifsl);
			                $($('#grid_user_${pageId}').find('.num')[num]).parent().find('.shifsl').html(results.result.parameter.shifsl);
			               }else{
			               	$('#grid_user_${pageId}').grid('selected');
			               }
			               $('#btn_checked').show();
				})
	    		return false;
	    }
	    function save(checkbox){
	    	if ($(checkbox).attr('checked') != '') {
	    		$(checkbox).removeAttr('checked'); 
	    	} else {
	    		$(checkbox).attr('checked','checked'); 
	    	}
	    	
	    	
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
							<td>${i18n.chuklx}： CD/MD</td>
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