<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","511");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_511}</title>
		<jsp:include page="../../common/js.jsp" />
		<jsp:include page="../../common/print.jsp" />
		<script type="text/javascript">
		//huxy_11956
			$(function(){
			$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/shenbao/51101.do',
					keyFields:['zhuangt'],
					cols:[
						{property:'jizxh',caption:'${i18n.jizxh}'},
						{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true},
						{property:'daoxsj',caption:'${i18n.shengbrq}'},
						{property:'wulid',caption:'${i18n.wuld}'}
			        ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	//参数校验
			   	 	 $('#grid_user_${pageId}').grid('clearRecords');
					 	if(!$('#form_user_${pageId}').form("validateParam")){
					 			return;
					 		}
					   if($('#shiftb input').val() == 'Y'){
					   		if($('#qissj input').val() == '' || $('#zhongzsj input').val() == ''){
					   			showPromptMsg('red','${i18n.qiszzsj_error}');
                                return false;
					   		}
					   }
					   var starttime=new Date(($('#qissj input').val()).replace(/-/g,"/"));
                       var endtime=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
                       if(endtime<starttime){
                              showPromptMsg('red','${i18n.datetime_invalid}');
                               return false;
                       }
				 		var params = $('#form_user_${pageId}').form("getFormParam");
				 		params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						$('#grid_user_${pageId}').grid("load",params);
			    		return false;
				      }}
				      ,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
					       if(!$('#form_user_${pageId}').form("validateParam")){
						 			return;
						 	 }
					   	 	var params = $('#form_user_${pageId}').form("getFormParam");
					   	 	params.push("usercenter="+st_UserCenter);
							var url="<%=request.getContextPath()%>/shenbao/51105.do";
							doprint(st_PageId,params,url);
							return false;
						}}
					 ,{name:'back',caption:'${i18n.back}[F11]'}	
				   	 ,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
			$('#form_user_${pageId}').form({
			 	 onemoredemand:true,
			 	 onreload:true,
			 		fields:[
			 		        {fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.jizxzt}',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/jizxzt.do'},       
			 		        {fieldType:'fieldSelect',property:'shiftb',caption:'${i18n.shifcxls}',includeNull:false,value:'N',onselect:'onchange()',src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
			 		        {fieldType:'fieldSelect',property:'wulid',caption:'${i18n.wuld}',includeNull:true,src:'<%=request.getContextPath()%>/common/wulidian.do'},
	                     	{fieldType:'fieldText',property:'qswulid',caption:'${i18n.wuldfw}',dataType:'text',maxLength:'3'},
	                        {fieldType:'fieldText',property:'zzwulid',caption:'${i18n.wuldfw}',dataType:'text',maxLength:'3'} ,
	                        {fieldType:'fieldText',property:'jizxh',caption:'${i18n.jizxh}',dataType:'text',maxLength:'11'},
	                        {fieldType:'fieldText',property:'qissj',caption:'${i18n.daoxqssj}',dataType:'date',maskOptions:{mask:'9999-99-99'}} ,
	                        {fieldType:'fieldText',property:'zhongzsj',caption:'${i18n.daoxzzsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}}
			 		]
			 	});
        
			 	$(document).keyboardsupport({});
			});
		$(document).ready(function(){
		   $('#shiftb input').attr('realValue','0');
		   $('#qissj input').attr("disabled",true);
		   $('#zhongzsj input').attr("disabled",true);
		   //$('#qissj input').blur(function(){$('#zhongzsj input').fucus()});
         });
		function onchange(){
				if('1' == $('#shiftb input').attr('realValue')){
					  $('#qissj input').removeAttr("disabled");
					  $('#zhongzsj input').removeAttr("disabled");
					  //$('#qissj input').attr("disabled",false);
					  //$('#zhongzsj input').attr("disabled",false);
				}else if('0' == $('#shiftb input').attr('realValue')){
					 $('#qissj input').html('');
					 $('#qissj input').val('');
					 $('#qissj input').attr('realValue','');
					 $('#zhongzsj input').html('');
					 $('#zhongzsj input').val('');
					 $('#zhongzsj input').attr('realValue','');
					 $('#qissj input').attr("disabled","disabled");
					 $('#zhongzsj input').attr("disabled","disabled");
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
						    <td>${i18n.jizxzt}:</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
							<td>${i18n.shifcxls}:</td>
							<td><div class="ui-field" id="shiftb"></div></td>
							<td>${i18n.jizxh}:</td>
							<td><div class="ui-field" id="jizxh"></div></td>
						</tr>
						<tr>
						     <td>${i18n.wuldfw}:</td>
							 <td><div class="ui-field" style="float:left" id="qswulid"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="zzwulid" ></div> </td>
						     <td>${i18n.wuld}/${i18n.kongxq}:</td>
							 <td><div class="ui-field" id="wulid"></div></td>
							
						</tr>
						<tr>
						    <td>${i18n.shengbrq}:</td>
							<td><div class="ui-field" style="float:left" id="qissj"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="zhongzsj" ></div> </td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>