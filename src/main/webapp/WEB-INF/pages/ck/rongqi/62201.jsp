<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","622");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_622}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp"/>
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldLabel',property:'danjbh',dataType:'fanhdh',caption:'${i18n.tuigysdh}',notNull:true}
				]
 		});
	var par=[];
	gridload();
	function gridload()
	{
		$('#grid_user_${pageId}').grid({
			keyFields:['danjbh','rongqxh','rongqsl','rongqye','gongysdm','gongysmc','wuld','chengysdm','chengysmc'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/62201.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/62202.do',
			cols:[
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
	  		{property:'rongqsl',caption:'${i18n.tuifsl}',editor:'fieldText',dataType:'plusinteger',afterenter:'resultShow'},
	  		{property:'rongqye',caption:'${i18n.yuantfsl}'},
	  		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
	  		//{property:'gongysmc',caption:'${i18n.gongysmc}'},
	  		{property:'chengysdm',caption:'${i18n.chengysdm}'},
	  		{property:'chengysmc',caption:'${i18n.chengysmc}'},
	  		{property:'jiesrq',caption:'${i18n.tuifsj}'},
	  		{property:'wuld',caption:'${i18n.rongqiq}'},
	  		{property:'caozy',caption:'${i18n.fanhczr}'}
	  		]
		});
	}
	
	//F1查询
 	$('#btn_search').bind('click',function(){
 	    $('#danjbh1 input').val('');
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
 		//范围校验
        if(!validRangeData("date", $('#bhsj1 input').val(), $('#bhsj2 input').val())){
            $('#bhsj1 input').focus();
            $('#bhsj1 input').removeClass('validate-success').addClass('validate-error');
            return;
        }
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62201.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
					par=[];
					gridload();
					 if (results.result.response == "0001"){
						 par.push('danjbh='+$('#danjbh span').val());
						 $('#danjbh1 input').val($('#danjbh span').val());
					 }
			 }
			 });
 	}); 
 	//F2删除
	$('#btn_delete').bind('click',function(){
		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		//先提交选中行，然后再重新加载
		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		 //去掉List[0];
         /* for(i=0;i<params.length;i++){
            params[i]=params[i].toString().replace("list[0].","");
        }*/
		params.push("currentPage="+currentPage);
		params.push("danjbh="+'${result.result.parameter.danjbh}');
		var url = "<%=request.getContextPath()%>/rongqi/62203.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
		}
		return false;
	});
	//F3确认
	$('#btn_quer').bind('click',function(){
        if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}        
 		var params = [];
		params.push("danjbh="+'${result.result.parameter.danjbh}');		
		var url = "<%=request.getContextPath()%>/rongqi/62204.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
			    var size=$('#grid_user_${pageId}').grid('getRecordAll').length;
			 		if (results.result.response == "0000" && size > 0){
				 		window.location.href="<%=request.getContextPath()%>/rongqi/62106.do?usercenter="+st_UserCenter+"&danjbh="+$('#danjbh span').html()+"&cangkbh="+st_Cangkbh+st_Params;
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
	$(document).keyboardsupport({});
});
//页面加载后，查询数据为界面赋值
$(document).ready(function(){
	//加载返回数据
		$('#danjbh span').html('${result.result.parameter.danjbh}');
		//加载返回数据
		$('#grid_user_${pageId}').grid('parseResult',${result});
		var params = $('#form_user_${pageId}').form("getFormParam");
		$('#grid_user_${pageId}').grid("setQueryParams", params);
});
	var resultShow=function(){
		showPromptMsg('blue','${i18n.querhsx}')
	}
</script>
</head>
<body>
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
		<td class="field-label">${i18n.tuigysdh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
      </tr>
</table>
<br/><div align="right">
        <!--  <span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>-->
        <span id="btn_delete"  class="ui-button">${i18n.delete}[F2]</span>
        <span id="btn_quer"  class="ui-button">${i18n.quer}[F3]</span>
        <span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
        <span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
        <span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div><br/>  
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
	<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>