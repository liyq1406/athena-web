<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","129");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_129}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
	            $('.hidden-item').hide(); //隐藏xuh
				$('#form_user_${pageId}').form({
					onreload:true,
				    onemoredemand:true,
					fields:[
					{fieldType:'fieldText' , property:'yaohlh',dataType:'yaohlh',caption:'${i18n.baozdykh}'},
					{fieldType:'fieldText' , property:'peislb',caption:'${i18n.peislb}',dataType:'letter_numeric',limitedLength:'4'},	
					{fieldType:'fieldText' , property:'blh',dataType:'blh',caption:'${i18n.bldh}',dataType:'text',maxLength:'10'},
					{fieldType:'fieldText' , property:'xiehzt',caption:'${i18n.xiehd}',dataType:'letter_numeric',limitedLength:'6'},
					{fieldType:'fieldText' , property:'qissj',caption:'${i18n.qissj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
					{fieldType:'fieldText' , property:'zhongzsj',caption:'${i18n.zhongzsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
					{fieldType:'fieldText' , property:'xuh',biaos:'enter',caption:'${i18n.xuh}'},
					{fieldType:'fieldSelect' , property:'zhuangt',caption:'${i18n.zhuangt}',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/yszhuangt.do'},
					{fieldType:'fieldText' , property:'chengysdm',caption:'${i18n.chengysdm}'}
					
					]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
					keyFields:['blh','uth','chengysdm','cangkdm'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/12901.do',
					cols:[
					{property:'blh',caption:'${i18n.bldh}',dataType:'blh'},
					{property:'uth',caption:'${i18n.uth}',dataType:'uth'},
					{property:'chengysdm',caption:'${i18n.chengysdm}',dataType:'chengysdm'},
					{property:'cangkbh',caption:'${i18n.cangkdm}',dataType:'cangkdm'},
					{property:'blscsj',caption:'${i18n.blshengcsj}'},
					{property:'yanssj',caption:'${i18n.yanssj}'},
					{property:'yanssl',caption:'${i18n.yanssl}'},
					{property:'lingjzl',caption:'${i18n.lingjzl}'}
				]
				,buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
						 //参数校验
						$("#xuh input").val('');
						$('#grid_user_${pageId}').grid('clearRecords');
				 		if(!$('#form_user_${pageId}').form("validateParam")){
	 			          return;
		 		          }
		 		        var starttime=new Date(($('#qissj input').val()).replace(/-/g,"/"));
                        var endtime=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
                        if(endtime<starttime){
                              showPromptMsg('red','${i18n.datetime_invalid}');
                               return false;
                          }
						var params = $('#form_user_${pageId}').form("getFormParam");
						params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						$('#serachKey').val(params);
						var url = "<%=request.getContextPath()%>/shouhuo/12901.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 			       if(results.result.response == '0001'){
							 		   //加载返回数据
									   $('#grid_user_${pageId}').grid('parseResult',results);
									   if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
																   
									   $('.hidden-item').show();     //显示序号
									  }
					           }
				         });
		    		return false;
		          }}
		            ,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
               
		 //点击序号回车事件
		 $('#xuh').bind('enter',function(event){
			 	var xuh=$("#xuh input").val();
 				var params = $('#grid_user_${pageId}').grid('getSelectedByRowNum',xuh);
 				if (params.length < 1){
		 			showPromptMsg('red','${i18n.selectederror}')
					return false;
		 		}
 				//去掉List[0];
				for(i=0;i<params.length;i++){
					params[i]=params[i].toString().replace("list[0].","");
				}
 				params.push("currentPage=1");
 				   var url = "<%=request.getContextPath()%>/shouhuo/12903.do";
 				   
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
								//加载返回数据
								  if(results.result.response != 'C_1403'){
									var strJSON=JSON.stringify(results.result);
									var strJSON1=JSON.stringify(results.result1);
									$('#putvalue').val(strJSON);
									$('#putvalue1').val(strJSON1);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P12901.do"+st_Params);
		    			    		document.putform.submit();
		    			    	 }

							 }
				 	});
				 	
			});
          //加载时判断是否是回退
			$(document).ready(function(){
				if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("blh") != -1){                   //BL号
							$('#blh input').val(vParam[1])
							continue;
						} else if (vParam[0].indexOf("xiehzt") != -1){           //卸货站台
							$('#xiehzt input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("uth") != -1){           //UT号
							$('#uth input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("qissj") != -1){           //起始时间
							$('#qissj input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("zhongzsj") != -1){           //终止时间
							$('#zhongzsj input').val(vParam[1])
							continue;
						} else if(vParam[0].indexOf("peislb") != -1){			//配送类别
							$('#peislb input').val(vParam[1])  
							continue;
						} else if(vParam[0].indexOf("yaohlh") != -1){			//要货令号
							$('#yaohlh input').val(vParam[1])
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
	<input id="serachKey" name="serachKey" type="Hidden"></input>
	<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="hidden"></input>
			<input id="putvalue1" name="putvalue1" type="hidden"></input>
	</form> 
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td>${i18n.bldh }</td>
							<td><div class="ui-field" id="blh" ></div></td>
							<td>${i18n.xiehd}</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td>${i18n.shijd}</td>
							<td><div class="ui-field" style="float:left" id="qissj"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="zhongzsj" ></div></td>
						</tr>
						<tr>
							<td>${i18n.baozdykh}</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td>${i18n.peislb}</td>
							<td><div class="ui-field" id="peislb"></div></td>
							<td>${i18n.zhuangt}</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							
						</tr>
						<tr class='hidden-item' id="xuh_div">
							<td colspan="4"></td>
							<td style="align:right">${i18n.xuh}</td>
							<td style="align:left"><div class="ui-field" id="xuh" style="align:center"></div></td>
						</tr>
						
					</tbody>
				</table>
			</div>
            <div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>