<!-- huxy_11467 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","435");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_435}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'fanxdh',dataType:'fanxdh',caption:'${i18n.fanxdh}',notNull:true},
                {fieldType:'fieldHidden',property:'fanxrkdh'}
	 			]
 		});
	//0013057
	$('#grid_user_${pageId}').grid({
		keyFields:['fanxrkdh','lingjbh','gongysdm','lingjmc','gongysmc'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易fanxsj
		src:'<%=request.getContextPath()%>/yichang/43501.do',
		cols:[
		{property:'fanxrkdh',caption:'${i18n.fanxrkdh}',align:'center'},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'ruksl',caption:'${i18n.fanxrksl}',align:'center'},
		{property:'danw',caption:'${i18n.danw}',align:'center'},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},
		{property:'cangkbh',caption:'${i18n.cangkbh}',align:'center'},
		{property:'fanxsj',caption:'${i18n.fanxiusj}',align:'center'}
		],
		buttons:[
	 				//F1查询 
	 				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	 			 		 //参数校验
	 			 		 if(!$('#form_user_${pageId}').form("validateParam")){
	 							return;	
	 			 		} 
	 			 		 //提交数据
	 			 		var params = $('#form_user_${pageId}').form("getFormParam");
	 			 		$('#grid_user_${pageId}').grid("setQueryParams", params);
	 			 		$('#grid_user_${pageId}').grid("load", params);
	 					return false;
	 				}},
	 				//rencong  0011832    选中
	 				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				$('#grid_user_${pageId}').grid('selected');
				return false;
			}},
			//全选
	 				{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
	 					msgClear();
	 					$('#grid_user_${pageId}').grid('selectedAll');
	 					return false;
	 				}},
	 				
 				//F2插销
 				{name:'btn_cx',caption:'${i18n.repeal}[F2]',keyboard:'F2',action:function(){
 					if(!$('#fanxdh').fieldText('validateNotNull')){
 			 			return;
 			 		}
 					var params = $('#form_user_${pageId}').form("getFormParam");
 					var records = $('#grid_user_${pageId}').grid("getSelectedAll");
 					if(records.length < 1){
                         showPromptMsg('red','${i18n.selectoneerror}');
                          return false;
                    }
 					params = params.concat(records);
 					var url = "<%=request.getContextPath()%>/yichang/43502.do";
 					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 						 	 if (results.result.response == "0000"){
	 							$('#grid_user_${pageId}').grid('parseResult',results);							
							 }
 						 }
 					});
 				}},
 				
 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
 				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'} 				
 				]
	});

	
	//加载时判断是否是回退
	$(document).ready(function(){
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
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.fanxdh}：</td>
		<td class="field-container"><div class="ui-field" id="fanxdh"></div>
		<div class="ui-field" id="fanxrkdh"></div>
		</td>		
      </tr>
  </table>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div> 
<div id='prompt'>${i18n.prompt}</div>	    		    		    
</div>		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>