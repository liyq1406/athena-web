<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","135");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_135}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
					{fieldType:'fieldText' , property:'blh',caption:'${i18n.blh}',dataType:'text',maxLength:'10',notNull:true},
					{fieldType:'fieldLabel' ,property:'chengysdm',caption:'${i18n.chengysdm}'},
					{fieldType:'fieldLabel' ,property:'xiehzt',caption:'${i18n.xiehzt}'}
					]
				}); 
                //grid
               $('#grid_user_${pageId}').grid({
					keyFields:['lingjbh'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/13501.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}'},
						{property:'weiz',caption:'${i18n.weizh}'},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'uaxh',caption:'${i18n.baozxh}'},
						{property:'uarl',caption:'${i18n.baozrl}'},
						{property:'yaohlscsj',caption:'${i18n.yaohlscsj}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'danw',caption:'${i18n.danw}'}
					],
				buttons:[
	                      {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 	    $('#grid_user_${pageId}').grid('clearRecords');
						    if(!$('#form_user_${pageId}').form("validateParam")){
	 			                return;
		 		              }
							var params = $('#form_user_${pageId}').form("getFormParam");
							params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
							   var  url = "<%=request.getContextPath()%>/shouhuo/13501.do";
							   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
									 if (showPromptRequestMsg(results)==true){
										//加载返回数据
										$('#xiehzt span').html(results.result.parameter.xiehzt);
										$('#chengysdm span').html(results.result.parameter.chengysdm);
										$('#grid_user_${pageId}').grid('parseResult',results);
										 if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
									 }
							 });
					    		return false;  	 
						 }}
						 ,{name:'back',caption:'${i18n.back}[F11]'}
			             ,{name:'return',caption:'${i18n.return}[F12]'}
					    ]}); 
	    
			  $(document).keyboardsupport({});
		});
		</script>
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td align="right">${i18n.blh }</td>
							<td align="left"><div class="ui-field" id="blh" ></div></td>
							<td align="right">${i18n.xiehzt}</td>
							<td align="left"><div class="ui-field" id="xiehzt"></div></td>
							<td align="right">${i18n.chengysdm}</td>
							<td align="left"><div class="ui-field" id="chengysdm"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}" class='hidden-item'></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>