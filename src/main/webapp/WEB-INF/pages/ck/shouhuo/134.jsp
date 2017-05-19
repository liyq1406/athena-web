<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","134");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_134}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
			    onreload:true,
				onemoredemand:true,
					fields:[
						{fieldType:'fieldText' , property:'lingjbh',biaos:'enter',caption:'${i18n.lingjbh}',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldSelect' , property:'gongysdm',caption:'${i18n.gongysdm}'},
						{fieldType:'fieldSelect' , property:'peislb',caption:'${i18n.peislb}',onclose:'xiehztValue()'},
						{fieldType:'fieldText' , property:'shangxsj1',caption:'${i18n.qissj}',notNull:true,dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText' , property:'shangxsj2',caption:'${i18n.zhongzsj}',notNull:true,dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText' , property:'xiehd',caption:'${i18n.xiehzt}',dataType:'letter_numeric',limitedLength:'6'},
						{fieldType:'fieldText' , property:'chengysdm',caption:'${i18n.chengysdm}',dataType:'letter_numeric',limitedLength:'10'}
						
					]}); 
                // grid
               $('#grid_user_${pageId}').grid({
					keyFields:['lingjbh'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/13401.do',
					cols:[
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						//{property:'lingjxh',caption:'${i18n.lingjxh}'},
						{property:'peislb',caption:'${i18n.peislb}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'danw',caption:'${i18n.danw}'}
				]
			,buttons:[
				 {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				    $('#grid_user_${pageId}').grid('clearRecords');	
                     //参数校验
			 		 if(!$('#form_user_${pageId}').form("validateParam")){
 			            return;
	 		          }
					  var params = $('#form_user_${pageId}').form("getFormParam");
					  var starttime=new Date(($('#shangxsj1 input').val()).replace(/-/g,"/"));
	                  var endtime=new Date(($('#shangxsj2 input').val()).replace(/-/g,"/"));
	                  if(endtime<starttime){
		                   showPromptMsg('red','${i18n.datetime_invalid}');
		                   return false;
	                    }
					    params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
					   var url = "<%=request.getContextPath()%>/shouhuo/13401.do";
					    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
									 if (showPromptRequestMsg(results)==true){
										//加载返回数据
										$('#grid_user_${pageId}').grid('parseResult',results)
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
		  //零件键盘事件
		   $('#lingjbh').bind('enter',function(event){
		   if(!$('#lingjbh').fieldText("validate")){
					     return;
			 }
		     var  lingjbh = $('#lingjbh input').val();
		     $('#gongysdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/lingjgys.do'+st_Params+'&lingjbh='+lingjbh);
		     $('#peislb').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/lingjpslb.do'+st_Params+'&lingjbh='+lingjbh);
		   });

		  $(document).keyboardsupport({});
		});
		
		 function xiehztValue(){
		   var params = [];
		   var peislb =$('#peislb input').val();
		   if(peislb == ''){
		    return false;
		   }
		   params.push("peislb="+peislb );
		   params.push("cangkbh="+st_Cangkbh);
		   params.push("usercenter="+'${userCenter}');
		   var url = "<%=request.getContextPath()%>/shouhuo/13402.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 	if(results.result.xiehzt != null){
					    $('#xiehd input').val(results.result.xiehzt);
					}
					msgClear();
			    });
			
			  
		   }
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
						<tr>
						    <td align="right">${i18n.xiehzt}</td>
							<td align="left"><div class="ui-field" id="xiehd"></div></td>
							<td align="right">${i18n.shangxsjqj}</td>
							<td align="left" ><div style="float:left" class="ui-field" id="shangxsj1"></div><div style="float:left" >——</div><div style="float:left" class="ui-field"  id="shangxsj2" ></div> </td>
							<td align="right">${i18n.chengysdm}</td>
							<td align="left"><div class="ui-field" id="chengysdm"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>