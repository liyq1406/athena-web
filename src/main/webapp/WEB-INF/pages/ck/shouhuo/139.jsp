<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","139");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_139 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uth','elh','blh','wuld','danw','editor','edit_time','cangkbh','lingjbh','tch','zhuangtxx','yanssl','blscsj','yujddsj','gongysdm','chengysdm','lingjsl','yikbs'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/13901.do',
					cols:[
					    {property:'uth',caption:'${i18n.uth}',width:35},
						{property:'elh',caption:'${i18n.elh}',width:35},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:40},
						{property:'tch',caption:'${i18n.tch}',width:45},
						{property:'blscsj',caption:'${i18n.faysj}',width:38},
						{property:'yujddsj',caption:'${i18n.yujddsj}',width:38},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:40},
						{property:'chengysdm',caption:'${i18n.chengysdm}',width:40},
						{property:'wuld',caption:'${i18n.wuld}',width:30},
						{property:'dingdh',caption:'${i18n.dingdh}',width:40},
						{property:'yanssl',caption:'${i18n.yanssl}',width:35},
						//huxy_10815
						{property:'blh',caption:'${i18n.blh}',width:40},
						{property:'lingjsl',caption:'${i18n.lingjsl}',width:35},
						{property:'danw',caption:'${i18n.danw}',width:20},
						{property:'cangkbh',caption:'${i18n.cangkbh}',width:15},
						{property:'zhuangtxx',caption:'${i18n.fahtzdzt}',internation:true,width:40},
						{property:'yikbs',caption:'${i18n.yikbs}',width:30},
						{property:'editor',caption:'${i18n.username}',width:40},
						{property:'edit_time',caption:'${i18n.caozsj}',width:38}
						
				     ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					   	 	if(!$('#form_user_${pageId}').form("validateParam")){
					   	 	 $('#grid_user_${pageId}').grid('clearRecords');
								return;
							}
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 		var cangkbh=$('#cangkbh input').attr('realValue');
						    if(cangkbh == ''){
		                    	 params.push("flag=0");
		                    }
				   	 		params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
							//加载数据
							//12791
							$('#grid_user_${pageId}').grid("load",params,function(){
								$('#blh input').val('');
								$('#blh input').addClass('field-tabed').focus(); 
								$('#blh input').focus();
								$('#blh input').select();
							});
				    		return false;
					}}, //0011470/0011522                   
					{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
					var params = $('#form_user_${pageId}').form("getFormParam");
					var records = $('#grid_user_${pageId}').grid('getRecordAll');
										
					var ck = $('#cangkbh input').val()
					//V4_026
					if(ck==''){
						params.splice(1,1);
						params.push("cangkbh="+st_Cangkbh);
					}
					params=params.concat(records);
							//var params = $('#grid_user_${pageId}').grid('getSelectedAll');
							var url = "<%=request.getContextPath()%>/shouhuo/13902.do";
							$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		    if (showPromptRequestMsg(results)==true){
										//加载返回数据
					 		    }	 
					          });
			    		 return false;
			 	     }}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
		
				$('#form_user_${pageId}').form({
				    onreload:true,
					onemoredemand:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},
					    {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}'},
						{fieldType:'fieldText',property:'tch',dataType:'laiy',maxLength:'11',caption:'${i18n.tch}'},
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},
						{fieldType:'fieldText',property:'yanssj1',caption:'${i18n.yujddsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
	                    {fieldType:'fieldText',property:'yanssj2',caption:'${i18n.yujddsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
	                    {fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'10',caption:'${i18n.username}'},
	                    {fieldType:'fieldText',property:'wuld',dataType:'letter_numeric',limitedLength:'3',caption:'${i18n.wuld}'},
	                    {fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.fahtzdzt}',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/fahtzdzt.do'},
						{fieldType:'fieldText',property:'jihydm',dataType:'text',maxLength:'10',caption:'${i18n.jihy}'}
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
							<!-- 12791 -->
							<td>${i18n.blh }:</td>
							<td><div class="ui-field" id="blh"></div></td>
						    <td >${i18n.cangkbh}</td>
							<td ><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.gongysdm }:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
						</tr>
						<tr>
							<!-- 12791 -->
							<td>${i18n.chengysdm }:</td>
							<td><div class="ui-field" id="chengysdm"></div></td>							
						    <td>${i18n.lingjbh }:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.tch}:</td>
							<td><div class="ui-field" id="tch"></div></td>							
						</tr>
						<tr>
						    <td>${i18n.jihy }:</td>
							<td><div class="ui-field" id="jihydm"></div></td>
							<td>${i18n.yujddsj}:</td>
							<td><div class="ui-field" style="float:left" id="yanssj1"></div></td>
						   <td>${i18n.zhi }</td>
						   <td><div style="float:left" class="ui-field"  id="yanssj2" ></div></td>
						</tr>
						<tr>
						    <td>${i18n.fahtzdzt}:</td>
							<td><div class="ui-field"  id="zhuangt"></div></td>
						    <td>${i18n.username}:</td>
							<td><div class="ui-field"  id="caozy"></div></td>
							<td>${i18n.wuld}:</td>
							<td><div class="ui-field"  id="wuld"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	    </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>