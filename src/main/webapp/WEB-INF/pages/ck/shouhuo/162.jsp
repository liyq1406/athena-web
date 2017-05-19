<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","162");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_162 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			$('#grid_user_${pageId}').grid({
				    keyFields:['uah'],
					id:'grid_user_${pageId}',
					//showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/15002.do',
					cols:[
						{property:'cangkbh',caption:'${i18n.cangkbh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'peislx',caption:'${i18n.peislb}'},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}'},
						{property:'lingjsl',caption:'${i18n.shenbsl}'},
						{property:'creator',caption:'${i18n.shengbr}'},
						{property:'create_time',caption:'${i18n.shengbrq}'}
				      ],
				buttons:[
						{name:'submit',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
							$('#grid_user_${pageId}').grid('clearRecords');
							if(!$('#form_user_${pageId}').form("validateParam")){
							     return;
						         }
						     var starttime=new Date(($('#shengbks input').val()).replace(/-/g,"/"));
				              var endtime=new Date(($('#shengbjs input').val()).replace(/-/g,"/"));
				              if(endtime<starttime){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                   return false;
				                    }
						    var params = $('#form_user_${pageId}').form("getFormParam");
						    params.push('currentPage=1');
						    //设置分页条件
						    $('#grid_user_${pageId}').grid("setQueryParams", params);
	                        $('#grid_user_${pageId}').grid("load",params);
					         return false;
						}}
						,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							if(!$('#form_user_${pageId}').form("validateParam")){
							     return;
						         }
						    var params = $('#form_user_${pageId}').form("getFormParam");
						    params.push("flag=1");
                             var  url = "<%=request.getContextPath()%>/shouhuo/15002.do";
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 
									  }
						    });
				    		return false;  							
						}}
					   ,{name:'back',caption:'${i18n.back}[F11]'}
			           ,{name:'return',caption:'${i18n.return}[F12]'}
			          ]
				   });
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
					    {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}'},
						{fieldType:'fieldText',property:'zhengclsh',dataType:'letter_numeric',limitedLength:'9',caption:'${i18n.zhengclsh}'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.chengysdm}'},
						{fieldType:'fieldText',property:'peislx',dataType:'letter_numeric',limitedLength:'4',caption:'${i18n.peislb}'},
						
						{fieldType:'fieldText',property:'creator',dataType:'laiy',maxLength:'11',caption:'${i18n.shengbr}'},
						{fieldType:'fieldText',property:'shengbks',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.shengbrq}'},
						{fieldType:'fieldText',property:'shengbjs',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.shengbrq}'}
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
						    <td>${i18n.cangkbh}</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
						    <td>${i18n.zhengclsh}</td>
							<td><div class="ui-field" id="zhengclsh"></div></td>
							<td>${i18n.peislb}</td>
							<td><div class="ui-field" id="peislx"></div></td>
							<td>${i18n.shengbr}</td>
							<td><div class="ui-field" id="creator"></div></td>
							
						</tr>
						<tr>
							<td>${i18n.shengbrq}:</td>
							<td><div class="ui-field" style="float:left" id="shengbks"></div></td>
							<td>${i18n.zhi}</td>
							<td><div style="float:left" class="ui-field"  id="shengbjs" ></div> </td>
					   </tr>
					</tbody>
				</table>
			</div>
			 <div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	 </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>