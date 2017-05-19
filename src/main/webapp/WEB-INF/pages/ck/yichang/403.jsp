<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","403");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_403}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'changx',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.chanx}',notNull:false},
				{fieldType:'fieldText',property:'fenpqh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.fenpqh}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}',notNull:false},
				{fieldType:'fieldText',property:'shengbdh',maxLength:'10',caption:'${i18n.gongysbh}',notNull:false},
				{fieldType:'fieldText',property:'xiaohdh',dataType:'yicxhdh',caption:'${i18n.xiaohdh}',notNull:false},
				{fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.zhuangt}',internation:true,includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/zhijchulzt.do'},
				{fieldType:'fieldText',property:'shengbrq1',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shengbrq}',notNull:false},
				{fieldType:'fieldText',property:'shengbd',dataType:'letter_numeric',limitedLength:'9',limitedLength2:'13',caption:'${i18n.shengbd}',notNull:false},
				{fieldType:'fieldText',property:'shengbr',maxLength:'10',caption:'${i18n.shengbr}',notNull:false},
				{fieldType:'fieldText',property:'oper_no',maxLength:'10',caption:'${i18n.yonghm}',notNull:false},
				{fieldType:'fieldText',property:'shengbrq2',dataType:'date',maskOptions:{mask:'9999-99-99'},notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['uch','xiaohdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/40301.do',
		pageSize:'5',
		cols:[
		{property:'zhuangtxx',caption:'${i18n.zhuangt}',align:'center',internation:true,width:'40'},
  		{property:'xiaohdh',caption:'${i18n.xiaohdh}',align:'center',width:'40'},
  		{property:'shengbdh',caption:'${i18n.shengbdh}',align:'center',width:'40'},
  		{property:'zhengclsh',caption:'${i18n.zhengclsh}',align:'center',width:'40'},
  		{property:'elh',caption:'${i18n.elh}',align:'center',width:'40'},
  		{property:'pich',caption:'${i18n.pich}',align:'center',width:'40'},
  		{property:'uch',caption:'${i18n.uch}',width:'40',align:'center'},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:'40'},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:'40'},
  		{property:'shenbsl',caption:'${i18n.shenbsl}',width:50,align:'center'},
  		{property:'shengbd',caption:'${i18n.shengbd}',align:'center',width:'30'},
  		{property:'shengbr',caption:'${i18n.shengbr}',align:'center',width:'30'},
  		{property:'shengbrq',caption:'${i18n.shengbrq}',align:'center',width:'30'},
  		{property:'buh',caption:'${i18n.buh}',align:'center',width:'40'},
  		{property:'hegsl',caption:'${i18n.hegsl}',align:'center',width:'40'},
  		{property:'buhgsl',caption:'${i18n.buhgsl}',align:'center',width:'40'},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:'40'},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:'40'},
  		{property:'yuany',caption:'${i18n.yuany}',align:'center',width:'40'},
  		{property:'creator',caption:'${i18n.yonghm}',align:'center',width:'40'},
  		{property:'hegyy',caption:'${i18n.hgyy}',align:'center',width:'40'}
  		],
		buttons:[
		    //F1查询
	   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	   	 	    //参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
						return;	
		 		}
		 		var shengbrq1 = $('#shengbrq1 input').val();
		 		var shengbrq2 = $('#shengbrq2 input').val();
			  	var date1 = new Date(shengbrq1.replace(/-/g,"/"));
			 	var date2 = new Date(shengbrq2.replace(/-/g,"/"));
			  	if(date1>date2){
					 showPromptMsg('red','${i18n.diyigsjxydrg}')
					 return;
			  	   }
	 		    //提交数据
	 			var params = $('#form_user_${pageId}').form("getFormParam");
	 		 	params.push('pageSize=5');
	 			$('#grid_user_${pageId}').grid("setQueryParams", params);
	 			var url = "<%=request.getContextPath()%>/yichang/40301.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 	 if (showPromptRequestMsg(results)==true){
					     //加载返回数据
						 $('#grid_user_${pageId}').grid("parseResult",results)
				        }else{
							 $('#form_info_${pageId}').form('resetFields');
							 $('#grid_user_${pageId}').grid('clearRecords');
					   }
				 });
				 return false;
		   }}
		    //F2明细
	   	 ,{name:'detail',caption:'${i18n.mingx}[F2]',keyboard:'F2',action:function(){
	   	 	    //获取选择行
			  var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','xiaohdh');
		      if(currPandfs.length!=1){
		      	showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				var Query= $('#form_user_${pageId}').form("getFormParam");
				//存放查询条件
				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
				Query.push("zhuangtxx="+$('#zhuangt input').val());
	            //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
	            var params = $('#grid_user_${pageId}').grid('getSelectedAll');
				params.push("currentPage=1");
				//去掉List[0];
				var xiahaodanhao = "";
				for(i=0;i<params.length;i++){
					params[i]=params[i].toString().replace("list[0].","");
					var vParam = params[i].split("=");
						if (vParam[0].indexOf("xiaohdh") != -1){                   //销耗单号
							xiahaodanhao = vParam[1];
							continue;
					}
				}
				vQuery.push("xiaohdh="+xiahaodanhao);
				vQuery.push("currentPage="+currentPage);
				$('#serachKey').val(Query);
		      //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
				var url = "<%=request.getContextPath()%>/yichang/40302.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 if (results.result.response != "C_1403"){
								//加载返回数据
								var strJSON=JSON.stringify(results);
								$('#putvalue').val(strJSON);
								$("#putform").attr("action","<%=request.getContextPath()%>/yichang/P40302.do"+st_Params);
					    		document.putform.submit();
							 }else{
								 showPromptMsg('red','${i18n.selecterrorwh}');
							 }
					 }
				});
			return false;
		   }}
		  ,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				$('#grid_user_${pageId}').grid('selected');
	    		return false;
			}}
		　,{name:'back',caption:'${i18n.back}[F11]'}
          ,{name:'return',caption:'${i18n.return}[F12]'}
	]});
        //加载时判断是否是回退
		$(document).ready(function(){
			if ( $('#serachKey').val()!=""){
				//为界面查询字段赋值
				var params = $('#serachKey').val().split(",");
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("changx") != -1){                   //产线
						$('#changx input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("fenpqh") != -1){                   //分配区
						$('#fenpqh input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("lingjbh") != -1){                   //零件编号
						$('#lingjbh input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("gongysdm") != -1){                  //供应商编码
						$('#gongysdm input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("pich") != -1){                  //批次号
						$('#pich input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("shengbdh") != -1){                  //申报单号
						$('#shengbdh input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("xiaohdh") != -1){                  //消耗单号
						$('#xiaohdh input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("zhuangtxx") != -1){                  //状态
						$('#zhuangt input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("zhuangt") != -1){                  //状态
						$('#zhuangt input').attr('realValue',vParam[1]);
						continue;
					}
					if (vParam[0].indexOf("shengbrq1") != -1){                  //申报日期1
						$('#shengbrq1 input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("shengbrq2") != -1){                  //申报日期2
						$('#shengbrq2 input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("shengbd") != -1){                  //申报点
						$('#shengbd input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("shengbr") != -1){                  //申报人
						$('#shengbr input').val(vParam[1])
						continue;
					}
					if (vParam[0].indexOf("oper_no") != -1){                  //用户名
						$('#oper_no input').val(vParam[1])
						continue;
					}
				}
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载列表数据
				$('#grid_user_${pageId}').grid("load",params);
				$('.hidden-item').show();     //显示序号
			}
		});
	$(document).keyboardsupport({});
});

</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始--> 
<input id="serachKey" name="serachKey" type="Hidden"></input>
<div id="title"></div> 
<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="hidden"></input>
</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout"> 	
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.chanx}：</td>
		<td class="field-container"><div class="ui-field" id="changx"></div></td>
		<td class="field-label">${i18n.fenpqh}：</td>
		<td class="field-container"><div class="ui-field" id="fenpqh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
		<td class="field-label">${i18n.shengbdh}：</td>
		<td class="field-container"><div class="ui-field" id="shengbdh"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.xiaohdh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>
		<td class="field-label">${i18n.zhuangt}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangt"></div></td>
		<td class="field-label">${i18n.shengbrq}：</td>
		<td class="field-container" ><div style="float:left" class="ui-field" id="shengbrq1"></div><div style="float:left" >${i18n.zhi}</div><div class="ui-field" id="shengbrq2" style="float:left"></div></td>
      </tr>
         <tr>
		<td class="field-label">${i18n.shengbd}：</td>
		<td class="field-container"><div class="ui-field" id="shengbd"></div></td>
		<td class="field-label">${i18n.shengbr}：</td>
		<td class="field-container"><div class="ui-field" id="shengbr"></div></td>
		<td class="field-label">${i18n.yonghm}：</td>
		<td class="field-container"><div class="ui-field" id="oper_no"></div></td>
      </tr>
  </table>
</div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>    
<div id='prompt'>${i18n.prompt}</div>
</div>	    		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>