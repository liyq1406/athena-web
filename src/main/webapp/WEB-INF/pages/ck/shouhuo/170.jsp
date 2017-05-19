<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","170");%>
<%long currTime = new java.util.Date().getTime();%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_170}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
			    onemoredemand:true,
		 		fields:[
				{fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangkbh}',value:st_Cangkbh}, 	
				{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.biaoqh}'},
				{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjbh}',dataType:'letter_numeric',limitedLength:'10'},
				{fieldType:'fieldText',property:'lingjxlh',caption:'${i18n.lingjxlh}',dataType:'letter_numeric',limitedLength:'13',limitedLength2:'14'},
				{fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.zhuangtbq}',notNull:false,internation:true,includeNull:true,
					src:'<%=request.getContextPath()%>/common/zhuangtbq.do'},
				{fieldType:'fieldText',property:'qissj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.daysj}',width:71,onchange:"stuffTime()"}, 
				{fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.daysj}',width:71,onchange:"judeZhongzsj()"},
				{fieldType:'fieldText',property:'caozy' ,dataType:'caozy',caption:'${i18n.dayr}'}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				id:'grid_user_${pageId}',
				keyFields:['ush','lingjxlh'],
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/shouhuo/17001.do',
				cols:[
					{property:'ush',caption:'${i18n.biaoqh}'},
					{property:'lingjbh',caption:'${i18n.lingjbh}'},
					{property:'lingjsl',caption:'${i18n.lingjsl}'},
					{property:'baozxh',caption:'${i18n.baozxh}'},
					{property:'shifwy',caption:'${i18n.shifwylj}'},
					{property:'zhuangt',caption:'${i18n.zhuangt}',internation:true},
					{property:'shifsx',caption:'${i18n.shifsx}'},
					{property:'daysj',caption:'${i18n.daysj}'},
					{property:'dayr',caption:'${i18n.dayr}'}
			     ],
			buttons:[
		   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
		   	     	$('#grid_user_${pageId}').grid('clearRecords');
				 	if(!$('#form_user_${pageId}').form("validateParam")){
				 			return;
				 		}
				 	
					//验证打印开始日期必须小于打印结束日期 hzg 2014.10.16 mantis:0010601
						if ($("#qissj input").val()!="" && $("#zhongzsj input").val()!=""){
							var qissj =new Date(($("#qissj input").val()).replace(/-/g,"/")); //起始日期 （将格式2014-10-12转换成2014/10/12）
							var jessj =new Date(($("#zhongzsj input").val()).replace(/-/g,"/"));//结束日期（将格式2014-10-22转换成2014/10/22）
							var qissjValue = qissj.valueOf(); //valueOf()将日期换算为秒级
							var _qssjAdd = new Date(qissjValue + 6*24*60*60*1000); //一周时间（选择时间往后推7天）
							if(qissj > jessj){
								$('#grid_user_${pageId}').grid('clearRecords');
								showPromptMsg('red','${i18n.daysj}'+$.sdcui.resource.i18n['C_fanwbf'])
								return;
							}
							if(jessj > _qssjAdd){
								if(""==$("#ush input").val() && ""==$("#lingjxlh input").val()){ 
								$('#grid_user_${pageId}').grid('clearRecords');
								showPromptMsg('red','${i18n.daysj}'+$.sdcui.resource.i18n['C_yzfanw'])
								return;
								}
							}
					 	}
				 	
			 		var params = $('#form_user_${pageId}').form("getFormParam");
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					$('#serachKey').val(params);
					params.push("currentPage=1");
					//设置分页条件
			   	 	 var url = "<%=request.getContextPath()%>/shouhuo/17001.do";
			 		   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							 //加载grid
							 $('#grid_user_${pageId}').grid('parseResult',results);
						    }
					  });
		    		return false;
				}}
				,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
					$('#grid_user_${pageId}').grid('selected');
		    		return false;
				}}
		   	 	,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
		   	 		$('#grid_user_${pageId}').grid('selectedAll');
		    		return false;
				}}
				,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						var params =$('#grid_user_${pageId}').grid('getQueryParams');  
					    var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
					    params = params.concat(records);
						var url = "<%=request.getContextPath()%>/shouhuo/17002.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		    if (showPromptRequestMsg(results)==true){
									//加载返回数据
									$('#grid_user_${pageId}').grid('parseResult',results);
				 		    }	 
				          });
		    		 return false;
			 	   }}
				,{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
					var params1 = $('#form_user_${pageId}').form("getFormParam");
					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
					if(params.length != 2){
						$('#prompt span').css('color','red').text("${i18n.selecterror}");
						return false;
					}
					 for(i=0;i<params.length;i++){
	                            params[i]=params[i].toString().replace("list[0].","");
	                        }
					params = params.concat(params1);
					var url = "<%=request.getContextPath()%>/shouhuo/17003.do";
					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						  if (showPromptRequestMsg(results)==true){
						       //加载返回数据
								  if(results.result.response != 'C_1403'){
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P17001.do"+st_Params);
		    			    		document.putform.submit();
		    			    	 }
						      }
					 });
		    		return false;
				}}
				,{name:'scgqbq',caption:'${i18n.scgqbq}[F8]',keyboard:'F8',action:function(){
				//打开提示框是否删除
				if(confirm($.sdcui.resource.i18n['C_delete'])){
				    var params = $('#form_user_${pageId}').form("getFormParam");
					var url = "<%=request.getContextPath()%>/shouhuo/17004.do";
					   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						  if (showPromptRequestMsg(results)==true){

							 }
			         });
			       }
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
						if (vParam[0].indexOf("ush") != -1){                   //us号
							$('#ush input').val(vParam[1])
							continue;
						} else if (vParam[0].indexOf("lingjbh") != -1){           //零件编号
							$('#lingjbh input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("lingjxlh") != -1){           //零件序列号
							$('#lingjxlh input').val(vParam[1])
							continue;
						}
					}
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
					
				}
			});
			
		 	$(document).keyboardsupport({});
	
	
		});	
			
      	/*	 //输入“标签号”和“零件序列号”中任意一个时“打印时间段”条件文本框清空置灰
	 
      		 
			function xiansbq(){
				if("" == $('#ush input').val() && "" == $('#lingjxlh input').val()){
					$('#qissj input').val();
					$('#zhongzsj input').val();
					$('#qissj input').attr("disabled",false);
					$('#zhongzsj input').attr("disabled",false);
				}else{
					$('#qissj input').attr("disabled",true);
					$('#zhongzsj input').attr("disabled",true);
				}
			}
			*/
			//输入起始时间，自动填充终止时间
			function stuffTime(){
			//起始时间的日
			//终止时间
				var start = new Date(($('#qissj input').val()).replace(/-/g,"/")).valueOf();
				var end = new Date(start + 1000*60*60*24*6); 
				m =(end.getMonth() + 1),
				d = end.getDate();
				
				var qissj = $('#qissj input').val();
				if(qissj==''){
				   $('#zhongzsj input').val('');				    
				}else{
				   $('#zhongzsj input').val(end.getFullYear() + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d)) ;					
				}
				
				
			}
			//修改终止时间      时间只能大 不能小
			function judeZhongzsj(){
				var start = new Date(($('#qissj input').val()).replace(/-/g,"/")).valueOf();
				//自动填充的终止时间
				var end = start + 1000*60*60*24*6;
				var etime = new Date(($('#zhongzsj input').val()).replace(/-/g,"/")).valueOf();
				if(etime < start || etime > end){
					showPromptMsg('red','${i18n.C_fanwbf}');
				}
			}
			//页面加载时  自动填充时间
			$(function (){
				var ntime = new Date();
				var start = new Date(ntime.getTime() - 1000*60*60*24*6);
				/*
				var mn =ntime.getMonth() + 1;
				var dn = ntime.getDate();
				$('#zhongzsj input').val(ntime.getFullYear() + '-' + (mn < 10 ? '0' + mn : mn) + '-' + (dn < 10 ? '0' + dn : dn)) ;
				var ms =start.getMonth() + 1;
				var ds = start.getDate();
				$('#qissj input').val(start.getFullYear() + '-' + (ms < 10 ? '0' + ms : ms) + '-' + (ds < 10 ? '0' + ds : ds)) ;
				*/
				$('#zhongzsj input').val(changeType (ntime)) ;
				$('#qissj input').val(changeType (start)) ;
				
			});
			
			//日期格式转换 将默认的日期转换成yyyy-MM-dd
			function changeType(time){
				var m =time.getMonth() + 1;
				var d = time.getDate();
				return (time.getFullYear() + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d));
			}
			
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
				<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="hidden"></input>
	        </form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.biaoqh}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lingjxlh}:</td>
							<td><div class="ui-field" id="lingjxlh"></div></td>
						</tr>
						<tr>
							<td>${i18n.zhuangtbq}:</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
								<td>${i18n.daysj}:</td>
							<td><div class="ui-field" id="qissj"></div>
							<div style="float:left">${i18n.zhi}</div><div class="ui-field" id="zhongzsj"></div></td>
							<td>${i18n.dayr}:</td>
							<td><div class="ui-field" id="caozy"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>