<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","108");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_108 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['jusdh','zhuangt'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/10801.do',
					cols:[
					{property:'cangkbh',caption:'${i18n.cangkbh}'},
					{property:'jusdh',caption:'${i18n.jusdh}'},
			  		{property:'chengysdm',caption:'${i18n.chengysdm}'},
					{property:'chengysmc',caption:'${i18n.chengysmc}'},
				 	{property:'kach',caption:'${i18n.tch}'},
					{property:'kacsj',caption:'${i18n.kacsj}'},
					{property:'create_time',caption:'${i18n.shengcsj}'},
					{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true}	
				],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 			if(!$('#form_user_${pageId}').form("validateParam")){
								return;
							}
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 	    var starttime=new Date(($('#qissj input').val()).replace(/-/g,"/"));
                            var endtime=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
                            if(endtime<starttime){
                                showPromptMsg('red','${i18n.datetime_invalid}');
                                return false;
                              }
                            params.push("currentPage=1");
     						//设置分页条件
     						$('#grid_user_${pageId}').grid("setQueryParams", params);
     						//加载数据
     						$('#grid_user_${pageId}').grid("load",params);
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
						{fieldType:'fieldText',property:'jusdh',dataType:'jusdh',caption:'${i18n.jusdh}'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}'},
						{fieldType:'fieldText',property:'kach',dataType:'laiy',maxLength:'11',caption:'${i18n.kach}'},
						{fieldType:'fieldText',property:'xiehd',dataType:'text',maxLength:'6',caption:'${i18n.shouhzt}'},
						{fieldType:'fieldText',property:'qissj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.qissj}'},
						{fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.zhongzsj}'},
						{fieldType:'fieldSelect' , property:'shiftb',caption:'${i18n.shiftb}',includeNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
						{fieldType:'fieldSelect',property:'zhuangt',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/juszt.do',caption:'${i18n.zhuangt}'}
						
					]
				});

				$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.jusdh }</td>
							<td><div class="ui-field" id="jusdh"></div></td>
							<td>${i18n.chengysdm }</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
							<td>${i18n.kach }</td>
							<td><div class="ui-field" id="kach"></div></td>
							<td>${i18n.shouhzt }</td>
							<td><div class="ui-field" id="xiehd"></div></td>
						</tr>
						<tr>
							<td>${i18n.chuangjqsrq }</td>
							<td><div style="float:left" class="ui-field" id="qissj"></div><div style="float:left;">&nbsp;-&nbsp; </div><div style="float:left;" class="ui-field" id="zhongzsj" ></div></td>
							<td>${i18n.zhuangt }</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
						</tr>
						<tr>
							<td>${i18n.shiftb}</td>
							<td><div class="ui-field" id="shiftb"></div>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		    <div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>