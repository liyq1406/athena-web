<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","418");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_418}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldText',property:'tuihdh',dataType:'tuihdh',caption:'${i18n.tuihdh}',notNull:false},
				//{fieldType:'fieldSelect',property:'ckandzick',caption:'${i18n.zickbh}',dataType:'shuzzm',maxLength:'6',value:st_Cangkbh,notNull:true},
				{fieldType:'fieldSelect',property:'ckandzick',caption:'${i18n.zickbh}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouseck.do'+'?buhgpk='+2+'&buhgpk2='+0},
				{fieldType:'fieldText',property:'caozy',caption:'${i18n.caozy}',dataType:'text',maxLength:'10',notNull:false},				
				{fieldType:'fieldText',property:'zhijrq1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.qissj}',notNull:false},
				{fieldType:'fieldText',property:'zhijrq2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.zhongzsj}',notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['tuihdh','cangkbh','zickbh','weixsdm','weixsmc','lingjsl','shengcsj','caozy'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41803.do',
		cols:[
  		{property:'tuihdh',caption:'${i18n.tuihdh}',align:'center'},
  		{property:'cangkbh',caption:'${i18n.cangkh}',align:'center'},
  		{property:'zickbh',caption:'${i18n.zick}',align:'center'},
  		{property:'weixsdm',caption:'${i18n.chengysdm}',align:'center'},
  		{property:'weixsmc',caption:'${i18n.chengysmc}',align:'center'},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'},
  		{property:'shengcsj',caption:'${i18n.shengcsj}',align:'center'},
  		{property:'caozy',caption:'${i18n.caozy}',align:'center'}  		
  		],
  		buttons:[
                //F1查询
  	  			 {name:'btn_search',caption:'${i18n.search}[F1]',keybord:'F1',action:function(){
		  	  				if(!$('#form_user_${pageId}').form("validateParam")){
		  	  				return;	
		  	  		        }
		  	  			    var starttime=new Date(($('#zhijrq1 input').val()).replace(/-/g,"/"));
                            var endtime=new Date(($('#zhijrq2 input').val()).replace(/-/g,"/"));
                            if(endtime<starttime){
                              showPromptMsg('red','${i18n.datetime_invalid}');
                               return false;
                             }
		  	  		        var zickbh=$('#ckandzick input').val();
		  	  	 		    var cangkbh=zickbh.substr(0,3);
		  	  	 		    var params2 = [];
		  	  			    var url2 = "<%=request.getContextPath()%>/common/wareHouse.do";
		  	  			    $('#form_user_${pageId}').form("submitUrl", params2, url2, function(results){
		  	  				showPromptMsg('blue','');
		  	  				var size=results.result.parameter.list.length;
		  	  				var id=0;
		  	  				   for(var i=0;i<size;i++){
		  	  					   if(cangkbh!=results.result.parameter.list[i].value){
		  	  						 	id=0;
		  	  					    }else{
		  	  						    id=1;
		  	  						    break;
		  	  					    }
		  	  				    }
			  	  				 if(id==0){
			  	  					 $('#grid_user_${pageId}').grid('clearRecords');
			  	  					 showPromptMsg('red','${i18n.C_C_cuowckh}')
			  	  					  return;
			  	  				 }else{
			  	  				 		 //提交数据
			  	  				 		var params = $('#form_user_${pageId}').form("getFormParam");
			  	  				 		$('#grid_user_${pageId}').grid("setQueryParams", params);
			  	  				 		var url = "<%=request.getContextPath()%>/yichang/41803.do";
			  	  				 		g_isSub=0;
			  	  						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  	  							 if (showPromptRequestMsg(results)==true){
			  	  								//加载grid
			  	  									$('#grid_user_${pageId}').grid("parseResult",results)
			  	  							 }
			  	  							 });
			  	  				 }
		  	  			 });
		  	   		return false;
  	  				}},
  	  			//F2明细
  	  		      {name:'btn_mingxi',caption:'${i18n.mingx}[F2]',keybord:'F2',action:function(){
  	  			        //获取选择行
	  	  				var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','tuihdh');
	  	  		        if(currPandfs.length!=1){
	  	  		        	showPromptMsg('red','${i18n.selecterror}')
	  	  					return false;
	  	  				}
	  	  				var Query= $('#form_user_${pageId}').form("getFormParam");
	  	  				//存放查询条件
	  	  				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
	  	  				vQuery.push("currentPage="+currentPage);
	  	  				
	  	  		        //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
	  	  		        var params = $('#grid_user_${pageId}').grid('getSelectedAll');
	  	  				params.push("currentPage=1");
	  	  				var vckzck="";
	  	  				//去掉List[0];
	  	  				for(i=0;i<params.length;i++){
	  	  					params[i]=params[i].toString().replace("list[0].","");
	  	  				var vParam = params[i].split("=");
						if (vParam[0].indexOf("cangkbh") != -1){                   //销耗单号
							vckzck = vParam[1];
							continue;
					     }
	  	  				}
	  	  			   vQuery.push("vckzck="+vckzck);
	  	  			   $('#serachKey').val(vQuery);
	  	  		 		var url = "<%=request.getContextPath()%>/yichang/41803.do";
	  	  				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  	  					 if (showPromptRequestMsg(results)==true){
	  	  						 if (results.result.response == "0000"){
	  	  								//加载返回数据
	  	  								var strJSON=JSON.stringify(results);
	  	  								$('#putvalue').val(strJSON);
	  	  								$("#putform").attr("action","<%=request.getContextPath()%>/yichang/P41803.do"+st_Params);
	  	  					    		document.putform.submit();
	  	  							 }
	  	  					 }
	  	  					 });
	  	  		 		return false;
  	  			    }},
  	  				//单选（选中）
  	  				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
  	  					$('#grid_user_${pageId}').grid('selected');
  	  					return false;
  	  				}},
  	  			    {name:'btn_back',caption:'${i18n.back}[F11]',keybord:'F11'},
  	  			    {name:'btn_return',caption:'${i18n.return}[F12]',keybord:'F12'}
  	  				]
	});
	
	//加载时判断是否是回退
	$(document).ready(function(){
		if ( $('#serachKey').val()!=""){
			//为界面查询字段赋值
			var params = $('#serachKey').val().split(",");
			for(i=0;i<params.length;i++){
				var vParam = params[i].split("=");
				if (vParam[0].indexOf("vckzck") != -1){                   //退货单号
					$('#ckandzick input').val(vParam[1])
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
<div style="padding:20px;">
<!--主体内容开始--> 
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.tuihdh}：</td>
		<td class="field-container"><div class="ui-field" id="tuihdh"></div></td>
		<td class="field-label">${i18n.zickbh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		<td class="field-label">${i18n.caozy}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.tuihuosj}：</td>
		<td class="field-container"><div class="ui-field" id="zhijrq1"></div>
		 <div style="float:left" >-</div>
        <div class="ui-field" id="zhijrq2"></div></td>
		<td class="field-label"></td>
	 	<td class="field-container"><div class="ui-field" id=""></div></td>
 		<td class="field-label"></td>
		<td class="field-container"><div class="ui-field" id=""></div></td>		
      </tr>

  </table>
</div>   
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>  		    
</div>	  	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>