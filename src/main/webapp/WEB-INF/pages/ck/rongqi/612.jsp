<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","612");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_612}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.diaobdh}',notNull:false},
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
                {fieldType:'fieldText',property:'caozy',maxLength:'10',caption:'${i18n.caozy}',notNull:false,value:st_UserName},
                {fieldType:'fieldSelect',property:'wuld',maxLength:'10',includeNull:true,caption:'${i18n.diaochurqq}',notNull:false,src:'<%=request.getContextPath()%>/common/rongqc2.do'},
                {fieldType:'fieldSelect',property:'diaoruwld',includeNull:true,caption:'${i18n.diaochurqq}',src:'<%=request.getContextPath()%>/common/rongqc2.do'},               
                {fieldType:'fieldText',property:'diaobsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.diaobsj1}',notNull:false},
                {fieldType:'fieldText',property:'diaobsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['diaobdh','wuld','diaoruwld','caozy','diaobzt'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/61701.do?zhuangt=4',
		cols:[
		{property:'diaobdh',caption:'${i18n.diaobdh}'},
		{property:'wuld',caption:'${i18n.diaochurqq}'},
  		{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
  		{property:'create_time',caption:'${i18n.diaobsqsj}'},
  		{property:'caozy',caption:'${i18n.caozy}'}
  		
  		],
  		buttons:[
				//F1 查询
				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			 		currentPage=1;
			 		//参数校验
					  if(!$('#form_user_${pageId}').form("validateParam")){
							return;	
					}
					  if (!validateform()){
			              return;
			          }
			 		 //提交数据
			 		var params = $('#form_user_${pageId}').form("getFormParam");
					params.push("currentPage="+currentPage);
					params.push("zhuangt=4");
					$('#grid_user_${pageId}').grid("setQueryParams", params);
			 		var url = "<%=request.getContextPath()%>/rongqi/61701.do";
					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
							//加载grid
								$('#grid_user_${pageId}').grid("parseResult",results)
						 }
						 });
				}},
 				//F2 查看
 				{name:'info',caption:'${i18n.info}[F2]',keyboard:'F2',action:function(){
 					//获取选择行
 					var currPandfs=$('#grid_user_${pageId}').grid('getSelectedAll');
 					//params应为表格的keyFields个数
                    if(currPandfs.length < 1){
                        showPromptMsg('red','${i18n.selecterror}');
                        return false;
                    }
 					
 					//存放查询条件
 					var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
 					vQuery.push("currentPage="+currentPage);
 					$('#serachKey').val(vQuery);
 	                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
 	                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 	                if($('#zhuangt input').val()=='未完成'){
 	                	params.push("zhuangt=1");
 	                }else{
 	                		params.push("zhuangt=2");
 	                	}
 	               
 					params.push("currentPage=1");
 					//去掉List[0];
 					for(i=0;i<params.length;i++){
 						params[i]=params[i].toString().replace("list[0].","");
 					}
 					var url = "<%=request.getContextPath()%>/rongqi/61201.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 if (results.result.response == "0001"){
 									//加载返回数据
 									var strJSON=JSON.stringify(results);
 									$('#putvalue').val(strJSON);
 									$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/6120101.do"+st_Params);
 		    			    		document.putform.submit();
 								 }
 						 }
 						 });
 					return false;
 				}},
 				//单选
 				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
 					$('#grid_user_${pageId}').grid('selected');
 					return false;
 				}},
 				//F11返回上一页 
 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
 				//F12返回主菜单
				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
   	   ]
	});
	$('#zhuangt input').bind('blur',function(){
		if($('#zhuangt input').val()=='已完成'){
			$('#btn_chexiao').hide();
			}
		else{
			$('#btn_chexiao').show();
		}
		
	});
	function validateform(){
        //参数校验
        if(!$('#form_user_${pageId}').form("validateParam")){
            $('#grid_user_${pageId}').grid('clearRecords');
            return false;
        }
        
        //范围校验
        var saoksj1 = $('#diaobsj1 input').val();
        var saoksj2 = $('#diaobsj2 input').val();
        if(!validRangeData("datetime", saoksj1, saoksj2)){
            $('#diaobsj1 input').focus();
            $('#diaobsj1 input').removeClass('validate-success').addClass('validate-error');
            return false;
        }
        var date1 = new Date(saoksj1.replace(/-/g,"/"));
        var date2 = new Date(saoksj2.replace(/-/g,"/"));
         if(date2<date1){
             showPromptMsg('red','${i18n.datetime_invalid}');
              return false;
          }
        var date3=date2.getTime()-date1.getTime();
        if (date3 > 7*24*3600*1000){
            showPromptMsg('red',$.sdcui.resource.i18n['C_F_DIAOBOSJ']);
            return false;
        }
        return true;
    }
	 	
//加载时判断是否是回退
$(document).ready(function(){
	if ( $('#serachKey').val()!=""){
		//为界面查询字段赋值
		var params = $('#serachKey').val().split(",");
		for(i=0;i<params.length;i++){
			var vParam = params[i].split("=");
			if (vParam[0].indexOf("diaobdh") != -1){                   //任务编号
				$('#diaobdh input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("rongqxh") != -1){           //状态信息
				$('#rongqxh input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("caozy") != -1){             //状态
				$('#caozy input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("wuld") != -1){        //生成库存时间
				$('#wuld input').val(vParam[1])
				continue;
			}  else if (vParam[0].indexOf("diaoruwld") != -1){        //生成库存时间
				$('#diaoruwld input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("zhuangt") != -1){        //生成库存时间
				if(vParam[1]!=""){
					if(vParam[1]==1)
						{
						$('#zhuangt input').val('未完成');
						}
					else
						{
						$('#zhuangt input').val('已完成');
						}
				}
				$('#zhuangt input').attr('realvalue',vParam[1])
				continue;
			}else if (vParam[0].indexOf("currentPage") != -1){       //页码
				currentPage = vParam[1]
				continue;
			}
		}
		//移除当前页码
		params.splice(params.length-1,1);
		//设置分页条件
		$('#grid_user_${pageId}').grid("setQueryParams", params);
		//加载列表数据
		$('#grid_user_${pageId}').grid("load",params);
	}
});
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>
		<td class="field-label">${i18n.diaobdh}：</td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label">${i18n.caozy}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>				     
		</tr>	
			<tr>	      
		<td class="field-label">${i18n.diaochurqq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div>
		</td>
		<td class="field-label">${i18n.diaorurqq}：</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div>
		</td> 
        <td class="field-label">${i18n.diaobsj}：</td>
		<td class="field-container"><div class="ui-field" style="float:left" id="diaobsj1"></div><div style="float:left" >-</div><div style="float:left" class="ui-field" id="diaobsj2"></div>	
	   </tr>	   
  </table>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>