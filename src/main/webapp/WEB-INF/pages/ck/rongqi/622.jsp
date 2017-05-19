<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","622");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_622}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'danjbh',dataType:'fanhdh',maxLength:'9',caption:'${i18n.danjbh}',notNull:false},
				{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},				
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','wuld','gongysdm','chengysdm','gongysmc'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62301.do?zhuangt=2',
		cols:[
		{property:'danjbh',caption:'${i18n.tuigysdh}'},
  		{property:'wuld',caption:'${i18n.rongqiq}'},
  		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
  		//{property:'gongysmc',caption:'${i18n.gongysmc}'},
  		{property:'chengysdm',caption:'${i18n.chengysdm}'},
  		{property:'chengysmc',caption:'${i18n.chengysmc}'},
  		{property:'caozy',caption:'${i18n.tuifczy}'},
  		{property:'create_time',caption:'${i18n.caozsj}'}
  		]
	});
	//F1查询 
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		if($('#chengysdm input').val()=="DPCA"){
			showPromptMsg('red','${i18n.dpcacw}')
			return;
		}
 		if($('#chengysdm input').val()=="dpca"){
			showPromptMsg('red','${i18n.dpcacw}')
			return;
		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62301.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid("parseResult",results)
				 $('#chengysdm input').val(results.result.parameter.chengysdm)
				 $('#gongysdm input').val(results.result.parameter.gongysdm)
			 }
			 });
 	}); 
	//F2 查看
 	$('#info').bind('click',function(){
			//获取选择行
			var currPandfs=$('#grid_user_${pageId}').grid('getSelectedAll');
			//params应为表格的keyFields个数
        if(currPandfs.length  < 1){
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
			params.push("zhuangt=1");
			//去掉List[0];
			for(i=0;i<params.length;i++){
				params[i]=params[i].toString().replace("list[0].","");
			}
		
			var url = "<%=request.getContextPath()%>/rongqi/62201.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 if (results.result.response == "0001"){
						//加载返回数据
						var strJSON=JSON.stringify(results);
						$('#putvalue').val(strJSON);						
			    		$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/6220101.do"+st_Params);
			    		document.putform.submit();
					 }
				 }
				 });
			return false;
 	}); 
	//F4 选中
 	$('#getSelected').bind('click',function(){
			$('#grid_user_${pageId}').grid('selected');
				return false;
 	}); 
	 	
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
				continue;
			} else if (vParam[0].indexOf("chengysdm") != -1){             //状态
				$('#chengysdm input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("gongysdm") != -1){        //生成库存时间
				$('#gongysdm input').val(vParam[1])
				continue;
			}else if (vParam[0].indexOf("chexyy") != -1){        //生成库存时间
				$('#chexyy input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("currentPage") != -1){       //页码
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
			<td class="field-label">${i18n.tuigysdh}：</td>
		    <td class="field-container"><div class="ui-field" id="danjbh"></div></td>
	
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container">
			<div class="ui-field" id="wuld"></div>
		</td>
	 </tr>
      <tr>
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
	    <td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
	 </tr>
  </table>		
<br><div align=right>
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="info"  class="ui-button">${i18n.info}[F2]</span>
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div><br/>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>		
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>