<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","358");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_358}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/35801.do',
					cols:[
					  	{property:'yaohlh',caption:'${i18n.yaohlh}',width:'50'},
					  	{property:'bhsj',caption:'${i18n.beihsj}',width:'50'},
					  	{property:'zuiwsj',caption:'${i18n.shangxsj}',width:'50'},
						{property:'yaohlscsj',caption:'${i18n.yaohlscsj}',width:'50'}
					],
					buttons:[
                       //F1查询
                       {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                           //参数校验
                           if(!$('#form_user_${pageId}').form("validateParam")){
					            return;
		 		           }
                           $('#grid_user_${pageId}').grid('clearRecords')
					  	 var params = $('#form_user_${pageId}').form("getFormParam");	
						 params.push("currentPage=1");
					     var url = "<%=request.getContextPath()%>/beihuo/35801.do";
					     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
								//加载返回数据
								$('#grid_user_${pageId}').grid('parseResult',results);
								 //设置分页条件
					             $('#grid_user_${pageId}').grid("setQueryParams", params);
						    }
					         });
					    return false;
                       }},
						//备货提前
						{name:'btn_submit',caption:'${i18n.tij}[F2]',keyboard:'F2',action:function(){
							 //参数校验
					 		if(!$('#form_user_${pageId}').form("validateParam")){
									return;	
					 		}
					 		 if(!$('#flag').fieldText('validateNotNull')){
							 			return;
							 	} 		 
					 		 if('0' == $('#flag input').attr('realValue')){
						       if(!$('#bhsj1').fieldText('validateNotNull')){
							 			return;
							 	}
						     }else if('1' == $('#flag input').attr('realValue')){
						       if(!$('#pandzq').fieldText('validateNotNull')){
							 			return;
							 	}
						     }
					 		 //提交数据
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		var url = "<%=request.getContextPath()%>/beihuo/35802.do";
							 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 $('#grid_user_${pageId}').grid("parseResult",results);
									 $('#bhsj1 input').val('');
									 $('#pandzq input').val('');
								    }
								 });
							return false;
						}},
                       //重新加载
                       {name:'back',caption:'${i18n.back}[F11]'},
                       //F12返回
                       {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
			 		fields:[
	                    {fieldType:'fieldText',property:'bhsj',caption:'${i18n.zuiwbhsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:true},
	                    //11519
	                    {fieldType:'fieldText',property:'chanx',caption:'${i18n.chanx}',dataType:'letter_numeric',limitedLength:'5'},
			 		    {fieldType:'fieldSelect',property:'flag',internation:true,caption:'${i18n.beihfs}',onselect:'onchange()',src:'<%=request.getContextPath()%>/common/beihfs.do'},
			 		    {fieldType:'fieldText',property:'bhsj1',caption:'${i18n.zhidbhsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
			 		    {fieldType:'fieldText',property:'pandzq',caption:'${i18n.tiqbhsj}',dataType:'plusinteger',maxLength:'3'}
			 		]
			 	});
			 	
			 	$(document).keyboardsupport({});
			});
			 /**
		  *进入358页面后进行查询
		  */
		 $(document).ready(function(){
		   $('#flag input').val($.sdcui.resource.i18n['C_BHFS_0']);
		   $('#flag input').attr('realValue','0');
		   $('#pandzq input').hide();
         });
			 //备货方式修改
		   function onchange(){
			   if(!$('#flag').fieldSelect('validateNotNull')){
					return;
				  }else{
					    if('0' == $('#flag input').attr('realValue')){
					       $('#bhsj1 input').show();
					       $('#pandzq input').val('');
					       $('#pandzq input').hide();
					       $('#bhsj1 input').addClass('field-tabed').focus();
					    }else if('1' == $('#flag input').attr('realValue')){
					       $('#pandzq input').show();
					       $('#bhsj1 input').val('');
					       $('#bhsj1 input').hide();
					       $('#pandzq input').addClass('field-tabed').focus();
					    }
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
						    <td align="right">${i18n.zuiwbhsj}</td>
							<td><div class="ui-field" id="bhsj"></div></td>
							<!-- 11519 -->
							<td align="right">${i18n.chanx}</td>
							<td><div class="ui-field" id="chanx"></div></td>
							
							<td align="right">${i18n.beihfs}</td>
							<!--<td><div class="ui-field" id="flag"></div></td>
							<td align="right"><div class="ui-field" id="bhsj1"></div></td>
							<td align="right"><div class="ui-field" id="pandzq"></div></td>-->
							<td align="left" ><div style="float:left" class="ui-field" id="flag"></div><div style="float:left" ></div><div style="float:left" class="ui-field"  id="bhsj1" ></div>
							<div style="float:left" class="ui-field"  id="pandzq" ></div> </td>
							
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>