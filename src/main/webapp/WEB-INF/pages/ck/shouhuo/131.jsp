<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","131");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_131}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
						{fieldType:'fieldText' , property:'lingjbh',caption:'${i18n.lingjbh}',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText' , property:'gongysdm',caption:'${i18n.gongysdm}',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText' , property:'peislb',caption:'${i18n.peislb}',dataType:'letter_numeric',limitedLength:'4'},
						{fieldType:'fieldSelect' , property:'paixfs',caption:'${i18n.paixfs}',internation:true,src:'<%=request.getContextPath()%>/common/paixfs.do'},
						{fieldType:'fieldText' , property:'zhengclsh1',caption:'${i18n.qissj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText' , property:'zhengclsh2',caption:'${i18n.zhongzsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText' , property:'xiehd',caption:'${i18n.xiehzt}',dataType:'letter_numeric',limitedLength:'10'}
					]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
					keyFields:['baozdykh'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/13101.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}',dataType:'baozdykh'},
						{property:'weizh',caption:'${i18n.weizh}',dataType:'weizh'},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}',dataType:'zhengclsh'},
						{property:'lingjbh',caption:'${i18n.lingjbh}',dataType:'lingjbh'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',dataType:'lingjmc'},
						{property:'gongysdm',caption:'${i18n.gongysdm}',dataType:'gongysdm'},
						{property:'gongysmc',caption:'${i18n.gongysmc}',dataType:'gongysmc'},
						{property:'shangxsj',caption:'${i18n.shangxsj}',dataType:'shangxsj'},
						{property:'lingjsl',caption:'${i18n.lingjsl}',dataType:'lingjsl'},
						{property:'danw',caption:'${i18n.danw}',dataType:'danw'}
				   ]
				   ,buttons:[
				   //查询EL F1
				    {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					     $('#grid_user_${pageId}').grid('clearRecords');
		                    //参数校验
				 		 if(!$('#form_user_${pageId}').form("validateParam")){
					            return;
		 		           }
					  	 var params = $('#form_user_${pageId}').form("getFormParam");	
					     var starttime=new Date(($('#zhengclsh1 input').val()).replace(/-/g,"/"));
		                 var endtime=new Date(($('#zhengclsh2 input').val()).replace(/-/g,"/"));
		                 if(endtime<starttime){
			                  showPromptMsg('red','${i18n.datetime_invalid}');
			                   return false;
		                    }
						 params.push("currentPage=1");
						 //设置分页条件
						  $('#grid_user_${pageId}').grid("setQueryParams", params);
						   var url = "<%=request.getContextPath()%>/shouhuo/13101.do";
						   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
									//加载返回数据
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
							<td align="right">${i18n.lingjbh }</td>
							<td align="left"><div class="ui-field" id="lingjbh" ></div></td>
							<td align="right">${i18n.gongysdm}</td>
							<td align="left"><div class="ui-field" id="gongysdm"></div></td>
							<td align="right">${i18n.peislb}</td>
							<td align="left"><div class="ui-field" id="peislb"></div></td>
						</tr>
						<tr >
							<td align="right">${i18n.paixfs}</td>
							<td align="left"><div class="ui-field" id="paixfs" ></div></td>
							<td align="right">${i18n.zhengclsh}</td>
							<td align="left" ><div style="float:left" class="ui-field" id="zhengclsh1"></div><div style="float:left" >——</div><div style="float:left" class="ui-field"  id="zhengclsh2" ></div> </td>
							<td align="right">${i18n.xiehzt}</td>
							<td align="left"><div class="ui-field" id="xiehd"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>