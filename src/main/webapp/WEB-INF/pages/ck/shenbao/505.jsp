<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","505");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_505}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			 	$('#form_user_${pageId}').form({
			 	    onemoredemand:true,
			 	    onreload:true,
			 		fields:[
	                        {fieldType:'fieldText',property:'jizxh',caption:'${i18n.jizxh}',dataType:'text',maxLength:'11'},
	                        {fieldType:'fieldHidden',property:'jizxh1',caption:'${i18n.jizxh}'}
			 		]
			 	  });
 			    $('#grid_user_${pageId}').grid({
			 	    id:'grid_user_${pageId}',
					keyFields:['jizxh'],
					showNum:true,
					//showCheckbox : true, // 显示复选框
					//checkedOnlyOne : true, //是否单选
					enableCutPage : false,//是否允许分页
					src:'<%=request.getContextPath()%>/shenbao/50601.do',
					cols:[
							{property:'wulid',caption:'${i18n.wuld}'},
							{property:'daoxsj',caption:'${i18n.daoxsj}'},
							{property:'jizxh',caption:'${i18n.jizxh}'},
							{property:'kach',caption:'${i18n.kach}'},
							{property:'yundh',caption:'${i18n.yundh}'},
							{property:'sij',caption:'${i18n.sij}'},
							{property:'jiesr',caption:'${i18n.jiesr}'}
				        ],
				buttons:[
			   	 	{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	//参数校验
			   	 	 $('#grid_user_${pageId}').grid('clearRecords');
					 	if(!$('#form_user_${pageId}').form("validateParam")){
					 			return;
					 		}
				 		var params = $('#form_user_${pageId}').form("getFormParam");
				 		params.push("currentPage=1");
						//设置分页条件
						//$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						$('#grid_user_${pageId}').grid("load",params, function(results){
			 				$('#jizxh1 input').val(results.result.parameter.jizxh);
					      });
			    		return false;
				      }}
				     /*  ,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							$('#grid_user_${pageId}').grid('selected');
				    		return false;
				     	}} */
                       ,{name:'qux',caption:'${i18n.qux}[F6]',keyboard:'F6',action:function(){
                    	   var params = [];
                    	   params.push("jizxh="+$('#jizxh1 input').val());
                        	/* //判定是否有数据被选中 
        		    	    var params = $('#grid_user_${pageId}').grid('getSelectedAll');
        		    	   	if(params.length != 1 ){
        	 					$('#prompt span').css('color','red').text("${i18n.selecterror}");
        			  				return false;
        		  			}
        		    	    //去掉List[0];
	                        for(i=0;i<params.length;i++){
	                            params[i]=params[i].toString().replace("list[0].","");
	                        } */
	                        var url = "<%=request.getContextPath()%>/shenbao/50501.do";
	    			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	    			 			 if (showPromptRequestMsg(results)==true){
	    			 			 $('#grid_user_${pageId}').grid('parseResult',results);
	    			 			 $('#form_user_${pageId}').form("clearValue");
	    			 			 }
	    			 		});
	    			 		return false;
	    			 }}
				     ,{name:'back',caption:'${i18n.back}[F11]'}
				   	 ,{name:'return',caption:'${i18n.return}[F12]'}
				]
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
							<td>${i18n.jizxh}:</td>
							<td><div class="ui-field" id="jizxh"></div></td>
							<td><div class="ui-field" id="jizxh1"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>