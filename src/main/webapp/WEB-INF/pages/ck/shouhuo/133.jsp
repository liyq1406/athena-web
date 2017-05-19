<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","133");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_133}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				  onreload:true,
				  onemoredemand:true,
					fields:[
						{fieldType:'fieldText' , property:'lingjbh',caption:'${i18n.lingjbh}',biaos:'enter',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldSelect' , property:'gongysdm',caption:'${i18n.gongysdm}'},
						{fieldType:'fieldSelect' , property:'peislb',caption:'${i18n.peislb}',onclose:'xiehztValue()'},
						{fieldType:'fieldSelect' , property:'paixfs',caption:'${i18n.paixfs}',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/paixfs.do'},
						{fieldType:'fieldText' , property:'shangxsj1',caption:'${i18n.qissj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:true},
						{fieldType:'fieldText' , property:'shangxsj2',caption:'${i18n.zhongzsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:true},
						{fieldType:'fieldText' , property:'xiehd',caption:'${i18n.xiehzt}',dataType:'letter_numeric',limitedLength:'6'}
					]}); 
                // grid
               $('#grid_user_${pageId}').grid({
					keyFields:['baozdykh'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/13301.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}',width:50},
						{property:'weiz',caption:'${i18n.weizh}',width:50},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:50},
						{property:'peislb',caption:'${i18n.peislb}',width:50},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
						{property:'gongysmc',caption:'${i18n.gongysmc}',width:50},
						{property:'shangxsj',caption:'${i18n.shangxsj}',width:50},
						{property:'ruksj',caption:'${i18n.yanssj}',width:50},
						{property:'yansy',caption:'${i18n.yansy}',width:50},
						{property:'lingjsl',caption:'${i18n.lingjsl}',width:50},
						{property:'danw',caption:'${i18n.danw}'}
				    ]
				,buttons:[
				 {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				        $('#grid_user_${pageId}').grid('clearRecords');
	                   //参数校验
	                    $('#grid_user_${pageId}').grid('clearRecords');
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
		                  if($('#shangxsj1 input').val()== ''&& $('#shangxsj2 input').val()==''){
		                       showPromptMsg('red','${i18n.sjqj}');
		                    return  false;
		                    }
						   params.push("currentPage=1");
						   //设置分页条件
						   $('#grid_user_${pageId}').grid("setQueryParams", params);
						   	var  url = "<%=request.getContextPath()%>/shouhuo/13301.do";
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
						<tr >
							<td align="right">${i18n.paixfs}</td>
							<td align="left"><div class="ui-field" id="paixfs" ></div></td>
							<td align="right">${i18n.shangxsjqj}</td>
							<td align="left" ><div style="float:left" class="ui-field" id="shangxsj1"></div><div style="float:left" >——</div><div style="float:left" class="ui-field"  id="shangxsj2" ></div> </td>
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