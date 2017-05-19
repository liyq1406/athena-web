<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","161");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_161}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var F2Enable=false;
		var F6Enable=false;
			$(function(){
			     //隐藏grid_user
			    //$('.hidden-item').hide();
			    //隐藏grid_baoz
			    $('.baoz_hidden-item').hide();
			    //form  
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'blh',caption:'${i18n.bldh}',notNull:true,dataType:'text',maxLength:'10'},
						{fieldType:'fieldText',property:'chengysdm' ,biaos:'enter',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldLabel',property:'chengysmc',caption:'${i18n.chengysmc}'},
						{fieldType:'fieldLabel',property:'xiehzt',caption:'${i18n.xiehd}'},
						{fieldType:'fieldHidden',property:'uth',}
					]
				}); 
                // EL_grid
               $('#grid_user_${pageId}').grid({
					keyFields:['gongysdm','lingjbh','elh','lingjzsl','uth','blh','pich','ulh','suifgongysdm','suifljh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true,
					src:'<%=request.getContextPath()%>/shouhuo/16107.do',
					editSubmitSrc:'<%=request.getContextPath()%>/shouhuo/16109.do',   //行编辑提交的地址
					cols:[
						{property:'gongysdm',caption:'${i18n.gongysdm}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'10',editor:'fieldText',afterenter:'refresh'},
						{property:'lingjbh',caption:'${i18n.lingjbh}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'10',editor:'fieldText',afterenter:'refresh'},
						{property:'lingjzsl',caption:'${i18n.lingjzs}',editor:'fieldText',isPlus:true,dataType:'dbnumber'},
						{property:'danw',caption:'${i18n.danw}'}
				]
				
				});
                //UA_grid 
               $('#grid_baoz_${pageId}').grid({
					keyFields:['uth','uah','gongysdm','lingjbh','lingjsl','uaxh','ucxh','ucgs','yaohlh','elh'],
					id:'grid_baoz_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/16111.do',
					editSubmitSrc:'<%=request.getContextPath()%>/shouhuo/16110.do',   //行编辑提交的地址
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}',editor:'fieldText'},
						{property:'uaxh',caption:'${i18n.uaxh}',editor:'fieldText'},
						{property:'ucxh',caption:'${i18n.ucxh}',editor:'fieldText'},
						{property:'ucgs',caption:'${i18n.ucgs}',editor:'fieldText'}
				     ]
				});
				//查询EL F1
			 	$('#btn_search').bind('click',function(){
			 	     //$('#form_user_$(pageId)').form('clearValue');
			 	     $('#grid_user_${pageId}').grid('clearRecords');
			 	     $('#grid_ua_${pageId}').grid('clearRecords');
                    //参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
 			              return;
	 		          }
	 		         //显示grid_user  
	 		        $('.baoz_hidden-item').hide();
			 	 	$('.hidden-item').show();
			 	 	$('#btn_cxbz').show();
					var params = $('#form_user_${pageId}').form("getFormParam");
					params.push("currentPage=1");
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					var url = "<%=request.getContextPath()%>/shouhuo/16107.do";
				 	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
					 		    //加载返回数据
							    $('#grid_user_${pageId}').grid('parseResult',results);
								$("#chengysdm input").val(results.result.parameter.chengysdm);
							    $("#chengysmc span").html(results.result.parameter.chengysmc);
							    $("#xiehzt span").html(results.result.parameter.xiehzt);
								$("#uth input").val(results.result.parameter.uth);
	
								F2Enable=true;
								F6Enable=true;
							}
						});
			    	return false;
			 	});
                 //查询包装 F2
				$('#btn_cxbz').bind('click',function(){
					if (F2Enable==false){ 
				    	return;
				    }
					//获取form中的blh信息
					var param = $("#blh input").val();
					//查询form 中 uth的 信息
				 	var uth = $("#uth input").val();
				 	//判定是否有数据被选中 
		    	    var baoz = $('#grid_user_${pageId}').grid('getSelectedAll');
		    	   	if(baoz.length >10 || baoz.length == 0){
	 					$('#prompt span').css('color','red').text("${i18n.selecterror}");
			  				return false;
		  			}
		    		baoz.push("blh="+$("#blh input").val());
		    		baoz.push("uth="+$("#uth input").val())
	    			baoz.push("currentPage=1");
					//设置分页条件
					$('#grid_baoz_${pageId}').grid("setQueryParams", baoz);
					
				    var url = "<%=request.getContextPath()%>/shouhuo/16111.do";
			 		$('#form_user_${pageId}').form("submitUrl", baoz, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
				 		 //加载返回数据
		    		     $('#grid_baoz_${pageId}').grid('parseResult',results);
				    		$('.hidden-item').hide();
							$('.baoz_hidden-item').show();
				    		$('#btn_cxbz').hide();
				    		$('#btn_search').hide();
				    		//$('#btn_back').hide();
				    		F6Enable=true;
		    		     }
	    		     });
		    		return false;
		    	 });
		    	//选中	
		    	$('#btn_checked').bind('click',function(){
		    	   if($('#grid_user_${pageId}').is(':hidden')){
	    	          $('#grid_baoz_${pageId}').grid('selected');
	    	      	}else if($('#grid_baoz_${pageId}').is(':hidden')){
			   	 		$('#grid_user_${pageId}').grid('selected');
			   	    }
	    		    return false;
				});
				//全选	
		    	$('#btn_selectall').bind('click',function(){
		    	   if($('#grid_user_${pageId}').is(':hidden')){
		    	          $('#grid_baoz_${pageId}').grid('selectedAll');
		    	      }else if($('#grid_baoz_${pageId}').is(':hidden')){
				   	 		$('#grid_user_${pageId}').grid('selectedAll');
				   	    }
			    		    return false;
					});
		    	 //返回
		    	 $('#btn_back').bind('click',function(){
		    	   if($('#grid_user_${pageId}').is(':hidden')){
		    	          $('#grid_baoz_${pageId}').hide();
		    	          var params=$('#grid_user_${pageId}').grid('getQueryParams')
		    	          $('#grid_user_${pageId}').grid('load',params);
		    	          $('#grid_user_${pageId}').show();
		    	          $('#btn_cxbz').show();
		    	          $('#btn_search').show();
		    	         // $('#btn_back').show();
		    	      }else {
				   	 		history.back();
				   	    }
			    		    return false;
				});
			 	//删除 F6
			 	$('#btn_delete').bind('click',function(){
			 	if(F6Enable==false){false;}
				if($('#grid_user_${pageId}').is(':hidden')){
				    var params = $('#grid_baoz_${pageId}').grid('getSelectedAll');
			    	if(params.length == 0){
							showMsg("${i18n.selectoneerror}");
							return false;
						}
					  var url = "<%=request.getContextPath()%>/shouhuo/16112.do";
				 	  $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
					 		        //加载返回数据
									$('#grid_baoz_${pageId}').grid('parseResult',results);
					           }
					  });
				}else if($('#grid_baoz_${pageId}').is(':hidden')){
				    var params = $('#grid_user_${pageId}').grid('getSelectedAll');
					if(params.length == 0){
						showMsg("${i18n.selectoneerror}");
						return false;
					  }
					var url = "<%=request.getContextPath()%>/shouhuo/16112.do";
				 	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		if (showPromptRequestMsg(results)==true){
					 		    //加载返回数据
								$('#grid_user_${pageId}').grid('parseResult',results);
					        }
					   });
		        }  
		    		return false;
			});
     
	

		 //点击承运商回车事件
		 $('#chengysdm').bind('enter',function(event){
		        if($("#uth input").val() == '' || $("#chengysdm input").val()=='' ||$("#blh input").val()=='' ){
			 		showMsg('${i18n.cysxgyw}');
			 		return false;
			 	  }
		        var params=[]
			 	params.push("blh="+$("#blh input").val());
			 	params.push("uth="+$("#uth input").val());
			 	params.push("chengysdm="+$("#chengysdm input").val());
 				var url = "<%=request.getContextPath()%>/shouhuo/16108.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						$("#chengysdm input").val(results.result.parameter.chengysdm);
				        $("#chengysmc span").html(results.result.parameter.chengysmc);       
			         }	
				});
				return  false;
		 	});
		 	
		 /**
		  *进入161页面后进行查询
		  */
		 $(document).ready(function(){
		    var params =[] 	
		    params.push("blh="+$('#blh input').val());	
		    params.push("currentPage=1");
	        var url = "<%=request.getContextPath()%>/shouhuo/16107.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 	if (showPromptRequestMsg(results)==true){
			 		    //加载返回数据
					    $('#grid_user_${pageId}').grid('parseResult',results);
						$("#chengysdm input").val(results.result.parameter.chengysdm);
					    $("#chengysmc span").html(results.result.parameter.chengysmc);
					    $("#xiehzt span").html(results.result.parameter.xiehzt);
						$("#uth input").val(results.result.parameter.uth);
                        $("#blh input").val(results.result.parameter.blh);
                        params.push("blh="+$('#blh input').val());
                        //设置分页条件
                        $('#grid_user_${pageId}').grid("setQueryParams", params);
						F2Enable=true;
						F6Enable=true;
					}
			 msgClear();
			});
			return false;
	      });
		 	
		 	
	 	$(document).keyboardsupport({});
	});
	
	function refresh(results){
			$('#grid_user_${pageId}').grid('parseResult',results);
		}
</script>
	</head>
	<body>
		<div style="padding:20px;">
		<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td>${i18n.bldh }</td>
							<td><div class="ui-field" id="blh" ></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td><div class="ui-field" id="chengysmc"></div></td>
							<td><div class="ui-field" id="uth"></div></td>
						</tr>
						<tr>
							<td>${i18n.xiehd}</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
					        <td colspan="4">
					        	<div align="right">
							        <span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
									<span id="btn_cxbz" class="ui-button">${i18n.chaxbz}[F2]</span>
									<span id="btn_checked" class="ui-button">${i18n.checked}[F4]</span>
									<span id="btn_selectall" class="ui-button">${i18n.selectall}[F5]</span>
									<span id="btn_delete" class="ui-button">${i18n.delete}[F6]</span>
									<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
									<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
								</div>
							<td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}" class='hidden-item'></div>
			<div id="grid_baoz_${pageId}" class='baoz_hidden-item'></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>