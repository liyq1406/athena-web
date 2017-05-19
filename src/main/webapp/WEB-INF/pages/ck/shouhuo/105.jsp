<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","105");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_105 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		 //V4_028
		 
		  Date.prototype.format = function(format){
	        var o = {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
	        }
	        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	        (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	        for(var k in o)if(new RegExp("("+ k +")").test(format))
	        format = format.replace(RegExp.$1,
	        RegExp.$1.length==1 ? o[k] :
	        ("00"+ o[k]).substr((""+ o[k]).length));
	        return format;
         }
         //0012436
	     var newdate=new Date();
         var curr=newdate.format('yyyy-MM-dd hh:mm:ss');
         var agocurr=new Date(newdate.getTime() - 1000 * 60 * 60 * 24 *0.5).format('yyyy-MM-dd hh:mm:ss');
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['jusgzdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true,
					src:'<%=request.getContextPath()%>/shouhuo/10501.do',
					cols:[
					{property:'jusdh',caption:'${i18n.jusdh}',width:50},
					{property:'jusgzdh',caption:'${i18n.genzdh}',width:50},
			  		{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
			  		{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
			  		{property:'jusljs',caption:'${i18n.jussl}',width:50},
			  		{property:'jusyy',caption:'${i18n.jusyy}',width:50},
			  		{property:'chengysdm',caption:'${i18n.chengysdm}',width:70},
			  		{property:'chengysmc',caption:'${i18n.chengysmc}',width:70},
			  		{property:'gongysdm',caption:'${i18n.gongysdm}',width:70},
			  		{property:'blh',caption:'${i18n.blh}',width:50},
			  		{property:'uth',caption:'${i18n.uth}',width:50},
			  		{property:'xiehd',caption:'${i18n.xiehzt}',width:50},
			  		{property:'zhuangt',caption:'${i18n.jusgzdzt}',internation:true,width:50},
			  		{property:'jsztxx',caption:'${i18n.juszt}',internation:true,width:50},
			  		{property:'caozy',caption:'${i18n.caozy}',width:50},
			  		{property:'caozsj',caption:'${i18n.shengcsj}',width:70},
			  		{property:'shijljbh',caption:'${i18n.shijljbh}',width:50}
				],
				buttons:[
			   	 	{name:'select',caption:'${i18n.jusgzdcx}[F1]',keyboard:'F1',action:function(){
			   	 		if(!$('#form_user_${pageId}').form("validateParam")){
							$('#grid_user_${pageId}').grid('clearRecords');
	 								return;	
						}
					//验证开始入库日期必须小于结束入库日期 V4_028
				     if ($("#zhijrq1 input").val()!="" && $("#zhijrq2 input").val()!=""){
					     var dRukkssj=new Date(($('#zhijrq1 input').val()).replace(/-/g,"/"));
		                 var dRukjssj=new Date(($('#zhijrq2 input').val()).replace(/-/g,"/"));
					     if(dRukkssj > dRukjssj){
						  $('#grid_user_${pageId}').grid('clearRecords');
						  showPromptMsg('red','${i18n.rukrq}'+$.sdcui.resource.i18n['C_fanwbf'])
						  return;
					}
				    }else if (($("#zhijrq1 input").val() =="" && $("#zhijrq2 input").val()!="") || ($("#zhijrq1 input").val() !="" && $("#zhijrq2 input").val() ==""))
				    {
					   $('#grid_user_${pageId}').grid('clearRecords');
					    showPromptMsg('red','拒收时间'+$.sdcui.resource.i18n['C_fanwbf'])
					    return;
				     }
				
						var params = $('#form_user_${pageId}').form("getFormParam");
						params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						$('#grid_user_${pageId}').grid("load",params);
			    		return false; 

					}}
					,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}}
					,{name:'info',caption:'${i18n.jusgzdck}[F7]',keyboard:'F7',action:function(){
					    var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length != 1){
					       showPromptMsg('red','${i18n.selecterror}')
					       return false;
					       }
					     //存放查询条件
						 var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
						 vQuery.push("zhuangtxx="+$('#zhuangt input').val());
						 vQuery.push("jsztxx="+$('#jszt input').val());
						 $('#serachKey').val(vQuery);
					     //去掉List[0];
						 for(i=0;i<params.length;i++){
							params[i]=params[i].toString().replace("list[0].","");
						  }
					     params.push("cangkbh="+$('#cangkbh input').attr('realValue'));
					     params.push("currentPage=1");
 				         var url = "<%=request.getContextPath()%>/shouhuo/10502.do";
				 		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
								//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P10501.do"+st_Params);
		    			    		document.putform.submit();
							  }
				    	});

			    		return false;
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
				
			 	$('#form_user_${pageId}').form({
			 		onemoredemand:true,
					onreload:true,
			 		url:'ck/jusgzdXz.do',
					fields:[
						{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,value:st_Cangkbh,realValue:st_Cangkbh,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'jusgzdh',dataType:'jusgzdh'},
						{fieldType:'fieldText',property:'jusdh',dataType:'jusdh'},
						{fieldType:'fieldSelect' , property:'zhuangt',caption:'${i18n.jusgzdzt}',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/jusgzdzt.do'},
						{fieldType:'fieldSelect',property:'jszt',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/juszt.do',caption:'${i18n.juszt}'},
						{fieldType:'fieldText',property:'caozy',maxLength:'20'},
						{fieldType:'fieldText',property:'zhijrq1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}, 
                        {fieldType:'fieldText',property:'zhijrq2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}
					]
				}); 
			//加载时判断是否是回退
			$(document).ready(function(){
				if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值 huxy_12934
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("cangkbh") != -1){                   //任务编号
							$('#cangkbh input').val(vParam[1]);
							$('#cangkbh input').attr('realValue',vParam[1]);
							continue;
						} else if (vParam[0].indexOf("chengysdm") != -1){           //状态信息
							$('#chengysdm input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("lingjbh") != -1){             //状态
							$('#lingjbh input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("gongysdm") != -1){             //状态
							$('#gongysdm input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("jusgzdh") != -1){             //状态
							$('#jusgzdh input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("jusdh") != -1){             //状态
							$('#jusdh input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("zhuangtxx") != -1){             //状态
							$('#zhuangt input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("zhuangt") != -1){             //状态
							$('#zhuangt input').attr('realValue',vParam[1]);
							continue;
						} else if (vParam[0].indexOf("jsztxx") != -1){             //状态
							$('#jszt input').val(vParam[1]);
							continue;
						}  else if (vParam[0].indexOf("jszt") != -1){        //生成库存时间
							$('#jszt input').attr('realValue',vParam[1]);
							continue;
						}  else if (vParam[0].indexOf("zhijrq1") != -1){        //生成库存时间
						    $('#zhijrq1 input').val(vParam[1]);
							$('#zhijrq1 input').attr('realValue',vParam[1]);
							continue;
						}  else if (vParam[0].indexOf("zhijrq2") != -1){        //生成库存时间
							$('#zhijrq2 input').val(vParam[1]);
							$('#zhijrq2 input').attr('realValue',vParam[1]);
							continue;
						} else if (vParam[0].indexOf("caozy") != -1){        //生成库存时间
							$('#caozy input').val(vParam[1]);
							$('#caozy input').attr('realValue',vParam[1]);
							continue;
						}
					}
					//移除状态信息及拒收状态信息
					params.splice(params.length-2,1);
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
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
		</form> 
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangkbh }</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.chengysdm }</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td>${i18n.lingjbh }</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm }</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.jusgzdh }</td>
							<td><div class="ui-field" id="jusgzdh"></div></td>
							<td>${i18n.jusdh }</td>
							<td><div class="ui-field" id="jusdh"></div></td>
						</tr>
						<tr>
							<td>${i18n.jusgzdzt }</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
							<td>${i18n.juszt }</td>
							<td><div class="ui-field" id="jszt"></div></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
						    <td>${i18n.caozy}</td>
						    <td><div class="ui-field" id="caozy"></div></td>
						    <td>拒收时间:</td>
                            <td> <div class="ui-field" style="float:left" id="zhijrq1"></div><div style="float:left" >至:</div><div style="float:left" class="ui-field"  id="zhijrq2" ></div></td>  
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		    <div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>