<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","604");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_604}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'danjbh',dataType:'shenbdh',caption:'${i18n.danjbh}',notNull:false},
                {fieldType:'fieldSelect',property:'wuld',includeNull:true,src:'<%=request.getContextPath()%>/common/getrongqc.do?temp=2&rongqcbh='+st_Rongqcbh},
                {fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
                {fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
                {fieldType:'fieldText',property:'shengbr',maxLength:'10',caption:'${i18n.shengbr}',notNull:false},
                {fieldType:'fieldText',property:'bhsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.bhsj1}',notNull:false},
                {fieldType:'fieldText',property:'bhsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.bhsj2}',notNull:false},
                {fieldType:'fieldText',property:'chexyy',maxLength:'20',caption:'${i18n.chexyy}',notNull:false}
	 			]
 		});
	function gridload(){
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','chengysdm','gongysdm','wuld','diaoruwld'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/60501.do',
		cols:[
		{property:'danjbh',caption:'${i18n.danjbh}'},
  		{property:'chengysdm',caption:'${i18n.rongqwls}'},
  		//{property:'gongysdm',caption:'${i18n.rongqgys}'},
  		{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
  		{property:'wuld',caption:'${i18n.rongqiq}'},
  		{property:'creator',caption:'${i18n.caozr}'},
  		{property:'create_time',caption:'${i18n.caozsj}'}
  		],
  		buttons:[
 				//查询
				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			 		$('#grid_user_${pageId}').grid('clearRecords');
			 		 //参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
							return;	
			 		}
			 		var bhsj1 = $('#bhsj1 input').val();
			 		var bhsj2 = $('#bhsj2 input').val();
					  var date1 = new Date(bhsj1.replace(/-/g,"/"));
					  var date2 = new Date(bhsj2.replace(/-/g,"/"));
					  if(date1>date2){
							 showPromptMsg('red','${i18n.diyigsjxydrg}')
							 return;
					  }
			 		 //提交数据
			 		var params = $('#form_user_${pageId}').form("getFormParam");
					params.push("currentPage="+currentPage);
					$('#grid_user_${pageId}').grid("setQueryParams", params);
			 		var url = "<%=request.getContextPath()%>/rongqi/60501.do";
					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
							 $('#grid_user_${pageId}').grid("parseResult",results)
						 }
						 });
                     return false;
				}},
				//查看
				 {name:'info',caption:'${i18n.info}[F2]',keyboard:'F2',action:function(){
					//获取选择行
					var currPandfs=$('#grid_user_${pageId}').grid('getSelectedAll');
					//params应为表格的keyFields个数
                    if(currPandfs.length != 5){
                        showPromptMsg('red','${i18n.selecterror}');
                        return false;
                    }
					
					//存放查询条件
					var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
					vQuery.push("currentPage="+currentPage);
					$('#serachKey').val(vQuery);
	                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
	                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
					params.push("currentPage=1");
					//去掉List[0];
					for(i=0;i<params.length;i++){
						params[i]=params[i].toString().replace("list[0].","");
					}
					var url = "<%=request.getContextPath()%>/rongqi/60401.do";
					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if (showPromptRequestMsg(results)==true){
							 if (results.result.response == "0000"){
									//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/6040101.do"+st_Params);
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
				//回退
				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
				//返回
				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
  	   ]
	});
	}
	gridload();	
//加载时判断是否是回退
$(document).ready(function(){
	//设置供应商编号不可输入
	$("#gongysdm input").attr('disabled',true);
	//供应商编号赋值
	$('#chengysdm input').change(function(){
		$("#gongysdm input").val($('#chengysdm input').val());
	});
	//供应商编号赋值
	$('#chengysdm input').bind('input propertychange',function(){
		$("#gongysdm input").val($('#chengysdm input').val());
	});
	if ( $('#serachKey').val()!=""){
		//为界面查询字段赋值
		var params = $('#serachKey').val().split(",");
		for(i=0;i<params.length;i++){
			var vParam = params[i].split("=");
			if (vParam[0].indexOf("danjbh") != -1){                   //任务编号
				$('#danjbh input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("wuld") != -1){           //状态信息
				$('#wuld input').val(vParam[1])
				$('#wuld input').attr('realvalue',vParam[1])
				continue;
			} else if (vParam[0].indexOf("gongysdm") != -1){             //状态
				$('#gongysdm input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("chengysdm") != -1){        //生成库存时间
				$('#chengysdm input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("shengbr") != -1){        //生成库存时间
				$('#shengbr input').val(vParam[1])
				continue;
			}else if (vParam[0].indexOf("bhsj1") != -1){        //生成库存时间
				$('#bhsj1 input').val(vParam[1])
				continue;
			}else if (vParam[0].indexOf("bhsj2") != -1){        //生成库存时间
				$('#bhsj2 input').val(vParam[1])
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
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.danjbh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
		<td class="field-label">${i18n.fankongq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
      </tr>
      <tr>
		  <td class="field-label">${i18n.rongqgys}：</td>
		    <td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.rongqwls}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
      </tr>
            <tr>
		  <td class="field-label">${i18n.caozyhm}：</td>
		    <td class="field-container"><div class="ui-field" id="shengbr"></div></td>
		<td class="field-label">${i18n.kongrqsbsj}：</td>
		<td class="field-container"><div class="ui-field" id="bhsj1"></div><div style="float:left" >-</div><div class="ui-field" id="bhsj2"></div></td>
      </tr>

  </table>	    	
</div>	
<div id="grid_user_${pageId}" class='hidden-item'></div>

<div id='prompt'>${i18n.prompt}</div>
	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>