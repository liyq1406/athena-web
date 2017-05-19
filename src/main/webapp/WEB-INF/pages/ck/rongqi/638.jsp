<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","638");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_638}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.yikdh}',notNull:false},
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
                {fieldType:'fieldText',property:'shengbr',maxLength:'10',caption:'${i18n.caozy}',notNull:false,value:st_UserName},               
                {fieldType:'fieldSelect',property:'wuld',caption:'${i18n.diaochurqq}',notNull:true,src:'<%=request.getContextPath()%>/common/rongqc.do'},
                {fieldType:'fieldSelect',property:'diaoruwld',notNull:true,caption:'${i18n.diaorurqq}',src:'<%=request.getContextPath()%>/common/rongqc.do'},
                {fieldType:'fieldSelect',property:'zhuangt',notNull:false,caption:'${i18n.zhuangt}',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/rongqykzt.do'},
                {fieldType:'fieldText',property:'diaobsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.diaobsj1}',notNull:false},
                {fieldType:'fieldText',property:'diaobsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['diaobdh','wuld','diaoruwld','diaobsj','shengbr','zhuangt','zhuangtxx'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/63801.do',
		cols:[
			{property:'diaobdh',caption:'${i18n.yikdh}'},
			{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
			{property:'wuld',caption:'${i18n.diaochurqq}'},
	  		{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true},
	  		{property:'diaobsj',caption:'${i18n.yikusqsj}'},
	  		{property:'shengbr',caption:'${i18n.caozy}'}
  		],
  		buttons:[
  			//查询
	  		{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	  			//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
					return;	
		 		}
				if (!validateform()){
			        return;
			    }
				//查询并显示数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载数据
				$('#grid_user_${pageId}').grid("load",params);
		   		return false;
	  		}}
			//单选
			,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				$('#grid_user_${pageId}').grid('selected');
				return false;
			}}
			,{name:'cancel',caption:'${i18n.repeal}[F6]',keyboard:'F6',action:function(){
				//获取选择行
		 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(params.length < 1){
					showPromptMsg('red','${i18n.selectoneerror}')
					return false;
				}
				//打开提示框是否删除
				if(confirm($.sdcui.resource.i18n['C_remove'])){
			 		//提交数据
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		var records =  $('#grid_user_${pageId}').grid('getSelectedAll');
			 		params = params.concat(records);
			 		var url = "<%=request.getContextPath()%>/rongqi/63802.do";
					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
							//加载grid
							$('#grid_user_${pageId}').grid("parseResult",results)
					 }
				 });
				}
			}}
			//查看
			,{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
				//获取选择行
				var currDiaobdh=$('#grid_user_${pageId}').grid('getSelectedColumnValue','diaobdh')
		        if(currDiaobdh.length!=1){
		        	showPromptMsg('red','${i18n.selecterror}')
					return false;
				} 
				//存放查询条件
				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
				vQuery.push("zhuangtxx="+$('#zhuangt input').val());
				vQuery.push("diaoruwldxx="+$('#diaoruwld input').val());
				vQuery.push("wuldxx="+$('#wuld input').val());
				$('#serachKey').val(vQuery);
				//页面数据提交并跳转，判断盘点方式，打开不同的查看页面
                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
				params.push("currentPage=1");
				//去掉List[0];
				for(i=0;i<params.length;i++){
					params[i]=params[i].toString().replace("list[0].","");
				}
				//加载返回数据
				var url = "<%=request.getContextPath()%>/rongqi/63901.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
		 				//加载返回数据
						var strJSON=JSON.stringify(results);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/63803.do"+st_Params);
   			    		document.putform.submit();
					 }
				});
				return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
   	   ]
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
			} else if (vParam[0].indexOf("zhuangtxx") != -1){        //生成库存时间
				$('#zhuangt input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("diaoruwldxx") != -1){        //生成库存时间
				$('#diaoruwld input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("wuldxx") != -1){        //生成库存时间
				$('#wuld input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("wuld") != -1){        //生成库存时间
				$('#wuld input').attr("realValue",vParam[1])
				continue;
			}  else if (vParam[0].indexOf("diaoruwld") != -1){        //生成库存时间
				$('#diaoruwld input').attr("realValue",vParam[1])
				continue;
			} else if (vParam[0].indexOf("zhuangt") != -1){        //生成库存时间
				$('#zhuangt input').attr('realvalue',vParam[1])
				continue;
			}
		}
		//移除当前页码
		params.splice(params.length-3,3);
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
		<td class="field-label">${i18n.yikdh}：</td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label">${i18n.caozy}：</td>
		<td class="field-container"><div class="ui-field" id="shengbr"></div></td>				     
		</tr>	
		<tr>	      
		<td class="field-label">${i18n.diaochurqq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div>
		</td>
		<td class="field-label">${i18n.diaorurqq}：</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div>
		</td> 
		<td class="field-label">${i18n.zhuangt}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangt"></div></td>
		</tr>	
		<tr>	      
		<td class="field-label">${i18n.diaobsj}：</td>
		<td class="field-container"><div class="ui-field" style="float:left" id="diaobsj1"></div><div style="float:left" >-</div><div style="float:left" class="ui-field" id="diaobsj2"></div>	
		</td>
		<td class="field-label"></td>
		<td class="field-container"></td> 
		<td class="field-label"></td>
		<td class="field-container"></td>
			</tr>	  
  </table>
	<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>