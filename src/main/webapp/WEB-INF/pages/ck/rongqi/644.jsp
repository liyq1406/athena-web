<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","644");%>
<!-- 11891 -->
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_644}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var params = [];
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'rongqfhdh',caption:'${i18n.rongqfhdh}',dataType:'shuzzm',maxLength:'10',notNull:true},
                {fieldType:'fieldText',property:'laiy',dataType:'laiy',maxLength:'25',caption:'${i18n.laiy}',notNull:false},
				{fieldType:'fieldText',property:'songhr',dataType:'laiy',maxLength:'10',caption:'${i18n.songhr}',notNull:false},		
				]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','rongqxh','shifsl','rongqsl'],
		id:'grid_user_${pageId}',
		params:params,
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/64401.do',
		editSubmitSrc:'<%=request.getContextPath()%>/rongqi/64402.do',
		cols:[		
		{property:'danjbh',caption:'${i18n.rongqbgdh}',width:'50'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},		
		{property:'shifsl',caption:'${i18n.shissl}',editor:'fieldText',dataType:'dbnumber'},		
  		{property:'fanhd',caption:'${i18n.fanhd}'},
  		{property:'creator',caption:'${i18n.caozy}',width:'50'},
  		{property:'create_time',caption:'${i18n.caozsj}',width:'70'},
  		]
	});

	//F1查询 
 	$('#btn_search').bind('click',function(){
 		//参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 //提交数据
 		params = $('#form_user_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
		params.push("usercenter="+st_UserCenter); 
		params.push("wuld="+st_Rongqcbh); 	
		params.push("flag=0");	
		$('#grid_user_${pageId}').grid("setQueryParams", params);
		$('#grid_user_${pageId}').grid("load",params);
 	}); 
 	//F2 查看明细
 	$('#info').bind('click',function(){				
         	//页面数据提交并跳转，判断盘点方式，打开不同的查看页面
        	var params = $('#grid_user_${pageId}').grid('getSelectedAll');
        	//获取选择行
			//params应为表格的keyFields个数
            if(params.length < 4||params.length > 4){
                 showPromptMsg('red','${i18n.selecterror}');
                 return false;
            }   
			params.push("currentPage=1");
			params.push("pageSize=10");
			//去掉List[0];
	
			for(i=0;i<params.length;i++){							
				params[i]=params[i].toString().replace("list[0].","");				
			}
			
			
			
			var vQuery= $('#form_user_${pageId}').form("getFormParam");
			params = params.concat(vQuery);

			$('#serachKey').val(vQuery);
								
			var url = "<%=request.getContextPath()%>/rongqi/64403.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 if (results.result.response == "0000"){									
						//加载返回数据
						var strJSON=JSON.stringify(results);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/P64401.do"+st_Params);
			    		document.putform.submit();
					 }
				 }
			});
			return false;
 	});
 	//F3结束录入
 	 $('#btn_jieslr').bind('click',function(){
 		 //提交数据
 		var songhr = $('#songhr input').val();
		var laiy = $('#laiy input').val();
		if(songhr=="" || laiy=="")
       	{
            showPromptMsg('red','${i18n.songhrerror}');
			return ;
        }   
 		params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("wuld="+st_Rongqcbh);
 		params.push("usercenter="+st_UserCenter); 
		var url = "<%=request.getContextPath()%>/rongqi/64404.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		if (showPromptRequestMsg(results)==true){
				if (results.result.response == "0000"){									
					$('#grid_user_${pageId}').grid("clearRecords");
					var para=[];
					var strJSON=JSON.stringify(results);
					para.push("putvalue1="+strJSON);
					//var strJSON=JSON.stringify(results);
			 		$.ajax({					    
                        url:"<%=request.getContextPath()%>/rongqi/64405.do",
					    type:'post', //数据发送方式 
					    dataType:'json', //接受数据格式 
					    data:para.join('&'),
						success:function(result){
                        	if (showPromptRequestMsg(result)==true){
                        		
                        	}
						}
						});
				}
			}
		});
 	});
 	
 	//F4 选中
 	$('#getSelected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
			return false;
 	});
 	//F5 全选
 	$('#getSelectedAll').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selectedAll');
			return false;
 	});
	$(document).keyboardsupport({});
	});
/**
 *进入644页面后进行查询
 */
$(document).ready(function(){
	if ( $('#serachKey').val()!="")
	{
		//为界面查询字段赋值
		var param1 = $('#serachKey').val().split(",");
		var r = param1[0].split("=");
		$('#rongqfhdh input').val(r[1]);
		//设置分页条件
		$('#grid_user_${pageId}').grid("setQueryParams", param1);
		//加载列表数据
		$('#grid_user_${pageId}').grid("load",param1);
	}
});
</script>
</head>
<body>
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
<form id="putform" method="post" name="putform">
	<input id="putvalue" name="putvalue" type="Hidden"></input>
</form> 

<form id="putform1" method="post" name="putform1">
	<input id="putvalue1" name="putvalue1" type="Hidden"></input>
</form> 


<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tbody>
	<tr>
		<td class="field-label">${i18n.rongqfhdh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqfhdh"></div></td>
		<td class="field-label">${i18n.laiy}：</td>
		<td class="field-container"><div class="ui-field" id="laiy"></div></td>
	</tr>
	<tr>
		<td class="field-label">${i18n.songhr}：</td>
		<td ><div class="ui-field" id="songhr"></div></td>	
	</tr>
</tbody>
</table>
<br/>
<div align="right">		
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="info"  class="ui-button">${i18n.mingx}[F2]</span>
	<span id="btn_jieslr"  class="ui-button">${i18n.endinput}[F3]</span>	
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
	<span id="getSelectedAll"  class="ui-button">${i18n.selectall}[F5]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
   </div>
   <br/>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>